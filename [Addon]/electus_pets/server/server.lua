function Notify(src, msg)
	TriggerClientEvent("ox_lib:notify", src, { description = msg })
end

RegisterNetEvent("electus_pets:storePet", function(pet, storageId)
	local src = source
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)
	MySQL.Async.execute(
		"UPDATE electus_pets SET `stored` = @stored WHERE identifier = @identifier AND name = @name",
		{ ["@identifier"] = identifier, ["@name"] = pet.name, ["@store"] = storageId }
	)
end)

RegisterNetEvent("electus_pets:payVetBill", function(pet, paymentMethod)
	local src = source
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)
	local bank = GetBankMoney(player)
	local cash = GetCashMoney(player)

	if (paymentMethod == "cash" and cash < Config.VetPrice) or (paymentMethod == "bank" and bank < Config.VetPrice) then
		Notify(src, L("notEnoughMoney"))
		return
	end

	if paymentMethod == "cash" then
		RemoveCashMoney(player, Config.VetPrice)
	else
		RemoveBankMoney(player, Config.VetPrice)
	end

	pet.status.hunger = 100
	pet.status.thirst = 100

	MySQL.Async.execute(
		"UPDATE electus_pets SET `stored` = 0 AND status = @status WHERE identifier = @identifier AND name = @name",
		{ ["@status"] = json.encode(pet.status), ["@identifier"] = identifier, ["@name"] = pet.name }
	)

	TriggerClientEvent("electus_pets:spawnPet", src, pet)
end)

RegisterNetEvent("elecuts_pets:updateBreeding", function(pet)
	local src = source
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)

	MySQL.Async.execute(
		"UPDATE electus_pets SET numOfBreedings = @numOfBreedings WHERE identifier = @identifier AND name = @name",
		{ ["@identifier"] = identifier, ["@name"] = pet.name, ["@numOfBreedings"] = pet.numOfBreedings }
	)
end)

function GivePet(src, name, model, startingPoints, variation, sex)
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)

	local var = variation or { componentId = 0, textureId = 0 }
	sex = sex or math.random(0, 1) == 0 and "M" or "F"
	local breedingSeed = math.random(1, 100)

	local hasPet = MySQL.Sync.fetchScalar(
		"SELECT COUNT(*) FROM electus_pets WHERE identifier = @identifier AND name = @name",
		{ ["@identifier"] = identifier, ["@name"] = name }
	)

	if hasPet > 0 then
		Notify(src, L("alreadyHavePetWithName"))
		TriggerClientEvent("electus_pets:receivePet", src, model)
		return false
	end

	local result = InsertPet(identifier, name, model, var, sex, breedingSeed, startingPoints)

	TriggerClientEvent("electus_pets:spawnPet", src, {
		name = name,
		model = model,
		status = { hunger = 100, thirst = 100 },
		skills = {
			xp = 0,
			bravery = 0,
			speed = 0,
			sniff = 0,
			obedience = 0,
			health = 0,
			thoughness = 0,
			skillPoints = startingPoints,
		},
		sniffedItems = {},
		accessories = {},
		abilities = {
			autoAttack = false,
			guardArea = false,
			searchVehicle = false,
			moreDailyTasks = false,
			addHealthEating = false,
			attackWheels = false,
		},
		stored = 0,
		variation = var,
		breedingSeed = breedingSeed,
		numOfBreedings = 0,
		sex = sex,
	})

	return true
end

exports("GivePet", GivePet)

local dogHumpValidation = {}

lib.callback.register("electus_pets:confirmDogHump", function(src)
	dogHumpValidation[src] = true
end)

RegisterNetEvent("electus_pets:givePet", function(name, model, startingPoints, variation)
	local src = source
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)

	if not dogHumpValidation[src] then
		return
	end

	dogHumpValidation[src] = nil

	if not name or name == "" then
		Notify(src, L("invalidName"))
		return
	end

	local given = GivePet(src, name, model, startingPoints, variation)

	if not given then
		dogHumpValidation[src] = true
	end
