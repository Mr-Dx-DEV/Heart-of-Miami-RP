CreateThread(function()
    if Config.Framework == Framework.QBOX then
        local job = FrameworkService.GetPlayerJob()

        if job and not job.isBoss then
            return ShowNotification(_U('NOTIFY.GENERAL'), _U('NOT_BOSS_GRADE'), 'error', 3000)
        end

        OpenBossMenu = function()
            exports["qbx_management"]:OpenBossMenu('job')
        end
    end
end)