local cachedItems = {}
local cachedPlayers = {}

CreateThread(function()
    while true do
        Wait(60000)
        for k, v in pairs(cachedPlayers) do
            local ped = GetPlayerPed(k)
            if ped ~= -1 then
                local pos = GetEntityCoords(ped)
                if #(v - pos) > 2 then
                    TriggerEvent(TriggerName("giveShooterWeapon"), false, k)
                    cachedPlayers[k] = nil
                end
            end
        end
    end
end)

if Config.TargetItemBased then
    function CheckForIllegalWeapons(source)
        local xPlayer = SharedObject.GetPlayerFromId(source)
        if xPlayer then
            if GetResourceKvpInt(xPlayer.identifier .. "_carnival_gun") == 1 then
                if GetResourceKvpInt(xPlayer.identifier .. "_carnival_gun_count") == 0 then
                    xPlayer.removeInventoryItem(Config.TargetWeaponItemName, 1)
                end

                if Config.IsAmmoSeparated then
                    xPlayer.removeInventoryItem(Config.TargetAmmoItemName, xPlayer.getInventoryItem(Config.TargetAmmoItemName).count)
                    xPlayer.addInventoryItem(Config.TargetAmmoItemName, GetResourceKvpInt(xPlayer.identifier .. "_carnival_ammo_count"))
                end

                DeleteResourceKvp(xPlayer.identifier .. "_carnival_gun_count")
                DeleteResourceKvp(xPlayer.identifier .. "_carnival_gun")
                DeleteResourceKvp(xPlayer.identifier .. "_carnival_ammo_count")
            end
        end
    end

    RegisterNetEvent('esx:playerLoaded', function()
        CheckForIllegalWeapons(source)
    end)

    RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
        CheckForIllegalWeapons(source)
    end)

    CreateThread(function()
        for id, _ in pairs(GetPlayers()) do
            CheckForIllegalWeapons(id)
        end
    end)
end

RegisterNetEvent(TriggerName("giveShooterWeapon"), function(result, playerID)
    local source = playerID or source

    if not IsPlayerAtCorrectLocation(source) then
        return
    end

    local xPlayer = SharedObject.GetPlayerFromId(source)
    if xPlayer then
        if result then
            SetResourceKvpInt(xPlayer.identifier .. "_carnival_gun", 1)
            if not cachedPlayers[source] then
                if Config.IsAmmoSeparated then
                    local gunCount = xPlayer.getInventoryItem(Config.TargetWeaponItemName).count
                    local ammoCount = xPlayer.getInventoryItem(Config.TargetAmmoItemName).count
                    SetResourceKvpInt(xPlayer.identifier .. "_carnival_gun_count", gunCount)
                    SetResourceKvpInt(xPlayer.identifier .. "_carnival_ammo_count", ammoCount)

                    cachedItems[source] = {
                        ammo = ammoCount,
                        gun = gunCount,
                    }

                    if gunCount == 0 then
                        xPlayer.addInventoryItem(Config.TargetWeaponItemName, 1)
                    end
                    xPlayer.addInventoryItem(Config.TargetAmmoItemName, Config.AmmoCount)
                else
                    cachedItems[source] = {
                        gun = xPlayer.getInventoryItem(Config.TargetWeaponItemName).count,
                    }

                    xPlayer.addInventoryItem(Config.TargetWeaponItemName, Config.AmmoCount)
                end
                TriggerClientEvent(TriggerName("ForceWeaponToHand"), source)
                cachedPlayers[source] = GetEntityCoords(GetPlayerPed(source))
            end
        else
            SetResourceKvpInt(xPlayer.identifier .. "_carnival_gun", 0)
            if cachedPlayers[source] then
                local data = cachedItems[source]
                if data then
                    xPlayer.removeInventoryItem(Config.TargetWeaponItemName, xPlayer.getInventoryItem(Config.TargetWeaponItemName).count)
                    if Config.IsAmmoSeparated then
                        xPlayer.removeInventoryItem(Config.TargetAmmoItemName, xPlayer.getInventoryItem(Config.TargetAmmoItemName).count)
                        if data.ammo ~= 0 then
                            xPlayer.addInventoryItem(Config.TargetAmmoItemName, data.ammo)
                        end
                    end

                    if data.gun ~= 0 then
                        xPlayer.addInventoryItem(Config.TargetWeaponItemName, data.gun)
                    end
                end
                cachedItems[source] = nil
                cachedPlayers[source] = nil
            end
        end
    end
end)

function IsPlayerAtCorrectLocation(source)
    local ped = GetPlayerPed(source)
    local pos = GetEntityCoords(ped)

    for k, v in pairs(Config.MiniGameList) do
        if #(v.Position - pos) > 2 then
            return true
        end
    end
    return false
end