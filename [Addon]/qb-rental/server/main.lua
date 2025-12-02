local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-rental:getpapers', function(licenseplate, model)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {
        name = Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname.." "..Player.PlayerData.citizenid,
        veh = QBCore.Shared.Vehicles[model]["brand"].." "..QBCore.Shared.Vehicles[model]["name"],
        plate = licenseplate
    }
    exports.ox_inventory:AddItem(src, "rentalpapers", 1, info)
end)

lib.callback.register('qb-rental:CheckMoney', function(source, money)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= money then
        Player.Functions.RemoveMoney('cash', money)
        return true
    else
        return false
    end
end)

RegisterServerEvent('qb-rental:takepapers', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    exports.ox_inventory:RemoveItem(src, 'rentalpapers', 1)
end)
