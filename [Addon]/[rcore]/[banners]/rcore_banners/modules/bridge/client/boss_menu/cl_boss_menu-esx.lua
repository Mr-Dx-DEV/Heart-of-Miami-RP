CreateThread(function()
    if Config.Framework == Framework.ESX then
        OpenBossMenu = function(BusinessName)
            local job = FrameworkService.GetPlayerJob()

            if job and not job.isBoss then
                return ShowNotification(_U('NOTIFY.GENERAL'), _U('NOT_BOSS_GRADE'), 'error', 3000)
            end

            TriggerEvent('esx_society:openBossMenu', BusinessName, function(data, menu)
                local state, error_message = pcall(function()
                    return SharedObject.CloseContext()
                end)
            end, Config.Business.SocietyOptionsESX)
        end
    end
end)

