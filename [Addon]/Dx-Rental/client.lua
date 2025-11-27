local QBCore = GetResourceState('qbx_core') == 'started' and exports['qb-core']:GetCoreObject()
local ESX = GetResourceState('es_extended') == 'started' and exports.es_extended:getSharedObject()



local blips = {
  
    {title="Vehicle Rentals", colour=13, id=56, scale = 0.6, x = -254.016, y = -970.496, z = 31.22}, -- Prison
    {title="Vehicle Rentals", colour=13, id=56, scale = 0.6, x = -214.48, y = 6355.65, z = 31.49}, -- Paleto
    {title="Vehicle Rentals", colour=13, id=56, scale = 0.6, x = -1039.07, y = -2730.95, z = 20.21}, -- Airport
    {title="Boat Rentals", colour= 3, id= 427, scale = 0.6, x = 3373.4, y = 5183.50, z = 1.46}, -- Boat Lighthouse
    {title="Boat Rentals", colour= 3, id= 427, scale = 0.6, x = -1799.49, y = -1224.51, z = 1.59}, -- Airport
    -- {title="Vehicle Rentals", colour=13, id=56, scale = 0.6, x = -279.48, y = -1061.26, z = 26.27}, -- Golf
}
  
  
Citizen.CreateThread(function()
      for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, info.scale)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

  

local ped = {}
Citizen.CreateThread(function()
    for k, v in pairs(Config.locations) do
        if v.ped then
            RequestModel(Config.pedmodel)
            while not HasModelLoaded(Config.pedmodel) do
                Wait(10)
            end

            ped[k] = CreatePed(4, Config.pedmodel, v.coords.x, v.coords.y, v.coords.z, v.coords.w, false, true)
            if Config.scenario then
                TaskStartScenarioInPlace(ped[k], Config.scenario, 0, true)
            end

            SetEntityCoordsNoOffset(ped[k], v.coords.x, v.coords.y, v.coords.z, false, false, false, true)
            Wait(100)
            FreezeEntityPosition(ped[k], true)
            SetEntityInvincible(ped[k], true)
            SetBlockingOfNonTemporaryEvents(ped[k], true)
            exports.ox_target:addLocalEntity(ped[k], {
                {
                    name = 'rent_vehicle_' .. k,
                    label = 'Rent Vehicle',
                    icon = 'fa-solid fa-car',
                    distance = 2.5,
                    onSelect = function(data)
                        TriggerEvent('NUKE-Rentals:client:rentVehicle', k)
                    end
                }
            })
        else
            exports.ox_target:addSphereZone({
                coords = vec3(v.coords.x, v.coords.y, v.coords.z),
                radius = 2.5,
                debug = false,
                options = {
                    {
                        name = 'rent_vehicle_' .. k,
                        label = 'Rent Vehicle',
                        icon = 'fa-solid fa-car',
                        onSelect = function(data)
                            TriggerEvent('NUKE-Rentals:client:rentVehicle', k)
                        end
                    }
                }
            })
        end
    end
end)


RegisterNetEvent('NUKE-Rentals:client:rentVehicle', function(k)

    local menu_options = {}

    for location, info in pairs(Config.locations) do 
        if location == k then 
            for vehicle, details in pairs(info.vehicles) do 
                table.insert(menu_options, {
                    title = vehicle:gsub("^%l", string.upper),
                    image = details.image,
                    description = '$' .. details.price,
                    onSelect = function()
                        TriggerServerEvent('NUKE-Rentals:server:MoneyAmounts', vehicle, details.price, location)
                    end
                })
            end
        end
    end 

    lib.registerContext({
        id = 'vehicle_rental',
        title = 'Vehicle Rental',
        options = menu_options,
    })

    lib.showContext('vehicle_rental')
end)

RegisterNetEvent('NUKE-Rentals:client:SpawnVehicle', function(vehiclename, location)
    local player = PlayerPedId()
    local vehicle = GetHashKey(vehiclename)
    RequestModel(vehicle)
    while not HasModelLoaded(vehicle) do
        Wait(10)
    end
    local rental = CreateVehicle(vehicle, Config.locations[location].vehiclespawncoords.x, Config.locations[location].vehiclespawncoords.y, Config.locations[location].vehiclespawncoords.z, Config.locations[location].vehiclespawncoords.w, true, true)
    local plate = GetVehicleNumberPlateText(rental)
    SetVehicleOnGroundProperly(rental)
    TaskWarpPedIntoVehicle(player, rental, -1) 
    SetVehicleEngineOn(rental, true, true, true)
    TriggerServerEvent('NUKE-Rentals:server:RentVehicle', vehiclename, plate)

    -- give keys 
    if QBCore then 
        exports.MrNewbVehicleKeys:GiveKeysByPlate(plate)
    elseif ESX then 
        exports["Renewed-Vehiclekeys"]:addKey(plate)
    end
        
    SetModelAsNoLongerNeeded(vehicle)
end)