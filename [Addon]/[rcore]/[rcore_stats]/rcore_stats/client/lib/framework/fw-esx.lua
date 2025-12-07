if Config.Framework == nil or Config.Framework == 0 then
    if GetResourceState('es_extended') == 'starting' or GetResourceState('es_extended') == 'started' then
        Config.Framework = 1
    end
end

if Config.Framework == 1 then
    if Config.FrameworkTriggers['notify'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['notify'])) == 'esx' then
        Config.FrameworkTriggers['notify'] = 'esx:showNotification'
    end

    if Config.FrameworkTriggers['load'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['load'])) == 'esx' then
        Config.FrameworkTriggers['load'] = 'esx:getSharedObject'
    end

    if Config.FrameworkTriggers['resourceName'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['resourceName'])) == 'esx' then
        Config.FrameworkTriggers['resourceName'] = 'es_extended'
    end

    if Config.FrameworkTriggers['playerLoaded'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['playerLoaded'])) == 'esx' then
        Config.FrameworkTriggers['playerLoaded'] = 'esx:playerLoaded'
    end
end

CreateThread(function()
    if Config.Framework == 1 then
        local ESX = Citizen.Await(GetSharedObjectSafe())

        ShowNotification = function(text, type)
            local notificationType = "info"

            if type == "error" then
                notificationType = "error"
            end

            TriggerEvent(Config.FrameworkTriggers['notify'], text, notificationType)
        end

        GetPlayerBalance = function()
            local xPlayer = ESX.GetPlayerData()

            if xPlayer then
                local accounts = xPlayer.accounts or {}
                local totalMoney = 0

                for _, acc in pairs(accounts) do
                    totalMoney = totalMoney + acc.money
                end

                return totalMoney
            end

            return 0
        end
    end
end)