end)

function InsertPet(identifier, name, model, variation, sex, breedingSeed, startingPoints)
	local result = MySQL.Sync.execute(
		"INSERT INTO electus_pets (`identifier`, `name`, `model`, `status`, `skills`, `variation`, `sniffedItems`, `accessories`, `abilities`, `stored`, `sex`, `breedingSeed`, `numOfBreedings`) VALUES (@identifier, @name, @model, @status, @skills, @variation, @sniffedItems, @accessories, @abilities, @stored, @sex, @breedingSeed, @numOfBreedings)",
		{
			["@identifier"] = identifier,
			["@name"] = name,
			["@model"] = model,
			["@status"] = json.encode({ hunger = 100, thirst = 100 }),
			["@skills"] = json.encode({
				xp = 0,
				bravery = 0,
				speed = 0,
				sniff = 0,
				health = 0,
				thoughness = 0,
				obedience = 0,
				skillPoints = startingPoints,
			}),
			["@abilities"] = json.encode({
				autoAttack = false,
				guardArea = false,
				searchVehicle = false,
				moreDailyTasks = false,
				addHealthEating = false,
				attackWheels = false,
			}),
			["@variation"] = json.encode(variation),
			["@sniffedItems"] = json.encode({}),
			["@accessories"] = json.encode({}),
			["@stored"] = 0,
			["@breedingSeed"] = breedingSeed,
			["@numOfBreedings"] = 0,
			["@sex"] = sex,
		}
	)
	return result
end

RegisterNetEvent("electus_pets:purchasePet", function(pet, variation, paymentMethod, name, startingPoints)
	local src = source
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)
	local bank = GetBankMoney(player)
	local cash = GetCashMoney(player)
	local petPrice = Config.Pets[pet.model].price
	local found = false

	if not name or name == "" then
		Notify(src, L("invalidName"))
		return
	end

	MySQL.Async.fetchAll(
		"SELECT * FROM electus_pets WHERE identifier = @identifier",
		{ ["@identifier"] = identifier },
		function(pets)
			for i = 1, #pets do
				if string.lower(pets[i].name) == string.lower(name) then
					found = true
					Notify(src, L("alreadyHavePetWithName"))
					break
				end
			end

			if not found then
				if (paymentMethod == "cash" and cash < petPrice) or (paymentMethod == "bank" and bank < petPrice) then
					Notify(src, L("notEnoughMoney"))
					return
				end

				if paymentMethod == "cash" then
					RemoveCashMoney(player, petPrice)
				else
					RemoveBankMoney(player, petPrice)
				end

				local sex = math.random(0, 1) == 0 and "M" or "F"
				local breedingSeed = math.random(1, 100)
				local result = InsertPet(identifier, name, pet.model, variation, sex, breedingSeed, startingPoints)

				if result == 0 then
					Notify(src, L("alreadyHavePetWithName"))
					return
				end

				local dailyTasks = InsertDailyQuests(identifier, name, false)

				TriggerClientEvent("electus_pets:spawnPet", src, {
					name = name,
					model = pet.model,
					status = { hunger = 100, thirst = 100 },
					skills = {
						xp = 0,
						bravery = 0,
						speed = 0,
						sniff = 0,
						obedience = 0,
						health = 0,
						thoughness = 0,
						skillPoints = startingPoints,
					},
					sniffedItems = {},
					accessories = {},
					abilities = {
						autoAttack = false,
						guardArea = false,
						searchVehicle = false,
						moreDailyTasks = false,
						addHealthEating = false,
						attackWheels = false,
					},
					stored = 0,
					variation = variation,
					breedingSeed = breedingSeed,
					sex = sex,
					dailyTasks = dailyTasks,
				})
			end
		end
	)
end)

