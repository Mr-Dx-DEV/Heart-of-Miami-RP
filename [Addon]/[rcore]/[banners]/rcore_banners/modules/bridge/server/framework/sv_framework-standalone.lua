CreateThread(function()
    if Config.Framework == Framework.NONE then
        local Jobs = {
            ['printers'] = {
                grades = {
                    ['4'] = {
                        name = "boss",
                        isboss = true,
                    },
                    ['3'] = {
                        name = "manager",
                    },
                    ['2'] = {
                        name = "novice",
                    },
                    ['1'] = {
                        name = "member",
                    }
                }
            },
            ['gov'] = {
                grades = {
                    ['4'] = {
                        name = "boss",
                        isboss = true,
                    },
                    ['3'] = {
                        name = "manager",
                    },
                    ['2'] = {
                        name = "novice",
                    },
                    ['1'] = {
                        name = "member",
                    }
                }
            }
        }

        RegisterCommand('playerId', function(source, args, rawCommand)
            ShowNotification(source, _U('NOTIFY.GENERAL'), _U('ID', source), 'success', 6000)
        end, false)

        
        RegisterCommand('job', function(source, args, rawCommand)
            local job = FrameworkService.GetPlayerJob(source)

            if job then
                ShowNotification(source, 'Job', ('Job: %s | Grade: %s'):format(job.name, job.grade), 'success', 6000)
            end
        end, false)
        
        RegisterCommand('set_business_job', function(source, args, rawCommand)
            if source == 0 then
                return
            end
            
            local playerGroup = FrameworkService.GetPlayerGroup(source)
        
            if playerGroup and playerGroup == 'user' then
                ShowNotification(source, _U('NOTIFY.GENERAL'), _U('NOT_ENOUGH_PERMS_TO_ACCESS', playerGroup), 'error', 6000)
                return
            end

            local target = tonumber(args[1])
            local jobName = args[2]
            local jobGrade = tonumber(args[3])
        
            if not target or not jobName or not jobGrade then
                ShowNotification(source, _U('NOTIFY.GENERAL'), _U('SET_BUSINESS_JOB_USE_CASE'), 'error', 6000)
                return
            end

            if not Jobs[jobName] then
                ShowNotification(source, _U('NOTIFY.GENERAL'), _U('SET_BUSINESS_INVALID_JOB'), 'error', 6000)
                return
            end

            if not Jobs[jobName].grades[tostring(jobGrade)] then
                ShowNotification(source, _U('NOTIFY.GENERAL'), _U('SET_BUSINESS_INVALID_GRADE'), 'error', 6000)
                return
            end

            local playerIdentifier = FrameworkService.GetPlayerIdentifier(target)
        
            if playerIdentifier then
                SetPlayerJob(target, playerIdentifier, jobName, jobGrade)
            end
        end, false)

        function SetPlayerJob(playerId, identifier, jobName, jobGrade)
            local job = Jobs[jobName]
            local gradeName = job.grades[tostring(jobGrade)].name
            local isBoss = job.grades[tostring(jobGrade)].boss

            local jobData = {
                name = jobName,
                grade = jobGrade,
                gradeName = gradeName,
                isBoss = isBoss or gradeName:lower() == 'boss'
            }

            TriggerClientEvent('rcore_banners:client:setJob', playerId, jobData)

            local jsonData = json.encode(jobData)
    
            SetResourceKvp(identifier .. "_job", jsonData)

            ShowNotification(playerId, 'Setjob', ('Job: %s | Grade: %s'):format(jobData.name, jobData.grade), 'success', 6000)
        end


        FrameworkService.GetPlayer = function(playerId)
            return nil
        end

        FrameworkService.ShowNotification = function(playerId, title, message, type, time)
            ShowNotification(playerId, title, message, type, time)
        end

        FrameworkService.GetPlayerJob = function(playerId)
            local identifier = FrameworkService.GetPlayerIdentifier(playerId)

            if not identifier then return nil end

            local jsonData = GetResourceKvpString(identifier .. "_job")
        
            if not jsonData then
                return {
                    name = 'unemployed',
                    grade = 0,
                    gradeName = 'none'
                }
            end
        
            local jobData = json.decode(jsonData)

            return jobData
        end

        FrameworkService.GetPlayerIdentifier = function(playerId)
            local success, result = pcall(function()
                return GetPlayerIdentifierByType(playerId, 'license')
            end)

            if not success then
                return dbg.critical('GetPlayerIdentifier: Failed to get identifier for user named %s', GetPlayerName(playerId))
            end

            return result
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

                if Config.Business.List[jobName].enabled and job.isBoss then
                    retval = true
                end
            end

            return retval
        end

        RegisterNetEvent('rcore_banners:server:playerSpawned', function()
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
    end
end)