local ESX_ITEMS_DEPLOY = {
    {
        name = 'paper',
        label = 'Paper',
        weight = 350,
    },
    {
        name = 'banner_remover',
        label = 'Banner remover',
        weight = 50,
    },
    {
        name = 'banner',
        label = 'Banner',
        weight = 50,
    }
}

CreateThread(function()
    if Config.Inventory == Inventory.MF then
        InventoryService.AddItem = function(client, itemName, amount, metadata)
            local identifier = FrameworkService.GetPlayerIdentifier(client)
            exports[Inventory.MF]:addInventoryItem(identifier, itemName, amount, client, nil, metadata)
            return true
        end
    
        InventoryService.RemoveItem = function(client, itemName, amount, metadata)
            local identifier = FrameworkService.GetPlayerIdentifier(client)
            exports[Inventory.MF]:removeInventoryItem(identifier, itemName, amount, client, nil, metadata)
            return true
        end

        InventoryService.HasItem = function(playerId, itemName, amount)
            local player = FrameworkService.GetPlayer(playerId)
            local identifier = FrameworkService.GetPlayerIdentifier(playerId)

            if not player then
                return false
            end

            local success, result = pcall(function()
                local item = exports[Inventory.MF]:getInventoryItem(identifier, itemName)
                return item and item.count >= amount or false
            end)

            if not success then
                dbg.critical('Failed to get check HasItem named: %s for player named %s (%s)', itemName, GetPlayerName(playerId), playerId)
                return false
            end

            return result
        end
    
        InventoryService.RegisterUsableItem = function(itemName, callBack)
            SharedObject.RegisterUsableItem(itemName, function(source)
                callBack(source, nil)
            end)
        end

        InventoryService.CanProduceBanner = function(playerId, targetAmount)
            local retval = false
        
            if Config.Business.Printers.ProductionItemNeed then
                local itemName = Config.Business.Printers.ProductionItem
        
                dbg.business('1. Checking if player %s (%s) has item %s with amount total amount %s', GetPlayerName(playerId), playerId, itemName, targetAmount)
        
                local itemCount = Inventory.hasItem(playerId, itemName, targetAmount)
        
                if itemCount then
                    dbg.business('2. Checking if player %s (%s) has item %s with total amount %s', GetPlayerName(playerId), playerId, itemName, targetAmount)
                    InventoryService.RemoveItem(playerId, itemName, targetAmount)
                    retval = true
                end
            else
                dbg.business('Production item is not required for production.')
                retval = true
            end
        
            return retval
        end
    

        InventoryService.GetInventoryItems = function(playerId)
            return exports[Inventory.MF]:getInventoryItems(playerId)
        end

        AssetDeployer:registerDeploy('items', Inventory.MF, function(data)
            for _, item in ipairs(data) do
                MySQL.Sync.execute('INSERT INTO items (name, label, weight, rare, can_remove) VALUES (?, ?, ?, 0, 1)', {
                    item.name,
                    item.label,
                    item.weight
                })
            end
    
            return true
        end, ESX_ITEMS_DEPLOY)
    end
end)