RegisterNetEvent("electus_pets:addStatus", function(pet, toAddHunger, toAddThrist)
	local src = source
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)
	local pet_waterCount = GetInventoryCount(src, Config.Items.petWater)
	local pet_foodCount = GetInventoryCount(src, Config.Items.petFood)

	if pet_foodCount == 0 and toAddHunger > 0 then
		Notify(src, L("noFood"))
		return
	end

	if pet_waterCount == 0 and toAddThrist > 0 then
		Notify(src, L("noWater"))
		return
	end

	local hunger = pet.status.hunger
	local thirst = pet.status.thirst

	if toAddThrist > 0 and thirst + toAddThrist <= 100 then
		pet.status.thirst = pet.status.thirst + toAddThrist
		RemoveInventoryItem(player, Config.Items.petWater, 1)

		MySQL.Async.execute(
			"UPDATE electus_pets SET status = @status WHERE identifier = @identifier AND name = @name",
			{ ["@identifier"] = identifier, ["@name"] = pet.name, ["@status"] = json.encode(pet.status) }
		)

		TriggerClientEvent("electus_pets:updateStatus", src, pet)
	elseif thirst + toAddThrist > 100 then
		Notify(src, L("notThirsty"))
	end

	if toAddHunger > 0 and hunger + toAddHunger <= 100 then
		pet.status.hunger = pet.status.hunger + toAddHunger
		RemoveInventoryItem(player, Config.Items.petFood, 1)

		MySQL.Async.execute(
			"UPDATE electus_pets SET status = @status WHERE identifier = @identifier AND name = @name",
			{ ["@identifier"] = identifier, ["@name"] = pet.name, ["@status"] = json.encode(pet.status) }
		)

		TriggerClientEvent("electus_pets:updateStatus", src, pet)
	elseif hunger + toAddHunger > 100 then
		Notify(src, L("notHungry"))
	end
end)

RegisterNetEvent("electus_pets:updateStatus", function(pet)
	local src = source
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)

	MySQL.Async.execute(
		"UPDATE electus_pets set status = @status WHERE identifier = @identifier AND name = @name",
		{ ["@identifier"] = identifier, ["@status"] = json.encode(pet.status), ["@name"] = pet.name }
	)
end)

RegisterNetEvent("electus_pets:updateAbilities", function(pet)
	local src = source
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)

	MySQL.Async.execute(
		"UPDATE electus_pets set status = @status WHERE identifier = @identifier AND name = @name",
		{ ["@identifier"] = identifier, ["@status"] = json.encode(pet.abilities), ["@name"] = pet.name }
	)
end)

RegisterNetEvent("electus_pets:transferPet", function(currentPet, targetSource)
	local src = source
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)
	local targetPlayer = GetPlayer(tonumber(targetSource))

	if not targetPlayer then
		Notify(src, L("cannotTransferToOffline"))
		return
	end

	local targetIdentifier = GetPlayerIdentifier(targetPlayer)

	if targetIdentifier == identifier then
		Notify(src, L("cannotTransferToSelf"))
		return
	end

	local targetCoords = GetEntityCoords(GetPlayerPed(targetSource))
	local playerCoords = GetEntityCoords(GetPlayerPed(src))

	if #(targetCoords - playerCoords) > 5.0 then
		Notify(src, L("tooFarAway"))
		return
	end

	if targetIdentifier == nil then
		Notify(src, L("cannotTransferToOffline"))
		return
	end

	local outPets = MySQL.Sync.fetchAll(
		"SELECT * FROM electus_pets WHERE `identifier` = @identifier AND `stored` = 0",
		{ ["@identifier"] = targetIdentifier }
	)

	if #outPets >= Config.MaxAmountPetOutside then
		return Notify(targetSource, L("tooManyPetsOutside"))
	end

	local pet = MySQL.Sync.fetchSingle(
		"SELECT * FROM electus_pets WHERE identifier = @identifier AND name = @name",
		{ ["@identifier"] = targetIdentifier, ["@name"] = currentPet.name }
	)

	if pet == nil then
		MySQL.Async.execute(
			"UPDATE electus_pets SET identifier = @targetIdentifier WHERE identifier = @identifier and name = @name",
			{
				["@identifier"] = identifier,
				["@targetIdentifier"] = targetIdentifier,
				["@name"] = currentPet.name,
			}
		)

		Notify(src, L("transferSuccessful"))
		Notify(targetSource, L("transferSuccessful"))

		local petEntity = NetworkGetEntityFromNetworkId(currentPet.netId)

		SetEntityIgnoreRequestControlFilter(petEntity, true)

		lib.callback.await("electus_pets:insertTransferedPet", targetSource, currentPet)

		SetEntityIgnoreRequestControlFilter(petEntity, false)

		TriggerClientEvent("electus_pets:removeTransferedPet", src, currentPet)
	else
		Notify(src, L("transferFailed"))
		Notify(targetSource, L("alreadyHavePetWithName"))
	end
