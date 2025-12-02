local QBCore = exports['qb-core']:GetCoreObject()
local SpawnVehicle = false


--Ped Spawn
function SpawnPed()
  lib.requestModel(config.RentalLocations.cars.pedhash, 5000)
  carrental = CreatePed(1, config.RentalLocations.cars.pedhash, config.RentalLocations.cars.pedspawn.x, config.RentalLocations.cars.pedspawn.y, config.RentalLocations.cars.pedspawn.z, config.RentalLocations.cars.pedspawn.w, false, true)
  FreezeEntityPosition(carrental, true)
  SetEntityInvincible(carrental, true)
  SetBlockingOfNonTemporaryEvents(carrental, true)
  TaskStartScenarioInPlace(carrental, 'WORLD_HUMAN_CLIPBOARD', 0, true)

  lib.requestModel(config.RentalLocations.aircrafts.pedhash, 5000)
  aircraftrental = CreatePed(1, config.RentalLocations.aircrafts.pedhash, config.RentalLocations.aircrafts.pedspawn.x, config.RentalLocations.aircrafts.pedspawn.y, config.RentalLocations.aircrafts.pedspawn.z, config.RentalLocations.aircrafts.pedspawn.w, false, true)
  FreezeEntityPosition(aircraftrental, true)
  SetEntityInvincible(aircraftrental, true)
  SetBlockingOfNonTemporaryEvents(aircraftrental, true)
  TaskStartScenarioInPlace(aircraftrental, 'WORLD_HUMAN_CLIPBOARD', 0, true)

  lib.requestModel(config.RentalLocations.boat.pedhash, 5000)
  boatrental = CreatePed(1, config.RentalLocations.boat.pedhash, config.RentalLocations.boat.pedspawn.x, config.RentalLocations.boat.pedspawn.y, config.RentalLocations.boat.pedspawn.z, config.RentalLocations.boat.pedspawn.w, false, true)
  FreezeEntityPosition(boatrental, true)
  SetEntityInvincible(boatrental, true)
  SetBlockingOfNonTemporaryEvents(boatrental, true)
  TaskStartScenarioInPlace(boatrental, 'WORLD_HUMAN_CLIPBOARD', 0, true)

  lib.requestModel(config.RentalLocations.bike.pedhash, 5000)
  bikerental = CreatePed(1, config.RentalLocations.bike.pedhash, config.RentalLocations.bike.pedspawn.x, config.RentalLocations.bike.pedspawn.y, config.RentalLocations.bike.pedspawn.z, config.RentalLocations.bike.pedspawn.w, false, true)
  FreezeEntityPosition(bikerental, true)
  SetEntityInvincible(bikerental, true)
  SetBlockingOfNonTemporaryEvents(bikerental, true)
  TaskStartScenarioInPlace(bikerental, 'WORLD_HUMAN_CLIPBOARD', 0, true)
end

