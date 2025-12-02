CurrentPets = {}
IsInPetMenu = false
PetIndexInSkillMenu = nil
CarriesPet = false
Action = nil

if Config.TargetSystem == "ox_target" then
	Config.TargetSystem = "qtarget"
end

function HasItems(items)
	local filteredItems = lib.callback.await("electus_pets:hasItems", false, items)

	if not filteredItems then
		return {}
	end
	for i = 1, #filteredItems do
		filteredItems[i] =
			{ name = filteredItems[i], label = GetAccessoryLabel(filteredItems[i]) or GetItemLabel(filteredItems[i]) }
	end

	return filteredItems
end

function HasItem(item)
	local hasItem = lib.callback.await("electus_pets:hasItem", false, item)
	return hasItem
end

local singleSequence =
	{ { 0.75, 0.0 }, { 0.75, 0.75 }, { 0.0, 0.75 }, { -0.75, 0.0 }, { -0.75, -0.75 }, { 0.0, -0.75 } }

lib.callback.register("electus_pets:setPetData", function(pet)
	local timedOutTimer = GetGameTimer() + 20000

	while not NetworkDoesNetworkIdExist(pet.netId) do
		Wait(150)
		if GetGameTimer() > timedOutTimer then
			return
		end
	end

	local petId = NetworkGetEntityFromNetworkId(pet.netId)
	pet.petId = petId

	while not NetworkHasControlOfEntity(pet.petId) do
		NetworkRequestControlOfEntity(pet.petId)
		Wait(150)
	end

	SetRelationshipBetweenGroups(3, GetPedRelationshipGroupHash(petId), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(3, GetHashKey("PLAYER"), GetPedRelationshipGroupHash(petId))
	PlaceObjectOnGroundProperly(petId)
	SetEntityAsMissionEntity(petId, true, true)
	SetBlockingOfNonTemporaryEvents(petId, true)
	SetPedFleeAttributes(petId, 0, false)
	NetworkRegisterEntityAsNetworked(petId)

	local healthModifier = pet.skills.health * 40
	SetEntityHealth(pet, 200 + healthModifier)
	SetEntityMaxHealth(pet, 200 + healthModifier)

	local componentId = pet.variation.componentId
	local textureId = pet.variation.textureId
	SetPedComponentVariation(petId, componentId, 0, textureId, 0)

	local maxIndex = #CurrentPets + 1

	CurrentPets[maxIndex] = {
		petId = petId,
		netId = pet.netId,
		model = pet.model,
		sniffedItems = pet.sniffedItems,
		status = pet.status,
		skills = pet.skills,
		name = pet.name,
		bornAt = pet.bornAt,
		accessories = pet.accessories,
		stored = pet.stored,
		dailyTasks = pet.dailyTasks,
		abilities = pet.abilities,
		variation = pet.variation,
		breedingSeed = pet.breedingSeed,
		numOfBreedings = pet.numOfBreedings,
		sex = pet.sex,
	}

	UpdateAccessories(maxIndex)

	if Config.TargetSystem ~= "none" then
		exports[Config.TargetSystem]:RemoveTargetEntity(petId)

		if Config.TargetSystem == "qb-target" then
			exports[Config.TargetSystem]:AddTargetEntity(petId, {
				options = {
					{
						name = pet.name,
						event = "electus_pets:interact",
						label = L("petMenu"),
						pet = CurrentPets[maxIndex],
					},
					{
						icon = "fas fa-paw",
						label = L("petDog"),
						action = function(entity)
							local net = PedToNet(entity)

							if not NetworkDoesNetworkIdExist(net) then
								return
							end

							TriggerServerEvent("electus_pets:petDog", PedToNet(entity))
						end,
						canInteract = function(entity)
							return GetPetByNetId(PedToNet(entity))
								and Config.PettableDogs[GetPetByNetId(PedToNet(entity)).model] ~= nil
						end,
					},
					{
						icon = "fas fa-suitcase",
						label = L("petBag"),
						action = function(entity)
							SendReactMessage("updateComponent", {
								component = "bagLock",
								bagData = {
									owner = GetPetByNetId(PedToNet(entity)).owner,
									petName = GetPetByNetId(PedToNet(entity)).name,
								},
							})
							ToggleNuiFrame(true)
						end,
						canInteract = function(entity)
							return Config.EnablePetBags
								and GetPetByNetId(PedToNet(entity))
								and GetPetByNetId(PedToNet(entity)).hasBag
						end,
					},
				},
				distance = 2.5,
			})
		else
			exports[Config.TargetSystem]:AddTargetEntity(petId, {
				options = {
					{
						name = pet.name,
						event = "electus_pets:interact",
						label = L("petMenu"),
						pet = CurrentPets[maxIndex],
					},
				},
				distance = 2.5,
			})
		end
	end

	TriggerEvent("electus_pets:petSpawned", CurrentPets[maxIndex])
end)

function SpawnPet(pet)
	local ped = PlayerPedId()
	local forward = GetEntityForwardVector(ped)
	local coords = GetEntityCoords(ped)

	local spawnCoords = coords
		+ vector3(singleSequence[#CurrentPets % 6 + 1][1], singleSequence[#CurrentPets % 6 + 1][2], 0.0)
	local ret, spawnCoordsZ = GetGroundZFor_3dCoord(spawnCoords.x, spawnCoords.y, spawnCoords.z, 0.0, false)

	if spawnCoords.z - spawnCoordsZ > 0.75 then
		spawnCoords = coords
	end

	TriggerServerEvent("electus_pets:spawnPet", pet, spawnCoords)
end

RegisterNetEvent("electus_pets:spawnPet", function(pet)
	SpawnPet(pet)
end)

CreateThread(function()
	local hasBeenMsged = false
	while Config.TargetSystem == "none" do
		Wait(500)
		if #CurrentPets > 0 then
			local closest, petIndex = GetClosestPet()
			local pet = CurrentPets[petIndex]

			if closest < 2.0 and not CarriesPet and not hasBeenMsged then
				hasBeenMsged = true
				local text = L("open2", { ["open"] = Config.KeyActions.interactWithPet })

				if pet.hasBag then
					text = text .. "\n" .. L("openPetBag", { ["open"] = Config.KeyActions.petBag })
				end

				if Config.PettableDogs[pet.model] then
					text = text .. "\n" .. L("petDogKey", { ["key"] = Config.KeyActions.petDog })
				end
				local isOpen = lib.isTextUIOpen()

				if not isOpen then
					HelpText(text)
				end
			elseif closest > 2.0 and hasBeenMsged then
				hasBeenMsged = false
			end
		end
	end
end)

CreateThread(function()
	RegisterCommand(Config.Commands.petMenu, function(source, args)
		local closest, pet = GetClosestPet()
		if closest < 2.0 and not IsInPetMenu and not CarriesPet and not IsPedInAnyVehicle(PlayerPedId(), true) then
			if CurrentPets[pet] then
				OpenPetMenu(CurrentPets[pet])
			end
		end
	end, false)
end)

RegisterNetEvent("electus_pets:updateStatus", function(pet)
	for i = 1, #CurrentPets do
		if CurrentPets[i].name == pet.name then
			CurrentPets[i].status.hunger = pet.status.hunger
			CurrentPets[i].status.thirst = pet.status.thirst
			break
		end
	end
end)

function GetPetIndex(name)
	for i = 1, #CurrentPets do
		if CurrentPets[i].name == name then
			return i
		end
	end
end

function OpenPetMenu(pet)
	local index = GetPetIndex(pet.name)
	if not CurrentPets[index] or GetEntityHealth(CurrentPets[index].petId) == 0 then
		return
	end

	IsInPetMenu = true
	PetIndexInSkillMenu = index
	local canAttack = false
	local canSniff = false

	for i, v in pairs(Config.Pets) do
		if CurrentPets[index].model == Config.Pets[i].model then
			canAttack = Config.Pets[i].canAttack
			canSniff = Config.Pets[i].canSniff
		end
	end

	local health = GetEntityHealth(CurrentPets[index].petId)

	SendReactMessage("updateComponent", {
		component = "petMenu",
		pet = {
			pet = CurrentPets[index],
			health = health,
			canAttack = canAttack,
			canSniff = canSniff,
			canBeCarried = CanBeCarried(CurrentPets[index].model),
			canBeRidden = Config.CanBeRidden[CurrentPets[index].model] ~= nil,
			dailyTasks = CurrentPets[index].dailyTasks,
		},
	})

	ToggleNuiFrame(true)
	SetNuiFocusKeepInput(true)
	-- SetNuiFocus(false, true)
	-- SendReactMessage('setVisible', true)
	DisableIdleCamera(true)
	CreateThread(function()
		while IsInPetMenu do
			Wait(0)
			-- disable punching
			DisableControlAction(0, 24, true)
			DisableControlAction(0, 25, true)
			DisableControlAction(0, 69, true)
			DisableControlAction(0, 70, true)
			DisableControlAction(0, 91, true)
			DisableControlAction(0, 92, true)
			DisableControlAction(0, 106, true)
			DisableControlAction(0, 114, true)
			DisableControlAction(0, 140, true)
			DisableControlAction(0, 141, true)
			DisableControlAction(0, 142, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 263, true)
			DisableControlAction(0, 264, true)
			DisableControlAction(0, 330, true)
			DisableControlAction(0, 331, true)
			DisablePlayerFiring(PlayerId(), true)

			-- disable ESC
			DisableControlAction(0, 199, true)
			DisableControlAction(0, 200, true)

			-- disable looking around
			DisableControlAction(0, 1, true)
			DisableControlAction(0, 2, true)

			-- disable chat
			DisableControlAction(0, 245, true)

			-- disable scrollwheel
			DisableControlAction(0, 14, true)
			DisableControlAction(0, 15, true)
			DisableControlAction(0, 16, true)
			DisableControlAction(0, 17, true)
			DisableControlAction(0, 37, true)
			DisableControlAction(0, 50, true)
			DisableControlAction(0, 99, true)
			DisableControlAction(0, 115, true)
			DisableControlAction(0, 180, true)
			DisableControlAction(0, 181, true)
			DisableControlAction(0, 198, true)
			DisableControlAction(0, 241, true)
			DisableControlAction(0, 242, true)
			DisableControlAction(0, 261, true)
			DisableControlAction(0, 262, true)

			-- disable radio (scrollwheel down is not enough)
			DisableControlAction(0, 85, true)
		end
	end)
end

function DoesHaveRequiredJob(job, Action)
	if Config.JobRestrictions[Action] == "none" then
		return true
	end

	local hasJob = false
	if type(Config.JobRestrictions[Action]) == "table" then
		for i = 1, #Config.JobRestrictions[Action] do
			if Config.JobRestrictions[Action][i] == job then
				hasJob = true
				break
			end
		end
	else
		hasJob = Config.JobRestrictions[Action] == job
	end

	return hasJob
end

RegisterCommand(Config.Commands.petSettings, function()
	SendReactMessage("updateComponent", {
		component = "settings",
	})
	ToggleNuiFrame(true)
end, false)

-- RegisterCommand(Config.Commands.petInteract, function()
-- 	if not DoesInteract and #CurrentPets > 0 then
-- 		DoesInteract = true
-- 		SendReactMessage("updateComponent", {
-- 			component = "commandBar",
-- 		})
-- 		ToggleNuiFrame(true)
-- 		Interact()
-- 	end
-- end, false)

-- RegisterKeyMapping(Config.Commands.petInteract, "Pet Interact", "keyboard", Config.KeyActions.fastInteraction)
RegisterKeyMapping(Config.Commands.petMenu, "Pet Menu", "keyboard", Config.KeyActions.interactWithPet)

RegisterNetEvent("electus_pets:removeTransferedPet", function(currentPet)
	for i = 1, #CurrentPets do
		if CurrentPets[i].name == currentPet.name then
			if Config.TargetSystem ~= "none" then
				exports[Config.TargetSystem]:RemoveTargetEntity(CurrentPets[i].petId, {
					L("interact"),
				})
			end
			table.remove(CurrentPets, i)
			break
		end
	end
end)

-- RegisterNetEvent("electus_pets:removePet", function(currentPet)
--     for i = 1, #CurrentPets do
--         if (CurrentPets[i].name == (currentPet.name or currentPet)) then
--             if (CurrentPets[i].status.tracker) then
--                 RemoveBlipForPet(CurrentPets[i].name)
--             end
--             TriggerServerEvent("electus_pets:removePetMigrate", PedToNet(CurrentPets[i].petId))
--             DeletePet(CurrentPets[i])
--             break
--         end
--     end
-- end)

RegisterNetEvent("electus_pets:commandPetHouse", function()
	OpenPetHouse(-2)
end)

lib.callback.register("electus_pets:insertTransferedPet", function(currentPet)
	currentPet.petId = NetToPed(currentPet.netId)

	while not NetworkHasControlOfEntity(currentPet.petId) do
		NetworkRequestControlOfEntity(currentPet.petId)
		Wait(150)
	end

	CurrentPets[#CurrentPets + 1] = currentPet

	if Config.TargetSystem ~= "none" then
		exports[Config.TargetSystem]:AddTargetEntity(currentPet.petId, {
			options = {
				{
					name = currentPet.name,
					event = "electus_pets:interact",
					label = L("interact"),
					pet = CurrentPets[#CurrentPets],
				},
			},
			distance = 2.5,
		})
	end
	Follow(currentPet)
end)

AddEventHandler("onResourceStop", function(resourceName)
	if GetCurrentResourceName() ~= resourceName then
		return
	end
	-- TriggerServerEvent("electus_pets:forceDelete", CurrentPets)

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

function ReloadPed()
	if GetResourceState("illenium-appearance") == "started" then
		TriggerEvent("illenium-appearance:reloadPed")
	elseif GetResourceState("skinchanger") == "started" then
		local ped = PlayerPedId()
		local maxhealth = GetEntityMaxHealth(ped)
		local health = GetEntityHealth(ped)
		local model = nil
		local sex = nil
		local loadSkin = nil

		TriggerEvent("skinchanger:getSkin", function(skin)
			sex = skin.sex
			loadSkin = skin
		end)

		local timer = GetGameTimer() + 10000

		while not loadSkin do
			Wait(100)
			if GetGameTimer() > timer then
				break
			end
		end

		if sex == 1 then
			model = GetHashKey("mp_f_freemode_01")
		else
			model = GetHashKey("mp_m_freemode_01")
		end

		RequestModel(model)

		SetPlayerModel(PlayerId(), model)
		SetModelAsNoLongerNeeded(model)
		TriggerEvent("skinchanger:loadSkin", loadSkin)
		SetPedMaxHealth(PlayerId(), maxhealth)
		Wait(1000)
		SetEntityHealth(PlayerPedId(), health)
	elseif GetResourceState("fivem-appearance") == "started" then
		local appearance = exports["fivem-appearance"]:getPedAppearance(PlayerPedId())
		exports["fivem-appearance"]:setPedAppearance(PlayerPedId(), appearance)
	elseif GetResourceState("qb-clothing") == "started" then
		local health = GetEntityHealth(PlayerPedId())
		local model

		local gender = QBCore.Functions.GetPlayerData().charinfo.gender
		local maxhealth = GetEntityMaxHealth(PlayerPedId())

		if gender == 1 then -- Gender is ONE for FEMALE
			model = GetHashKey("mp_f_freemode_01") -- Female Model
		else
			model = GetHashKey("mp_m_freemode_01") -- Male Model
		end

		RequestModel(model)

		SetPlayerModel(PlayerId(), model)
		SetModelAsNoLongerNeeded(model)
		Citizen.Wait(1000)

		TriggerServerEvent("qb-clothes:loadPlayerSkin")
		TriggerServerEvent("qb-clothing:loadPlayerSkin")

		SetPedMaxHealth(PlayerId(), maxhealth)
		Wait(1000)
		SetEntityHealth(PlayerPedId(), health)
	end
end

function GetPetHouseData(houseId)
	local data = lib.callback.await("electus_pets:getPetHouseData", false, houseId)

	return data
end

function OpenPetVet()
	local pets = lib.callback.await("electus_pets:getDeadPets", false)

	SendReactMessage("updateComponent", { component = "vet", vetPets = pets })
	ToggleNuiFrame(true)
end

function HandleUpdateAccessories(petIndex, data, action)
	local pet = CurrentPets[petIndex]
	local item = data.item

	if data.item == nil then
		item = pet.accessories[data.slot]
	end

	if action == "removeItem" then
		local compatible = IsAccessoryCompatible(pet.model, data.item)
		if not compatible then
			Notify(L("incompatibleAccessory"))
			return
		end
	end

	CurrentPets[petIndex].accessories[data.slot] = data.item

	if action == "addItem" then
		if CurrentPets[petIndex].accessoriesProps and CurrentPets[petIndex].accessoriesProps[data.slot] then
			while DoesEntityExist(CurrentPets[petIndex].accessoriesProps[data.slot]) do
				DeleteEntity(CurrentPets[petIndex].accessoriesProps[data.slot])
				Wait(0)
			end
		end
	end

	local success = lib.callback.await("electus_pets:updateAccessories", false, CurrentPets[petIndex], item, action)
	if success then
		UpdateAccessories(petIndex)
		SyncUIAccessoriesInventory()
		SyncUIAccessoriesSlots(pet)
	end
end

function LoadPets()
	local pets = lib.callback.await("electus_pets:getPets", false)
	for i = 1, #pets do
		SpawnPet(pets[i])
	end

	for i = 1, #CurrentPets do
		CreateThread(function()
			Follow(CurrentPets[i])
		end)
	end
end

function SearchPed(pet, ped)
	local id = GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped))
	local foundItem = lib.callback.await("electus_pets:searchPlayer", false, id, pet)

	local ranNum = math.random(1, 10)

	if foundItem then
		if pet.skills.sniff >= ranNum then
			AnimHandler(pet, "sitAnim")
			Notify(L("foundSniffedItem"))
			AddXP(pet, Config.RewardsXP.successfulSearch)
			DailyTaskCheck(pet, "sniffItem")
			UpdatePetUI()
			Wait(500)
			AnimHandler(pet)
		end
	else
		Notify(L("sniffedItemNotFound"))
	end
end

function OpenPetBagInventory(petName, owner)
	local stashId = owner .. "-pet-" .. petName

	if Config.Inventory == "ox_inventory" then
		if not exports["ox_inventory"]:openInventory("stash", stashId) then
			TriggerServerEvent("electus_pets:openBagInventory", petName, owner)
			exports["ox_inventory"]:openInventory("stash", stashId)
		end
	elseif Config.Inventory == "tgiann" or Config.Inventory == "codem" then
		local options = {}
		options.maxweight = Config.Bags.maxWeight
		options.slots = Config.Bags.maxSlots

		TriggerServerEvent("inventory:server:OpenInventory", "stash", stashId, options)
		TriggerEvent("inventory:client:SetCurrentStash", stashId)
	elseif Config.Inventory == "qs-inventory" then
		stashId = stashId:gsub("-", "_")
		exports["qs-inventory"]:RegisterStash(stashId, Config.Bags.maxSlots, Config.Bags.maxWeight)
	else
		TriggerServerEvent("electus_pets:openBagInventory", petName, owner)
		local options = {}
		options.maxweight = Config.Bags.maxWeight
		options.slots = Config.Bags.maxSlots
		TriggerServerEvent("inventory:server:OpenInventory", "stash", stashId, options)
		TriggerEvent("inventory:client:SetCurrentStash", stashId)
	end
end
