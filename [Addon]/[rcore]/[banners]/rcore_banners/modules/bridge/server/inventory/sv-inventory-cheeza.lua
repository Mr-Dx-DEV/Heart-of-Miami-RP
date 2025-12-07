CreateThread(function()
    if Config.Inventory == Inventory.CHEEZA then
        InventoryService.AddItem = function(client, itemName, amount, metadata)
            local player = FrameworkService.GetPlayer(client)

            if not player then
                return false
            end

            if itemName == 'cash' or itemName == 'money' then
                return player.addMoney(amount)
            end

            local match = string.match(itemName, "^WEAPON_(.*)")

            if match then
                return player.addWeapon(itemName:lower(), math.random(30, 120))
            end

            return player.addInventoryITem(itemName, amount)
        end
    
        InventoryService.RemoveItem = function(client, itemName, amount, metadata)
            local player = FrameworkService.GetPlayer(client)

            if not player then
                return false
            end

            if itemName == 'cash' or itemName == 'money' then
                return player.removeMoney(amount)
            end

            local match = string.match(itemName, "^WEAPON_(.*)")

            if match then
                return player.removeWeapon(itemName:lower(), math.random(30, 120))
            end

            return player.removeInventoryItem(itemName, amount)
        end

        InventoryService.HasItem = function(playerId, itemName, amount)
            local player = FrameworkService.GetPlayer(playerId)

            if not player then
                return false
            end

            local success, result = pcall(function()
                return player.getInventoryItem(itemName) and (player.getInventoryItem(itemName).count >= amount)
            end)

            if not success then
                dbg.critical('Failed to get check HasItem named: %s for player named %s (%s)', itemName, GetPlayerName(playerId), playerId)
                return false
            end

            return result
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

        InventoryService.RegisterUsableItem = function(itemName, callBack)
            if not SharedObject then
                return
            end

            SharedObject.RegisterUsableItem(itemName, function(source)
                callBack(source, nil)
            end)
        end

        InventoryService.GetInventoryItems = function(playerId)
            local player = FrameworkService.GetPlayer(playerId)

            if not player then
                return nil
            end

            local playerInventory = {}
            local items = player.getInventory()
            local loadout = player.getLoadout(false)

            local success, result = pcall(function()
                return exports[Inventory.CHEEZA]:getPlayerInventory(player)
            end)

            if not success then
                if items and next(items) then
                    for _, v in pairs(items) do
                        if v.count and v.count > 0 then
                            playerInventory[#playerInventory + 1] = {
                                name = v.name,
                                count = v.count,
                                label = v.label,
                                weight = v.weight,
                                useable = v.useable,
                                rare = v.rare,
                                type = 'item',
                            }
                        end
                    end
                end

                if loadout and next(loadout) then
                    for _, weapon in pairs(loadout) do
                        playerInventory[#playerInventory + 1] = {
                            name = weapon.name,
                            count = 1,
                            label = weapon.label,
                            weight = weapon.weight or 0,
                            useable = false,
                            rare = false,
                            type = 'weapon',
                        }
                    end
                end
            else
                playerInventory = result
            end

            return playerInventory
        end
    end
end)