end)

RegisterNetEvent("electus_pets:updateDailyTasks", function(pet)
	local src = source
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)

	MySQL.Async.execute(
		"UPDATE electus_pets_daily_tasks SET dailyTasks = @dailyTasks WHERE identifier = @identifier AND name = @name",
		{ ["@identifier"] = identifier, ["@name"] = pet.name, ["@dailyTasks"] = json.encode(pet.dailyTasks) }
	)
end)

RegisterNetEvent("electus_pets:updateSkills", function(pet)
	local src = source
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)

	MySQL.Async.execute(
		"UPDATE electus_pets SET skills = @skills WHERE identifier = @identifier AND name = @name",
		{ ["@identifier"] = identifier, ["@name"] = pet.name, ["@skills"] = json.encode(pet.skills) }
	)
end)

RegisterNetEvent("electus_pets:petDeath", function(pet)
	local src = source
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)

	MySQL.Async.execute(
		"UPDATE electus_pets SET `stored` = -1, `deadAt` = @deadAt WHERE identifier = @identifier AND name = @name",
		{ ["@identifier"] = identifier, ["@name"] = pet.name, ["@deadAt"] = os.time() }
	)
end)

RegisterNetEvent("electus_pets:newSniffedItem", function(pet, item)
	local src = source
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)

	for i = 1, #pet.sniffedItems do
		if pet.sniffedItems[i] == item then
			return
		end
	end

	for i = 1, #Config.AllowedSniffedItems, 1 do
		if Config.AllowedSniffedItems[i] == namiteme then
			table.insert(pet.sniffedItems, item)
			MySQL.Async.execute(
				"UPDATE electus_pets SET sniffedItems = @sniffedItems WHERE identifier = @identifier AND name = @name",
				{
					["@identifier"] = identifier,
					["@name"] = pet.name,
					["@sniffedItems"] = json.encode(pet.sniffedItems),
				}
			)
		end
	end
end)

RegisterNetEvent("electus_pets:insertNewPetHouse", function(houseType, coords)
	local src = source
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)
	local item = Config.PetHouseModels[houseType].itemName
	local hasItem = GetInventoryCount(src, item) > 0

	if hasItem then
		local success = MySQL.Sync.execute(
			"INSERT INTO electus_pets_houses SET identifier = @identifier, coords = @coords, houseType = @houseType",
			{ ["@identifier"] = identifier, ["@coords"] = json.encode(coords), ["@houseType"] = houseType }
		)

		if success then
			local houseId = MySQL.Sync.fetchScalar(
				"SELECT id FROM electus_pets_houses WHERE identifier = @identifier AND coords = @coords",
				{ ["@identifier"] = identifier, ["@coords"] = json.encode(coords) }
			)

			RemoveInventoryItem(player, item, 1)
			Notify(src, L("housePlaced"))
			TriggerClientEvent("electus_pets:spawnPetHouse", src, houseId, houseType, coords)
		end
	else
		Notify(src, L("noHouseItem"))
	end
