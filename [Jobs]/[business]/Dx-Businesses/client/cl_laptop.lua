QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}
local showingUI = false
local currentPointCoords = nil
local items = exports.ox_inventory:Items()

-- Register PlayerJob on load
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

-- Function to format timestamp
local function FormatTime(timestamp)
    return os.date('%H:%M %d/%m', timestamp)
end

-- Function to view business ratings
local function ViewBusinessRatings(businessName, businessLabel)
    TriggerServerEvent('vl_businesses:getBusinessRatings', businessName)
end

RegisterNetEvent('vl_businesses:receiveBusinessRatings', function(data)
    if not data then
        lib.notify({
            title = 'No Ratings',
            description = 'No ratings available yet.',
            type = 'info'
        })
        return
    end

    local avgRating = data.average or 0
    local totalRatings = data.total or 0
    local recentRatings = data.recent or {}

    local options = {
        {
            title = '📊 Business Statistics',
            disabled = true,
            icon = 'chart-bar'
        },
        {
            title = string.format('Average Rating: ⭐ %.1f/5.0', avgRating),
            description = string.format('Total Reviews: %d', totalRatings),
            disabled = true,
            icon = 'star'
        },
        {
            title = '─────────────',
            disabled = true
        },
        {
            title = '📝 Recent Reviews',
            disabled = true,
            icon = 'comments'
        }
    }

    -- Add recent ratings
    if #recentRatings > 0 then
        for i, rating in ipairs(recentRatings) do
            if i <= 20 then
                local stars = string.rep('⭐', rating.rating)
                local description = rating.comment and rating.comment ~= '' and rating.comment or 'No comment'
                local timeStr = FormatTime(rating.timestamp)

                options[#options + 1] = {
                    title = stars .. ' - ' .. rating.playerName,
                    description = description .. '\n' .. timeStr,
                    icon = 'user',
                    disabled = true
                }
            end
        end
    else
        options[#options + 1] = {
            title = 'No reviews yet',
            disabled = true,
            icon = 'info-circle'
        }
    end

    lib.registerContext({
        id = 'laptop_ratings',
        title = 'Business Ratings',
        menu = 'business_laptop_main',
        options = options
    })
    lib.showContext('laptop_ratings')
end)

-- Function to view business orders
local function ViewBusinessOrders(businessName)
    TriggerServerEvent('vl_businesses:getBusinessOrders', businessName)
end

RegisterNetEvent('vl_businesses:receiveBusinessOrders', function(orders)
    if not orders or #orders == 0 then
        lib.notify({
            title = 'No Orders',
            description = 'No active orders at the moment.',
            type = 'info'
        })
        return
    end

    local options = {
        {
            title = '📦 Active Orders (' .. #orders .. ')',
            disabled = true,
            icon = 'clipboard-list'
        },
        {
            title = '─────────────',
            disabled = true
        }
    }

    -- Sort orders by status (pending first)
    table.sort(orders, function(a, b)
        local statusOrder = { pending = 1, preparing = 2, ready = 3 }
        return (statusOrder[a.status] or 4) < (statusOrder[b.status] or 4)
    end)

    for _, order in ipairs(orders) do
        local itemData = items[order.item]
        local statusIcon = order.status == 'pending' and '⏳' or order.status == 'preparing' and '👨‍🍳' or '✅'
        local statusColor = order.status == 'pending' and 'warning' or order.status == 'preparing' and 'info' or 'success'

        options[#options + 1] = {
            title = string.format('%s Order #%d - %s', statusIcon, order.orderId, order.playerName),
            description = string.format('%dx %s | $%d\nInstructions: %s\nStatus: %s',
                order.quantity,
                itemData and itemData.label or order.item,
                order.price,
                order.instructions ~= '' and order.instructions or 'None',
                order.status:upper()
            ),
            icon = 'receipt',
            arrow = true,
            onSelect = function()
                -- Show order management options
                local orderOptions = {
                    {
                        title = '👨‍🍳 Mark as Preparing',
                        description = 'Update order status to preparing',
                        icon = 'fire',
                        disabled = order.status ~= 'pending',
                        onSelect = function()
                            TriggerServerEvent('vl_businesses:updateOrderStatus', order.orderId, 'preparing')
                            Wait(500)
                            ViewBusinessOrders(order.business)
                        end
                    },
                    {
                        title = '✅ Mark as Ready',
                        description = 'Order is ready for pickup',
                        icon = 'check',
                        disabled = order.status == 'ready',
                        onSelect = function()
                            TriggerServerEvent('vl_businesses:updateOrderStatus', order.orderId, 'ready')
                            Wait(500)
                            ViewBusinessOrders(order.business)
                        end
                    },
                    {
                        title = '🎁 Complete & Give Item',
                        description = 'Give item to customer (requires item in your inventory)',
                        icon = 'gift',
                        onSelect = function()
                            TriggerServerEvent('vl_businesses:completeOrderGiveItem', order.orderId)
                            Wait(500)
                            ViewBusinessOrders(order.business)
                        end
                    },
                    {
                        title = '❌ Cancel Order',
                        description = 'Cancel this order',
                        icon = 'times',
                        onSelect = function()
                            local confirm = lib.alertDialog({
                                header = 'Cancel Order',
                                content = string.format('Are you sure you want to cancel Order #%d?', order.orderId),
                                centered = true,
                                cancel = true
                            })

                            if confirm == 'confirm' then
                                TriggerServerEvent('vl_businesses:cancelOrder', order.orderId)
                                Wait(500)
                                ViewBusinessOrders(order.business)
                            end
                        end
                    }
                }

                lib.registerContext({
                    id = 'laptop_order_manage',
                    title = string.format('Manage Order #%d', order.orderId),
                    menu = 'laptop_orders',
                    options = orderOptions
                })
                lib.showContext('laptop_order_manage')
            end
        }
    end

    lib.registerContext({
        id = 'laptop_orders',
        title = 'Business Orders',
        menu = 'business_laptop_main',
        options = options
    })
    lib.showContext('laptop_orders')
end)