-- Blips
function RentalBlips()
  CarRentalBlip = AddBlipForCoord(config.RentalLocations.cars.pedspawn.x, config.RentalLocations.cars.pedspawn.y, config.RentalLocations.cars.pedspawn.z)
  SetBlipSprite (CarRentalBlip, 225)
  SetBlipDisplay(CarRentalBlip, 6)
  SetBlipScale  (CarRentalBlip, 0.65)
  SetBlipAsShortRange(CarRentalBlip, true)
  SetBlipColour(CarRentalBlip, 2)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentSubstringPlayerName('Car Rental')
  EndTextCommandSetBlipName(CarRentalBlip)

  AirRentalBlip = AddBlipForCoord(config.RentalLocations.aircrafts.pedspawn.x, config.RentalLocations.aircrafts.pedspawn.y, config.RentalLocations.aircrafts.pedspawn.z)
  SetBlipSprite (AirRentalBlip, 307)
  SetBlipDisplay(AirRentalBlip, 6)
  SetBlipScale  (AirRentalBlip, 0.65)
  SetBlipAsShortRange(AirRentalBlip, true)
  SetBlipColour(AirRentalBlip, 2)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentSubstringPlayerName('Aircraft Rentals')
  EndTextCommandSetBlipName(AirRentalBlip)

  BoatRentalBlip = AddBlipForCoord(config.RentalLocations.boat.pedspawn.x, config.RentalLocations.boat.pedspawn.y, config.RentalLocations.boat.pedspawn.z)
  SetBlipSprite (BoatRentalBlip, 427)
  SetBlipDisplay(BoatRentalBlip, 6)
  SetBlipScale  (BoatRentalBlip, 0.65)
  SetBlipAsShortRange(BoatRentalBlip, true)
  SetBlipColour(BoatRentalBlip, 2)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentSubstringPlayerName('Boat Rentals')
  EndTextCommandSetBlipName(BoatRentalBlip)

  BikeRentalBlip = AddBlipForCoord(config.RentalLocations.bike.pedspawn.x, config.RentalLocations.bike.pedspawn.y, config.RentalLocations.bike.pedspawn.z)
  SetBlipSprite (BikeRentalBlip, 226)
  SetBlipDisplay(BikeRentalBlip, 6)
  SetBlipScale  (BikeRentalBlip, 0.65)
  SetBlipAsShortRange(BikeRentalBlip, true)
  SetBlipColour(BikeRentalBlip, 2)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentSubstringPlayerName('Bike Rentals')
  EndTextCommandSetBlipName(BikeRentalBlip)
end


CreateThread(function()
  SpawnPed()
  RentalBlips()

  exports.ox_target:addBoxZone({
    coords = config.RentalLocations.cars.pedspawn.xyz,
    size = vec3(1.5, 1.5, 2.0),
    rotation = 15,
    debug = false,
    options = {
      {
        name = 'rentvehicle',
        icon = 'fas fa-car',
        label = 'Rent Vehicle',
        onSelect = function()
          TriggerEvent('qb-rental:client:OpenCarRental')
        end,
        distance = 2.0
      },
      {
        name = 'returnvehicle',
        icon = 'fa-solid fa-rotate-left',
        label = 'Return Vehicle',
        onSelect = function()
          TriggerEvent('qb-rental:ReturnVehicle')
        end,
        distance = 2.0
      },
    }
  })

  exports.ox_target:addBoxZone({
    coords = config.RentalLocations.aircrafts.pedspawn.xyz,
    size = vec3(1.5, 1.5, 2.0),
    rotation = 0,
    debug = false,
    options = {
      {
        name = 'rentair',
        icon = 'fas fa-plane',
        label = 'Rent Vehicle',
        onSelect = function()
          TriggerEvent('qb-rental:client:OpenAirRental')
        end,
        distance = 2.0
      },
      {
        name = 'returnair',
        icon = 'fa-solid fa-rotate-left',
        label = 'Return Vehicle',
        onSelect = function()
          TriggerEvent('qb-rental:ReturnVehicle')
        end,
        distance = 2.0
      },
    }
  })

  exports.ox_target:addBoxZone({
    coords = config.RentalLocations.boat.pedspawn.xyz,
    size = vec3(1.5, 1.5, 2.0),
    rotation = 0,
    debug = false,
    options = {
      {
        name = 'rentboat',
        icon = 'fa-solid fa-sailboat',
        label = 'Rent Vehicle',
        onSelect = function()
          TriggerEvent('qb-rental:client:OpenBoatRental')
        end,
        distance = 2.0
      },
      {
        name = 'returnboat',
        icon = 'fa-solid fa-rotate-left',
        label = 'Return Vehicle',
        onSelect = function()
          TriggerEvent('qb-rental:ReturnVehicle')
        end,
        distance = 2.0
      },
    }
  })

  exports.ox_target:addBoxZone({
    coords = config.RentalLocations.bike.pedspawn.xyz,
    size = vec3(1.5, 1.5, 2.0),
    rotation = 0,
    debug = false,
    options = {
      {
        name = 'rentbike',
        icon = 'fa-solid fa-bicycle',
        label = 'Rent Vehicle',
        onSelect = function()
          TriggerEvent('qb-rental:client:OpenBikeRental')
        end,
        distance = 3.0
      },
      {
        name = 'returnbike',
        icon = 'fa-solid fa-rotate-left',
        label = 'Return Vehicle',
        onSelect = function()
          TriggerEvent('qb-rental:ReturnVehicle')
        end,
        distance = 3.0
      },
    }
  })
end)

