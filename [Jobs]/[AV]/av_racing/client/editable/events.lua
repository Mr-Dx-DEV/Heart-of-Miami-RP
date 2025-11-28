AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        ClearGpsMultiRoute()
        DeleteAllCheckpoints()
        wipeMarkers()
        if inCreator then
            exports['av_laptop']:hideTextUI()
        end
        EndGhostLoop()
    end
end)

RegisterNetEvent('av_racing:markGPS', function(coords)
    SetNewWaypoint(coords.x, coords.y)
end)

RegisterNetEvent('av_racing:dnf', function()
    FinishRace()
end)

RegisterNetEvent('av_racing:wipe', function(reason)
    FinishRace()
    if reason then
        TriggerEvent('av_laptop:notification',Lang['app_name'], reason, 'inform')
    end
end)