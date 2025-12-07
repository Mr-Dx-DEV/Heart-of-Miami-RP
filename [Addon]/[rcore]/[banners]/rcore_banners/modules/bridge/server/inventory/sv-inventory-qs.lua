CreateThread(function()
    if Config.Inventory == Inventory.QS then
        InventoryService.AddItem = function(playerId, item, amount, metadata)
            local match = string.match(item, "^WEAPON_(.*)")
    
            if match then
                item = item:lower()
            end

            return exports[Inventory.QS]:AddItem(playerId, item, amount, nil, metadata)
        end

        InventoryService.RemoveItem = function(playerId, item, amount, metadata)
            local match = string.match(item, "^WEAPON_(.*)")
    
            if match then
                item = item:lower()
            end
    
            return exports[Inventory.QS]:RemoveItem(playerId, item, amount, nil, metadata)
        end
    
        InventoryService.HasItem = function(client, itemName, amount)
            local player = FrameworkService.GetPlayer(client)

            if not player then
                return
            end

            local currentAmount = exports[Inventory.QS]:GetItemTotalAmount(source, itemName)

            return currentAmount and (currentAmount >= amount) or false
        end

        InventoryService.RegisterUsableItem = function(itemName, callBack)
            if not SharedObject then
                return
            end

            if Config.Framework == Framework.ESX then
                SharedObject.RegisterUsableItem(itemName, function(source, item)
                    callBack(source, item.info or item.metadata or {})
                end)
            elseif IS_QB[Config.Framework] then -- QBCORE, QBOX
                SharedObject.Functions.CreateUseableItem(itemName, function(source, item)
                    callBack(source, item.info or item.metadata or {})
                end)
            end
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
            local player = FrameworkService.GetPlayer(playerId)
            local inventory = {}

            if not player then
                return inventory
            end
            
            if doesExportExistInResource(Inventory.QS, "GetPlayerInventory") then
                dbg.debug("Inventory-QS: Loading player inventory via existing export GetPlayerInventory")
                inventory = exports[Inventory.QS]:GetPlayerInventory(playerId)
            elseif doesExportExistInResource(Inventory.QS, "GetInventory") then
                dbg.debug("Inventory-QS: Loading player inventory via existing export GetInventory")
                inventory = exports[Inventory.QS]:GetInventory(playerId)
            else
                dbg.debug("Inventory-QS: Loading player inventory as fallback via Framework.")
                
                if Config.Framework == Framework.QBCore or Config.Framework == Framework.QBOX then
                    inventory = player.PlayerData.items
                elseif Config.Framework == Framework.ESX then
                    local items = player.inventory
                    local loadout = player.getLoadout(false)
        
                    if items and next(items) then
                        for k, v in pairs(items) do
                            if v.count > 0 then
                                inventory[#inventory + 1] = {
                                    name = v.name,
                                    count = v.count,
                                    label = v.label,
                                    weight = v.weight,
                                    useable = v.useable,
                                    rare = v.rare,
                                }
                            end
                        end
                    end
        
                    if loadout and next(loadout) then
                        inventory = table.merge(inventory, loadout)
                    end
                end
            end

            return inventory
        end
    end
end)