--Emails functions

function CarRStartEmail()
  TriggerServerEvent('qb-phone:server:sendNewMail', {
    sender = 'Car Rental',
    subject = 'Purchase Complete',
    message = 'Thanks you for your purchase, be sure to return your rental vehicle.',
    button = {}
})
end

function AirRStartEmail()
  TriggerServerEvent('qb-phone:server:sendNewMail', {
    sender = 'Aircraft Rental',
    subject = 'Purchase Complete',
    message = 'Thanks you for your purchase, be sure to return your rental vehicle.',
    button = {}
})
end

function BoatRStartEmail()
  TriggerServerEvent('qb-phone:server:sendNewMail', {
    sender = 'Boat Rental',
    subject = 'Purchase Complete',
    message = 'Thanks you for your purchase, be sure to return your rental vehicle.',
    button = {}
})
end

function BikeRStartEmail()
  TriggerServerEvent('qb-phone:server:sendNewMail', {
    sender = 'Bike Rental',
    subject = 'Purchase Complete',
    message = 'Thanks you for your purchase, be sure to return your rental vehicle.',
    button = {}
})
end

-- Helper function to spawn vehicle
function SpawnRentalVehicle(model, coords, heading, callback)
  lib.requestModel(model, 10000)
  local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, heading, true, false)
  SetVehicleHasBeenOwnedByPlayer(vehicle, true)
  SetEntityAsMissionEntity(vehicle, true, true)
  SetVehicleNeedsToBeHotwired(vehicle, false)
  SetModelAsNoLongerNeeded(model)
  if callback then
    callback(vehicle)
  end
  return vehicle
end

----------------------------------------------------------------------------------------------------------
------------------------------------------CAR RENTAL------------------------------------------------------
----------------------------------------------------------------------------------------------------------

RegisterNetEvent("qb-rental:client:OpenCarRental", function()
  local options = {}

  for k, v in pairs(config.CarRental) do
    options[#options + 1] = {
      title = v.header,
      description = '$' ..v.price..'.00',
      icon = 'car',
      onSelect = function()
        lib.registerContext({
          id = 'car_confirm_menu',
          title = 'Confirm Rental',
          options = {
            {
              title = 'Go Back',
              icon = 'chevron-left',
              onSelect = function()
                TriggerEvent('qb-rental:client:OpenCarRental')
              end
            },
            {
              title = 'Confirm Purchase',
              description = 'Rent ' .. v.header .. ' for $' .. v.price,
              icon = 'square-check',
              onSelect = function()
                TriggerEvent('qb-rental:startrental', {
                  model = v.carhash,
                  money = v.price,
                })
              end
            },
            {
              title = 'Cancel Purchase',
              icon = 'square-xmark',
            }
          }
        })
        lib.showContext('car_confirm_menu')
      end
    }
  end

  lib.registerContext({
    id = 'car_rental_menu',
    title = 'Current Available Rentals',
    options = options
  })
  lib.showContext('car_rental_menu')
end)

