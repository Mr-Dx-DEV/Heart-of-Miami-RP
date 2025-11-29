Inventory = {}
Inventory.Name = nil

if GetResourceState('ox_inventory') == 'started' then
    Inventory.Name = 'ox_inventory'
elseif GetResourceState('qb-inventory') == 'started' then
    Inventory.Name = 'qb-inventory'
elseif GetResourceState('qs-inventory') == 'started' then
    Inventory.Name = 'qs-inventory'
else
    if Framework.Name == 'ESX' then
        Inventory.Name = 'esx_inventory'
    elseif Framework.Name == 'QB' or Framework.Name == 'QBX' then
        Inventory.Name = 'qb-inventory'
    end
end

if IsDuplicityVersion() then
    function Inventory.RegisterUsableItem(itemName, callback)
        if Framework.Name == 'QB' or Framework.Name == 'QBX' then
            Framework.Object.Functions.CreateUseableItem(itemName, callback)
        elseif Inventory.Name == 'esx_inventory' then
            Framework.Object.RegisterUsableItem(itemName, callback)
        end
    end
    
    function Inventory.GetItemCount(source, itemName)
        if Inventory.Name == 'ox_inventory' then
            local count = exports.ox_inventory:GetItem(source, itemName, nil, true)
            return count or 0
        elseif Inventory.Name == 'qb-inventory' or Inventory.Name == 'qs-inventory' then
            local Player = Framework.GetPlayer(source)
            if Player then
                if Framework.Name == 'QBX' then
                    return Player.Functions.GetItemByName(itemName)?.amount or 0
                else
                    local item = Player.Functions.GetItemByName(itemName)
                    return item and item.amount or 0
                end
            end
        elseif Inventory.Name == 'esx_inventory' then
            local Player = Framework.GetPlayer(source)
            if Player then
                local item = Player.getInventoryItem(itemName)
                return item and item.count or 0
            end
        end
        return 0
    end
    
    function Inventory.RemoveItem(source, itemName, count, slot)
        if Inventory.Name == 'ox_inventory' then
            return exports.ox_inventory:RemoveItem(source, itemName, count, nil, slot)
        elseif Inventory.Name == 'qb-inventory' or Inventory.Name == 'qs-inventory' then
            local Player = Framework.GetPlayer(source)
            if Player then
                return Player.Functions.RemoveItem(itemName, count, slot)
            end
        elseif Inventory.Name == 'esx_inventory' then
            local Player = Framework.GetPlayer(source)
            if Player then
                Player.removeInventoryItem(itemName, count)
                return true
            end
        end
        return false
    end
    
else
    function Inventory.ItemBox(itemName, action)
        if Inventory.Name == 'ox_inventory' then
            return
        elseif Inventory.Name == 'qb-inventory' or Inventory.Name == 'qs-inventory' then
            if Framework.Name == 'QB' or Framework.Name == 'QBX' then
                TriggerEvent('inventory:client:ItemBox', Framework.Object.Shared.Items[itemName], action)
            end
        end
    end
    
end

