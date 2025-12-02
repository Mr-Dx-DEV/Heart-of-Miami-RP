QBCore = exports['qb-core']:GetCoreObject()

function getEcommerceData(user_id)
	local data = {}

		-- Busca os 4 itens premium que vão aparecer em destaque
	local sql = [[SELECT * FROM `ecommerce_items` WHERE type = 1 AND premium = 1 ORDER BY date DESC LIMIT ]]..Config.premiumItemsPerPage
	data.premiumItens = MySQL.Sync.fetchAll(sql, {});

		-- Busca os 50 ultimos itens para aparecer na tela inicial
	local sql = [[SELECT * FROM `ecommerce_items` WHERE type = 1 AND premium = 0 ORDER BY date DESC LIMIT ]]..Config.itemsPerPage
	data.normalItens = MySQL.Sync.fetchAll(sql, {});

		-- Busca os 4 carros premium que vão aparecer em destaque
	local sql = [[SELECT * FROM `ecommerce_items` WHERE type = 0 AND premium = 1 ORDER BY date DESC LIMIT ]]..Config.premiumItemsPerPage
	data.premiumCars = MySQL.Sync.fetchAll(sql, {});

		-- Busca os 50 ultimos carros para aparecer na tela inicial
	local sql = [[SELECT * FROM `ecommerce_items` WHERE type = 0 AND premium = 0 ORDER BY date DESC LIMIT ]]..Config.itemsPerPage
	data.normalCars = MySQL.Sync.fetchAll(sql, {});

		-- Busca quantidade de páginas dos carros
	local sql = [[SELECT COUNT(ID) as max_amount FROM `ecommerce_items` WHERE type = 0 AND premium = 0]]
	data.pagesCars = MySQL.Sync.fetchAll(sql, {});
	data.pagesCars = math.ceil(data.pagesCars[1].max_amount/Config.itemsPerPage)

		-- Busca quantidade de páginas dos itens
	local sql = [[SELECT COUNT(ID) as max_amount FROM `ecommerce_items` WHERE type = 1 AND premium = 0]]
	data.pagesItems = MySQL.Sync.fetchAll(sql, {});
	data.pagesItems = math.ceil(data.pagesItems[1].max_amount/Config.itemsPerPage)

		-- Busca o dado do usuário
	local sql = [[SELECT * FROM `ecommerce_moneys` WHERE user_id = @user_id]]
	local userdata = MySQL.Sync.fetchAll(sql, {['@user_id'] = user_id})
	if not userdata[1] then
		local sql = [[INSERT INTO `ecommerce_moneys` (`user_id`) VALUES (@user_id);]]
		MySQL.Sync.execute(sql, {['@user_id'] = user_id})
		data.userMoney = 0
	else
		data.userMoney = userdata[1].money
	end

	return data
end

function getEcommercePageData(pagedata)
	local data = {}

	local searchWhere = ""
	if pagedata.search and pagedata.search ~= "" then
		searchWhere = "AND (name LIKE'%"..addslashes(pagedata.search).."%' OR product_id LIKE'%"..addslashes(pagedata.search).."%') "
	end
	if tonumber(pagedata.maxPrice) and tonumber(pagedata.maxPrice) > 0 then
		searchWhere = searchWhere .. "AND price <= "..tonumber(pagedata.maxPrice).." "
	end
	if tonumber(pagedata.minPrice) and tonumber(pagedata.minPrice) > 0 then
		searchWhere = searchWhere .. "AND price >= "..tonumber(pagedata.minPrice).." "
	end
	if pagedata.productclass and pagedata.productclass ~= "" then
		searchWhere = searchWhere .. "AND class = '"..pagedata.productclass.."' "
	end

	if pagedata.type == 1 then
			-- Busca os 4 itens premium que vão aparecer em destaque
		local sql = [[SELECT * FROM `ecommerce_items` WHERE type = 1 AND premium = 1 ]]..searchWhere..[[ORDER BY date DESC LIMIT ]]..Config.premiumItemsPerPage..[[ OFFSET ]]..math.floor((pagedata.page-1)*Config.premiumItemsPerPage)
		data.premiumItens = MySQL.Sync.fetchAll(sql, {});

			-- Busca os 50 ultimos itens para aparecer na tela inicial
		local sql = [[SELECT * FROM `ecommerce_items` WHERE type = 1 AND premium = 0 ]]..searchWhere..[[ORDER BY date DESC LIMIT ]]..Config.itemsPerPage..[[ OFFSET ]]..math.floor((pagedata.page-1)*Config.itemsPerPage)
		data.normalItens = MySQL.Sync.fetchAll(sql, {});
		-- Busca quantidade de páginas dos itens
		local sql = [[SELECT COUNT(ID) as max_amount FROM `ecommerce_items` WHERE type = 1 AND premium = 0 ]]..searchWhere
		data.pagesItems = MySQL.Sync.fetchAll(sql, {});
		data.pagesItems = math.ceil(data.pagesItems[1].max_amount/Config.itemsPerPage)
	else
		-- Busca os 4 carros premium que vão aparecer em destaque
		local sql = [[SELECT * FROM `ecommerce_items` WHERE type = 0 AND premium = 1 ]]..searchWhere..[[ORDER BY date DESC LIMIT ]]..Config.premiumItemsPerPage..[[ OFFSET ]]..math.floor((pagedata.page-1)*Config.premiumItemsPerPage)
		data.premiumCars = MySQL.Sync.fetchAll(sql, {});
		
		-- Busca os 50 ultimos carros para aparecer na tela inicial
		local sql = [[SELECT * FROM `ecommerce_items` WHERE type = 0 AND premium = 0 ]]..searchWhere..[[ORDER BY date DESC LIMIT ]]..Config.itemsPerPage..[[ OFFSET ]]..math.floor((pagedata.page-1)*Config.itemsPerPage)
		data.normalCars = MySQL.Sync.fetchAll(sql, {});

			-- Busca quantidade de páginas dos carros
		local sql = [[SELECT COUNT(ID) as max_amount FROM `ecommerce_items` WHERE type = 0 AND premium = 0 ]]..searchWhere
		data.pagesCars = MySQL.Sync.fetchAll(sql, {});
		data.pagesCars = math.ceil(data.pagesCars[1].max_amount/Config.itemsPerPage)
	end

	return data
