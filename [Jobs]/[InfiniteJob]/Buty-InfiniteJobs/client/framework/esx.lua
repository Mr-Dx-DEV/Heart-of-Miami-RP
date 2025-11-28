if Configuration.Framework ~= 'esx' then
    return
end

ESX = exports['es_extended']:getSharedObject()

playerJob = nil
playerJobName = nil
taskblip = {}
task_blip = {}

if Configuration.JobForID then
    Citizen.CreateThread(function()

        while ESX == nil do
            Citizen.Wait(100)
        end
        
        while playerJob == nil do
            playerJob = ESX.GetPlayerData().job
            Wait(1000)
        end

        StartWithJob()
    end)
end

RegisterNetEvent('esx:setJob', function(job, lastJob)
    playerJob = job
end)

hintToDisplay = function(text, coords)
    local playerCoords = GetEntityCoords(PlayerPedId())
    local dist = #(vector3(coords.x, coords.y, coords.z) - playerCoords)

    if dist < 1.5 then
        DrawText3Ds(coords.x, coords.y, coords.z, text, 0.35)
    else
        DrawText3Ds(coords.x, coords.y, coords.z, text, 0.35)
    end
end

function DrawText3Ds(x, y, z, text, scale)
    SetTextScale(scale or 0.35, scale or 0.35)
    SetTextFont(4)
    SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)

    DrawText(0.0, 0.0)

    local textLength = string.len(text)
    local factor = textLength / 370
    DrawRect(0.0, 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 100)

    ClearDrawOrigin()
end

Notify = function(type, text, time)
    -- time = 10000
    -- if type == 'success' then
    --     exports["Venice-Notification"]:Notify(text, time, "check", options)
    -- elseif type == 'error' then
    --     exports["Venice-Notification"]:Notify(text, time, "error", options)
    -- elseif type == 'info' then
    --     exports["Venice-Notification"]:Notify(text, time, "info", options)
    -- end

    ESX.ShowNotification(text)
end

