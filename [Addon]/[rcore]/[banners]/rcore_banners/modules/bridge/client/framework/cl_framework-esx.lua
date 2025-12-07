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

        function AwaitPlayerLoad()
            if not ESX then
                return
            end

            local identity = FindTargetResource and FindTargetResource('identity') or nil
            local multichar = FindTargetResource and FindTargetResource('multicharacter') or nil

            if not identity then
                identity = 'IDENTITY_NOT_FOUND'
            end

            if not multichar then
                multichar = 'MULTICHAR_NOT_FOUND'
            end

            dbg.debug('AwaitPlayerLoad: Checking server enviroment: \nIdentity: %s \nMultichar: %s', identity,
                multichar)

            if type(ESX.IsPlayerLoaded) == "table" then
                repeat
                    Wait(500)
                    dbg.debug(
                        'AwaitPlayerLoad: Awaiting to player load as active character via method: ESX.IsPlayerLoaded')
                until ESX.IsPlayerLoaded() or EnforcePlayerLoaded
            elseif type(ESX.GetPlayerData) == "table" then
                local playerData = ESX.GetPlayerData()

                repeat
                    Wait(500)
                    dbg.debug(
                        'AwaitPlayerLoad: Awaiting to player load as active character via method: ESX.GetPlayerData')
                until playerData and next(playerData) or EnforcePlayerLoaded
            else
                dbg.debug(
                    'AwaitPlayerLoad: Any of framework related helper functions, not found: loading fallback solution.')
            end

            CacheJob()

            dbg.debug('AwaitPlayerLoad: Requesting player load, since player is found as active!')

            TriggerEvent('rcore_banners:client:playerSpawned')
            TriggerServerEvent('rcore_banners:server:requestPlayerLoaded')
        end

        local isActive = false

        RegisterNetEvent('esx:onPlayerLogout', function()
            if source == '' then return end
            if not isActive then return end
                
            isActive = false
        end)

        CreateThread(function()
            while true do
                if NetworkIsPlayerActive(PlayerId()) and not isActive then
                    isActive = true
                    AwaitPlayerLoad()
                end

                Wait(500)
            end
        end)


        function CacheJob()
            local playerData = SharedObject and SharedObject.GetPlayerData()

            if playerData and playerData.job then
                local job = playerData.job

                FrameworkService.setJob({
                    name = job.name,
                    gradeName = job.grade_name,
                    grade = job.grade,
                    duty = false,
                    isBoss = job.grade_name:lower() == "boss"
                })

                if not next(job) then
                    dbg.critical('Cached player failed, not any job data found.')
                else
                    dbg.debug('Cached player setting player job data.')
                end
            end
        end

        RegisterNetEvent(Config.Events['esx:setJob'])
        AddEventHandler(Config.Events['esx:setJob'], function(data)
            FrameworkService.setJob({
                name = data.name,
                gradeName = data.grade_name,
                grade = data.grade,
                duty = false,
                isBoss = data.grade_name:lower() == "boss"
            })
        end)

        FrameworkService.ShowNotification = function(title, message, type, time)
            if not SharedObject then
                return
            end

            SharedObject.ShowNotification(message, type)
        end

        FrameworkService.GetPlayerJob = function()
            return FrameworkService.job
        end

        function FrameworkService.setJob(job)
            FrameworkService.job = job
        end

        function FrameworkService.IsAuthorisedForManagementMenu()
            local retval = false
            local job = FrameworkService.GetPlayerJob()

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

        
        function FrameworkService.CacheFrameworkJob(jobs)
            if not SharedObject.Jobs then
                SharedObject.Jobs = jobs
            end
        end


        function FrameworkService.GetFrameworkGrades(businessName)
            if not SharedObject or not SharedObject.Jobs then
                return nil
            end
        
            local job = SharedObject.Jobs[businessName]
            
            if not job or type(job.grades) ~= "table" then
                return nil
            end

            return job.grades
        end
        
        

        function IsAtJob(jobOwner, grades, minGrade, unk, jobRenderedArray)
            local job = FrameworkService.GetPlayerJob()

            if job then
                local renderState = false
                local hasAccess = false

                local jobName = job and job?.name
                local jobGrade = job and job?.grade

                if not jobOwner and jobRenderedArray then
                    if jobRenderedArray[jobName] then
                        hasAccess = true
                    end
                elseif jobOwner and jobOwner == jobName then
                    if grades and grades[jobGrade] then
                        if jobGrade >= minGrade then
                            hasAccess = true
                        end
                    else
                        hasAccess = true
                    end
                end

                return hasAccess, renderState
            end
        end
    end
end)
