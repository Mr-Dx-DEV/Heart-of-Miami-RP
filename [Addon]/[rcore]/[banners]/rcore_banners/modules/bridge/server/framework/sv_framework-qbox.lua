CreateThread(function()
    if Config.Framework == Framework.QBOX then
        local QBCore = nil
    
        local success = pcall(function()
            QBCore = exports[Framework.QBCORE]:GetCoreObject()
        end)
    
        if not success then
            success = pcall(function()
                QBCore = exports[Framework.QBCORE]:GetSharedObject()
            end)
        end
    
        if not success then
            local breakPoint = 0
            while not QBCore do
                Wait(100)
                
                TriggerEvent('QBCore:GetObject', function(obj)
                    QBCore = obj
                end)
    
                breakPoint = breakPoint + 1

                if breakPoint == 25 then
                    dbg.critical('Failed to find shared object for QBCore!')
                    break
                end
            end
        end

        SharedObject = QBCore

        FrameworkService.GetPlayer = function(playerId)
            if not playerId then
                return nil
            end

            return exports.qbx_core:GetPlayer(playerId)
        end

        FrameworkService.ShowNotification = function(playerId, title, message, type, time)
            local player =  FrameworkService.GetPlayer(playerId)

            if not player then
                return nil
            end

            TriggerClientEvent('QBCore:Notify', playerId, message, type, time)
        end

        FrameworkService.GetPlayerJob = function(playerId)
            local player = FrameworkService.GetPlayer(playerId)
        
            if not player then
                return nil
            end

            local playerJob = player.PlayerData.job

            if not playerJob then
                return nil
            end
        
            return {
                name = playerJob.name,
                grade = playerJob.grade.level,
                gradeName = playerJob.grade.name,
                isBoss = playerJob.isboss
            }
        end

        FrameworkService.GetPlayerIdentifier = function(playerId)
            local player = FrameworkService.GetPlayer(playerId)

            if not player then
                return
            end
            
            return player.PlayerData.citizenid
        end

        FrameworkService.GetPlayerGroup = function(playerId)
            local group = 'user'

            if Ace.Can(playerId, ADMIN_GROUPS.IS_ADMIN) then
                group = ADMIN_GROUPS.IS_ADMIN
            elseif Ace.Can(playerId, ADMIN_GROUPS.IS_GOD) then
                group = ADMIN_GROUPS.IS_GOD
            elseif Ace.Can(playerId, ADMIN_GROUPS.IS_SUPERADMIN) then
                group = ADMIN_GROUPS.IS_SUPERADMIN
            end

            if group == "user" and IsPlayerAceAllowed(playerId, 'command') then
                group = ADMIN_GROUPS.IS_GOD
            end

            return group
        end

        FrameworkService.IsAuthorisedForBillboard = function(playerId)
            local retval = false
            local job = FrameworkService.GetPlayerJob(playerId)

            if job then
                local jobName = job.name

                if Config.Business.List[jobName] and Config.Business.List[jobName].enabled then
                    retval = true
                end
            end

            return retval
        end

        FrameworkService.IsAuthorisedForManagementMenu = function(playerId)
            local retval = false
            local job = FrameworkService.GetPlayerJob(playerId)

            if job then
                local jobName = job.name
                local jobGrade = job.grade

                if not SharedObject then
                    return retval
                end

                if not Config.Business.List[jobName] then
                    return retval
                end

                if SharedObject.Shared.Jobs[jobName] and next(SharedObject.Shared.Jobs[jobName]) and Config.Business.List[jobName].enabled then
                    local gradesAmount = table.len(SharedObject.Shared.Jobs[jobName].grades)
                    local isBoss = job.isBoss or job.isboss or false
                    local isManager = gradesAmount - 2 == jobGrade

                    dbg.debug("Management menu access state: %s %s", isBoss, isManager)

                    if isBoss or isManager then
                        retval = true
                    end
                end
            end

            return retval
        end

        RegisterNetEvent('rcore_banners:server:requestPlayerLoaded', function()
            local playerId = source

            if playerId then
                TriggerEvent('rcore_banners:server:playerLoaded', playerId)
                TriggerClientEvent("rcore_banners:client:playerLoaded", playerId)
            end
        end)

        AddEventHandler('playerDropped', function()
            local playerId = source
        
            if playerId then
                TriggerEvent('rcore_banners:server:playerUnloaded', playerId)
            end
        end)
    end
end)