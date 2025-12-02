Utils = Utils or exports['lc_utils']:GetUtils()
truck,truck_blip,trailer,trailer_blip,rent_truck,route_blip,blip_to_trailer = nil,nil,nil,nil,nil,nil,nil
menu_active = false
current_location = nil
loading_trailer, loading_truck = false, false
cooldown = nil
is_store_truck_text_shown = false
should_load_trailer = false
is_player_far_from_trailer = true -- Global variable to determine if the player reached the trailer or not (when its false, the trailer is spawned)

-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCATIONS
-----------------------------------------------------------------------------------------------------------------------------------------	

function createMarkersThread()
	Citizen.CreateThreadNow(function()
		local timer = 2
		while true do
			timer = 3000
			for trucker_location_id,trucker_location_data in pairs(Config.trucker_locations) do
				if not menu_active then
					local x,y,z = table.unpack(trucker_location_data.menu_location)
					if Utils.Entity.isPlayerNearCoords(x,y,z,20.0) then
						timer = 2
						Utils.Markers.createMarkerInCoords(trucker_location_id,x,y,z,Utils.translate('open'),openTruckerUiCallback)
					end
				end
			end
			Citizen.Wait(timer)
		end
	end)
end

function createTargetsThread()
	Citizen.CreateThreadNow(function()
		for trucker_location_id,trucker_location_data in pairs(Config.trucker_locations) do
			local x,y,z = table.unpack(trucker_location_data.menu_location)
			Utils.Target.createTargetInCoords(trucker_location_id,x,y,z,openTruckerUiCallback,Utils.translate('open_target'),"fas fa-truck","#2986cc")
		end
	end)
end

function openTruckerUiCallback(location)
	if location and Config.trucker_locations[location] then
		current_location = location
		TriggerServerEvent("truck_logistics:getData",current_location)
	else
		print("^3ERROR: Location parameter sent in openUI is invalid or nil: '^1" .. (location or "nil") .. "^3'^7")
	end
end
exports('openUI', openTruckerUiCallback)

