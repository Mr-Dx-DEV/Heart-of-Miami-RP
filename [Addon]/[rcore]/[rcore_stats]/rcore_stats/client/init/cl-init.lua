dbg = RDebug()
dbg.setupPrefix(GetCurrentResourceName())
PLAYER_ID = PlayerId()
SERVER_ID = GetPlayerServerId(PLAYER_ID)

CreateThread(function()
    while (not HasCollisionLoadedAroundEntity(PlayerPedId())) do
        Wait(500)
    end

    dbg.info('Init: Fetching data from server.')
    TriggerServerEvent(STriggerName('playerSpawned'))
    -- TriggerServerEvent('rcore_stats:server:playerSpawned')
end)

local function playerReload()
    while (not HasCollisionLoadedAroundEntity(PlayerPedId())) do
        Wait(500)
    end

    dbg.info('PlayerReload: Fetching data from server.')
    TriggerServerEvent(STriggerName('playerReload'))
end

CreateThread(function()
    while not Config.FrameworkTriggers.playerLoaded do
        Wait(0)
    end

    RegisterNetEvent(Config.FrameworkTriggers.playerLoaded, playerReload)
end)