function tooltext(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

GetJob = function(player)
    local job = lib.callback.await('Buty-InfiniteJobs:server:GetJob', false, player)
    return job
end

setblip = function(name,coords,text,number_blip)
    if name == "jobcenter" then
        jobcenter_blip = AddBlipForCoord(coords[1], coords[2], coords[3])
        SetBlipSprite(jobcenter_blip, 162)
        SetBlipColour(jobcenter_blip, 27)
        SetBlipScale(jobcenter_blip, 0.9)
        SetBlipAsShortRange(jobcenter_blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandSetBlipName(jobcenter_blip)
    elseif name == "menu_group" then
        menu_group_blip = AddBlipForCoord(coords[1], coords[2], coords[3])
        SetBlipSprite(menu_group_blip, 516)
        SetBlipColour(menu_group_blip, 27)
        SetBlipScale(menu_group_blip, 0.4)
        SetBlipAsShortRange(menu_group_blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandSetBlipName(menu_group_blip)
    elseif name == "workclothes" then
        workclothes_blip = AddBlipForCoord(coords[1], coords[2], coords[3])
        SetBlipSprite(workclothes_blip, 366)
        SetBlipColour(workclothes_blip, 27)
        SetBlipScale(workclothes_blip, 0.4)
        SetBlipAsShortRange(workclothes_blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandSetBlipName(workclothes_blip)
    elseif name == "VehicleBlip" then
        vehicle_blip = AddBlipForCoord(coords[1], coords[2], coords[3])
        SetBlipSprite(vehicle_blip, 641)
        SetBlipColour(vehicle_blip, 27)
        SetBlipScale(vehicle_blip, 0.4)
        SetBlipAsShortRange(vehicle_blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandSetBlipName(vehicle_blip)
    elseif name == "task" then
        task_blip[number_blip] = AddBlipForCoord(coords[1], coords[2], coords[3])
        SetBlipSprite(task_blip[number_blip], 271)
        SetBlipColour(task_blip[number_blip], 27)
        SetBlipScale(task_blip[number_blip], 0.4)
        SetBlipAsShortRange(task_blip[number_blip], true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandSetBlipName(task_blip[number_blip])
    elseif name == "process" then
        process_blip = AddBlipForCoord(coords[1], coords[2], coords[3])
        SetBlipSprite(process_blip, 267)
        SetBlipColour(process_blip, 27)
        SetBlipScale(process_blip, 0.4)
        SetBlipAsShortRange(process_blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandSetBlipName(process_blip)
    elseif name == "pay" then
        pay_blip = AddBlipForCoord(coords[1], coords[2], coords[3])
        SetBlipSprite(pay_blip, 207)
        SetBlipColour(pay_blip, 27)
        SetBlipScale(pay_blip, 0.4)
        SetBlipAsShortRange(pay_blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandSetBlipName(pay_blip)
        SetNewWaypoint(coords[1], coords[2])
    end
end

progress = function()
    local useButyProgress = GetResourceState('Buty-Progress') == 'started'
    if useButyProgress then
        exports["Buty-Progress"]:on({
            time = 3000, 
            text = _U('JOBS_NOTIFICATION_PROGRESS'), 
            color = "linear-gradient(20.5deg, #AC41DE 9.83%, rgba(172, 65, 222, 0) 93.95%)",
            color2 = "#AC41DE",
        })
    else
        lib.progressBar({
            duration = 3000,
            label = _U('JOBS_NOTIFICATION_PROGRESS'),
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
        })
    end
end

spawnvehicle = function(vehicle)
    local plate = GetVehicleNumberPlateText(vehicle)
    local model = GetEntityModel(vehicle)

    -- Verificar qué sistema de llaves está activo
    local useJaksamsKey = GetResourceState('vehicles_keys') == 'started'
    local useWasabiKey = GetResourceState('wasabi_carlock') == 'started'
    local useQuasarKeys = GetResourceState('qs-vehiclekeys') == 'started'
    local useAK47Keys = GetResourceState('ak47_vehiclekeys') == 'started'
    local useQBKeys = GetResourceState('qb-vehiclekeys') == 'started'
    local useMKKeys = GetResourceState('mk_vehiclekeys') == 'started'
    local useDusaKeys = GetResourceState('dusa_vehiclekeys') == 'started'
    local useMRNewbKeys = GetResourceState('MrNewbVehicleKeys') == 'started'

    -- Asignar llaves según el sistema detectado
    if useJaksamsKey then
        TriggerServerEvent("vehicles_keys:selfGiveVehicleKeys", plate)
    elseif useWasabiKey then
        exports.wasabi_carlock:GiveKey(plate)
    elseif useQuasarKeys then
        exports['qs-vehiclekeys']:GiveKeys(plate, model, true)
    elseif useAK47Keys then
        exports['ak47_vehiclekeys']:GiveVirtualKey(plate)
    elseif useQBKeys then
        TriggerEvent("qb-vehiclekeys:client:SetOwner", plate)
        TriggerEvent("qb-vehiclekeys:client:AddKeys", plate)
    elseif useMKKeys then
        exports["mk_vehiclekeys"]:AddKey(vehicle)
    elseif useDusaKeys then
        exports['dusa_vehiclekeys']:IntegrateKey(plate)
    elseif useMRNewbKeys then
        exports.MrNewbVehicleKeys:GiveKeys(vehicle)
    end

    -- Configurar combustible a 100%
    SetVehicleFuelLevel(vehicle, 100.0)
end

Removevehicle = function(vehicle)
    local plate = GetVehicleNumberPlateText(vehicle)
    local model = GetEntityModel(vehicle)

    -- Verificar qué sistema de llaves está activo
    local useWasabiKey = GetResourceState('wasabi_carlock') == 'started'
    local useQuasarKeys = GetResourceState('qs-vehiclekeys') == 'started'
    local useJaksamsKey = GetResourceState('vehicles_keys') == 'started'
    local useAK47Keys = GetResourceState('ak47_vehiclekeys') == 'started'
    local useQBKeys = GetResourceState('qb-vehiclekeys') == 'started'
    local useMKKeys = GetResourceState('mk_vehiclekeys') == 'started'
    local useDusaKeys = GetResourceState('dusa_vehiclekeys') == 'started'
    local useMRNewbKeys = GetResourceState('MrNewbVehicleKeys') == 'started'

    -- Remover llaves según el sistema detectado
    if useWasabiKey then
        exports.wasabi_carlock:RemoveKey(plate)
    elseif useQuasarKeys then
        exports['qs-vehiclekeys']:RemoveKeys(plate, model)
    elseif useJaksamsKey then
        TriggerServerEvent("vehicles_keys:selfRemoveKeys", plate)
    elseif useAK47Keys then
        exports['ak47_vehiclekeys']:RemoveVirtualKey(plate)
    elseif useMRNewbKeys then
        exports.MrNewbVehicleKeys:RemoveKeys(vehicle)
    end
    DeleteEntity(vehicle)
end


RegisterCommand('canceljob', function(source, args, rawCommand)
    if job_incurse then canceljob() end
end, false)

CreateTarget = function(data)
    if data.targetType == 'AddBoxZone' then
        if data.distance == nil then
            distance = 3.0
        else
            distance = data.distance
        end

        exports["qtarget"]:AddBoxZone(data.identifier, data.coords, data.length, data.width, {
            name=data.identifier,
            heading=data.heading,
            debugPoly=false,
            minZ=data.coords.z-0.7,
            maxZ=data.coords.z+1.5,
        }, {
            options = data.options,
            distance = distance,
        })
    elseif data.targetType == 'entity' then
     
        if data.distance == nil then
            distance = 2.5
        else
            distance = data.distance
        end
        exports.qtarget:AddTargetEntity(data.entitys, {
            options = data.options,
            label = data.identifier,
            distance = distance
        })  
    end
end

finish_teleport_function = function(player, coord)
    SetEntityCoords(player, coord)
end

tutorial_cam_active = function()

end

tutorial_cam_inactive = function()
    
end

skill_custom = function()

    --------- ** PS-UI EXAMPLE! *** -------------------

        -- local p = promise.new()

        -- exports['ps-ui']:Circle(function(success)
        --     p:resolve(success)
        -- end, 2, 50) 

        -- return Citizen.Await(p)
        
    ---------------------------------------------------

    return lib.skillCheck(lobby.jobconfig.skill.difficultyLevels,lobby.jobconfig.skill.controls)
end

