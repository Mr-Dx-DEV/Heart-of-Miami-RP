local InventoryUseableItems = {
	['banner'] = {},
	['banner_remover'] = {}
}

local PlayerInventoryItemCooldowns = {}

AddEventHandler('rcore_banners:server:databaseReady', function()
	RegisterUseableItems()
end)


function RegisterUseableItems()
	dbg.debug('Registering useable items')

	InventoryService.RegisterUsableItem(Config.General.Items.BANNER_PLACER, function(playerId, metadata)
		if not playerId then return end
		if type(playerId) ~= 'number' then return end

		if ActiveEditorSessions[playerId] then
			return ShowNotification(playerId, _U('EDITOR_IS_ALREADY_OPENED'), 'error')
		end

		HandleOpenBannerMenu(playerId, 'placeBanner', metadata)
	end)

	InventoryService.RegisterUsableItem(Config.General.Items.BANNER_REMOVER, function(playerId, metadata)
		if not playerId then return end
		if type(playerId) ~= 'number' then return end

		if ActiveEditorSessions[playerId] then
			return ShowNotification(playerId, _U('EDITOR_IS_ALREADY_OPENED'), 'error')
		end

		HandleRemoveBanner(playerId)
	end)
end

--- @param data table
function AddBannerIntoSystem(data)
	if not data then
		return false, 'Invalid data.'
	end

	if not data['banner_name'] then
		return false, 'Banner name needs to be provided.'
	end

	if not data['banner_type'] then
		return false, 'Banner type is required -> custom!'
	end

	if data['banner_type'] ~= 'custom' then
		return false, 'Only valid banner type is custom.'
	end

	repeat
		Wait(1000)
	until next(ServerBanners)

	local bannerData = GetBannerByName(data['banner_name'])

	if bannerData then
		return false, 'Banner already exists in banners db.'
	end

	if not data['banner_image'] then
		return false, 'Banner image needs to be provided.'
	end

	local bannerImage = data['banner_image']
	local p = promise.new()

	CreateThread(function()
		PerformHttpRequest(bannerImage, function(statusCode, _, resultHeaders, errorData)
			local resultHeadersType = resultHeaders['content-type']
			local validHeadersList = {
				['image/jpeg'] = true,
				['image/png'] = true,
				['image/gif'] = true,
			}

			if statusCode == 200 and validHeadersList[resultHeadersType] then
				local banner = RegisterNewServerBanner(data)

				if banner then
					p:resolve({ state = true, statusCode = 'Banner added successfully to system.' })
				else
					p:resolve({ state = false, statusCode = 'Failed to add banner to system.' })
				end
			else
				p:resolve({ state = false, statusCode = 'Failed to fetch banner image, invalid type!' })
			end
		end)
	end)

	Citizen.Await(p)

	return p.value?.state, p.value?.statusCode
end

--- @param playerId number
--- @param amount number
--- @param data table
--- @return boolean, string
function AddBannerToPlayerInventory(playerId, amount, data)
	if not playerId then
		return false, 'Invalid player id.'
	end

	repeat
		Wait(1000)
	until next(ServerBanners)

	local bannerData = GetBannerByName(data['banner_name'])

	if not bannerData then
		return false, 'Banner doesnt exists in banners db.'
	end

	local item = InventoryService.AddItem(playerId, Config.General.Items.BANNER_PLACER, amount, {
		banner_name = bannerData.banner_name,
		banner_type = bannerData.banner_type,
		banner_image = bannerData.banner_image
	})

	return item, 'Banner added to player inventory.'
end