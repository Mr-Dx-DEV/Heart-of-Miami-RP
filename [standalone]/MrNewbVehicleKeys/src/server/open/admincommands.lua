lib.addCommand('giveadminkey', {
    help = 'Gives an admin a key to any vehicle by plate',
    params = {
        {
            name = 'id',
            type = 'number',
            help = 'Player ID To Grant Key To',
        },
        {
            name = 'plate',
            type = 'string',
            help = 'Vehicle Plate Number',
        },
    },
    restricted = 'group.admin'
}, function(source, args, raw)
	local src = source
    local plate = string.upper(args.plate)
	if not plate then return NotifyPlayer(src, locale("AdminCommands.NoVehicleNearby"), "error", 6000)  end
	local target = tonumber(args.id)
	if not target then target = src end
	local pedId = GetPlayerPed(target)
	if pedId == 0 then return NotifyPlayer(src, locale("AdminCommands.NoPlayerWithID"), "error", 6000)  end
	AddKeyByPlate(target, plate)
	NotifyPlayer(target, locale("AdminCommands.KeyGranted"), "success")
end)

lib.addCommand('givenearbykey', {
    help = 'Gives an admin a key to the closest vehicle',
    restricted = 'group.admin'
}, function(source, raw)
	local src = source
    local coords = GetEntityCoords(GetPlayerPed(src))
    local vehicle = lib.getClosestVehicle(coords, 5)
    if not vehicle then return NotifyPlayer(src, locale("AdminCommands.NoVehicleNearby"), "error", 6000) end
    local netId = NetworkGetNetworkIdFromEntity(vehicle)
    AddKeyByNetId(src, netId)
	NotifyPlayer(src, locale("AdminCommands.KeyGranted"), "success", 6000)
end)