CreateThread(function()
    if Config.Framework == Framework.NONE then
        local ServerJobs = Jobs or {
            ['printers'] = {
                grades = {
                    {
                        isBoss = true,
                        name = "boss",
                        label = "Boss",
                        grade = 4,
                    },
                    {
                        name = "manager",
                        label = "Manager",
                        grade = 3,
                    },
                    {
                        name = "novice",
                        label = "Novice",
                        grade = 2,
                    },
                    {
                        name = "member",
                        label = "Member",
                        grade = 1,
                    }
                }
            },
            ['gov'] = {
                grades = {
                    {
                        isBoss = true,
                        name = "boss",
                        label = "Boss",
                        grade = 4,
                    },
                    {
                        name = "manager",
                        label = "Manager",
                        grade = 3,
                    },
                    {
                        name = "novice",
                        label = "Novice",
                        grade = 2,
                    },
                    {
                        name = "member",
                        label = "Member",
                        grade = 1,
                    }
                }
            }
        }

        CreateThread(function()
            while true do
                if NetworkIsPlayerActive(PlayerId()) then
                    Wait(0)
                    TriggerEvent('rcore_banners:client:playerSpawned')
                    TriggerServerEvent('rcore_banners:server:requestPlayerLoaded')
                    break
                end
                Wait(0)
            end
        end, "cl-standalone code name: Alfa")

        FrameworkService.ShowNotification = function(title, message, type, time)
            LoadIncludedNotify(title, message, type, time)
        end

        FrameworkService.GetPlayerJob = function()
            return FrameworkService.job
        end


        RegisterNetEvent('rcore_banners:client:playerLoaded')
        AddEventHandler('rcore_banners:client:playerLoaded', function(data)
            FrameworkService.setJob({
                name = data.name,
                gradeName = data.gradeName,
                grade = data.grade,
                duty = false,
                isBoss = data.grade_name == 'boss'
            })
        end)

        RegisterNetEvent('rcore_banners:client:setJob')
        AddEventHandler('rcore_banners:client:setJob', function(data)
            FrameworkService.setJob({
                name = data.name,
                gradeName = data.gradeName,
                grade = data.grade,
                duty = false,
                isBoss = data.gradeName == 'boss'
            })
        end)

        function FrameworkService.setJob(job)
            FrameworkService.job = job
        end

        -- This is used for interactions zone business/billboards

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

        function FrameworkService.CacheFrameworkJob()
            if ServerJobs and next(ServerJobs) then
                for k, v in pairs(ServerJobs) do
                    table.getOrAssignBossGrades(k, v.grades, Config.Jobs.Boss.IncludeSecondHighestAsBoss)
                end 
            end
        end

        function FrameworkService.IsAuthorisedForManagementMenu()
            local retval = false
            local job = FrameworkService.GetPlayerJob()

            if job then
                local jobName = job.name

                if not Config.Business.List[jobName] then
                    return retval
                end

                if Config.Business.List[jobName].enabled and job.isBoss then
                    retval = true
                end
            end

            return retval
        end

        function FrameworkService.GetFrameworkGrades(businessName)
            local job = ServerJobs[businessName]

            if not job then
                return nil
            end

            return job.grades
        end
    end
end)
