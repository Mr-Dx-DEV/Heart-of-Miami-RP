ItemUsedStates = {}

local DEBUG_BANNERS_STATE = false

RegisterCommand(Config.Commands.billboardHideMarker or 'billboardHideMarker', function(source, args, rawCommand)
	if source == 0 then
		return
	end

	local billboardId = tonumber(args[1])
	local billboardState = tonumber(args[2])

	if not billboardId then
		return ShowNotification(source, _U('BILLBOARD_HIDE_COMMAND_MARKER.INVALID_BILLBOARD_ID'), 'error')
	end

	if not billboardState then
		return ShowNotification(source, _U('BILLBOARD_HIDE_COMMAND_MARKER.INVALID_BILLBOARD_STATE'), 'error')
	end

	local playerGroup = FrameworkService.GetPlayerGroup(source)
	local playerPermissions = FetchPermissionsByGroup(playerGroup)

    if playerPermissions and not playerPermissions[APP_PERMS.ACCESS_DEBUG_BANNERS] then
        ShowNotification(source, _U('NOTIFY.GENERAL'), _U('YOU_DONT_HAVE_PERMISSION', APP_PERMS.ACCESS_DEBUG_BANNERS), 'error')
        dbg.debug('User named %s tried to billboardHideMarker [%s] - not enough permission to do it!',
            GetPlayerName(source), APP_PERMS.ACCESS_DEBUG_BANNERS)
        return
    end

	HandleHideBillboardMarker(billboardId, billboardState, source)
end, false)

RegisterCommand(Config.Commands.debugMaterial or 'debugMaterial', function(source, args, rawCommand)
	if source == 0 then
		return
	end

	HandleDebugMaterial(source)
end, false)

RegisterCommand(Config.Commands.bannersDebug, function(source, args, rawCommand)
	if source == 0 then
		return
	end

	HandleBannersDebug(source)
end, false)

RegisterCommand(Config.Commands.billboardHide, function(source, args, rawCommand)
	if source == 0 then
		return
	end

	HandleHideBannersDebug(source)
end, false)

RegisterCommand(Config.Commands.banners, function(source, args, rawCommand)
	if source == 0 then
		return
	end

	HandleOpenBannerMenu(source)
end, false)

RegisterCommand(Config.Commands.removeBanners, function(source, args, rawCommand)
	if source == 0 then
		return
	end

	if ActiveEditorSessions[source] then
		return ShowNotification(source, _U('EDITOR_IS_ALREADY_OPENED'), 'error')
	end

	HandleRemoveBanner(source)
end, false)

AddEventHandler('rcore_banners:server:databaseReady', function()
	-- inventoryBridgeReady()
end)

function HandleDebugMaterial(source)
	local playerGroup = FrameworkService.GetPlayerGroup(source)
	local playerPermissions = FetchPermissionsByGroup(playerGroup)

    if playerPermissions and not playerPermissions[APP_PERMS.ACCESS_DEBUG_BANNERS] then
        ShowNotification(source, _U('NOTIFY.GENERAL'), _U('YOU_DONT_HAVE_PERMISSION', APP_PERMS.ACCESS_DEBUG_BANNERS), 'error')
        dbg.debug('User named %s tried to debug [%s] - not enough permission to do it!',
            GetPlayerName(source), APP_PERMS.ACCESS_DEBUG_BANNERS)
        return
    end

	StartClient(source, 'handleDebugMaterial')
end

function OpenEditor(playerId, bannerName)
	local currentBanner = GetBannerByName(bannerName)
	local retval = {}

	if currentBanner then
		retval = currentBanner
	else
		return dbg.debug('Invalid banner type - request failed. %s', GetPlayerName(playerId))
	end

	DefineBanner(playerId, retval, bannerName)
end

