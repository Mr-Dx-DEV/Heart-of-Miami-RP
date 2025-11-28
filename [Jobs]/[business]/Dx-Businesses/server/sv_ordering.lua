QBCore = exports['qb-core']:GetCoreObject()

-- Storage for active orders
local activeOrders = {}
local orderIdCounter = 1000

-- Function to generate order ID
local function GenerateOrderId()
    orderIdCounter = orderIdCounter + 1
    return orderIdCounter
end

-- Function to get business orders for management
local function GetBusinessOrders(businessName)
    local orders = {}
    for orderId, order in pairs(activeOrders) do
        if order.business == businessName then
            table.insert(orders, order)
        end
    end
    return orders
end

-- Place order callback
lib.callback.register('vl_businesses:placeOrder', function(source, businessName, item, quantity, price, instructions)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then
        return false
    end

    -- Check if player has enough money
    local playerMoney = Player.PlayerData.money['cash'] or 0
    if playerMoney < price then
        -- Try bank account
        playerMoney = Player.PlayerData.money['bank'] or 0
        if playerMoney < price then
            return false
        end
        -- Remove from bank
        Player.Functions.RemoveMoney('bank', price, 'business-order')
    else
        -- Remove from cash
        Player.Functions.RemoveMoney('cash', price, 'business-order')
    end

    -- Create order
    local orderId = GenerateOrderId()
    local citizenid = Player.PlayerData.citizenid
    local playerName = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname

    activeOrders[orderId] = {
        orderId = orderId,
        business = businessName,
        source = source,
        citizenid = citizenid,
        playerName = playerName,
        item = item,
        quantity = quantity,
        price = price,
        instructions = instructions,
        status = 'pending',
        timestamp = os.time()
    }

    -- Debug logging
    print(string.format('[Order Created Debug] Business stored as: %s', businessName))

    -- Notify business employees
    local players = QBCore.Functions.GetPlayers()
    for _, playerId in ipairs(players) do
        local employee = QBCore.Functions.GetPlayer(playerId)
        if employee and employee.PlayerData.job.name == businessName and employee.PlayerData.job.onduty then
            TriggerClientEvent('vl_businesses:newOrderNotification', playerId, orderId, playerName, item, quantity)
        end
    end

    print(string.format('[Business Orders] Order #%d placed: %s ordered %dx %s from %s', orderId, playerName, quantity, item, businessName))

    return true
end)

-- Get player's orders callback
lib.callback.register('vl_businesses:getMyOrders', function(source, businessName)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then
        return {}
    end

    local citizenid = Player.PlayerData.citizenid
    local playerOrders = {}

    for orderId, order in pairs(activeOrders) do
        if order.citizenid == citizenid and (not businessName or order.business == businessName) then
            table.insert(playerOrders, order)
        end
    end

    return playerOrders
end)

-- Update order status (used by employees)
RegisterNetEvent('vl_businesses:updateOrderStatus', function(orderId, newStatus)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end

    local order = activeOrders[orderId]
    if not order then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Error',
            description = 'Order not found.',
            type = 'error'
        })
        return
    end

    -- Debug logging
    print(string.format('[Order Update Debug] Player Job: %s | Order Business: %s | On Duty: %s',
        Player.PlayerData.job.name,
        order.business,
        tostring(Player.PlayerData.job.onduty)))

    -- Check if player is employee of the business
    if Player.PlayerData.job.name ~= order.business then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Not Authorized',
            description = string.format('You must be employed at %s to update this order.', order.business),
            type = 'error'
        })
        return
    end

    if not Player.PlayerData.job.onduty then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Not On Duty',
            description = 'You must be clocked in to update orders.',
            type = 'error'
        })
        return
    end

    -- Update status
    order.status = newStatus

    -- Notify customer
    local customerSource = order.source
    if customerSource and GetPlayerPing(customerSource) > 0 then
        TriggerClientEvent('vl_businesses:orderStatusUpdate', customerSource, orderId, newStatus, order.item)
    end

    -- If order is completed and ready, add item to tray or give to player
    if newStatus == 'ready' then
        -- Add item to customer's nearby tray (you can implement this logic)
        -- For now, we'll keep the order in the system until manually completed
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Order Ready',
            description = string.format('Order #%d is ready for pickup!', orderId),
            type = 'success'
        })
    elseif newStatus == 'completed' then
        -- Remove order from active orders
        activeOrders[orderId] = nil
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Order Completed',
            description = string.format('Order #%d has been completed and removed.', orderId),
            type = 'success'
        })
    end

    print(string.format('[Business Orders] Order #%d status updated to: %s', orderId, newStatus))
end)

