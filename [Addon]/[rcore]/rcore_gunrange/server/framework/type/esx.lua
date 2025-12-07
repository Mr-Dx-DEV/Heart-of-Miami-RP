if FrameworkResource == Framework.ESX then
    local ESX = nil

    local success, result = pcall(function()
        ESX = exports[Framework.ESX]:getSharedObject()
    end)

    if not success then
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end

    Framework.object = ESX

    function Framework.getIdentifier(source)
        local player = ESX.GetPlayerFromId(source)
        if player == nil then return nil end
        return player.identifier
    end

    function Framework.payMoney(source, price)
        local player = ESX.GetPlayerFromId(source)
        if player == nil then return false end
        if player.getMoney() >= price then
            player.removeMoney(price)
            return true
        end
        return false
    end

    AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
        local identifier = xPlayer.identifier
        local rentedWeapon, storedWeapons = db.getWeapons(identifier)
        if rentedWeapon ~= nil then
            Inventory.removeWeapon(playerId, rentedWeapon)
            givenWeapons[identifier] = nil
            db.deleteRentedWeapon(identifier)
            savedPlayerWeapons[playerId] = storedWeapons
        end
        returnInventory(playerId)
    end)

    AddEventHandler('esx:playerDropped', function(playerId)
        local identifier = Framework.getIdentifier(playerId)
        local rentedWeapon = givenWeapons[identifier]
        if rentedWeapon ~= nil then
            db.saveRentedWeapon(identifier, rentedWeapon, savedPlayerWeapons[playerId])
        end
    end)
end
