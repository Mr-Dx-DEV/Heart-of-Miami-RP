local fetchedJobs = false

CreateThread(function()
    if Config.Framework == Framework.ESX then
        local ESX = nil


        local success, result = pcall(function()
            ESX = exports[Framework.ESX]:getSharedObject()
        end)

        if not success then
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        end

        SharedObject = ESX

        function loadJobs()
            if not fetchedJobs then
                fetchedJobs = true

                local jobs = MySQL.Sync.fetchAll('SELECT * FROM jobs', {})

                for k, v in ipairs(jobs) do
                    SharedObject.Jobs[v.name] = v
                    SharedObject.Jobs[v.name].grades = {}
                end

                local jobGrades = MySQL.Sync.fetchAll('SELECT * FROM job_grades', {})
                
                for k, v in ipairs(jobGrades) do
                    if SharedObject.Jobs[v.job_name] then
                        SharedObject.Jobs[v.job_name].grades[tostring(v.grade)] = v
                    end
                end
            end
        end

        FrameworkService.GetPlayer = function(playerId)
            if not SharedObject then
                return nil
            end

            local player = SharedObject.GetPlayerFromId(playerId)

            if not player then
                return nil
            end

            return player
        end

        FrameworkService.GetPlayerJob = function(playerId)
            local xPlayer = FrameworkService.GetPlayer(playerId)

            if not xPlayer then
                return nil
            end

            return {
                name = xPlayer.job.name,
                grade = xPlayer.job.grade,
                isBoss = xPlayer.job.grade_name == 'boss',
                gradeName = xPlayer.job.grade_name
            }
        end

        FrameworkService.GetPlayerIdentifier = function(playerId)
            local player = FrameworkService.GetPlayer(playerId)

            if not player then
                return
            end

            return player.getIdentifier()
        end

        FrameworkService.GetPlayerGroup = function(playerId)
            local player = FrameworkService.GetPlayer(playerId)

            if not player then
                return 'user'
            end

            if group == "user" and IsPlayerAceAllowed(playerId, 'command') then
                group = "superadmin"
            end

            return player.getGroup()
        end

        FrameworkService.ShowNotification = function(playerId, message, type, time)
            local player = FrameworkService.GetPlayer(playerId)

            if not player then
                return nil
            end

            player.showNotification(message, type)
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

                if SharedObject.Jobs[jobName] and Config.Business.List[jobName].enabled then
                    local gradesAmount = table.len(SharedObject.Jobs[jobName].grades)
                    local isBoss = job.gradeName:lower() == "boss" and true or false
                    local isManager = gradesAmount - 1 == jobGrade

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
            end
        end)

        AddEventHandler('playerDropped', function()
            local playerId = source
        
            if playerId then
                TriggerEvent('rcore_banners:server:playerUnloaded', playerId)
            end
        end)

        loadJobs()
    end
end)
