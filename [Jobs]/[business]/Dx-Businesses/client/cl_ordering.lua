QBCore = exports['qb-core']:GetCoreObject()
local spawnedOrderingPeds = {}
local items = exports.ox_inventory:Items()

-- Function to format price
local function FormatPrice(price)
    return '$' .. price
end

-- Function to open ordering menu
local function OpenOrderMenu(businessName, businessData)
    if not businessData.orderingMenu or not businessData.orderingMenu.enabled then
        lib.notify({
            title = 'Not Available',
            description = 'Online ordering is not available at this business.',
            type = 'error'
        })
        return
    end

    local menu = businessData.orderingMenu.menu
    if not menu or #menu == 0 then
        lib.notify({
            title = 'Menu Empty',
            description = 'No items available to order.',
            type = 'error'
        })
        return
    end

    local options = {}

    -- Add menu items
    for _, category in ipairs(menu) do
        -- Add category header
        if category.categoryName then
            options[#options + 1] = {
                title = '──── ' .. category.categoryName .. ' ────',
                disabled = true,
                icon = category.icon or 'utensils'
            }
        end

        -- Add items in category
        for _, item in ipairs(category.items) do
            local itemData = items[item.item]
            if itemData then
                options[#options + 1] = {
                    title = itemData.label,
                    description = (item.description or '') .. '\n' .. FormatPrice(item.price),
                    image = itemData.client and itemData.client.image or nil,
                    icon = 'shopping-cart',
                    onSelect = function()
                        local input = lib.inputDialog('Order ' .. itemData.label, {
                            {
                                type = 'number',
                                label = 'Quantity',
                                description = 'How many would you like to order?',
                                required = true,
                                min = 1,
                                max = 10,
                                default = 1
                            },
                            {
                                type = 'textarea',
                                label = 'Special Instructions (Optional)',
                                description = 'Any special requests?',
                                placeholder = 'e.g., Extra sauce, no onions...',
                                required = false
                            }
                        })

                        if input and input[1] then
                            local quantity = input[1]
                            local instructions = input[2] or ''
                            local totalPrice = item.price * quantity

                            -- Confirm order
                            local confirm = lib.alertDialog({
                                header = 'Confirm Order',
                                content = string.format('Order %dx %s\nTotal: %s\n\nProceed with order?', quantity, itemData.label, FormatPrice(totalPrice)),
                                centered = true,
                                cancel = true
                            })

                            if confirm == 'confirm' then
                                -- Send order to server
                                local success = lib.callback.await('vl_businesses:placeOrder', false, businessName, item.item, quantity, totalPrice, instructions)

                                if success then
                                    lib.notify({
                                        title = 'Order Placed',
                                        description = string.format('Your order for %dx %s has been placed!\nTotal: %s', quantity, itemData.label, FormatPrice(totalPrice)),
                                        type = 'success',
                                        duration = 5000
                                    })
                                else
                                    lib.notify({
                                        title = 'Order Failed',
                                        description = 'Not enough money or unable to place order.',
                                        type = 'error'
                                    })
                                end
                            end
                        end
                    end
                }
            end
        end

        -- Add spacing between categories
        if category ~= menu[#menu] then
            options[#options + 1] = {
                title = ' ',
                disabled = true
            }
        end
    end

    lib.registerContext({
        id = 'business_ordering_menu',
        title = (businessData.blips and businessData.blips.label or 'Business') .. ' - Menu',
        menu = 'business_ordering_main',
        options = options
    })
    lib.showContext('business_ordering_menu')
end

-- Function to view active orders
local function ViewMyOrders(businessName)
    local orders = lib.callback.await('vl_businesses:getMyOrders', false, businessName)

    if not orders or #orders == 0 then
        lib.notify({
            title = 'No Orders',
            description = 'You have no active orders.',
            type = 'info'
        })
        return
    end

    local options = {}
    for i, order in ipairs(orders) do
        local itemData = items[order.item]
        local statusIcon = order.status == 'pending' and '⏳' or order.status == 'preparing' and '👨‍🍳' or '✅'

        options[#options + 1] = {
            title = statusIcon .. ' ' .. (itemData and itemData.label or order.item),
            description = string.format('Quantity: %d | Total: %s\nStatus: %s\nOrder #%d',
                order.quantity,
                FormatPrice(order.price),
                order.status:upper(),
                order.orderId
            ),
            icon = 'receipt',
            disabled = true
        }
    end

    lib.registerContext({
        id = 'business_my_orders',
        title = 'My Active Orders',
        menu = 'business_ordering_main',
        options = options
    })
    lib.showContext('business_my_orders')
end

-- Function to spawn ordering ped
local function SpawnOrderingPed(data)
    lib.requestModel(data.orderingMenu.ped)
    local entity = CreatePed(0, GetHashKey(data.orderingMenu.ped), data.orderingMenu.coords.x, data.orderingMenu.coords.y, data.orderingMenu.coords.z - 1.0, data.orderingMenu.coords.w, false, false)
    FreezeEntityPosition(entity, true)
    SetEntityInvincible(entity, true)
    SetBlockingOfNonTemporaryEvents(entity, true)
    SetEntityHeading(entity, data.orderingMenu.coords.w)

    exports['qb-target']:AddTargetEntity(entity, {
        options = {
            {
                action = function()
                    local options = {
                        {
                            title = 'View Menu',
                            description = 'Browse available items',
                            icon = 'book-open',
                            onSelect = function()
                                OpenOrderMenu(data.businessKey, data)
                            end
                        },
                        {
                            title = 'My Orders',
                            description = 'View your active orders',
                            icon = 'clipboard-list',
                            onSelect = function()
                                ViewMyOrders(data.businessKey)
                            end
                        }
                    }

                    lib.registerContext({
                        id = 'business_ordering_main',
                        title = (data.blips and data.blips.label or 'Business') .. ' - Ordering',
                        options = options
                    })
                    lib.showContext('business_ordering_main')
                end,
                icon = 'fa-solid fa-clipboard-list',
                label = 'Order Food',
            }
        },
        distance = 2.5,
    })
    return entity
end

-- Function to handle entering/exiting ordering zones
local function onEnterOrdering(self)
    if spawnedOrderingPeds[self.businessData.businessKey] == nil or not DoesEntityExist(spawnedOrderingPeds[self.businessData.businessKey]) then
        spawnedOrderingPeds[self.businessData.businessKey] = SpawnOrderingPed(self.businessData)
    end
end

local function onExitOrdering(self)
    if spawnedOrderingPeds[self.businessData.businessKey] ~= nil and DoesEntityExist(spawnedOrderingPeds[self.businessData.businessKey]) then
        DeleteEntity(spawnedOrderingPeds[self.businessData.businessKey])
        spawnedOrderingPeds[self.businessData.businessKey] = nil
    end
end

-- Initialize ordering stations
CreateThread(function()
    for k, v in pairs(Businesses) do
        if v.enabled and v.orderingMenu and v.orderingMenu.enabled then
            lib.points.new({
                coords = v.orderingMenu.coords,
                distance = 50.0,
                businessData = {
                    businessKey = k,
                    orderingMenu = v.orderingMenu,
                    blips = v.blips,
                    dutyzone = v.dutyzone,
                },
                onEnter = onEnterOrdering,
                onExit = onExitOrdering,
            })
        end
    end
end)

-- Event to notify order status update
RegisterNetEvent('vl_businesses:orderStatusUpdate', function(orderId, status, item)
    local itemData = items[item]
    local statusText = status == 'preparing' and 'is being prepared' or status == 'ready' and 'is ready' or 'has been completed'

    lib.notify({
        title = 'Order Update',
        description = string.format('Your order of %s %s!', itemData and itemData.label or item, statusText),
        type = 'info',
        duration = 7000
    })
end)
