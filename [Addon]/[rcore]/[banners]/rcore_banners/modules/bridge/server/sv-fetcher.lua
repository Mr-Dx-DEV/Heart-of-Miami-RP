local CachedMinifiedJobs = nil

function Fetcher.sendServerJobsToClient(playerId)
    if Fetcher.isRegistered(playerId, 'ServerJobs') then
        return
    end

    local jobCreator = FindTargetResource('job_creator') or FindTargetResource('jobs_creator')

    if not jobCreator and Config.Framework ~= Framework.ESX then
        return Fetcher.sendChunkMeta(playerId, "ServerJobs", {
            status = "empty",
            reason = "No job creator resource found"
        })
    end

    if IS_QB[Config.Framework] then
        return Fetcher.sendChunkMeta(playerId, "ServerJobs", {
            status = "empty",
            reason = "Jobs on IS_QB server type, can be fetched directly, skipping"
        })
    end

    local minifiedJobs = GetMinifiedJobData(SharedObject.Jobs)

    Fetcher.register(playerId, 'ServerJobs')
    Fetcher.sendDataInChunks(playerId, "ServerJobs", minifiedJobs)
end

function Fetcher.sendBannersToClient(playerId)
    if Fetcher.isRegistered(playerId, 'BannersData') then
        return
    end

    Fetcher.register(playerId, 'BannersData')

    Fetcher.sendDataInChunks(playerId, "Banners", Banners)
    Fetcher.sendDataInChunks(playerId, "Billboards", RegisteredBillboards)
    Fetcher.sendDataInChunks(playerId, "ServerBanners", ServerBanners)
end


--- @param jobs table<string, table>
function GetMinifiedJobData(jobs)
    if CachedMinifiedJobs then
        return CachedMinifiedJobs
    end

    local result = {}

    if Config.Framework == Framework.ESX and Jobs and next(Jobs) then
        for jobName, job in pairs(Jobs or {}) do
            if type(SharedObject.DoesJobExist) == "table" then
                if not SharedObject.DoesJobExist(jobName, 0) and not jobs[jobName] then
                    dbg.critical(("📢 Business Setup Required: Missing job '%s'.\n💡 Hint: Run 'bannersetup es_extended' in your txAdmin (Live Console) to register it.\n🔁 After running the command, don't forget to restart your server to apply the changes."):format(jobName))
                    jobs[jobName] = {
                        name = jobName,
                        label = jobName,
                        grades = job.grades or {}
                    }
                end
            end
        end
    end

    for jobName, job in pairs(jobs or {}) do
        local newGrades = {}
        local grades = type(job.grades) == "table" and job.grades or {}

        for gradeIndex, grade in pairs(grades) do
            if type(grade) == "table" and grade.name and grade.label then
                table.insert(newGrades, {
                    name = grade.name,
                    label = grade.label,
                    grade = grade.grade or tonumber(gradeIndex)
                })
            end
        end

        if #newGrades > 0 then
            table.sort(newGrades, function(a, b)
                return a.grade < b.grade
            end)

            if #newGrades > 1 then
                local highestGrade = newGrades[#newGrades].grade
                local secondHighestGrade = newGrades[#newGrades - 1].grade
            
                for _, g in ipairs(newGrades) do
                    if g.grade == highestGrade then
                        g.isBoss = true
                    elseif g.grade == secondHighestGrade and (Config.Jobs and Config.Jobs.Boss.IncludeSecondHighestAsBoss) then
                        g.isBoss = true
                    end
                end
            end
            
            result[jobName] = {
                name = job.name or jobName,
                label = job.label or jobName,
                grades = newGrades
            }
        end
    end
    

    CachedMinifiedJobs = result

    return result
end
