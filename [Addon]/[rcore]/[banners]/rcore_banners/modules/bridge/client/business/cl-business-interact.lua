BusinessInteractCache = {}

onChunkReady("ServerJobs", function(status, meta, jobs)
    if status == "ready" and type(jobs) == "table" then
        local reconstructed = {}

        for _, entry in ipairs(jobs) do
            if entry.__key and entry.__value then
                reconstructed[entry.__key] = entry.__value
            end
        end

        FrameworkService.CacheFrameworkJob(reconstructed)
    end

    if Config.Framework == Framework.NONE then
        FrameworkService.CacheFrameworkJob()
    end

    RegisterBusinessInteract()
end)

function RegisterBusinessInteract()
    if not Config.Business.Enabled then
        return
    end

    for businessName, businessData in pairs(Config.Business.List) do
        if businessData.enabled then
            for interactIdx = 1, #businessData.interact, 1 do
                local data = businessData.interact[interactIdx]

                local interactPos = data.pos
                local interactType = data.type

                local interact = createMarker()

                interact.setType(1)
                interact.setPosition(vec3(interactPos.x, interactPos.y, interactPos.z - 1.25))
                interact.setScale(Config.InteractZone.Scale)
                interact.setInRadius(Config.InteractZone.InRadius)
                interact.setColor({
                    r = 240,
                    g = 200,
                    b = 80,
                    a = 160
                })

                local jobGrades = FrameworkService.GetFrameworkGrades(businessName)

                if not jobGrades then
                    return dbg.debug('Failed to get job grades from framework on business interact!')
                end

                local highestGrade, secondHighestGrade = table.getOrAssignBossGrades(
                    businessName,
                    jobGrades,
                    Config.Jobs.Boss.IncludeSecondHighestAsBoss
                )
                
                local gradeAmount = secondHighestGrade or highestGrade or 0
                
                dbg.debug('Boss menu interact: Grade required is %s | highest: %s | second: %s', gradeAmount, highestGrade, secondHighestGrade)

                interact.setRotation(false)
                interact.setKeys({ 38 })
                interact.setRenderJob(businessName)
                interact.setGrades(jobGrades)
                interact.setLocationType(interactType)

                if interactType == Interact.BOSS_MENU then
                    interact.setMinGrade(gradeAmount)
                end

                interact.on("enter", function()
                    if not interact.help then
                        local job = FrameworkService:GetPlayerJob()
                        local jobName = job and job?.name

                        if not interact.getRenderJob() == jobName then
                            return
                        end

                        interact.help = true

                        BusinessInteractCache = {
                            name = interact.getRenderJob(),
                            id = interact.id,
                            interact = interact,
                        }

                        HandleBusinessInteractHelpPrompt('render', interactType)
                    end
                end)

                interact.on("leave", function()
                    if interact.help then
                        interact.help = false

                        HandleBusinessInteractHelpPrompt('hide')
                    end
                end)

                interact.on("key", function()
                    if InEditor then
                        return dbg.debug('Ignore business interaction, since in active editor.')
                    end

                    local locationType = interact.getLocationType()

                    if not interact.IsMarkerBusy() then
                        HandleBusinessInteractHelpPrompt('hide')
                    end

                    if locationType == Interact.BOSS_MENU then
                        OpenManagementMenu(interact.getRenderJob())
                    end
                end)

                interact.render()
            end
        end
    end
end

--- @param isRender boolean
function HandleInteractMarkers(isRender)
    if next(CacheInteract) then
        for idx, data in pairs(CacheInteract) do
            CreateThread(function()
                if isRender then
                    data.interact.stopRender()
                else
                    data.interact.render()
                end
            end)
        end
    end
end

--- @param state boolean
function HandleInteractState(state)
    if BusinessInteractCache then
        if BusinessInteractCache.interact then
            -- BusinessInteractCache.interact.SetBusyStatus(state)
            dbg.debug('Handling interact busy state with: %s', state)
        end
    end
end

--- @param color any
function HandleMarkerColor(color, markerIdx)
    if next(CacheInteract) then
        for idx, data in pairs(CacheInteract) do
            CreateThread(function()
                if markerIdx == idx then
                    local locationType = data.interact.getLocationType()

                    if locationType == Interact.PRODUCTION_MINIGAME then
                        data.interact.setColor({
                            r = color.r,
                            g = color.g,
                            b = color.b,
                            a = color.alpha
                        })
                    end
                end
            end)
        end
    end
end

--- @param state any
--- @param interactType any
function HandleBusinessInteractHelpPrompt(state, interactType)
    if state and state == 'render' then
        if not interactType then
            return
        end

        if InEditor then
            return
        end

        local prefix = ('%s.%s'):format('Business', interactType)

        ShowHelpKeys({
            {
                label = _U(prefix),
                keyName = 'E',
            },
        })
    else
        if not InEditor then
            HideHelpKeys()
        end
    end
end

--- @param businessName string
function OpenBussinessBossMenu(businessName)
    if not businessName then
        return dbg.debug('Failed to open business menu, received unk businessName!')
    end

    local name = businessName:lower()

    if not Config.Business.List[name] then
        return dbg.debug('Failed to find defined business in the list: %s', name)
    end

    if not Config.Business.List[name].enabled then
        return dbg.debug('Failed to open bossMenu since the busienss is disabled.')
    end

    OpenBossMenu(businessName)
end
