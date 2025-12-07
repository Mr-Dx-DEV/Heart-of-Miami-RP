if isBridgeLoaded('Inventory', Inventory.QS) then
    Inventory.hasItem = function(client, itemName, amount)
        amount = amount or 1

        local item = exports[Bridge.Inventory]:GetItemByName(client, itemName)
        log.debug('Item %s is nil for %s', itemName, client)
        if item == nil then return false end

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

    Inventory.registerUsableItem = function(itemName, cb)
        if isBridgeLoaded('Framework', Framework.QBCore) then
            Framework.object.Functions.CreateUseableItem(itemName, function(source, item)
                cb(source, item.name, item)
            end)
        end

        if isBridgeLoaded('Framework', Framework.ESX) then
            Framework.object.RegisterUsableItem(itemName, function(source, item)
                cb(source, item.name, item)
            end)
        end
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

        local match = string.match(item, "^WEAPON_(.*)")

        if match then
            item = item:lower()
        end

        return exports[Bridge.Inventory]:RemoveItem(client, item, amount, nil, data)
    end

    --- @return boolean success
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

        local match = string.match(item, "^WEAPON_(.*)")

        if match then
            item = item:lower()
        end

        return exports[Bridge.Inventory]:AddItem(client, item, amount, nil, data)
    end

    Inventory.createInventory = function(name, label, slots, maxWeight)
        return
    end

    Inventory.getInventoryItems = function(name, playerId)
        if playerId ~= nil then
            local player = Framework.getPlayer(playerId)
            local inventory = nil

            if player == nil then
                log.error('Failed to get player in getInventoryItems')
                return {}
            end

            if doesExportExistInResource(Bridge.Inventory, "GetPlayerInventory") then
                log.debug('Using QS Inv method 1 for getInventoryItems')
                inventory = exports[Bridge.Inventory]:GetPlayerInventory(playerId)
            end

            if doesExportExistInResource(Bridge.Inventory, "GetInventory") then
                log.debug('Using QS Inv method 2 for getInventoryItems')
                inventory = exports[Bridge.Inventory]:GetInventory(playerId)
            end

            if isBridgeLoaded('Framework', Framework.QBCore) then
                log.debug('Using QS Inv method 3 for getInventoryItems')
                inventory = player.PlayerData.items
            end

            if isBridgeLoaded('Framework', Framework.ESX) then
                log.debug('Using QS Inv method 4 for getInventoryItems')
                inventory = player.inventory
            end

            if inventory == nil then
                log.error('Failed to get inventory for player %s', playerId)
                inventory = {}
            end

            return inventory
        end

        return exports[Inventory.QS]:GetStashItems(name)
    end

    Inventory.items = function()
        local qsItems = exports[Inventory.QS]:GetItemList()
        local items = {}
        for k, v in pairs(qsItems) do
            items[v.name] = {
                name = v.name,
                label = v.label,
                weight = v.weight,
                stack = v.unique,
                close = v.useable
            }
        end

        return items
    end

    Inventory.clearInventory = function(name)
        local items = Inventory.getInventoryItems(name)
        for _, item in ipairs(items) do
            exports['qs-inventory']:RemoveItemIntoStash(name, item.name, item.amount)
        end
    end

    AssetDeployer:registerFileDeploy('items',
        isBridgeLoaded('Framework', Framework.ESX) and Inventory.QS or Framework.QBCore, 'shared/items.lua',
        function(file, data)
            file = file:strtrim():gsub('}$', '')
            file = append(file, ASSET_DEPLOYER_WATERMARK_PREFIX)
            local itemTemplate = [[
    ['%s'] = {
        ['name'] = '%s',
        ['label'] = '%s',
        ['weight'] = %s,
        ['type'] = '%s',
        ['image'] = '%s.png',
        ['unique'] = %s,
        ['useable'] = %s,
        ['shouldClose'] = %s,
        ['combinable'] = nil,
    },
        ]]
            local items = {}
            for _, item in ipairs(data) do
                local formattedItem = itemTemplate:format(
                    item.name,
                    item.name,
                    item.label,
                    item.weight,
                    item.type,
                    item.name,
                    item.unique,
                    item.useable,
                    item.shouldClose
                )
                file = append(file, '', formattedItem)
            end

            file = append(file, '', ASSET_DEPLOYER_WATERMARK_SUFFIX, '}')
            return file
        end,
        QB_INVENTORY_ITEMS_DEPLOY
    )

    AssetDeployer:registerCopyFilesDeploy('items-images', Inventory.QS, 'assets/inventory_images', 'html/images',
        function(data)
            local files = {}
            for _, item in ipairs(data) do
                table.insert(files, item .. '.png')
            end

            return files
        end, { 'xmas_gift', 'xmas_packed_gift', 'xmas_tree', 'xmas_star', 'xmas_decor' }
    )
end