-- Main laptop menu
local function OpenLaptop(businessName, businessLabel)
    local options = {
        {
            title = '📦 View Active Orders',
            description = 'Manage customer orders',
            icon = 'clipboard-list',
            onSelect = function()
                ViewBusinessOrders(businessName)
            end
        },
        {
            title = '⭐ View Ratings & Reviews',
            description = 'See customer feedback',
            icon = 'star',
            onSelect = function()
                ViewBusinessRatings(businessName, businessLabel)
            end
        },
        {
            title = '📊 Business Analytics',
            description = 'View business statistics (Coming Soon)',
            icon = 'chart-line',
            disabled = true,
            onSelect = function()
                lib.notify({
                    title = 'Coming Soon',
                    description = 'Business analytics feature is coming soon!',
                    type = 'info'
                })
            end
        },
        {
            title = '⚙️ Business Settings',
            description = 'Manage business settings (Coming Soon)',
            icon = 'cog',
            disabled = true,
            onSelect = function()
                lib.notify({
                    title = 'Coming Soon',
                    description = 'Business settings feature is coming soon!',
                    type = 'info'
                })
            end
        }
    }

    lib.registerContext({
        id = 'business_laptop_main',
        title = businessLabel .. ' - Management',
        options = options
    })
    lib.showContext('business_laptop_main')
end

-- Point handler for laptop zones
local function onEnterNearbyLaptop(point)
    if point.job ~= PlayerJob.name then
        return
    end

    if not PlayerJob.onduty then
        return
    end

    if point.isClosest and point.currentDistance < 1.0 and not showingUI then
        lib.showTextUI('[E] Access Business Laptop')
        showingUI = true
        currentPointCoords = point.coords
    elseif showingUI and point.currentDistance > 1.0 and currentPointCoords == point.coords then
        lib.hideTextUI()
        showingUI = false
        currentPointCoords = nil
    end

    if point.isClosest and point.currentDistance < 1.0 and IsControlJustReleased(0, 38) then
        OpenLaptop(point.businessKey, point.businessLabel)
    end
end

-- Initialize laptop zones
CreateThread(function()
    Wait(2000) -- Wait for businesses to load

    for k, v in pairs(Businesses) do
        if v.enabled and v.managementLaptop and v.managementLaptop.enabled then
            for _, laptopCoords in ipairs(v.managementLaptop.coords) do
                lib.points.new({
                    coords = laptopCoords,
                    distance = 10.0,
                    nearby = onEnterNearbyLaptop,
                    businessKey = k,
                    businessLabel = v.blips and v.blips.label or v.dutyzone.label,
                    job = v.job
                })
            end
        end
    end
end)

-- Event for new order notification to employees
RegisterNetEvent('vl_businesses:newOrderNotification', function(orderId, customerName, item, quantity)
    local itemData = items[item]

    lib.notify({
        title = '🔔 New Order!',
        description = string.format('Order #%d\n%s ordered %dx %s', orderId, customerName, quantity, itemData and itemData.label or item),
        type = 'info',
        duration = 8000,
        position = 'top'
    })

    -- Play notification sound (optional)
    PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", true)
end)
