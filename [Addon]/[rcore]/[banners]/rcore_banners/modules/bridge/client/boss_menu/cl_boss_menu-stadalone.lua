CreateThread(function()
    if Config.Framework == Framework.NONE then
        OpenBossMenu = function(BusinessName)
            dbg.debug('Failed to open any boss menu since running in standalone mode.')
        end
    end
end)