end)

RegisterNetEvent("electus_pets:removePetHouse", function(houseId)
	local src = source
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)

	local houseType = MySQL.Sync.fetchScalar(
		"SELECT houseType FROM electus_pets_houses WHERE identifier = @identifier AND id = @id",
		{ ["@identifier"] = identifier, ["@id"] = houseId }
	)

	local empty = MySQL.Sync.fetchScalar(
		"SELECT COUNT(*) FROM electus_pets WHERE identifier = @identifier AND `stored` = @stored",
		{ ["@identifier"] = identifier, ["@stored"] = houseId }
	)

	if empty > 0 then
		Notify(src, L("houseNotEmpty"))
		return
	end

	local item = Config.PetHouseModels[houseType].itemName

	MySQL.Async.execute(
		"DELETE FROM electus_pets_houses WHERE identifier = @identifier AND id = @id",
		{ ["@identifier"] = identifier, ["@id"] = houseId }
	)

	AddInventoryItem(player, item, 1)
end)

RegisterNetEvent("electus_pets:insertPetInHouse", function(name, houseId, maxHouseSlots)
	local src = source
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)

	MySQL.Async.fetchAll(
		"SELECT * FROM electus_pets WHERE identifier = @identifier AND `stored` = @stored",
		{ ["@identifier"] = identifier, ["@stored"] = houseId },
		function(pets)
			if #pets < maxHouseSlots then
				MySQL.Async.execute(
					"UPDATE electus_pets SET `stored` = @stored WHERE identifier = @identifier AND name = @name",
					{ ["@identifier"] = identifier, ["@name"] = name, ["@stored"] = houseId }
				)
				TriggerClientEvent("electus_pets:removePetFromOutside", src, houseId, name)
			else
				Notify(src, L("houseFull"))
			end
		end
	)
end)

RegisterNetEvent("electus_pets:withdrawPet", function(name)
	local src = source
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)

	MySQL.Async.fetchAll(
		"SELECT * FROM electus_pets WHERE identifier = @identifier AND `stored` = 0",
		{ ["@identifier"] = identifier },
		function(pets)
			if #pets < Config.MaxAmountPetOutside then
				MySQL.Async.execute(
					"UPDATE electus_pets SET `stored` = 0 WHERE identifier = @identifier AND name = @name",
					{ ["@identifier"] = identifier, ["@name"] = name }
				)
				MySQL.Async.fetchAll(
					"SELECT * FROM electus_pets WHERE identifier = @identifier AND name = @name",
					{ ["@identifier"] = identifier, ["@name"] = name },
					function(pet)
						if pet[1] then
							pet[1].status = json.decode(pet[1].status)
							pet[1].sniffedItems = json.decode(pet[1].sniffedItems)
							pet[1].skills = json.decode(pet[1].skills)
							pet[1].abilities = json.decode(pet[1].abilities)
							pet[1].variation = json.decode(pet[1].variation)
							pet[1].accessories = json.decode(pet[1].accessories)
							TriggerClientEvent("electus_pets:spawnPet", src, pet[1])
						end
					end
				)
			else
				Notify(src, L("tooManyPetsOutside"))
			end
		end
	)
end)

RegisterNetEvent("electus_pets:learnNewSniffItem", function(pet)
	local src = source
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)

	MySQL.Async.execute(
		"UPDATE electus_pets SET sniffedItems = @sniffedItems WHERE identifier = @identifier AND name = @name",
		{ ["@identifier"] = identifier, ["@name"] = pet.name, ["@sniffedItems"] = json.encode(pet.sniffedItems) }
	)
end)

RegisterCommand(Config.Commands.petStorage, function(source, args, rawCommand)
	if source > 0 and Config.EnablePetCommandForHouse then
		TriggerClientEvent("electus_pets:commandPetHouse", source)
	end
end, false)

