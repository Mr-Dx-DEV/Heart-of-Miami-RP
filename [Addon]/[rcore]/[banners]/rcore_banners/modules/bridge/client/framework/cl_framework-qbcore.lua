CreateThread(function()
    if Config.Framework == Framework.QBCORE then
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
    
        FrameworkService.ShowNotification = function(title, message, type, time)
            TriggerEvent('QBCore:Notify', message, type, time)
        end

        FrameworkService.GetPlayerJob = function()
            return FrameworkService.job
        end

        function CacheJob()
            local retval = {}
            local playerData = SharedObject.Functions.GetPlayerData()

            if playerData and playerData.job then
                retval = {
                    job = playerData.job,
                    identifier = playerData.citizenid
                }
            end

            if retval and next(retval) then
                dbg.debug('Framework - job: Setting player job data on player load!')

                local duty = false

                if retval.job and retval.job.onduty ~= nil then
                    duty = true
                end

                if not duty then
                    duty = true
                end

                if retval.identifier then
                    FrameworkService.identifier = retval.identifier
                end

                FrameworkService.setJob({
                    name = retval.job.name,
                    gradeName = retval.job.grade.name,
                    grade = retval.job.grade.level,
                    duty = retval.job.onduty,
                    isBoss = retval.job.isboss
                })
            end
        end

        function AwaitPlayerLoad()
            local identity = FindTargetResource and FindTargetResource('identity') or nil
            local multichar =  FindTargetResource and FindTargetResource('multicharacter') or nil

            if not identity then
                identity = 'IDENTITY_NOT_FOUND'
            end

            if not multichar then
                multichar = 'MULTICHAR_NOT_FOUND'
            end

            dbg.debug('AwaitPlayerLoad: Checking server enviroment: \nIdentity: %s \nMultichar: %s', identity,
                multichar)

            if type(LocalPlayer.state['isLoggedIn']) == "boolean" then
                repeat
                    Wait(500)
                    dbg.debug(
                        'AwaitPlayerLoad: Awaiting to player load as active character via method: LocalPlayer.state.isLoggedIn')
                until LocalPlayer.state['isLoggedIn']
            elseif QBCore then
                local size = 0
                local playerData = QBCore.Functions.GetPlayerData()

                if type(playerData) == "table" then
                    repeat
                        Wait(500)
                        playerData = QBCore.Functions.GetPlayerData()
                        size = table.size(playerData)
                        dbg.debug('AwaitPlayerLoad: Awaiting to player load as active character via method: PlayerData')
                    until size and size > 0
                end
            else
                dbg.debug(
                'AwaitPlayerLoad: Any of framework related helper functions, not found: loading fallback solution.')
            end

            dbg.debug('AwaitPlayerLoad: Requesting player load, since player is found as active!')

            CacheJob()

            TriggerEvent('rcore_banners:client:playerSpawned')
            TriggerServerEvent('rcore_banners:server:requestPlayerLoaded')
        end

        local isActive = false

        RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
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



        RegisterNetEvent(Config.Events['QBCore:Client:OnJobUpdate'])
        AddEventHandler(Config.Events['QBCore:Client:OnJobUpdate'], function(updatedJobData)
            if not updatedJobData then
                return
            end

            dbg.debug('Framework - job: Updating player job data!')
            FrameworkService.setJob({
                name = updatedJobData.name,
                gradeName = updatedJobData.grade.name,
                grade = updatedJobData.grade.level,
                duty = updatedJobData.onduty,
                isBoss = updatedJobData.isboss
            })
        end)

        function FrameworkService.setJob(job)
            FrameworkService.job = job
        end

        --- @param job any
        --- @param grades any
        --- @param minGrade any
        --- @param jobRenderedArray any
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
        
        local cachedGrades = {} -- Cache table

        function FrameworkService.GetFrameworkGrades(businessName)
            if not SharedObject then
                return nil
            end
        
            businessName = businessName:lower()

            if cachedGrades[businessName] then
                return cachedGrades[businessName]
            end
        
            local job = SharedObject.Shared.Jobs[businessName]
        
            if not job then
                dbg.critical('Failed to find job grades for business name: %s, please define them in your QBCORE!', businessName)
                return nil
            end
        
            local grades = {}
        
            for k, v in pairs(job.grades) do
                local index = tonumber(k)
                if index then
                    v.grade = index
                    table.insert(grades, v)
                end
            end

            cachedGrades[businessName] = grades
        
            return grades
        end
    end
end)

