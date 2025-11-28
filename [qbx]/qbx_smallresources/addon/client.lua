local QBCore = exports['qb-core']:GetCoreObject()
-- ========================
-- 🔒 Anti Aim Lock
-- ========================
CreateThread(function()
    while true do
        local playerId = PlayerId()
        local ped = PlayerPedId()
        if ped ~= -1 then
            if IsPlayerFreeAiming(playerId) then
                SetPlayerLockon(playerId, false)
                Wait(100)
            else
                Wait(1000) -- slower when not aiming
            end
        else
            Wait(1000)
        end
    end
end)

-- ========================
-- 🪖 Remove Bulletproof Helmet
-- ========================
lib.onCache('ped', function(value)
    SetPedConfigFlag(value, 438, true)
end)

-- ========================
-- 🚓 Emergency Vehicle Kick
-- ========================
CreateThread(function()
    while true do
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            local vehicle = GetVehiclePedIsIn(ped, false)
            if GetPedInVehicleSeat(vehicle, -1) == ped then
                local vehClass = GetVehicleClass(vehicle)
                if vehClass == 18 then
                    local PlayerData = QBCore.Functions.GetPlayerData()
                    if PlayerData.job.name ~= 'police' and PlayerData.job.name ~= 'ambulance' then
                        TaskLeaveVehicle(ped, vehicle, 0)
                        QBCore.Functions.Notify("You are not allowed to drive this vehicle.", "error")
                    end
                end
            end
            Wait(2000)
        else
            Wait(5000) -- slower when on foot
        end
    end
end)

-- ========================
-- Complete ID Checker
-- ========================

RegisterNetEvent('citizen:showInfo', function(data)
    print('Citizen ID')
    lib.registerContext({
        id = 'citizen_info_menu',
        title = 'Citizen Information',
        options = {
            {
                title = 'Citizen ID',
                description = data.citizenid,
                icon = 'id-card',
                onSelect = function()
                    lib.setClipboard(data.citizenid)
                    lib.notify({
                        title = 'Copied!',
                        description = 'Citizen ID copied to clipboard',
                        type = 'success'
                    })
                end
            },
            {
                title = 'Character Name',
                description = data.charname,
                icon = 'user',
                onSelect = function()
                    lib.setClipboard(data.charname)
                    lib.notify({
                        title = 'Copied!',
                        description = 'Character name copied to clipboard',
                        type = 'success'
                    })
                end
            },
            {
                title = 'Steam Name',
                description = data.steamname,
                icon = 'gamepad',
                onSelect = function()
                    lib.setClipboard(data.steamname)
                    lib.notify({
                        title = 'Copied!',
                        description = 'Steam name copied to clipboard',
                        type = 'success'
                    })
                end
            },
            {
                title = 'License',
                description = data.license,
                icon = 'certificate',
                onSelect = function()
                    lib.setClipboard(data.license)
                    lib.notify({
                        title = 'Copied!',
                        description = 'License copied to clipboard',
                        type = 'success'
                    })
                end
            }
        }
    })

    lib.showContext('citizen_info_menu')
end)


-- ========================
-- Bike Damage Stoper
-- ========================


CreateThread(function()
    local isOnBike = false
    local lastVehicle = 0

    while true do
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        if vehicle ~= 0 then
            if vehicle ~= lastVehicle then
                lastVehicle = vehicle
                local vehicleClass = GetVehicleClass(vehicle)
                isOnBike = (vehicleClass == 8 or vehicleClass == 13)
            end

            if isOnBike then
                DisableControlAction(0, 73, true)
                DisableControlAction(0, 345, true)
                DisableControlAction(0, 346, true)
                Wait(0)
            else
                Wait(200)
            end
        else
            if lastVehicle ~= 0 then
                lastVehicle = 0
                isOnBike = false
            end
            Wait(500)
        end
    end
end)



-- ========================
-- WeaponChecker
-- ========================

local restrictedWeapons = {
    ['WEAPON_STUNGUN'] = {'police', 'ambulance'},
    ['WEAPON_GLOCK22'] = {'police', 'ambulance'},
    ['WEAPON_DE'] = {'police', 'ambulance'},
    ['WEAPON_RAM9D'] = {'police', 'ambulance'},
    ['WEAPON_CZBREN'] = {'police', 'ambulance'},
    ['WEAPON_MK47'] = {'police', 'ambulance'},
    ['WEAPON_MP5'] = {'police', 'ambulance'},
    ['WEAPON_BERETTA1301'] = {'police', 'ambulance'},
}

local function hasAccess(job, allowedJobs)
    for _, j in ipairs(allowedJobs) do
        if j == job then return true end
    end
    return false
end

AddEventHandler('ox_inventory:currentWeapon', function(weapon)
    if not weapon or not weapon.name then return end

    local weaponName = weapon.name
    local playerData = QBCore.Functions.GetPlayerData()
    local job = playerData.job.name

    if restrictedWeapons[weaponName] then
        if not hasAccess(job, restrictedWeapons[weaponName]) then
            TriggerEvent('ox_inventory:disarm', true)

            QBCore.Functions.Notify("You are not authorized to use this weapon!", "error")
        end
    end
end)

