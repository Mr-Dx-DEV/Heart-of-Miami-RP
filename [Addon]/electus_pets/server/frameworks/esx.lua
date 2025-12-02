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

function GetPlayer(source)
	source = tonumber(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	return xPlayer
end

function GetPlayerIdentifier(player)
	if player and player.getIdentifier then
		return player:getIdentifier()
	end
end

function AddInventoryItem(player, item, count)
	player.addInventoryItem(item, count)
end

function RemoveInventoryItem(player, item, count)
	player.removeInventoryItem(item, count)
end

function RemoveBankMoney(player, amount)
	player.removeAccountMoney("bank", amount)
end

function RemoveCashMoney(player, amount)
	player.removeAccountMoney("money", amount)
end

function GetBankMoney(player)
	return player.getAccount("bank").money
end

function GetCashMoney(player)
	return player.getAccount("money").money
end

function AddBall(player)
	player.addInventoryItem("WEAPON_BALL", 1)
end

for k, v in pairs(Config.PetHouseModels) do
	ESX.RegisterUsableItem(v.itemName, function(playerId)
		if Config.EnablePetHouse then
			TriggerClientEvent("electus_pets:placeProp", playerId, k)
		end
	end)
end

ESX.RegisterServerCallback("electus_pets:getItemLabel", function(src, cb, item)
	local label = ESX.GetItemLabel(item) or "Label not found"
	cb(label)
end)

ESX.RegisterServerCallback("electus_pets:getTargetInventory", function(src, cb, targetSrc)
	local xPlayer = ESX.GetPlayerFromId(targetSrc)
	cb(xPlayer.getInventory())
end)

ESX.RegisterServerCallback("electus_pets:getOxTrunk", function(src, cb, plate, items)
	local count = 0
	for i = 1, #items do
		local itemCount = exports.ox_inventory:GetItem("trunk" .. plate, items[i], nil, true)

		if itemCount then
			count = count + itemCount
		end
	end
	cb(count)
end)

ESX.RegisterServerCallback("electus_pets:getJobsName", function(src, cb, jobs)
	local esxJobs = ESX.GetJobs()
	local cbJobs = {}

	for i = 1, #jobs do
		if esxJobs[jobs[i]] then
			cbJobs[#cbJobs + 1] = { label = esxJobs[jobs[i]].label, name = jobs[i] }
		end
	end
	cb(cbJobs)
end)

ESX.RegisterServerCallback("electus_pets:getInventory", function(src, cb)
	local xPlayer = ESX.GetPlayerFromId(src)
	cb(xPlayer.getInventory())
end)
