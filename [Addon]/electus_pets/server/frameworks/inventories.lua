function GetInventoryCount(src, item)
	if Config.Inventory == "esx" then
		local xPlayer = ESX.GetPlayerFromId(src)

		return xPlayer.getInventoryItem(item)?.count or 0
	elseif Config.Inventory == "qb" then
		local player = QBCore.Functions.GetPlayer(source)

		return player.Functions.GetItemByName(item)?.amount or 0
	elseif Config.Inventory == "core" then
		return exports.core_inventory:getItemCount(src, item)
	elseif Config.Inventory == "qs-inventory" then
		return exports["qs-inventory"]:GetItemTotalAmount(src, item)
	elseif Config.Inventory == "tgiann" then
		return exports["tgiann-inventory"]:GetItemCount(src, item)
	elseif Config.Inventory == "ox_inventory" then
		return exports.ox_inventory:GetItemCount(src, item)
	elseif Config.Inventory == "qb-inventory" then
		return exports["qb-inventory"]:GetItemCount(src, item)
	elseif Config.Inventory == "codem" then
		return exports["codem-inventory"]:GetItemsTotalAmount(src, item)
	else
		print("[^1ERROR^7] Inventory system not found.")
		return 0
	end
end