RegisterNetEvent('qb-rental:startrental')
AddEventHandler('qb-rental:startrental', function(data)
  local money = data.money
  local model = data.model
  local player = PlayerPedId()

  if IsAnyVehicleNearPoint(config.RentalLocations.cars.vehiclespawn.x, config.RentalLocations.cars.vehiclespawn.y, config.RentalLocations.cars.vehiclespawn.z, 2.5) then
    lib.notify({
      title = 'Rental',
      description = 'There is a Vehicle in the Way.',
      type = 'error'
    })
    return
  end

  if IsAnyPedNearPoint(config.RentalLocations.cars.vehiclespawn.x, config.RentalLocations.cars.vehiclespawn.y, config.RentalLocations.cars.vehiclespawn.z, 2.5) then
    lib.notify({
      title = 'Rental',
      description = 'There is a Player in the way.',
      type = 'error'
    })
    return
  end

  local hasMoney = lib.callback.await('qb-rental:CheckMoney', false, money)

  if hasMoney then
    if lib.progressCircle({
      duration = 3000,
      position = 'bottom',
      label = 'Renting',
      useWhileDead = false,
      canCancel = true,
      disable = {
        car = true,
        move = true,
        combat = true,
      },
      anim = {
        dict = 'mp_action',
        clip = 'thanks_male_06'
      },
    }) then
      local vehicle = SpawnRentalVehicle(model, config.RentalLocations.cars.vehiclespawn, config.RentalLocations.cars.heading)
      CarRStartEmail()
      TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
      exports[config.Fuelexport]:SetFuel(vehicle, 100.0)
      SpawnVehicle = true
      Wait(100)
      TriggerServerEvent('qb-rental:getpapers', GetVehicleNumberPlateText(vehicle), model)
    end
  else
    lib.notify({
      title = 'Rental',
      description = 'Not Enough Money',
      type = 'error'
    })
  end
end)

RegisterNetEvent('qb-rental:ReturnVehicle', function()
  if SpawnVehicle then
    if lib.progressCircle({
      duration = 3000,
      position = 'bottom',
      label = 'Returning Keys',
      useWhileDead = false,
      canCancel = true,
      disable = {
        car = true,
        move = true,
        combat = true,
      },
      anim = {
        dict = 'random@atm_robbery@return_wallet_male',
        clip = 'return_wallet_positive_a_male'
      },
    }) then
      lib.notify({
        title = 'Rental',
        description = 'Thanks for returning the vehicle',
        type = 'success'
      })
      TriggerServerEvent('qb-rental:takepapers')
      local car = GetVehiclePedIsIn(PlayerPedId(),true)
      NetworkFadeOutEntity(car, true,false)
      Wait(3000)
      DeleteVehicle(car)
      SpawnVehicle = false
    end
  else
    lib.notify({
      title = 'Rental',
      description = 'There is no Vehicle to Return',
      type = 'error'
    })
  end
end)

----------------------------------------------------------------------------------------------------------
------------------------------------------AIR RENTAL------------------------------------------------------
----------------------------------------------------------------------------------------------------------

RegisterNetEvent("qb-rental:client:OpenAirRental", function()
  local options = {}

  for k, v in pairs(config.AirRental) do
    options[#options + 1] = {
      title = v.header,
      description = '$' ..v.price..'.00',
      icon = 'plane',
      onSelect = function()
        lib.registerContext({
          id = 'air_confirm_menu',
          title = 'Confirm Rental',
          options = {
            {
              title = 'Go Back',
              icon = 'chevron-left',
              onSelect = function()
                TriggerEvent('qb-rental:client:OpenAirRental')
              end
            },
            {
              title = 'Confirm Purchase',
              description = 'Rent ' .. v.header .. ' for $' .. v.price,
              icon = 'square-check',
              onSelect = function()
                TriggerEvent('qb-rental:client:startAirRental', {
                  model = v.carhash,
                  money = v.price,
                })
              end
            },
            {
              title = 'Cancel Purchase',
              icon = 'square-xmark',
            }
          }
        })
        lib.showContext('air_confirm_menu')
      end
    }
  end

  lib.registerContext({
    id = 'air_rental_menu',
    title = 'Current Available Rentals',
    options = options
  })
  lib.showContext('air_rental_menu')
end)

