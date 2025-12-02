RegisterNUICallback("command", function(data, cb)
	if not DoesInteract then
		DoesInteract = true
		Wait(150)
		SendReactMessage("updateComponent", {
			component = "commandBar",
		})
		ToggleNuiFrame(true)
		SetNuiFocusKeepInput(true)
		IsInPetMenu = false
		Interact(CurrentPets[PetIndexInSkillMenu])
	end
	PetIndexInSkillMenu = nil
	cb({})
end)

RegisterNUICallback("carry", function(data, cb)
	CarryPet(CurrentPets[PetIndexInSkillMenu])
	PetIndexInSkillMenu = nil
	IsInPetMenu = nil
	ToggleNuiFrame(false)
	SetNuiFocusKeepInput(false)
	cb({})
end)

RegisterNUICallback("feed", function(data, cb)
	if PreventActionRiding() then
		cb({})
		return
	end
	FeedPet(CurrentPets[PetIndexInSkillMenu])
	UpdatePetUI()

	cb({})
end)

RegisterNuiCallback("drink", function(data, cb)
	if PreventActionRiding() then
		cb({})
		return
	end
	WetPet(CurrentPets[PetIndexInSkillMenu])
	UpdatePetUI()

	cb({})
end)

RegisterNUICallback("requestInput", function(data, cb)
	SetNuiFocusKeepInput(false)
	cb({})
end)

RegisterNUICallback("exitInput", function(data, cb)
	SetNuiFocusKeepInput(true)
	cb({})
end)

RegisterNUICallback("autoAttack", function(data, cb)
	if CurrentPets[PetIndexInSkillMenu].status.autoAttack then
		CurrentPets[PetIndexInSkillMenu].status.autoAttack = nil
	else
		CurrentPets[PetIndexInSkillMenu].status.autoAttack = true
	end
	cb({})
end)

RegisterNUICallback("switchTracker", function(data, cb)
	if CurrentPets[PetIndexInSkillMenu].status.tracker then
		CurrentPets[PetIndexInSkillMenu].status.tracker = nil
		TriggerServerEvent("electus_pets:switchTracker", false)
		RemoveBlipForPet(CurrentPets[PetIndexInSkillMenu].name)
		TriggerServerEvent("electus_pets:updateStatus", CurrentPets[PetIndexInSkillMenu])
	else
		TriggerServerEvent("electus_pets:switchTracker", true, PetIndexInSkillMenu)
	end
	cb({})
end)

RegisterNetEvent("electus_pets:enableTracker", function(petIndex)
	CurrentPets[petIndex].status.tracker = true
	AddBlipForPet(CurrentPets[petIndex])
	TriggerServerEvent("electus_pets:updateStatus", CurrentPets[petIndex])
end)

RegisterNUICallback("fetch", function(data, cb)
	if PreventActionRiding() then
		cb({})
		return
	end
	FetchBall(CurrentPets[PetIndexInSkillMenu])
	cb({})
end)

RegisterNUICallback("sniffNewItem", function(data, cb)
	if PreventActionRiding() then
		cb({})
		return
	end
	SniffNewItem(CurrentPets[PetIndexInSkillMenu], data.item)
	cb({})
end)

RegisterNUICallback("getSniffedItems", function(data, cb)
	local items = CurrentPets[PetIndexInSkillMenu].sniffedItems
	local sniffedItems = {}
	for i = 1, #items do
		sniffedItems[#sniffedItems + 1] = {
			item = items[i],
			label = GetItemLabel(items[i]),
		}
	end
	cb(sniffedItems)
end)

RegisterNUICallback("transferPet", function(data, cb)
	ToggleNuiFrame(false)
	IsInPetMenu = false
	TriggerServerEvent("electus_pets:transferPet", data.pet, data.id)
	cb({})
end)

