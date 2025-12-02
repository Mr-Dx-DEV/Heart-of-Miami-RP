QBCore = nil
PlayerData = {}

if Config.Framework ~= "qb" then
	return
end

QBCore = exports[Config.CustomStringQBExport]:GetCoreObject()

function MenuClose()
	QBCore.UI.Menu.CloseAll()
end

PlayerData = QBCore.Functions.GetPlayerData()

CreateThread(function()
	Wait(1000)

	if LocalPlayer.state.isLoggedIn then
		LoadPets()
		LoadPetHouses()
		LoadMarkers()
		TriggerServerEvent("electus_pets:sendFriendListToClient")
	end
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
	while not PlayerLoaded() do
		Wait(250)
	end
	LoadPets()
	LoadPetHouses()
	LoadMarkers()
	TriggerServerEvent("electus_pets:sendFriendListToClient")
end)

RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
	PlayerData = {}

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

	PetHouses = {}
	CurrentPets = {}
	-- interactablePeds = {}
	-- markers = {}

	LoadPets()
	LoadPetHouses()
	LoadMarkers()
	TriggerServerEvent("electus_pets:sendFriendListToClient")
end)

function GetJobName()
	local job = QBCore.Functions.GetPlayerData().job.name

	return job
end

function GetIdentifier()
	local identifier = QBCore.Functions.GetPlayerData().citizenid

	return identifier
end

function GetItemLabel(item)
	if not QBCore.Shared.Items[item:lower()] then
		return "Label not found"
	end
	local label = QBCore.Shared.Items[item:lower()].label
	return label
end

function GetJobsLabel(jobs)
	local jobNames = {}
	for i = 1, #jobs do
		jobNames[#jobNames + 1] = { label = QBCore.Shared.Jobs[jobs[i]].label, name = jobs[i] }
	end
	return jobNames
end

RegisterNetEvent("electus_pets:interact", function(data)
	OpenPetMenu(data.pet)
end)

function DoesVehicleHaveSniffedItem(plate, pet)
	local p = promise:new()
	if Config.VehicleInventory == "qs-inventory" then
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
	elseif Config.VehicleInventory == "custom" then
		Wait(2500)
		if Config.GetCustomVehiclePlateInventoryItems ~= nil then
			local items = Config.GetCustomVehiclePlateInventoryItems(plate)
			for i = 1, #items do
				if items then
					for j = 1, #pet.sniffedItems do
						if items[i].name == pet.sniffedItems[j] then
							if pet.skills.sniff >= ranNum then
								p:resolve(true)
								break
							end
						end
					end
				end
			end
		end
		p:resolve(false)
	end
	Citizen.Await(p)
	return p.value
end
