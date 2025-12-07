if isBridgeLoaded('Inventory', Inventory.CODEM) then
    Inventory.hasItem = function(client, itemName, amount)
        amount = amount or 1

        local item = exports[Bridge.Inventory]:GetItemsByName(client, itemName)
        local ItemInfo = {
            name = itemName,
            count = item.amount or item.count or 0,
            label = item.label or "none",
            weight = item.weight or 0,
            usable = item.useable or false,
            rare = false,
            canRemove = false
        }

        log.debug('Inventory.hasItem: %s (%s) - checking if user has %s amount (%s) with state: %s',
            GetPlayerName(client), client, itemName, amount, ItemInfo.count >= amount or false)

        return ItemInfo and ItemInfo.count >= amount or false
    end

    Inventory.addItem = function(client, item, amount, data)
        local player = Framework.getPlayer(client)

        if item == 'cash' or item == 'money' then
            if player == nil then
                return false
            end

            if isBridgeLoaded('Framework', Framework.QBCore) then
                return player.Functions.AddMoney('cash', amount)
            end

            if isBridgeLoaded('Framework', Framework.ESX) then
                return player.addMoney(amount)
            end
        end

        local state, error_message = pcall(function()
            return exports[Bridge.Inventory]:AddItem(client, item, amount, nil, data)
        end)

        return state
    end

    Inventory.removeItem = function(client, item, amount, data)
        local player = Framework.getPlayer(client)

        if item == 'cash' or item == 'money' then
            if player == nil then
                return false
            end

            if isBridgeLoaded('Framework', Framework.QBCore) then
                return player.Functions.RemoveMoney('cash', amount)
            end

            if isBridgeLoaded('Framework', Framework.ESX) then
                return player.removeMoney(amount)
            end
        end

        local state, error_message = pcall(function()
            return exports[Bridge.Inventory]:RemoveItem(client, item, amount)
        end)

        return state
    end

    Inventory.registerUsableItem = function(name, cb)
        if esxLoaded then
            Framework.object.RegisterUsableItem(name, function(source)
                cb(source, name)
            end)
        elseif qbcoreLoaded then
            Framework.object.Functions.CreateUseableItem(name, function(source, item)
                cb(source, item.name, item)
            end)
        end
    end

    Inventory.getInventoryItems = function(stashName, playerId)
        if playerId then
            local player = Framework.getPlayer(playerId)

            if player == nil then return {} end

            if isBridgeLoaded('Framework', Framework.QBCore) then
                return player.PlayerData.items
            end

            if isBridgeLoaded('Framework', Framework.ESX) then
                return player.inventory
            end

            log.warn('Inventory.getInventoryItems: Unsupported framework for getting player inventory items')
            return {}
        end

        return exports[Bridge.Inventory]:GetStashItems(stashName)
    end

    Inventory.createInventory = function(name, label, slots, maxWeight, owner)

    end

    Inventory.items = function()

    end


    Inventory.clearInventory = function(playerId)
        local state, error_message = pcall(function()
            return exports[Bridge.Inventory]:ClearInventory(playerId)
        end)

        return state
    end
end