RegisterNUICallback("ridePet", function(data, cb)
	if PreventActionRiding() then
		cb({})
		return
	end
	ToggleNuiFrame(false)
	IsInPetMenu = false
	StartRiding(CurrentPets[PetIndexInSkillMenu])
	cb({})
end)

RegisterNUICallback("upgradeSkill", function(data, cb)
	local pet = CurrentPets[PetIndexInSkillMenu]
	if pet.skills.skillPoints > 0 then
		pet.skills.skillPoints = pet.skills.skillPoints - 1
		pet.skills[data.skill] = pet.skills[data.skill] + 1
		TriggerServerEvent("electus_pets:updateSkills", CurrentPets[PetIndexInSkillMenu])
	end
	cb({})
end)

RegisterNUICallback("selectNewPet", function(data, cb)
	local pet = data.pet
	local hash = GetHashKey(pet.model)

	while DoesEntityExist(SelectedPet) do
		Wait(0)
		DeleteEntity(SelectedPet)
	end

	while not HasModelLoaded(hash) do
		RequestModel(hash)
		Wait(0)
	end
	local ret, z = GetGroundZFor_3dCoord(
		Config.PetShop[CurrentShop].petCoords.x,
		Config.PetShop[CurrentShop].petCoords.y,
		Config.PetShop[CurrentShop].petCoords.z,
		0
	)

	SelectedPet = CreatePed(
		28,
		hash,
		Config.PetShop[CurrentShop].petCoords.x,
		Config.PetShop[CurrentShop].petCoords.y,
		z,
		Config.PetShop[CurrentShop].petCoords.w,
		false,
		false
	)
	SetEntityAlpha(SelectedPet, 0, false)
	Wait(50)
	SetEntityAlpha(SelectedPet, 255, false)
	SetPedFleeAttributes(SelectedPet, 2, false)
	SetBlockingOfNonTemporaryEvents(SelectedPet, true)
	SetPedCanRagdollFromPlayerImpact(SelectedPet, false)
	SetPedDiesWhenInjured(SelectedPet, false)
	FreezeEntityPosition(SelectedPet, true)
	SetEntityInvincible(SelectedPet, true)
	SetPedCanPlayAmbientAnims(SelectedPet, false)
	local model = pet.model
	if Config.PetVariations[model] then
		local componentId = Config.PetVariations[model][1].componentId
		local textureId = Config.PetVariations[model][1].textureId
		SetPedComponentVariation(SelectedPet, componentId, 0, textureId, 0)
	end

	cb({})
end)

RegisterNuiCallback("changeZoom", function(data, cb)
	SetZoom(100 - tonumber(data.value))
	cb({})
end)

RegisterNUICallback("changeVariation", function(data, cb)
	SetPedComponentVariation(SelectedPet, data.value.componentId, 0, data.value.textureId, 0)
	cb({})
end)

RegisterNUICallback("hideFrame", function(data, cb)
	if CurrentShop then
		ClosePetShopScene()
	end
	ToggleNuiFrame(false)
	SendReactMessage("updateComponent", { component = "none" })
	if IsInPetMenu then
		Wait(100)
		IsInPetMenu = false
	end
	cb({})
end)

RegisterNUICallback("loadUtils", function(data, cb)
	loaded = true
	cb({ locale = locales[Config.Locale], config = Config })
end)

RegisterNUICallback("rotatePetInShop", function(data, cb)
	RotatePetInShop(data.value)
	cb({})
end)

RegisterNUICallback("getSniffableItems", function(data, cb)
	local items = Config.AllowedSniffedItems
	local ownedItems = HasItems(items)

	for i = 1, #ownedItems do
		local alreadySniffed = false
		for j = 1, #CurrentPets[PetIndexInSkillMenu].sniffedItems do
			if CurrentPets[PetIndexInSkillMenu].sniffedItems[j] == ownedItems[i].name then
				alreadySniffed = true
				break
			end
		end
		ownedItems[i] = {
			item = ownedItems[i].name,
			label = GetItemLabel(ownedItems[i].name),
			alreadySniffed = alreadySniffed,
		}
	end

	cb(ownedItems)
end)

