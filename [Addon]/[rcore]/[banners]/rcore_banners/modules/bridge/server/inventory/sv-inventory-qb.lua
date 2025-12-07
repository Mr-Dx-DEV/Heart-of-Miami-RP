CreateThread(function()
    if Config.Inventory == Inventory.QB or Config.Inventory == Inventory.PS or Config.Inventory == Inventory.LJ then
        InventoryService.AddItem = function(playerId, item, amount, metadata)
            local player = FrameworkService.GetPlayer(playerId)

            if player == nil then 
                return false 
            end

            if item == 'cash' or item == 'money' then
                return player.Functions.AddMoney('cash', amount)
            end

            local match = string.match(item, "^WEAPON_(.*)")

            if match then
                item = item:lower()
            end    

            return player.Functions.AddItem(item, amount, nil, metadata or {})
        end

        InventoryService.RemoveItem = function(playerId, item, amount, metadata)
            local player = FrameworkService.GetPlayer(playerId)

            if not player then 
                return false 
            end


            if item == 'cash' or item == 'money' then
                return player.Functions.RemoveMoney('cash', amount)
            end

            local match = string.match(item, "^WEAPON_(.*)")

            if match then
                item = item:lower()
            end    

            return player.Functions.RemoveItem(item, amount)
        end
    
        InventoryService.HasItem = function(client, itemName, amount)
            local player = FrameworkService.GetPlayer(client)

            if not player then
                return
            end

            local item = player.Functions.GetItemByName(itemName) or {}
            local ItemInfo = {
                name = itemName,
                count = item.amount or item.count or 0,
                label = item.label or "none",
                weight = item.weight or 0,
                usable = item.useable or false,
                rare = false,
                canRemove = false
            }

            return ItemInfo and ItemInfo.count and (ItemInfo.count >= amount or false)
        end

        InventoryService.RegisterUsableItem = function(itemName, callBack)
            if not SharedObject then
                return
            end

            SharedObject.Functions.CreateUseableItem(itemName, function(source, item)
                callBack(source, item.info or item.metadata or {})
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
            local player = FrameworkService.GetPlayer(playerId)
            local inventory = {}

            if not player then
                return inventory
            end

            if doesExportExistInResource(Inventories.QS, "GetPlayerInventory") then
                dbg.debug("Inventory-QS: Loading player inventory via existing export GetPlayerInventory")
                inventory = exports[Config.Inventories]:GetPlayerInventory(playerId)
            elseif doesExportExistInResource(Inventories.QS, "GetInventory") then
                dbg.debug("Inventory-QS: Loading player inventory via existing export GetInventory")
                inventory = exports[Config.Inventories]:GetInventory(playerId)
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