function HandleHideBannersDebug(source)
	if not source then return end

	local playerId = source
	local playerGroup = FrameworkService.GetPlayerGroup(source)
	local playerPermissions = FetchPermissionsByGroup(playerGroup)

    if playerPermissions and not playerPermissions[APP_PERMS.ACCESS_DEBUG_BANNERS] then
        ShowNotification(playerId, _U('NOTIFY.GENERAL'), _U('YOU_DONT_HAVE_PERMISSION', APP_PERMS.ACCESS_DEBUG_BANNERS), 'error')
        dbg.debug('User named %s tried to open banners debug [%s] - not enough permission to do it!',
            GetPlayerName(playerId), APP_PERMS.ACCESS_DEBUG_BANNERS)
        return
    end

	DEBUG_BANNERS_STATE = not DEBUG_BANNERS_STATE

	StartClient(playerId, 'handleHideModels', playerId)
end

function HandleBannersDebug(source)
	if not source then return end

	local playerId = source
	local playerGroup = FrameworkService.GetPlayerGroup(source)
	local playerPermissions = FetchPermissionsByGroup(playerGroup)

    if playerPermissions and not playerPermissions[APP_PERMS.ACCESS_DEBUG_BANNERS] then
        ShowNotification(playerId, _U('NOTIFY.GENERAL'), _U('YOU_DONT_HAVE_PERMISSION', APP_PERMS.ACCESS_DEBUG_BANNERS), 'error')
        dbg.debug('User named %s tried to open banners debug [%s] - not enough permission to do it!',
            GetPlayerName(playerId), APP_PERMS.ACCESS_DEBUG_BANNERS)
        return
    end

	DEBUG_BANNERS_STATE = not DEBUG_BANNERS_STATE

	StartClient(playerId, 'handleBannersDebug', playerId)
end

function HandleOpenBillboardMenu(source)
	if type(source) ~= "number" then return end

	if not source then return end

	local group = FrameworkService.GetPlayerGroup(source)

	StartClient(source, 'showInteractionMenu', source, group)
end

function HandleOpenBannerMenu(source, actionType, metadata)
	if type(source) ~= "number" then return end

	if not source then return end

	local group = FrameworkService.GetPlayerGroup(source)

	local openState = InventoryService.HasItem(source, Config.General.Items.BANNER_PLACER, 1)

	dbg.debug('Open state for item: %s | Editor item open requirement state: %s', openState, Config.General.NEED_EDITOR_ITEM_STATE)

	if Config.General.NEED_EDITOR_ITEM_STATE then
		if not openState then
			StartClient(source, 'resetMovement', false)
			return ShowNotification(source, _U('YOU_DONT_HAVE_REQUIRED_ITEM', Config.General.Items.BANNER_PLACER))
		end
	end

	if actionType == 'placeBanner' then
		if metadata and type(metadata) ~= "string" and next(metadata) and metadata['banner_name'] then
			local banner = GetBannerByName(metadata['banner_name'])

			if not banner then
				banner = RegisterNewServerBanner(metadata)
				Wait(250)
			end

			if ActiveEditorSessions[source] then
				return ShowNotification(source, _U('NOTIFY.GENERAL'), _U('EDITOR_IS_ALREADY_OPENED'), 'error')
			end

			return DefineBanner(source, banner, Config.General.Items.BANNER_PLACER)
		end
	end

	if ActiveEditorSessions[source] then
		return ShowNotification(source, _U('NOTIFY.GENERAL'), _U('OPEN_DASHBOARD_ERROR_SINCE_EDITOR_OPENED'), 'error')
	end

	StartClient(source, 'showInteractionMenu', source, group)
end

function HandleRemoveBanner(source)
	if not source then return end

	if ActiveEditorSessions[source] then
		return ShowNotification(source, _U('NOTIFY.GENERAL'), _U('EDITOR_IS_ALREADY_OPENED'), 'error')
	end

	if Config.Framework ~= Framework.NONE and Config.General.NEED_REMOVE_BANNER_ITEM_STATE then
		local openState = InventoryService.HasItem(source, Config.General.Items.BANNER_REMOVER, 1)

		if not openState then
			return ShowNotification(source, _U('NOTIFY.GENERAL'), _U('YOU_DONT_HAVE_REQUIRED_ITEM', Config.General.Items.BANNER_REMOVER))
		end
	end

	StartClient(source, 'requestRemoveBanners', source)
end


