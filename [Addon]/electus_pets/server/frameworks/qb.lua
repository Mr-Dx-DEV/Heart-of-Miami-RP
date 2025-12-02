if Config.Framework ~= "qb" then
	return
end

QBCore = exports[Config.CustomStringQBExport]:GetCoreObject()

function GetPlayer(source)
	local player = QBCore.Functions.GetPlayer(source)
	return player
end

function GetPlayerIdentifier(player)
	if player then
		return player.PlayerData.citizenid
	end
end

function AddInventoryItem(player, item, count)
	player.Functions.AddItem(item, count)
end

function RemoveInventoryItem(player, item, count)
	player.Functions.RemoveItem(item, count)
end

function RemoveBankMoney(player, amount)
	player.Functions.RemoveMoney("bank", amount)
end

function RemoveCashMoney(player, amount)
	player.Functions.RemoveMoney("cash", amount)
end

function GetBankMoney(player)
	return player.Functions.GetMoney("bank")
end

function GetCashMoney(player)
	return player.Functions.GetMoney("cash")
end

function AddBall(player)
	player.Functions.AddItem("WEAPON_BALL", 1)
end

for k, v in pairs(Config.PetHouseModels) do
	QBCore.Functions.CreateUseableItem(v.itemName, function(playerId, item)
		if Config.EnablePetHouse then
			TriggerClientEvent("electus_pets:placeProp", playerId, k)
		end
	end)
end

QBCore.Functions.CreateCallback("electus_pets:getTargetInventory", function(src, cb, targetSrc)
	local Player = QBCore.Functions.GetPlayer(targetSrc)
	if Config.Debug then
		print(Player.PlayerData.inventory)
	end
	cb(Player.PlayerData.inventory)
end)

QBCore.Functions.CreateCallback("electus_pets:getVehicleInventory", function(src, cb, plate)
	local items = {}
	MySQL.Async.fetchAll("SELECT * FROM trunkitems WHERE plate = @plate", { ["@plate"] = plate }, function(result)
		if not result[1] then
			return
		end
		local result = result[1].items
		if result then
			local trunkItems = json.decode(result)
			if trunkItems then
				for _, item in pairs(trunkItems) do
					local itemInfo = QBCore.Shared.Items[item.name:lower()]
					if itemInfo then
						items[item.slot] = {
							name = itemInfo["name"],
							amount = tonumber(item.amount),
							info = item.info or "",
							label = itemInfo["label"],
							description = itemInfo["description"] or "",
							weight = itemInfo["weight"],
							type = itemInfo["type"],
							unique = itemInfo["unique"],
							useable = itemInfo["useable"],
							image = itemInfo["image"],
							slot = item.slot,
						}
					end
				end
			end
			cb(items)
		end
	end)
end)

QBCore.Functions.CreateCallback("electus_pets:getJobsName", function(src, cb, jobs)
	local qbJobs = QBShared.jobs
	local cbJobs = {}

	for i = 1, #jobs do
		if qbJobs[jobs[i]] then
			cbJobs[#cbJobs + 1] = { label = qbJobs[jobs[i]].label, name = jobs[i] }
		end
	end
	cb(cbJobs)
end)