-- Cancel order
RegisterNetEvent('vl_businesses:cancelOrder', function(orderId)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end

    local order = activeOrders[orderId]
    if not order then return end

    -- Check if player is the customer or an employee
    local isCustomer = order.citizenid == Player.PlayerData.citizenid
    local isEmployee = Player.PlayerData.job.name == order.business and Player.PlayerData.job.onduty

    if not isCustomer and not isEmployee then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Not Authorized',
            description = 'You cannot cancel this order.',
            type = 'error'
        })
        return
    end

    -- Refund money if customer cancels within certain time (e.g., 2 minutes)
    if isCustomer then
        local timeElapsed = os.time() - order.timestamp
        if timeElapsed <= 120 and order.status == 'pending' then
            local customer = QBCore.Functions.GetPlayer(order.source)
            if customer then
                customer.Functions.AddMoney('cash', order.price, 'order-refund')
                TriggerClientEvent('ox_lib:notify', order.source, {
                    title = 'Order Cancelled',
                    description = string.format('Order #%d cancelled. $%d refunded.', orderId, order.price),
                    type = 'info'
                })
            end
        else
            TriggerClientEvent('ox_lib:notify', source, {
                title = 'Cannot Cancel',
                description = 'Order is being prepared and cannot be cancelled.',
                type = 'error'
            })
            return
        end
    end

    -- Remove order
    activeOrders[orderId] = nil

    print(string.format('[Business Orders] Order #%d cancelled', orderId))
end)

-- Get all business orders (for management laptop)
RegisterNetEvent('vl_businesses:getBusinessOrders', function(businessName)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end

    -- Check if player is employee/owner
    if Player.PlayerData.job.name ~= businessName then
        return
    end

    local orders = GetBusinessOrders(businessName)
    TriggerClientEvent('vl_businesses:receiveBusinessOrders', source, orders)
end)

-- Notify employees of new order
RegisterNetEvent('vl_businesses:newOrderNotification', function(orderId, customerName, item, quantity)
    -- This event is triggered from server to client in the placeOrder callback
end)

-- Complete order and give item to customer
RegisterNetEvent('vl_businesses:completeOrderGiveItem', function(orderId)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end

    local order = activeOrders[orderId]
    if not order then return end

    -- Debug logging
    print(string.format('[Complete Order Debug] Player Job: %s | Order Business: %s | On Duty: %s',
        Player.PlayerData.job.name,
        order.business,
        tostring(Player.PlayerData.job.onduty)))

    -- Check if player is employee
    if Player.PlayerData.job.name ~= order.business then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Not Authorized',
            description = string.format('You must be employed at %s to complete this order.', order.business),
            type = 'error'
        })
        return
    end

    if not Player.PlayerData.job.onduty then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Not On Duty',
            description = 'You must be clocked in to complete orders.',
            type = 'error'
        })
        return
    end

    -- Check if employee has the item
    local hasItem = exports.ox_inventory:GetItemCount(source, order.item)
    if hasItem < order.quantity then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Missing Items',
            description = string.format('You need %dx %s to complete this order.\nYou only have %d.', order.quantity, order.item, hasItem),
            type = 'error'
        })
        return
    end

    -- Check if customer is online
    local customerSource = order.source
    if not customerSource or GetPlayerPing(customerSource) <= 0 then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Customer Offline',
            description = 'Customer is no longer online.',
            type = 'error'
        })
        return
    end

    -- Remove item from employee inventory
    local removed = exports.ox_inventory:RemoveItem(source, order.item, order.quantity)
    if not removed then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Failed',
            description = 'Failed to remove items from your inventory.',
            type = 'error'
        })
        return
    end

    -- Give item directly to customer
    local Customer = QBCore.Functions.GetPlayer(customerSource)
    if Customer then
        local success = exports.ox_inventory:AddItem(customerSource, order.item, order.quantity)
        if success then
            -- Mark order as completed and remove
            activeOrders[orderId] = nil

            TriggerClientEvent('ox_lib:notify', source, {
                title = 'Order Completed',
                description = string.format('Order #%d completed and given to %s.', orderId, order.playerName),
                type = 'success'
            })

            TriggerClientEvent('ox_lib:notify', customerSource, {
                title = 'Order Received',
                description = 'Your order has been delivered!',
                type = 'success'
            })

            print(string.format('[Business Orders] Order #%d completed and delivered to %s', orderId, order.playerName))
        else
            -- Failed to add to customer, return items to employee
            exports.ox_inventory:AddItem(source, order.item, order.quantity)

            TriggerClientEvent('ox_lib:notify', source, {
                title = 'Failed',
                description = 'Customer inventory is full. Items returned to your inventory.',
                type = 'error'
            })
        end
    end
end)

-- Export function to get orders (can be used by other resources)
exports('GetBusinessOrders', GetBusinessOrders)
exports('GetActiveOrders', function()
    return activeOrders
end)

-- Initialize
CreateThread(function()
    print('[VL-Businesses] Ordering system initialized')
end)