RegisterNetEvent('truck_logistics:open')
AddEventHandler('truck_logistics:open', function(dados,update)
	TriggerScreenblurFadeIn(1000)
	SendNUIMessage({
		showmenu = true,
		update = update,
		dados = dados,
		utils = { config = Utils.Config, lang = Utils.Lang },
		resourceName = GetCurrentResourceName()
	})
	if update == false then
		menu_active = true
		SetNuiFocus(true,true)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CALLBACKS
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterNUICallback('post', function(body, cb)
	if cooldown == nil then
		cooldown = true
		
		if body.event == "changeTheme" then
			exports['lc_utils']:changeTheme(body.data.dark_theme)
		end
		if body.event == "close" then
			closeUI()
		elseif body.event == "startContract" and (loading_trailer or loading_truck) then
			exports['lc_utils']:notify("info",Utils.translate('loading_trailer'))
			closeUI()
		elseif body.event == "spawnTruck" and loading_truck then
			exports['lc_utils']:notify("info",Utils.translate('loading_truck'))
			closeUI()
		elseif (body.event == "repairTruck" or body.event == "refuelTruck") and (IsEntityAVehicle(truck) and not rent_truck) then
			exports['lc_utils']:notify("error",Utils.translate('store_truck'))
		elseif body.event == "sellTruck" and (IsEntityAVehicle(truck) and not rent_truck) then
			exports['lc_utils']:notify("error",Utils.translate('store_truck_2'))
		else
			TriggerServerEvent('truck_logistics:'..body.event,current_location,body.data)
		end
		cb(200)

		SetTimeout(100,function()
			cooldown = nil
		end)
	end
end)

function closeUI()
	current_location = nil
	menu_active = false
	SetNuiFocus(false,false)
	SendNUIMessage({ hidemenu = true })
	TriggerScreenblurFadeOut(1000)
	TriggerServerEvent('truck_logistics:closeUI')
end

RegisterNetEvent('truck_logistics:closeUIToStartContract')
AddEventHandler('truck_logistics:closeUIToStartContract', function()
	menu_active = false
	SetNuiFocus(false,false)
	SendNUIMessage({ hidemenu = true })
	TriggerScreenblurFadeOut(1000)
	TriggerServerEvent('truck_logistics:closeUI')
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWN OWNED TRUCK
-----------------------------------------------------------------------------------------------------------------------------------------
local update_vehicle_status = 0
RegisterNetEvent('truck_logistics:spawnTruck')
AddEventHandler('truck_logistics:spawnTruck', function(truck_data)
	if IsEntityAVehicle(truck) then
		exports['lc_utils']:notify("error",Utils.translate('already_has_truck'))
		return
	end


	local garage_to_spawn = Config.trucker_locations[current_location]['garage_location']
	local i = #garage_to_spawn
	local x,y,z,h
	while i > 0 do
		x,y,z,h = table.unpack(garage_to_spawn[i])
		if not Utils.Vehicles.isSpawnPointClear({['x']=x,['y']=y,['z']=z},5.001) then
			if i <= 1 then
				exports['lc_utils']:notify("error",Utils.translate('occupied_places'))
				return
			end
		else
			break
		end
		i = i - 1
	end

	truck_data.properties = json.decode(truck_data.properties) or {}
	truck_data.properties.plate = truck_data.properties.plate or Utils.Vehicles.generateTempVehiclePlateWithPrefix(GetCurrentResourceName())
	truck_data.properties.bodyHealth = truck_data.body
	truck_data.properties.engineHealth = truck_data.engine
	truck_data.properties.fuelLevel = truck_data.fuel

	Citizen.CreateThreadNow(function()
		resetLoading()
	end)

	loading_truck = true
	local blip_data = { name = Utils.translate('truck_blip'), sprite = 477, color = 26 }
	truck,truck_blip = Utils.Vehicles.spawnVehicle(truck_data.truck_name,x,y,z,h,blip_data,truck_data.properties)
	if (truck_data.wheels < 400) then
		SetVehicleTyresCanBurst(truck,true)
		local arr = {0,1,2,3,4,5,6,7}
		for _,v in pairs(arr) do
			SetVehicleTyreBurst(truck,v,true,1000.0)
		end
	end
	exports['lc_utils']:notify("success",Utils.translate('already_is_in_garage'))
	loading_truck = false

	local timer = 2
	local engine_health = GetVehicleEngineHealth(truck)
	local vehicle_fuel = GetVehicleFuelLevel(truck)
	local body_health = GetVehicleBodyHealth(truck)

	while IsEntityAVehicle(truck) do
		timer = 2000
		is_store_truck_text_shown = false
		local ped = PlayerPedId()
		local veh = GetVehiclePedIsIn(ped,false)
		if veh == truck then
			for _,v in pairs(Config.trucker_locations) do
				for _,mark in pairs(v.garage_location) do
					local x,y,z = table.unpack(mark)
					local distance = #(GetEntityCoords(PlayerPedId()) - vector3(x,y,z))
					if distance <= 20.0 then
						timer = 2
						Utils.Markers.drawMarker(39,x,y,z+0.6,2.0)
						if distance <= 5.0 then
							is_store_truck_text_shown = true
							Utils.Markers.drawText2D(Utils.translate('press_e_to_store_truck'), 8,0.5,0.95,0.50,255,255,255,180)
							if IsControlJustPressed(0,38) and IsEntityAVehicle(truck) then
								TriggerServerEvent("truck_logistics:updateTruckStatus",truck_data,GetVehicleEngineHealth(truck),GetVehicleBodyHealth(truck),vehicle_fuel,Utils.Vehicles.getVehicleProperties(truck))
								Utils.Vehicles.deleteVehicle(truck)
								Utils.Blips.removeBlip(truck_blip)
								truck = nil
								truck_blip = nil
								is_store_truck_text_shown = false
								return
							end
						end
					end
				end
			end
		end

		if IsEntityAVehicle(truck) and update_vehicle_status == 0 and (engine_health ~= GetVehicleEngineHealth(truck) or vehicle_fuel ~= GetVehicleFuelLevel(truck)) then
			update_vehicle_status = 3
			engine_health = GetVehicleEngineHealth(truck)
			body_health = GetVehicleBodyHealth(truck)
			vehicle_fuel = GetVehicleFuelLevel(truck)
			TriggerServerEvent("truck_logistics:updateTruckStatus",truck_data,engine_health,body_health,vehicle_fuel,Utils.Vehicles.getVehicleProperties(truck))
		end
		Citizen.Wait(timer)
	end
	Utils.Vehicles.removeKeysFromPlate(truck_data.properties.plate,truck_data.truck_name)
	Utils.Blips.removeBlip(truck_blip)
	truck = nil
	truck_blip = nil
	is_store_truck_text_shown = false
end)

Citizen.CreateThread(function()
	while true do
		timer = 10000
		if update_vehicle_status > 0 then
			update_vehicle_status = update_vehicle_status - 1
		end
		Citizen.Wait(timer)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- START CONTRACT
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent('truck_logistics:startContract')
AddEventHandler('truck_logistics:startContract', function(key,contract_data,location, trailerSpawnParamX, trailerSpawnParamY, trailerSpawnParamZ, trailerSpawnParamH)
	is_player_far_from_trailer = true
	local is_finished = false
	local trailer_body = 0
	-- Clean up any leaked trailer/blips from a previous session
	if not IsEntityAVehicle(trailer) then
		Utils.Vehicles.deleteVehicle(trailer)
		Utils.Blips.removeBlip(trailer_blip)
		Utils.Blips.removeBlip(route_blip)
		trailer = nil
		trailer_blip = nil
		route_blip = nil
		rent_truck = false
	end
	-- Block double-start: already has cargo or an active rental
	if trailer or rent_truck then
		exports['lc_utils']:notify("error",Utils.translate('already_has_cargo'))
		TriggerServerEvent('truck_logistics:updateContract',contract_data.contract_id, false)
		return
	end

	-- Ensure local truck reference is valid; otherwise fully reset state
	if not IsEntityAVehicle(truck) then
		Utils.Vehicles.deleteVehicle(truck)
		Utils.Blips.removeBlip(truck_blip)
		Utils.Blips.removeBlip(route_blip)
		truck = nil
		truck_blip = nil
		route_blip = nil
		rent_truck = false
	end
	-- Rental contracts (type 0) require player truck to be stored
	if IsEntityAVehicle(truck) and contract_data.contract_type == 0 then
		exports['lc_utils']:notify("error",Utils.translate('must_store_truck'))
		TriggerServerEvent('truck_logistics:updateContract',contract_data.contract_id, false)
		return
	end

	Citizen.CreateThreadNow(function()
		resetLoading()
	end)

	local truckSpawnX,truckSpawnY,truckSpawnZ,truckSpawnH
	local trailerSpawnX,trailerSpawnY,trailerSpawnZ,trailerSpawnH
	local destX,destY,destZ,destH
	local truck_blip_data = { name = Utils.translate('rented_truck_blip'), sprite = 477, color = 26 }
	local truck_properties = { plate = Utils.Vehicles.generateTempVehiclePlateWithPrefix(GetCurrentResourceName()) }
	if contract_data.contract_type == 0 then
		-- Spawn a rental truck at the selected garage slot (fallback across spots)
		local garagem = Config.trucker_locations[key]['garage_location']
		truckSpawnX,truckSpawnY,truckSpawnZ,truckSpawnH = table.unpack(garagem[location])
		if not Utils.Vehicles.isSpawnPointClear({['x']=truckSpawnX,['y']=truckSpawnY,['z']=truckSpawnZ},5.001) then
			local i = #garagem
			while i > 0 do
				truckSpawnX,truckSpawnY,truckSpawnZ,truckSpawnH = table.unpack(garagem[i])
				local checkPos = Utils.Vehicles.isSpawnPointClear({['x']=truckSpawnX,['y']=truckSpawnY,['z']=truckSpawnZ},5.001)
				if checkPos == false then -- walk list backwards until a free spot is found
					if i <= 1 then
						exports['lc_utils']:notify("error",Utils.translate('occupied_places'))
						TriggerServerEvent('truck_logistics:updateContract',contract_data.contract_id, false)
						return
					end
				else
					break
				end
				i = i - 1
			end
		end

		loading_truck = true
		truck,truck_blip = Utils.Vehicles.spawnVehicle(contract_data.truck,truckSpawnX,truckSpawnY,truckSpawnZ,truckSpawnH,truck_blip_data,truck_properties)
		loading_truck = false
		rent_truck = true
	end
	
	-- If trailer spawn coords are provided via parameters, use them directly; otherwise use configured locations (with existing fallback logic)
	if trailerSpawnParamX ~= nil and trailerSpawnParamY ~= nil and trailerSpawnParamZ ~= nil and trailerSpawnParamH ~= nil then
		trailerSpawnX, trailerSpawnY, trailerSpawnZ, trailerSpawnH = trailerSpawnParamX, trailerSpawnParamY, trailerSpawnParamZ, trailerSpawnParamH
	else
		local cargas = Config.trucker_locations[key]['trailer_location']
		trailerSpawnX,trailerSpawnY,trailerSpawnZ,trailerSpawnH = table.unpack(cargas[location])
		if not Utils.Vehicles.isSpawnPointClear({['x']=trailerSpawnX,['y']=trailerSpawnY,['z']=trailerSpawnZ},5.001) then
			local i = #cargas -- same fallback for trailer spawn; rollback rental if none free
			while i > 0 do
				trailerSpawnX,trailerSpawnY,trailerSpawnZ,trailerSpawnH = table.unpack(cargas[i])
				local checkPos = Utils.Vehicles.isSpawnPointClear({['x']=trailerSpawnX,['y']=trailerSpawnY,['z']=trailerSpawnZ},5.001)
				if checkPos == false then
					if i <= 1 then
						if rent_truck then
							Utils.Vehicles.deleteVehicle(truck)
							Utils.Blips.removeBlip(truck_blip)
							truck = nil
							truck_blip = nil
							rent_truck = false
						end
						exports['lc_utils']:notify("error",Utils.translate('occupied_places'))
						TriggerServerEvent('truck_logistics:updateContract',contract_data.contract_id, false)
						return
					end
				else
					break
				end
				i = i - 1
			end
		end
	end

	-- Mark as started server-side
	TriggerServerEvent('truck_logistics:updateContract',contract_data.contract_id, true)
	-- Start delivery
	closeUI()
	exports['lc_utils']:notify("success",Utils.translate('started_job'))

	-- Create a route to the trailer spawn so players can find the cargo before it exists
	blip_to_trailer = Utils.Blips.createBlipForCoords(trailerSpawnX,trailerSpawnY,trailerSpawnZ,1,5,Utils.translate('destination_blip'),1.0,true)
	Citizen.CreateThreadNow(function()
		while blip_to_trailer do
			local ped = PlayerPedId()
			local distance = #(GetEntityCoords(ped) - vector3(trailerSpawnX,trailerSpawnY,trailerSpawnZ))
			if distance <= 100.0 then
				Utils.Blips.removeBlip(blip_to_trailer)
				break
			end
			Citizen.Wait(4000)
		end
	end)

	-- Create additional threads
	createVehicleMarkersThread() -- QoL markers to find spawned vehicles
	if contract_data.fast == 1 then -- urgent cargo timer logic
		local cargo_timer = contract_data.distance * Config.jobs.special_cargo.urgent.seconds_per_km
		createVehicleFastCargoTimerThread(math.floor(cargo_timer))
	end

	-- Defer spawn until player is near to ensure streaming stability
	should_load_trailer = true
	Citizen.CreateThreadNow(function()
		local ped = PlayerPedId()
		local timer = 1000
		while is_player_far_from_trailer and should_load_trailer do
			local veh = GetVehiclePedIsIn(ped,false)
			if veh and veh == truck then
				Utils.Markers.drawText2D(Utils.translate('pickup_cargo'), 8,0.5,0.90,0.50,255,255,255,180)
				timer = 2
			end
			Wait(timer)
		end
	end)
	while should_load_trailer do
		local ped = PlayerPedId()
		local distToSpawn = #(GetEntityCoords(ped) - vector3(trailerSpawnX, trailerSpawnY, trailerSpawnZ))
		if distToSpawn <= 120.0 then break end

		if contract_data.contract_type == 0 then
			local vehicles = { truck }
			local peds = { ped }
			local has_error, error_message = Utils.Entity.isThereSomethingWrongWithThoseBoys(vehicles,peds)
			if has_error then
				PlaySoundFrontend(-1, "PROPERTY_PURCHASE", "HUD_AWARDS", 0)
				exports['lc_utils']:notify("error",Utils.translate('failed'))
				Utils.Blips.removeBlip(blip_to_trailer)
				break
			end
		end

		Citizen.Wait(2000)
	end
	if should_load_trailer == false then return end -- Contract cancelled

	local trailer_blip_data = { name = Utils.translate('cargo_blip'), sprite = 479, color = 26 }
	local trailer_properties = { plate = Utils.Vehicles.generateTempVehiclePlateWithPrefix(GetCurrentResourceName()) }
	if #(GetEntityCoords(PlayerPedId()) - vector3(trailerSpawnX, trailerSpawnY, trailerSpawnZ)) <= 120.0 then
		loading_trailer = true
		trailer,trailer_blip = Utils.Vehicles.spawnVehicle(contract_data.trailer,trailerSpawnX,trailerSpawnY,trailerSpawnZ,trailerSpawnH,trailer_blip_data,trailer_properties)
		loading_trailer = false
		is_player_far_from_trailer = false
	end

	-- External contracts can override destination; otherwise use configured index
	if contract_data.external_data then
		destX,destY,destZ,destH = contract_data.external_data.x,contract_data.external_data.y,contract_data.external_data.z,contract_data.external_data.h
	else
		destX,destY,destZ,destH = table.unpack(Config.delivery_locations[contract_data.coords_index])
	end

	-- Set delivery destination blip
	route_blip = Utils.Blips.createBlipForCoords(destX,destY,destZ,1,5,Utils.translate('destination_blip'),1.0,true)

	local net_trailer = NetworkGetNetworkIdFromEntity(trailer)
	if IsEntityAVehicle(trailer) then
		if Utils.Config.custom_scripts_compatibility.target == "disabled" then
			SetNetworkIdCanMigrate(net_trailer, false) -- keep server authority over trailer
			SetEntityAsMissionEntity(trailer, true, true)

			NetworkRequestControlOfEntity(trailer)

			TriggerServerEvent('truck_logistics:server:createInspectVehicleThread', contract_data, net_trailer)
		else
			TriggerServerEvent('truck_logistics:server:registerNetVehicleId', contract_data, net_trailer)
		end
	end

	local timer = 2000
	-- Delivery loop: gate finish on position/orientation + attachment
	while IsEntityAVehicle(trailer) do
		timer = 2000
		local ped = PlayerPedId()
		local veh = GetVehiclePedIsIn(ped,false)
		local distance = #(GetEntityCoords(ped) - vector3(destX,destY,destZ))

		if distance <= 50.0 then
			timer = 2
			if distance <= 4.0 and GetEntityHeading(veh) + 10 >= destH and GetEntityHeading(veh) - 10 <= destH and GetEntityHeading(trailer) + 10 >= destH and GetEntityHeading(trailer) - 10 <= destH and IsEntityAttachedToEntity(veh,trailer) then
				DrawMarker(30,destX,destY,destZ-0.6,0,0,0,90.0,destH,0.0,3.0,1.0,10.0,0,255,0,50,0,0,0,0)
				Utils.Markers.drawText2D(Utils.translate('press_e_to_park'), 8,0.5,0.90,0.50,255,255,255,180)
				if IsControlJustPressed(0,38) then
					BringVehicleToHalt(truck, 2.5, 1, false)
					Citizen.Wait(10)
					DoScreenFadeOut(500)
					Citizen.Wait(500)
					trailer_body = GetVehicleBodyHealth(trailer) -- used for payout/penalties
					Utils.Vehicles.deleteVehicle(trailer)
					Utils.Blips.removeBlip(trailer_blip)
					Utils.Blips.removeBlip(route_blip)
					TriggerServerEvent("truck_logistics:deliveredCargo")
					PlaySoundFrontend(-1, "PROPERTY_PURCHASE", "HUD_AWARDS", 0)
					Citizen.Wait(1000)
					DoScreenFadeIn(1000)
					Utils.Scaleform.showScaleform(Utils.translate('success'), Utils.translate('finished_job'), 3)
					trailer = nil
					trailer_blip = nil
					route_blip = nil
					if not Config.jobs.truck_rental.must_return_truck or contract_data.contract_type ~= 0 then -- finish immediately if return not required
						TriggerServerEvent("truck_logistics:finishContract",GetVehicleEngineHealth(truck),GetVehicleBodyHealth(truck),trailer_body)
					end
					is_finished = true
					break
				end
			else
				Utils.Markers.drawText2D(Utils.translate('park_your_truck'), 8,0.5,0.90,0.50,255,255,255,180)
				DrawMarker(30,destX,destY,destZ-0.6,0,0,0,90.0,destH,0.0,3.0,1.0,10.0,255,0,0,50,0,0,0,0)
			end
		end

		local vehicles = { truck, trailer }
		local peds = { ped }
		local has_error, error_message = Utils.Entity.isThereSomethingWrongWithThoseBoys(vehicles,peds) -- anti-exploit / invalid state guard
		if has_error then
			PlaySoundFrontend(-1, "PROPERTY_PURCHASE", "HUD_AWARDS", 0)
			exports['lc_utils']:notify("error",Utils.translate('failed'))
			
			Utils.Blips.removeBlip(trailer_blip)
			Utils.Blips.removeBlip(route_blip)
			Utils.Vehicles.deleteVehicle(trailer)
			trailer = nil
			trailer_blip = nil
			route_blip = nil
			break
		end

		if IsControlPressed(0,Config.jobs.cancel_job_key) then -- allow manual cancel
			TriggerEvent('truck_logistics:cancelContract',contract_data)
			break
		end
		Wait(timer)
	end

	TriggerServerEvent('truck_logistics:server:registerNetVehicleId', nil, net_trailer)

	-- Post-delivery: enforce rental return flow if applicable
	while IsEntityAVehicle(truck) and contract_data.contract_type == 0 do 
		timer = 2000
		is_store_truck_text_shown = false
		local ped = PlayerPedId()
		local veh = GetVehiclePedIsIn(ped,false)
		for k,v in pairs(Config.trucker_locations) do
			for k,mark in pairs(v.garage_location) do
				local x,y,z = table.unpack(mark)
				local distance = #(GetEntityCoords(PlayerPedId()) - vector3(x,y,z))
				timer = 2
				if veh == truck and distance <= 20.0 then
					Utils.Markers.drawMarker(39,x,y,z+0.6,2.0)
					if distance <= 5.0 then
						is_store_truck_text_shown = true
						Utils.Markers.drawText2D(Utils.translate('press_e_to_store_truck'), 8,0.5,0.95,0.50,255,255,255,180)
						if IsControlJustPressed(0,38) then
							if Config.jobs.truck_rental.must_return_truck and is_finished then
								TriggerServerEvent("truck_logistics:finishContract",GetVehicleEngineHealth(truck),GetVehicleBodyHealth(truck),trailer_body)
							end
							Utils.Vehicles.deleteVehicle(truck)
							Utils.Blips.removeBlip(truck_blip)
							Utils.Blips.removeBlip(route_blip)
							truck = nil
							truck_blip = nil
							route_blip = nil
							rent_truck = false
						end
					end
				else
					Utils.Markers.drawText2D(Utils.translate('bring_back'), 8,0.5,0.90,0.50,255,255,255,180)
				end
			end
		end

		local vehicles = { truck }
		local peds = { ped }
		local has_error, error_message = Utils.Entity.isThereSomethingWrongWithThoseBoys(vehicles,peds)
		if has_error then
			PlaySoundFrontend(-1, "PROPERTY_PURCHASE", "HUD_AWARDS", 0)
			exports['lc_utils']:notify("error",Utils.translate('failed'))
			break
		end

		Wait(timer)
	end

	-- Cleanup spawned key ownership
	Utils.Vehicles.removeKeysFromPlate(truck_properties.plate,contract_data.truck)
	Utils.Vehicles.removeKeysFromPlate(trailer_properties.plate,contract_data.trailer)
	is_store_truck_text_shown = false
	Wait(100)
	TriggerEvent('truck_logistics:cancelContract',contract_data)
	TriggerServerEvent('truck_logistics:updateContract',contract_data.contract_id, false)
end)

RegisterNetEvent('truck_logistics:cancelContract')
AddEventHandler('truck_logistics:cancelContract', function(contract_data)
	Utils.Vehicles.deleteVehicle(trailer)
	Utils.Blips.removeBlip(trailer_blip)
	Utils.Blips.removeBlip(route_blip)
	Utils.Blips.removeBlip(blip_to_trailer)
	trailer = nil
	trailer_blip = nil
	route_blip = nil
	blip_to_trailer = nil
	rent_truck = false
	should_load_trailer = false
	if contract_data.contract_type == 0 then
		Utils.Vehicles.deleteVehicle(truck)
		Utils.Blips.removeBlip(truck_blip)
		truck = nil
		truck_blip = nil
	end
end)

function createVehicleMarkersThread()
	Citizen.CreateThreadNow(function()
		local timer = 2000
		local ped = PlayerPedId()
		while IsEntityAVehicle(truck) or (is_player_far_from_trailer or IsEntityAVehicle(trailer)) do
			timer = 2000
			local player_coords = GetEntityCoords(ped)
			local truck_coords = GetEntityCoords(truck)
			local trailer_coods = GetEntityCoords(trailer)
			
			local distance_truck = #(player_coords - truck_coords)
			local distance_trailer = #(player_coords - trailer_coods)
			if distance_truck < 50.0 and GetVehiclePedIsIn(ped,false) ~= truck and not IsEntityAttachedToEntity(truck,trailer) then
				timer = 2
				local tx,ty,tz = table.unpack(truck_coords)
				Utils.Markers.drawMarker(0,tx,ty,tz+3.1,1.0,0,100,255)
			end

			if distance_trailer < 50.0 and (not IsEntityAttachedToEntity(truck,trailer) or GetVehiclePedIsIn(ped,false) ~= truck) then
				timer = 2
				local tx,ty,tz = table.unpack(trailer_coods)
				Utils.Markers.drawMarker(0,tx,ty,tz+3.6,1.0,0,100,255)
			end
			
			Wait(timer)
		end
	end)
end

function createVehicleFastCargoTimerThread(cargo_timer)
	Citizen.CreateThreadNow(function()
		while cargo_timer > 0 do
			Wait(1000)
			cargo_timer = cargo_timer - 1
		end
	end)
	Citizen.CreateThreadNow(function()
		while is_player_far_from_trailer or IsEntityAVehicle(trailer) do
			local timer = 1000
			if not is_store_truck_text_shown then
				timer = 2
				Utils.Markers.drawText2D(Utils.translate('fast_cargo_timer'):format(cargo_timer), 8,0.5,0.95,0.50,255,255,255,180)
				if cargo_timer <= 0 then
					exports['lc_utils']:notify("error", Utils.translate("failed_urgent_time"):format(Config.jobs.special_cargo.urgent.reward_penalty_percent))
					return
				end
			end
			Wait(timer)
		end
	end)
end

local activeInspectThreads = {}

RegisterNetEvent('truck_logistics:client:createInspectVehicleThread')
AddEventHandler('truck_logistics:client:createInspectVehicleThread', function(contract_data, net_trailer)
	if activeInspectThreads[net_trailer] then return end
	activeInspectThreads[net_trailer] = true

	local ped = PlayerPedId()
	local is_inspecting = false

	local attempt = 1
	while not NetworkDoesNetworkIdExist(net_trailer) or not NetworkDoesEntityExistWithNetworkId(net_trailer) do
		Wait(1000)
		attempt = attempt + 1
		if attempt > 15 then
			break
		end
	end

	while NetworkDoesNetworkIdExist(net_trailer) and NetworkDoesEntityExistWithNetworkId(net_trailer) do
		local vehicle = NetToEnt(net_trailer)
		local timer = 1000
		local player_coords = GetEntityCoords(ped)
		local trailer_length = 7.5
		local interaction_distance = 3.0

		-- Get trailer matrix
		local forward, _, _, trailer_coords = GetEntityMatrix(vehicle)

		-- Compute point behind the trailer
		local interaction_point = trailer_coords - (forward * trailer_length)

		-- Distance from player to that point
		local distance = #(player_coords - interaction_point)

		local success, groundZ = GetGroundZExcludingObjectsFor_3dCoord(interaction_point.x, interaction_point.y, interaction_point.z, false)
		if success then
			interaction_point = vector3(interaction_point.x, interaction_point.y, groundZ + 0.7)
		end

		if distance <= interaction_distance and GetEntitySpeed(vehicle) < 0.5  and not is_inspecting then
			Utils.Markers.drawMarker(27,interaction_point.x, interaction_point.y, interaction_point.z,2.0,0,100,255,150)
			Utils.Markers.showHelpNotification(Utils.translate("cargo_inspect_interaction"), true)
			timer = 2
		end

		if IsControlJustPressed(0, 38) and not is_inspecting and distance <= interaction_distance and IsVehicleStopped(vehicle) then
			is_inspecting = true

			Utils.Callback.TriggerServerCallback('truck_logistics:hasPoliceJob', function(has_police_job)
				executeCargoInspection(has_police_job, contract_data)
				is_inspecting = false
			end)
		end

		Wait(timer)
	end

	activeInspectThreads[net_trailer] = nil
end)

function resetLoading()
	Citizen.Wait(50000)
	if loading_truck == true then
		exports['lc_utils']:notify("error",Utils.translate('loading_fail'),30000)
		loading_truck = false
		return
	end
	-- Wait the player be near the trailer
	while is_player_far_from_trailer do Wait(2000) end
	Wait(10000) -- Wait load trailer
	if loading_trailer == true then
		exports['lc_utils']:notify("error",Utils.translate('loading_fail'),30000)
		loading_trailer = false
		return
	end
end

Citizen.CreateThread(function()
	for _,trucker_location_data in pairs(Config.trucker_locations) do
		local x,y,z = table.unpack(trucker_location_data.menu_location)
		Utils.Blips.createBlipForCoords(x,y,z,trucker_location_data.blips.id,trucker_location_data.blips.color,trucker_location_data.blips.name,trucker_location_data.blips.scale,false)
	end
end)

function registerTargetForTrailerModels()
	local trailer_list = {}
	local seen = {} -- Set to track unique trailers

	for _, value in ipairs(Config.jobs.available_loads) do
		if not seen[value.trailer] then
			table.insert(trailer_list, value.trailer)
			seen[value.trailer] = true
		end
	end

	local params = {
		labelText = Utils.translate('cargo_inspect_interaction_target'),
		icon = "fas fa-truck-ramp-box",
		iconColor = "#2986cc",
		zone_id = "trucker_trailers",
	}
	Utils.Target.createTargetForModels(trailer_list,params,inspectTrailerCargoCallback)
end

function inspectTrailerCargoCallback(zone_id, callbackData, entity)
	Utils.Callback.TriggerServerCallback('truck_logistics:hasPoliceJob', function(has_police_job)
		Utils.Callback.TriggerServerCallback('truck_logistics:getTrailerContent', function(contract_data)
			executeCargoInspection(has_police_job, contract_data)
		end,NetworkGetNetworkIdFromEntity(entity))
	end)
end

function executeCargoInspection(has_police_job, contract_data)
	local ped = PlayerPedId()
	if has_police_job then
		local dict = "amb@prop_human_bum_bin@idle_a"
		local anim = "idle_a"

		-- Load and play animation
		Utils.Animations.loadAnimDict(dict)
		TaskPlayAnim(ped, dict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)

		-- Freeze movement
		FreezeEntityPosition(ped, true)

		-- Wait to simulate inspection
		exports['lc_utils']:progressBar(Config.jobs.inspect_cargo_time * 1000, Utils.translate("cargo_inspect_loading"))
		Wait(Config.jobs.inspect_cargo_time * 1000)

		-- Stop animation & unfreeze
		Utils.Animations.stopPlayerAnim(false)
		FreezeEntityPosition(ped, false)

		-- Show result
		if contract_data then
			if contract_data.illegal == 1 then
				exports['lc_utils']:notify("info", Utils.translate("cargo_inspect_illegal_message"):format(contract_data.contract_name))
			else
				exports['lc_utils']:notify("info", Utils.translate("cargo_inspect_message"):format(contract_data.contract_name))
			end
		else
			exports['lc_utils']:notify("info", Utils.translate("cargo_inspect_message"):format(Utils.translate("cargo_inspect_empty")))
		end
	else
		exports['lc_utils']:notify("error", Utils.translate("cargo_inspect_must_be_police"))
	end
end

RegisterNetEvent('truck_logistics:Notify')
AddEventHandler('truck_logistics:Notify', function(type,message)
	exports['lc_utils']:notify(type,message)
end)

Citizen.CreateThread(function()
	Wait(1000)
	SetNuiFocus(false,false)

	Utils.loadLanguageFile(Lang)

	if Utils.Config.custom_scripts_compatibility.target == "disabled" then
		createMarkersThread()
	else
		createTargetsThread()
		registerTargetForTrailerModels()
	end
end)

AddEventHandler('onResourceStop', function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end
	if truck then
		Utils.Vehicles.deleteVehicle(truck)
	end
	if trailer then
		Utils.Vehicles.deleteVehicle(trailer)
	end
end)