RegisterNetEvent("electus_pets:loadBagInventory", function(petName, owner)
	local src = source
	local ox_inventory = exports.ox_inventory

	ox_inventory:RegisterStash(
		owner .. "-" .. "pet-" .. petName,
		L("petBag"),
		Config.Bags.maxSlots,
		Config.Bags.maxWeight
	)
end)

RegisterNetEvent("electus_pets:giveBall", function()
	local src = source
	local player = GetPlayer(src)

	if Config.AddBallAfterFetch then
		AddBall(player)
	end
end)

lib.callback.register("electus_pets:hasItem", function(src, item)
	local hasItem = GetInventoryCount(src, item) > 0
	return hasItem
end)

lib.callback.register("electus_pets:hasItems", function(src, items)
	local cbItems = {}

	for i = 1, #items do
		if items[i] then
			local hasItem = GetInventoryCount(src, items[i]) > 0
			if hasItem then
				cbItems[#cbItems + 1] = items[i]
			end
		end
	end

	return cbItems
end)

lib.callback.register("electus_pets:getPets", function(src)
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)

	local pets = MySQL.Sync.fetchAll(
		"SELECT * FROM electus_pets WHERE identifier = @identifier AND `stored` = 0",
		{ ["@identifier"] = identifier }
	)

	for i = 1, #pets do
		if pets[1] == nil then
			return pets
		end

		local dailyTasks = InsertDailyQuests(identifier, pets[i].name, pets[i].abilities.moreDailyTasks)

		pets[i].dailyTasks = dailyTasks
		pets[i].status = json.decode(pets[i].status)
		pets[i].skills = json.decode(pets[i].skills)
		pets[i].sniffedItems = json.decode(pets[i].sniffedItems)
		pets[i].accessories = json.decode(pets[i].accessories)
		pets[i].abilities = json.decode(pets[i].abilities)
		pets[i].variation = json.decode(pets[i].variation)
	end

	return pets
end)

lib.callback.register("electus_pets:getAllPets", function(src)
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)

	local pets = MySQL.Sync.fetchAll(
		"SELECT * FROM electus_pets WHERE identifier = @identifier",
		{ ["@identifier"] = identifier }
	)

	if pets[1] == nil then
		return pets
	end

	for i = 1, #pets do
		pets[i].status = json.decode(pets[i].status)
		pets[i].skills = json.decode(pets[i].skills)
		pets[i].sniffedItems = json.decode(pets[i].sniffedItems)
		pets[i].accessories = json.decode(pets[i].accessories)
		pets[i].abilities = json.decode(pets[i].abilities)
		pets[i].variation = json.decode(pets[i].variation)
	end
	return pets
end)

lib.callback.register("electus_pets:getDeadPets", function(src)
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)

	local pets = MySQL.Sync.fetchAll(
		"SELECT * FROM electus_pets WHERE identifier = @identifier AND `stored` = -1",
		{ ["@identifier"] = identifier }
	)

	if pets[1] == nil then
		return pets
	end

	for i = 1, #pets do
		pets[i].status = json.decode(pets[i].status)
		pets[i].skills = json.decode(pets[i].skills)
		pets[i].sniffedItems = json.decode(pets[i].sniffedItems)
		pets[i].accessories = json.decode(pets[i].accessories)
		pets[i].abilities = json.decode(pets[i].abilities)
		pets[i].variation = json.decode(pets[i].variation)
		pets[i].timeDiff = math.floor((os.time() - pets[i].deadAt) / (Config.PetRecoverTime * 60) * 100)
	end
	return pets
end)

lib.callback.register("electus_pets:getPetHouseData", function(src, id)
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)

	local pets = MySQL.Sync.fetchAll(
		"SELECT name, model FROM electus_pets WHERE identifier = @identifier AND `stored` = @stored",
		{ ["@identifier"] = identifier, ["@stored"] = id }
	)

	local houseData = MySQL.Sync.fetchAll(
		"SELECT * FROM electus_pets_houses WHERE identifier = @identifier AND id = @id",
		{ ["@identifier"] = identifier, ["@id"] = id }
	)

	return { pets = pets, data = houseData[1] }
