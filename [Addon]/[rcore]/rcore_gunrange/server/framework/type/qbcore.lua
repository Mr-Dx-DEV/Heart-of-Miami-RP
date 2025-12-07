if FrameworkResource == Framework.QBCore then
    local QBCore = nil

    local success = pcall(function()
        QBCore = exports[Framework.QBCore]:GetCoreObject()
    end)

    if not success then
        success = pcall(function()
            QBCore = exports[Framework.QBCore]:GetSharedObject()
        end)
    end

    if not success then
        local breakPoint = 0
        while not QBCore do
            Wait(100)
            TriggerEvent('QBCore:GetObject', function(obj)
                QBCore = obj
            end)

            breakPoint = breakPoint + 1
            if breakPoint == 25 then
                print(string.format(
                    "^1[%s]^7 Could not load the sharedobject, are you sure it is called ^1˙QBCore:GetObject˙^7?",
                    GetCurrentResourceName()))
                break
            end
        end
    end

    Framework.object = QBCore

    function Framework.getIdentifier(source)
        local player = QBCore.Functions.GetPlayer(source)
        if player == nil then return nil end
        return player.PlayerData.citizenid
    end

    function Framework.payMoney(source, price)
        local player = QBCore.Functions.GetPlayer(source)
        if player == nil then return false end
        if player.Functions.GetMoney("cash") >= price then
            player.Functions.RemoveMoney("cash", price)
            return true
        end
        return false
    end

    AddStateBagChangeHandler('isLoggedIn', nil, function(bagName, key, value)
        local playerId = GetPlayerFromStateBagName(bagName)
        if playerId == 0 then return end
        local identifier = Framework.getIdentifier(playerId)
        if value then
            local rentedWeapon, storedWeapons = db.getWeapons(identifier)
            if rentedWeapon ~= nil then
                givenWeapons[identifier] = nil
                Inventory.removeWeapon(playerId, rentedWeapon)
                db.deleteRentedWeapon(identifier)
                savedPlayerWeapons[playerId] = storedWeapons
            end
            returnInventory(playerId)
        else
            local rentedWeapon = givenWeapons[identifier]
            if rentedWeapon ~= nil then
                db.saveRentedWeapon(identifier, rentedWeapon, savedPlayerWeapons[playerId])
            end
        end
    end)
end
