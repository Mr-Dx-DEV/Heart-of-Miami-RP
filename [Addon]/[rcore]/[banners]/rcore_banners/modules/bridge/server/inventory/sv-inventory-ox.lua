CreateThread(function()
    if Config.Inventory == Inventory.OX then
        AddEventHandler('ox_inventory:usedItem', function(playerId, name, slotId, metadata)
            TriggerEvent('bridge:usedItem', playerId, name, slotId, metadata)
        end)

        InventoryService.AddItem = function(playerId, itemName, amount, metadata)
            exports[Inventory.OX]:AddItem(playerId, itemName, amount, metadata)
        end
        
        InventoryService.RemoveItem = function(playerId, itemName, amount, metadata)
            exports[Inventory.OX]:RemoveItem(playerId, itemName, amount)
        end
    
        InventoryService.HasItem = function(playerId, itemName, amount)
            local currentAmount = exports[Inventory.OX]:Search(playerId, 'count', itemName)

            return currentAmount and (currentAmount >= amount or false)
        end

        InventoryService.RegisterUsableItem = function(itemName, callBack)
            AddEventHandler('bridge:usedItem', function(playerId, name, slotId, metadata)
                if name == itemName then
                    callBack(playerId, metadata)
                end
            end)
        end
        InventoryService.CanProduceBanner = function(playerId, targetAmount)
            local retval = false
        
            if Config.Business.Printers.ProductionItemNeed then
                local itemName = Config.Business.Printers.ProductionItem
        
                dbg.business('1. Checking if player %s (%s) has item %s with amount total amount %s', GetPlayerName(playerId), playerId, itemName, targetAmount)
        
                local itemCount = InventoryService.HasItem(playerId, itemName, targetAmount)
        
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
            return exports[Inventory.OX]:GetInventoryItems(playerId)
        end
    end
end)