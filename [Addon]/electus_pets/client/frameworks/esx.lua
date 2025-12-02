PlayerData = {}

if Config.Framework ~= "esx" then
	return
end

export, ESX = pcall(function()
	return exports.es_extended:getSharedObject()
end)

if not export then
	TriggerEvent("esx:getSharedObject", function(obj)
		ESX = obj
	end)
end

RegisterNetEvent("esx:playerLoaded", function(xPlayer, isNew, skin)
	PlayerData = xPlayer

	Wait(2000)
	ESX.PlayerLoaded = true
end)

RegisterNetEvent("esx:onPlayerLogout", function()
	ESX.PlayerLoaded = false

	for i = 1, #CurrentPets do
		if CurrentPets[i].action == "riding" then
			StopRiding(CurrentPets[i])
		end
		DeleteEntity(CurrentPets[i].petId)
		if CurrentPets[i].accessoriesProps then
			for key, value in pairs(CurrentPets[i].accessoriesProps) do
				DeleteEntity(value)
			end
		end
	end

	for i = 1, #PetHouses do
		DeleteEntity(PetHouses[i].obj)
	end

	while not ESX.PlayerLoaded do
		Wait(250)
	end

	PetHouses = {}
	CurrentPets = {}
	-- interactablePeds = {}
	-- markers = {}

	ESX.PlayerLoaded = true

	LoadPets()
	LoadPetHouses()
	LoadMarkers()
	TriggerServerEvent("electus_pets:sendFriendListToClient")
end)

-- AddEventHandler("onResourceStop", function(resourceName)
-- 	if resourceName == GetCurrentResourceName() then
-- 		-- ESX.PlayerLoaded = false
-- 	end
-- end)

RegisterNetEvent(Config.MidGameCharacterSwap)
AddEventHandler(Config.MidGameCharacterSwap, function()
	for i = 1, #CurrentPets do
		if CurrentPets[i].action == "riding" then
			StopRiding(CurrentPets[i])
		end
		DeleteEntity(CurrentPets[i].petId)
		if CurrentPets[i].accessoriesProps then
			for key, value in pairs(CurrentPets[i].accessoriesProps) do
				DeleteEntity(value)
			end
		end
	end
	for i = 1, #PetHouses do
		DeleteEntity(PetHouses[i].obj)
	end
end)

CreateThread(function()
	Wait(500)

	while ESX == nil do
		Wait(500)
	end

	while not ESX.PlayerLoaded do
		Wait(500)
	end

	PlayerData = ESX.GetPlayerData()
	ESX.PlayerLoaded = true

	LoadPets()
	LoadPetHouses()
	LoadMarkers()
	TriggerServerEvent("electus_pets:sendFriendListToClient")
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
	LoadMarkers()
end)

function MenuClose()
	ESX.UI.Menu.CloseAll()
end

function GetJobName()
	local job = ESX.GetPlayerData().job.name

	return job
end

function GetIdentifier()
	local identifier = ESX.GetPlayerData().identifier

	return identifier
end

function GetInventory()
	local inventory = ESX.GetPlayerData().inventory
	return inventory
end

function GetItemLabel(item)
	local p = promise:new()
	ESX.TriggerServerCallback("electus_pets:getItemLabel", function(label)
		p:resolve(label)
	end, item)
	return Citizen.Await(p)
end

function GetJobsLabel(jobs)
	local p = promise:new()
	ESX.TriggerServerCallback("electus_pets:getJobsName", function(jobNames)
		p:resolve(jobNames)
	end, jobs)
	return Citizen.Await(p)
end

RegisterNetEvent("electus_pets:interact", function(data)
	OpenPetMenu(data.pet)
end)

function DoesVehicleHaveSniffedItem(plate, pet)
	local p = promise:new()

	if not Config.EnableLearnToSniff then
		pet.sniffedItems = Config.AllowedSniffedItems
	end

	if Config.VehicleInventory == "esx_inventoryhud_trunk" or Config.VehicleInventory == "esx_trunk" then
		ESX.TriggerServerCallback(Config.VehicleInventory .. ":getInventoryV", function(inventory)
			Wait(2500)
			for i = 1, #inventory.items do
				if inventory.items[i].count > 0 then
					for j = 1, #pet.sniffedItems do
						if inventory.items[i].name == pet.sniffedItems[j] then
							p:resolve(true)
							break
						end
					end
				end
			end
			p:resolve(false)
		end, plate)
	elseif Config.VehicleInventory == "ox_inventory" then
		ESX.TriggerServerCallback("electus_pets:getOxTrunk", function(returnedCount)
			Wait(2500)
			if returnedCount > 0 then
				p:resolve(true)
			end
			p:resolve(false)
		end, plate, pet.sniffedItems)
	elseif Config.VehicleInventory == "qs-inventory" then
		Wait(2500)
		local items = lib.callback.await("electus_pets:getQSTrunk", false, plate)

		for i = 1, #items do
			for j = 1, #pet.sniffedItems do
				if items[i].name == pet.sniffedItems[j] then
					p:resolve(true)
				end
			end
		end
		p:resolve(false)
	elseif Config.VehicleInventoru == "mf-inventory" then
		exports["mf-inventory"]:getInventoryItems("trunk" .. plate, function(items)
			Wait(2500)
			for i = 1, #items do
				for j = 1, #pet.sniffedItems do
					if items[i].name == pet.sniffedItems[j] then
						p:resolve(true)
						break
					end
				end
			end
			p:resolve(false)
		end)
	elseif Config.VehicleInventory == "custom" then
		Wait(2500)
		if Config.GetCustomVehicleInventoryItems ~= nil then
			local items = Config.GetCustomVehiclePlateInventoryItems(plate)
			for i = 1, #items do
				for j = 1, #pet.sniffedItems do
					if items[i].name == pet.sniffedItems[j] then
						p:resolve(true)
					end
				end
			end
			p:resolve(false)
		end
	end
	Citizen.Await(p)
	return p.value
end
