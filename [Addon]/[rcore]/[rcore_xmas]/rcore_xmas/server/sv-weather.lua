EASYTIME_SETTINGS = {
    hours = 12,
    mins = 0,
    weather = 'XMAS',
    instantweather = true,
    dynamic = false,
    freeze = true,
    instanttime = false,
    blackout = false
}

Citizen.CreateThread(function()
    if Config.XmasWeather then
        if isResourceLoaded('av_weather') then
            local zones = {
                'santos',
                'paleto',
                'sandy',
                'cayo'
            }

            for _, zone in ipairs(zones) do
                if doesExportExistInResource('av_weather', 'UpdateZone') then
                    local success = exports['av_weather']:UpdateZone(zone, 'XMAS', true)
                    if not success then
                        log.debug('av_weather: Failed to change weather in zone %s', zone)
                    end
                elseif doesExportExistInResource('av_weather', 'updateZone') then
                    exports['av_weather']:updateZone(zone, 'XMAS', true)
                end
            end
        elseif isBridgeLoaded('Framework', Framework.QBCore) and isResourceLoaded('qb-weathersync') and not isResourceLoaded('cd_easytime') then
            local success = exports['qb-weathersync']:setWeather('XMAS')
            if not success then
                log.debug('Could not set the weather to XMAS in qb-weathersync!')
            end
        elseif isResourceLoaded('cd_easytime') then
            print(' ')
            log.info('^2cd_easytime^7 detected. Please follow docs:')
            log.info('^2 https://documentation.rcore.cz/paid-resources/rcore_xmas/weather/cd_easytime ^7')
            print(' ')
        end
    end
end)

RegisterNetEvent('nolag_properties:server:property:exit', function()
    local client = source
    TriggerClientEvent('rcore_xmas:loadWeather', client)
end)