RegisterNetEvent('qb-rental:client:startAirRental', function(data)
  local player = PlayerPedId()
  local money = data.money
  local model = data.model

  if IsAnyVehicleNearPoint(config.RentalLocations.aircrafts.vehiclespawn.x, config.RentalLocations.aircrafts.vehiclespawn.y, config.RentalLocations.aircrafts.vehiclespawn.z, 2.5) then
    lib.notify({
      title = 'Rental',
      description = 'There is a Vehicle in the Way.',
      type = 'error'
    })
    return
  end

  if IsAnyPedNearPoint(config.RentalLocations.aircrafts.vehiclespawn.x, config.RentalLocations.aircrafts.vehiclespawn.y, config.RentalLocations.aircrafts.vehiclespawn.z, 2.5) then
    lib.notify({
      title = 'Rental',
      description = 'There is a Player in the way.',
      type = 'error'
    })
    return
  end

  local hasMoney = lib.callback.await('qb-rental:CheckMoney', false, money)

  if hasMoney then
    if lib.progressCircle({
      duration = 3000,
      position = 'bottom',
      label = 'Renting',
      useWhileDead = false,
      canCancel = true,
      disable = {
        car = true,
        move = true,
        combat = true,
      },
      anim = {
        dict = 'mp_action',
        clip = 'thanks_male_06'
      },
    }) then
      local vehicle = SpawnRentalVehicle(model, config.RentalLocations.aircrafts.vehiclespawn, config.RentalLocations.aircrafts.heading)
      AirRStartEmail()
      TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
      exports[config.Fuelexport]:SetFuel(vehicle, 100.0)
      SpawnVehicle = true
      Wait(100)
      TriggerServerEvent('qb-rental:getpapers', GetVehicleNumberPlateText(vehicle), model)
    end
  else
    lib.notify({
      title = 'Rental',
      description = 'Not Enough Money',
      type = 'error'
    })
  end
end)

----------------------------------------------------------------------------------------------------------
------------------------------------------BOATS RENTAL----------------------------------------------------
----------------------------------------------------------------------------------------------------------

RegisterNetEvent("qb-rental:client:OpenBoatRental", function()
  local options = {}

  for k, v in pairs(config.BoatRental) do
    options[#options + 1] = {
      title = v.header,
      description = '$' ..v.price..'.00',
      icon = 'sailboat',
      onSelect = function()
        lib.registerContext({
          id = 'boat_confirm_menu',
          title = 'Confirm Rental',
          options = {
            {
              title = 'Go Back',
              icon = 'chevron-left',
              onSelect = function()
                TriggerEvent('qb-rental:client:OpenBoatRental')
              end
            },
            {
              title = 'Confirm Purchase',
              description = 'Rent ' .. v.header .. ' for $' .. v.price,
              icon = 'square-check',
              onSelect = function()
                TriggerEvent('qb-rental:client:startBoatRental', {
                  model = v.carhash,
                  money = v.price,
                })
              end
            },
            {
              title = 'Cancel Purchase',
              icon = 'square-xmark',
            }
          }
        })
        lib.showContext('boat_confirm_menu')
      end
    }
  end

  lib.registerContext({
    id = 'boat_rental_menu',
    title = 'Current Available Rentals',
    options = options
  })
  lib.showContext('boat_rental_menu')
end)

RegisterNetEvent('qb-rental:client:startBoatRental', function(data)
  local player = PlayerPedId()
  local money = data.money
  local model = data.model

  if IsAnyVehicleNearPoint(config.RentalLocations.boat.vehiclespawn.x, config.RentalLocations.boat.vehiclespawn.y, config.RentalLocations.boat.vehiclespawn.z, 2.5) then
    lib.notify({
      title = 'Rental',
      description = 'There is a Vehicle in the Way.',
      type = 'error'
    })
    return
  end

  if IsAnyPedNearPoint(config.RentalLocations.boat.vehiclespawn.x, config.RentalLocations.boat.vehiclespawn.y, config.RentalLocations.boat.vehiclespawn.z, 2.5) then
    lib.notify({
      title = 'Rental',
      description = 'There is a Player in the way.',
      type = 'error'
    })
    return
  end

  local hasMoney = lib.callback.await('qb-rental:CheckMoney', false, money)

  if hasMoney then
    if lib.progressCircle({
      duration = 3000,
      position = 'bottom',
      label = 'Renting',
      useWhileDead = false,
      canCancel = true,
      disable = {
        car = true,
        move = true,
        combat = true,
      },
      anim = {
        dict = 'mp_action',
        clip = 'thanks_male_06'
      },
    }) then
      local vehicle = SpawnRentalVehicle(model, config.RentalLocations.boat.vehiclespawn, config.RentalLocations.boat.heading)
      BoatRStartEmail()
      TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
      exports[config.Fuelexport]:SetFuel(vehicle, 100.0)
      SpawnVehicle = true
      Wait(100)
      TriggerServerEvent('qb-rental:getpapers', GetVehicleNumberPlateText(vehicle), model)
    end
  else
    lib.notify({
      title = 'Rental',
      description = 'Not Enough Money',
      type = 'error'
    })
  end
end)

