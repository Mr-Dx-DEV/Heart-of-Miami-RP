CreateThread(function()
    if Config.Framework == Framework.QBCORE then
        OpenBossMenu = function()
            local job = FrameworkService.GetPlayerJob()

            if job and not job.isBoss then
                return ShowNotification(_U('NOTIFY.GENERAL'), _U('NOT_BOSS_GRADE'), 'error', 3000)
            end

            TriggerEvent(Config.Events['qb-openBossMenu'])
        end
    end
end)