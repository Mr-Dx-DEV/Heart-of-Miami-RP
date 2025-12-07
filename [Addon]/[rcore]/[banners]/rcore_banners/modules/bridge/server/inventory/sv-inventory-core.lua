CreateThread(function()
    if Config.Inventory == Inventory.CORE then
        InventoryService.AddItem = function(client, itemName, amount, metadata)
            local retval = false
            local player = FrameworkService.GetPlayer(client)

            if Config.Framework == Framework.ESX and player then
                if itemName == 'cash' or itemName == 'money' then
                    return player.addMoney(amount)
                end
    
                local match = string.match(itemName, "^WEAPON_(.*)")
    
                if match then
                    return player.addWeapon(itemName:lower(), math.random(30, 120))
                end
    
                retval = player.addInventoryItem(itemName, amount)
            elseif IS_QB[Config.Framework] and player then -- QBCORE, QBOX
                if itemName == 'cash' or itemName == 'money' then
                    return player.Functions.AddMoney('cash', amount)
                end
    
                retval = player.Functions.AddItem(itemName, amount, nil, metadata or {})
            else
                retval = true
                -- YOUR INVENTORY EXPORT/EVENT
            end

            return retval
        end
    
        InventoryService.RemoveItem = function(client, itemName, amount, metadata)
            local retval = false
            local player = FrameworkService.GetPlayer(client)

            if Config.Framework == Framework.ESX and player then
                if itemName == 'cash' or itemName == 'money' then
                    return player.removeMoney(amount)
                end
    
                local match = string.match(itemName, "^WEAPON_(.*)")
    
                if match then
                    return player.removeWeapon(itemName:lower(), math.random(30, 120))
                end
    
                retval = player.removeInventoryItem(itemName, amount)
            elseif IS_QB[Config.Framework] and player then -- QBCORE, QBOX
                if itemName == 'cash' or itemName == 'money' then
                    return player.Functions.RemoveMoney('cash', amount)
                end
        
                local match = string.match(itemName, "^WEAPON_(.*)")
        
                if match then
                    itemName = itemName:lower()
                end
        
                retval = player.Functions.RemoveItem(itemName, amount, nil, metadata or {})
            else
                retval = true
                -- YOUR INVENTORY EXPORT/EVENT
            end

            return retval
        end

        InventoryService.HasItem = function(client, itemName, amount)
            local retval = false
            local player = FrameworkService.GetPlayer(client)


            if Config.Framework == Framework.ESX and player then
                local success, result = pcall(function()
                    return player.getInventoryItem(itemName) and (player.getInventoryItem(itemName).count > amount)
                end)
    
                retval = result
            elseif IS_QB[Config.Framework] and player then -- QBCORE, QBOX
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

                retval = ItemInfo and ItemInfo.count and (ItemInfo.count >= amount or false)
            else
                retval = true
                -- YOUR INVENTORY EXPORT/EVENT
            end

            return retval
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
            if Config.Framework == Framework.ESX then
                SharedObject.RegisterUsableItem(itemName, function(source)
                    callBack(source, nil)
                end)
            elseif IS_QB[Config.Framework] then -- QBCORE, QBOX
                SharedObject.Functions.CreateUseableItem(itemName, function(source, item)
                    callBack(source, item.info or item.metadata or {})
                end)
            else
                -- playerId
                callBack(nil, nil)
            end
        end
    
    
        InventoryService.GetInventoryItems = function(client)
            local playerInventory = {}
            local player = FrameworkService.GetPlayer(client)
            
            if Config.Framework == Framework.ESX and player then
                local items = player.getInventory()
                local loadout = player.getLoadout(false)

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
            elseif IS_QB[Config.Framework] and player then -- QBCORE, QBOX
                playerInventory = player.PlayerData.items
            end

            return playerInventory
        end
    end
end)