RegisterNUICallback("getEmotes", function(pet, cb)
	if PreventActionRiding() then
		cb({})
		return
	end
	if not Config.Emotes[pet.model] then
		cb({})
		return
	end
	cb(Config.Emotes[pet.model])
end)

RegisterNUICallback("unlockAbility", function(data, cb)
	local pet = CurrentPets[PetIndexInSkillMenu]
	local ability = Config.AbilitiesUpgrade[data.ability]
	if pet.skills.skillPoints >= Config.AbilitiesUpgrade[data.ability].cost then
		if data.ability == "autoAttack" or data.ability == "attackWheels" or data.ability == "guardArea" then
			if pet.skills.bravery < ability.requireBraveryLevel then
				Notify(L("notEnoughBravery"))
				return
			end
		elseif data.ability == "searchVehicle" then
			if pet.skills.sniff < ability.requireSniffLevel then
				Notify(L("notEnoughSniff"))
				return
			end
		end
		pet.skills.skillPoints = pet.skills.skillPoints - Config.AbilitiesUpgrade[data.ability].cost
		pet.abilities[data.ability] = true
		TriggerServerEvent("electus_pets:unlockAbility", CurrentPets[PetIndexInSkillMenu])
	end
	UpdatePetUI()
	cb({})
end)

RegisterNUICallback("playEmote", function(emote, cb)
	if PreventActionRiding() then
		return
	end
	PlayEmote(emote)
	cb({})
end)

RegisterNUICallback("dischargePet", function(data, cb)
	TriggerServerEvent("electus_pets:payVetBill", data.pet, data.paymentMethod)
	ToggleNuiFrame(false)
	cb({})
end)

RegisterNUICallback("switchAutoAttack", function(data, cb)
	if CurrentPets[PetIndexInSkillMenu].status.autoAttack then
		CurrentPets[PetIndexInSkillMenu].status.autoAttack = nil
	else
		CurrentPets[PetIndexInSkillMenu].status.autoAttack = true
	end

	UpdatePetUI()
	cb({})
end)

RegisterNUICallback("getAccessoriesData", function(data, cb)
	local slots = GetAccessoiresSlots(CurrentPets[PetIndexInSkillMenu])
	local inventory = GetAccessoriesInventory()

	cb({ slots = slots, inventory = inventory })
end)

RegisterNUICallback("removeAccessory", function(data, cb)
	HandleUpdateAccessories(PetIndexInSkillMenu, data, "addItem")
	cb({})
end)

RegisterNUICallback("removeHouse", function(data, cb)
	RemoveHouse(data.houseId)
	ToggleNuiFrame(false)
	cb({})
end)

RegisterNUICallback("setAccessory", function(data, cb)
	HandleUpdateAccessories(PetIndexInSkillMenu, data, "removeItem")
	cb({})
end)

RegisterNUICallback("purchaseAccessories", function(data, cb)
	TriggerServerEvent("electus_pets:purchaseAccessories", data.basket, data.paymentMethod)
	ToggleNuiFrame(false)
	cb({})
end)

RegisterNUICallback("leash", function(data, cb)
	if PreventActionRiding() then
		return
	end

	if CurrentPets[PetIndexInSkillMenu].leash then
		CurrentPets[PetIndexInSkillMenu].leash = false
		DetachLeash(CurrentPets[PetIndexInSkillMenu])
	else
		local hasLeash = HasItem(Config.Items.petLeash)
		if not hasLeash then
			Notify(L("noLeashItem"))
			return
		end
		CurrentPets[PetIndexInSkillMenu].leash = true
		AttachLeash(CurrentPets[PetIndexInSkillMenu])
	end
	UpdatePetUI()
	cb({})
end)