end)

lib.callback.register("electus_pets:getPetHousePets", function(src, id)
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)

	local pets = MySQL.Sync.fetchAll(
		"SELECT * FROM electus_pets WHERE identifier = @identifier AND `stored` = @stored",
		{ ["@identifier"] = identifier, ["@stored"] = id }
	)

	for i = 1, #pets do
		pets[i].status = json.decode(pets[i].status)
		pets[i].skills = json.decode(pets[i].skills)
		pets[i].sniffedItems = json.decode(pets[i].sniffedItems)
		pets[i].abilities = json.decode(pets[i].abilities)
		pets[i].accessories = json.decode(pets[i].accessories)
		pets[i].variation = json.decode(pets[i].variation)
	end

	return pets
end)

lib.callback.register("electus_pets:updateAccessories", function(src, pet, item, action)
	local player = GetPlayer(src)
	local identifier = GetPlayerIdentifier(player)
	local success = false

	if action == "removeItem" and GetInventoryCount(src, item) > 0 then
		RemoveInventoryItem(player, item, 1)
		success = true
	elseif action == "addItem" then
		AddInventoryItem(player, item, 1)
		success = true
	else
		Notify(src, L("notEnoughItems"))
	end

	if success then
		MySQL.Sync.execute(
			"UPDATE electus_pets SET accessories = @accessories WHERE identifier = @identifier AND name = @name",
			{ ["@accessories"] = json.encode(pet.accessories), ["@identifier"] = identifier, ["@name"] = pet.name }
		)
	end

	return success
end)

RegisterNetEvent("electus_pets:openBagInventory", function(petName, owner)
	local src = source

	local stashId = owner .. "-pet-" .. petName

	if Config.Inventory == "ox_inventory" then
		exports.ox_inventory:RegisterStash(stashId, L("petBag"), Config.Bags.maxSlots, Config.Bags.maxWeight)
	elseif Config.Inventory == "qb-inventory" then
		exports["qb-inventory"]:OpenInventory(
			src,
			stashId,
			{ label = L("petBag"), maxweight = Config.Bags.maxWeight, slots = Config.Bags.maxSlots }
		)
	elseif Config.Inventory == "core" then
		exports.core_inventory:openInventory(nil, stashId, "stash", nil, nil, false, nil, false)

		exports.core_inventory:openInventory(src, stashId, L("petBag"), "stash", nil, nil, true, nil, false)
	end
end)

lib.addCommand("accessory_editor", {
	help = "Opens Pet Accessory Editor",
	restricted = "group.admin",
}, function(source, args, raw)
	TriggerClientEvent("electus_pets:propTest", source)
end)

lib.callback.register("electus_pets:searchPlayer", function(src, targetSrc, pet)
	local items = (Config.EnableLearnToSniff and pet.sniffedItems) or Config.AllowedSniffedItems

	for i = 1, #items do
		local hasItem = GetInventoryCount(targetSrc, items[i]) > 0

		if hasItem then
			return true
		end
	end

	return false
end)

lib.callback.register("electus_pets:getQSTrunk", function(src, plate)
	local items = MySQL.Sync.fetchAll("SELECT * FROM `inventory_trunk` WHERE plate = @plate", { ["@plate"] = plate })

	if not items[1] then
		return
	end

	local toProcessItems = json.decode(items[1].items)

	local retItems = {}

	for i = 1, #toProcessItems do
		local item = toProcessItems[i]

		if item.count > 0 then
			items[#items + 1] = {
				name = item.name,
				label = item.label,
				count = item.count,
			}
		end
	end

	return (json.decode(retItems[1].items))
end)