end

function addslashes(s)
	return (string.gsub(s, "([^'])'", "%1\'"))
end

function getProfileItensData(user_id)
	local data = {}
	local sql = [[SELECT * FROM `ecommerce_items` WHERE user_id = @user_id ORDER BY date DESC LIMIT 200]]
	data.profileItens = MySQL.Sync.fetchAll(sql, {['@user_id'] = user_id})
	return data
end

function alterOwnerVehicleTable(user_id,plate)
	-- local sql = [[UPDATE `player_vehicles` SET citizenid = @ebay_owner WHERE citizenid = @user_id AND plate = @plate]]
	-- MySQL.Sync.execute(sql, {['@ebay_owner'] = 'ebay_'..user_id, ['@user_id'] = user_id, ['@plate'] = plate})
end

function alterOwnerVehicleTable_2(user_id,plate)
	local sql = [[UPDATE `player_vehicles` SET citizenid = @ebay_owner WHERE plate = @plate]]
	MySQL.Sync.execute(sql, {['@ebay_owner'] = user_id, ['@plate'] = plate})
end

function createAd(user_id,itemData)
	local sql = [[INSERT INTO `ecommerce_items` (`type`,`user_id`,`product_id`,`plate`,`name`,`price`,`amount`,`class`,`premium`,`image`,`features`,`date`) VALUES (@type,@user_id,@product_id,@plate,@name,@price,@amount,@class,@premium,@image,@features,@date);]]
	MySQL.Sync.execute(sql, {['@type'] = itemData.type, ['@user_id'] = user_id, ['@plate'] = itemData.plate, ['@product_id'] = itemData.product_id, ['@name'] = itemData.name, ['@price'] = itemData.price, ['@amount'] = itemData.amount, ['@class'] = itemData.class, ['@premium'] = itemData.premium, ['@image'] = itemData.image, ['@features'] = itemData.features, ['@date'] = os.time()})
end

function getItem(itemId)
	local sql = [[SELECT * FROM `ecommerce_items` WHERE id = @id]]
	local itemData = MySQL.Sync.fetchAll(sql, {['@id'] = itemId})[1];
	return itemData
end

function deleteItem(itemId)
	local sql = [[DELETE FROM `ecommerce_items` WHERE `id`=@id]]
	MySQL.Sync.execute(sql, {['@id'] = itemId})
end

function getVehicle(plate)
	local sql = [[SELECT citizenid FROM `player_vehicles` WHERE plate = @plate]]
	local vehicle = MySQL.Sync.fetchAll(sql, {['@plate'] = plate})[1];
	return vehicle
end

function updateVehicleOwner(user_id,plate)
	local sql = [[UPDATE `player_vehicles` SET citizenid = @citizenid WHERE plate = @plate]]
	MySQL.Sync.execute(sql, {['@citizenid'] = user_id, ['@plate'] = plate})
end

function getPlayerVehicles(user_id)
	local sql = [[SELECT vehicle, plate FROM `player_vehicles` WHERE citizenid = @user_id]]
	local vehicles = MySQL.Sync.fetchAll(sql, {['@user_id'] = user_id})

	local vehList = {}
	for k,v in pairs(vehicles) do
		table.insert(vehList, {model = v.vehicle, plate = v.plate})
	end
	
	return vehList
end

function getPlayerInventory(source)
	local items = {}
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local data = xPlayer.PlayerData.items
	for k,v in pairs(data) do
		if v.amount > 0 then
			if Config.beautifierItemNames[k] then
				itemName = Config.beautifierItemNames[v.name]
			elseif v.label then
				itemName = v.label
			else
				itemName = v.name
			end
			table.insert(items, {item=v.name,amount=v.amount,itemName=itemName})
		end
	end
	
	return items
end

function getPlayerMoney(user_id)
	local sql = [[SELECT money FROM `ecommerce_moneys` WHERE user_id = @user_id]]
	local amount = MySQL.Sync.fetchAll(sql, {['@user_id'] = user_id})[1].money
	return amount
end

function removePlayerMoney(user_id)
	local sql = [[UPDATE `ecommerce_moneys` SET money = 0 WHERE user_id = @user_id]]
	MySQL.Sync.execute(sql, {['@user_id'] = user_id})
end

function giveEcommerceMoney(user_id, amount)
	local sql = [[UPDATE `ecommerce_moneys` SET money = money + @amount WHERE user_id = @user_id]]
	MySQL.Sync.execute(sql, {['@user_id'] = user_id, ['@amount'] = amount})
end

function giveItem(source,item,amount)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    return xPlayer.Functions.AddItem(item, amount)
end

function removeItem(source, item, amount)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	xPlayer.Functions.RemoveItem(item,amount)
end

function getItemCount(source, item, amount)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	if xPlayer.Functions.GetItemByName(item).amount >= amount then
		return true
	else
		return false
	end
end