RegisterNUICallback("getHouseData", function(data, cb)
	local houseData = GetPetHouseData(data.houseId)
	local pets = {}
	for i = 1, #CurrentPets do
		pets[#pets + 1] = { name = CurrentPets[i].name, model = CurrentPets[i].model }
	end
	cb({
		house = houseData.pets,
		maxOutside = Config.MaxAmountPetOutside,
		outside = pets,
		maxHouseSlots = (data.houseId == -2 and Config.MaxAmountPetInsideCommandHouse)
			or Config.PetHouseModels[houseData.data.houseType].maxPets,
	})
end)

RegisterNUICallback("guardArea", function(data, cb)
	local pedCoords = GetEntityCoords(PlayerPedId())
	CreateGuardArea(CurrentPets[PetIndexInSkillMenu], pedCoords)

	-- GuardArea(CurrentPets[PetIndexInSkillMenu], pedCoords, 5.0)
	cb({})
end)

RegisterNUICallback("insertPetInHouse", function(data, cb)
	InsertPetInHouse(data.houseId, data.petName, data.maxHouseSlots)
	cb({})
end)

RegisterNUICallback("getAvaliableFriendJobs", function(data, cb)
	cb(GetJobsLabel(Config.AllowedJobsToSetAsFriends))
end)

RegisterNUICallback("removePetFromHouse", function(data, cb)
	if #CurrentPets > Config.MaxAmountPetOutside then
		Notify(L("maxOutside"))
		return
	end
	RemovePetFromHouse(data.petName, data.houseId)
	cb({})
end)

RegisterNUICallback("addJobAsFriend", function(data, cb)
	TriggerServerEvent("electus_pets:addJobAsFriend", data.job)
	cb({})
end)

RegisterNUICallback("removeJobAsFriend", function(data, cb)
	TriggerServerEvent("electus_pets:removeJobAsFriend", data.job)
	cb({})
end)

RegisterNUICallback("addFriend", function(data, cb)
	TriggerServerEvent("electus_pets:addFriend", data.id)
	cb({})
end)

RegisterNUICallback("getFriends", function(data, cb)
	cb(GetFriendList())
end)

RegisterNUICallback("removeFriend", function(data, cb)
	TriggerServerEvent("electus_pets:removeFriend", data.identifier)
	cb({})
end)

RegisterNUICallback("purchasePet", function(data, cb)
	local startingPoints = Config.PetShop[CurrentShop].startingSkillPoints
	TriggerServerEvent(
		"electus_pets:purchasePet",
		data.pet,
		data.variation,
		data.paymentMethod,
		data.name,
		startingPoints
	)
	ClosePetShopScene()
	ToggleNuiFrame(false)
	cb({})
end)

RegisterNUICallback("openOptions", function(data, cb)
	SetNuiFocusKeepInput(false)
	SendReactMessage("updateComponent", {
		component = "settings",
	})
	cb({})
end)

RegisterNUICallback("bagLock", function(data, cb)
	ToggleNuiFrame(false)
	SetNuiFocusKeepInput(true)
	IsInPetMenu = false
	TriggerServerEvent("electus_pets:unlockBag", data.owner, data.petName, data.password)
	cb({})
end)

RegisterNUICallback("changeBagLock", function(data, cb)
	SendReactMessage("updateComponent", { component = "changePass" })
	cb({})
end)

RegisterNUICallback("receivePet", function(data, cb)
	ToggleNuiFrame(false)
	TriggerServerEvent("electus_pets:givePet", data.name, data.model, 0)
	cb({})
end)

RegisterNUICallback("changePass", function(data, cb)
	TriggerServerEvent("electus_pets:registerBagPassword", CurrentPets[PetIndexInSkillMenu].name, data.password)
	ToggleNuiFrame(false)
	IsInPetMenu = false
	SetNuiFocusKeepInput(false)
	cb({})
end)
