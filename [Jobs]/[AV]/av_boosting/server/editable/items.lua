Config = Config or {}
Framework = nil
CreateThread(function()
    while not exports['av_laptop']:isReady() do Wait(50) end
    if Config.Debug then
        print('Registering items...')
    end
    if not Framework then Framework = exports['av_laptop']:getFramework() end
    if Framework == "qb" or Framework == "qbox" then
        Config.VehicleTable = "player_vehicles"
    elseif Framework == "esx" then
        Config.VehicleTable = "owned_vehicles"
    end
    exports['av_laptop']:registerItem(Config.TrackerItem)
    exports['av_laptop']:registerItem(Config.CrackerItem)
    if Config.Debug then
        print('All items registered.')
    end
end)

AddEventHandler('ox_inventory:usedItem', function(playerId, name, slotId, metadata)
    if not playerId or not name then return end
    if Config.TrackerItem and Config.TrackerItem == name then
        TriggerClientEvent('av_boosting:trackerMinigame',playerId)
        return
    end
    if Config.CrackerItem and Config.CrackerItem == name then
        TriggerClientEvent('av_boosting:useCracker',playerId)
        return
    end
end)