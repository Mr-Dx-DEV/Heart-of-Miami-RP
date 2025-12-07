CreateThread(function()
    if not FrameworkObject then
        FrameworkObject = Citizen.Await(GetSharedObjectSafe())
    end
end)

function makeUsable(item, cb)
    if Config.ox_inventory then
        exports(item, function(event, itemData, inventory, slot, data)
            cb(inventory.id)
        end)
    else
        if Config.Framework == Frameworks.ESX then
            FrameworkObject.RegisterUsableItem(item, cb)
        elseif Config.Framework == Frameworks.QBCORE then
            FrameworkObject.Functions.CreateUseableItem(item, cb)
        end
    end
end

function canCarryItem(player, itemName)
    if not player then
        return false
    end

    local amount = 1

    if Config.Framework == Frameworks.ESX then
        if player.canCarryItem then
            return player.canCarryItem(itemName, amount)
        else
            local currentCount = player.getInventoryItem(itemName).count
            local limit = player.getInventoryItem(itemName).limit
            if limit == -1 then
                return true
            end
            return currentCount + amount <= limit
        end
        return false
    elseif Config.Framework == Frameworks.QBCORE then
        local itemInfo = FrameworkObject.Shared.Items[itemName:lower()]
        if not itemInfo then return false end
        if exports['qb-inventory']:CanCarryItem(source, itemName, amount) then
            return true
        else
            return false
        end
    end
end

function canUseItem(player, itemName)
    local amount = 1
    if Config.Framework == Frameworks.ESX then
        local xItem = player.getInventoryItem(itemName)
        if xItem and xItem.count >= amount then
            return true
        end
        return false
    elseif Config.Framework == Frameworks.QBCORE then
        local item = player.Functions.GetItemByName(itemName)
        if item and item.amount >= amount then
            return true
        end
        return false
    end
end

function useItem(player, itemName)
    if Config.Framework == Frameworks.ESX then
        local xItem = player.getInventoryItem(itemName)
        FrameworkObject.UseItem(player.source, xItem.name)
    elseif Config.Framework == Frameworks.QBCORE then
        local item = player.Functions.GetItemByName(itemName)
        FrameworkObject.Functions.UseItem(player.source, item)
    end
end

function addItem(player, itemName)
    local amount = 1
    if Config.Framework == Frameworks.ESX then
        player.addInventoryItem(itemName, amount)
    elseif Config.Framework == Frameworks.QBCORE then
        player.Functions.AddItem(itemName, amount)
    end
end

function removeItem(player, itemName)
    local amount = 1
    if Config.Framework == Frameworks.ESX then
        player.removeInventoryItem(itemName, amount)
    elseif Config.Framework == Frameworks.QBCORE then
        player.Functions.RemoveItem(itemName, amount)
    end
end

function getPlayer(source)
    if Config.Framework == Frameworks.ESX then
        return FrameworkObject.GetPlayerFromId(source)
    elseif Config.Framework == Frameworks.QBCORE then
        return FrameworkObject.Functions.GetPlayer(source)
    end
end