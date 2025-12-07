if Config.Framework == nil or Config.Framework == 0 then
    if GetResourceState('qb-core') == 'starting' or GetResourceState('qb-core') == 'started' then
        Config.Framework = 2
    end
end

if Config.Framework == 2 then
    if Config.FrameworkTriggers['notify'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['notify'])) == 'qbcore' then
        Config.FrameworkTriggers['notify'] = 'QBCore:Notify'
    end

    if Config.FrameworkTriggers['load'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['load'])) == 'qbcore' then
        Config.FrameworkTriggers['load'] = 'QBCore:GetObject'
    end

    if Config.FrameworkTriggers['resourceName'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['resourceName'])) == 'qbcore' then
        Config.FrameworkTriggers['resourceName'] = 'qb-core'
    end

    if Config.FrameworkTriggers['playerLoaded'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['playerLoaded'])) == 'qbcore' then
        Config.FrameworkTriggers['playerLoaded'] = 'QBCore:Client:OnPlayerLoaded'
    end
end


CreateThread(function()
    if Config.Framework == 2 then
        local QBCore = Citizen.Await(GetSharedObjectSafe())

        ShowNotification = function(msg, type)
            local notificationType = "success"

            if type == "error" then
                notificationType = "error"
            end

            QBCore.Functions.Notify(msg, notificationType)
        end

        GetPlayerBalance = function()
            local Player = QBCore.Functions.GetPlayerData()

            if Player then
                local accounts = Player.money or {}
                local totalMoney = 0

                for _, acc in pairs(accounts) do
                    totalMoney = totalMoney + acc
                end

                return totalMoney
            end

            return 0
        end
    end
end)