----------------------------------------------------------------------------------------------------------
------------------------------------------BIKES RENTAL----------------------------------------------------
----------------------------------------------------------------------------------------------------------

RegisterNetEvent("qb-rental:client:OpenBikeRental", function()
  local options = {}

  for k, v in pairs(config.BikeRental) do
    options[#options + 1] = {
      title = v.header,
      description = '$' ..v.price..'.00',
      icon = 'bicycle',
      onSelect = function()
        lib.registerContext({
          id = 'bike_confirm_menu',
          title = 'Confirm Rental',
          options = {
            {
              title = 'Go Back',
              icon = 'chevron-left',
              onSelect = function()
                TriggerEvent('qb-rental:client:OpenBikeRental')
              end
            },
            {
              title = 'Confirm Purchase',
              description = 'Rent ' .. v.header .. ' for $' .. v.price,
              icon = 'square-check',
              onSelect = function()
                TriggerEvent('qb-rental:client:startBikeRental', {
                  model = v.carhash,
                  money = v.price,
                })
              end
            },
            {
              title = 'Cancel Purchase',
              icon = 'square-xmark',
            }
          }
        })
        lib.showContext('bike_confirm_menu')
      end
    }
  end

  lib.registerContext({
    id = 'bike_rental_menu',
    title = 'Current Available Rentals',
    options = options
  })
  lib.showContext('bike_rental_menu')
end)

RegisterNetEvent('qb-rental:client:startBikeRental', function(data)
  local player = PlayerPedId()
  local money = data.money
  local model = data.model

  if IsAnyVehicleNearPoint(config.RentalLocations.bike.vehiclespawn.x, config.RentalLocations.bike.vehiclespawn.y, config.RentalLocations.bike.vehiclespawn.z, 2.5) then
    lib.notify({
      title = 'Rental',
      description = 'There is a Vehicle in the Way.',
      type = 'error'
    })
    return
  end

  if IsAnyPedNearPoint(config.RentalLocations.bike.vehiclespawn.x, config.RentalLocations.bike.pedspawn.y, config.RentalLocations.bike.vehiclespawn.z, 2.5) then
    lib.notify({
      title = 'Rental',
      description = 'There is a Player in the way.',
      type = 'error'
    })
    return
  end

  local hasMoney = lib.callback.await('qb-rental:CheckMoney', false, money)

  if hasMoney then
    if lib.progressCircle({
      duration = 3000,
      position = 'bottom',
      label = 'Renting',
      useWhileDead = false,
      canCancel = true,
      disable = {
        car = true,
        move = true,
        combat = true,
      },
      anim = {
        dict = 'mp_action',
        clip = 'thanks_male_06'
      },
    }) then
      local vehicle = SpawnRentalVehicle(model, config.RentalLocations.bike.vehiclespawn, config.RentalLocations.bike.heading)
      BikeRStartEmail()
      TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
      exports[config.Fuelexport]:SetFuel(vehicle, 100.0)
      SpawnVehicle = true
      Wait(100)
      TriggerServerEvent('qb-rental:getpapers', GetVehicleNumberPlateText(vehicle), model)
    end
  else
    lib.notify({
      title = 'Rental',
      description = 'Not Enough Money',
      type = 'error'
    })
  end
end)
