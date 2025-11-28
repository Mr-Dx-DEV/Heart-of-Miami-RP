local onDuty = {}

RegisterServerEvent("av_business:duty", function()
    local src = source
    local x = tostring(src)
    local name = exports['av_laptop']:getName(src)
    local job = exports['av_laptop']:getJob(src).name
    onDuty[x] = onDuty[x] or {}
    if onDuty[x]['clockIn'] then -- set off duty
        local now = os.time()
        local v = onDuty[x]
        local identifier = v['identifier']
        local job = v['job']
        local clockIn = v['clockIn']
        local worked = getTodaysWorked(identifier,job)
        local diff = hoursWorked(worked, now, clockIn)
        if (diff and worked) and (diff > worked) then
            setHoursWorked(job, identifier, diff)
        end
        onDuty[x] = nil
        exports['av_laptop']:toggleDuty(src, false)
        TriggerClientEvent("av_laptop:notification",src,Lang['app_title'],Lang['duty_off'], "inform")
        sendLog("duty", src, job, {identifier = identifier, name = name, duty = false})
    else -- set on duty
        today[job] = today[job] or {}
        today[job]['employees'] = today[job]['employees'] or {}
        if not onDuty[x]['identifier'] then
            onDuty[x]['identifier'] = exports['av_laptop']:getIdentifier(src)
        end
        if not onDuty[x]['clockIn'] then
            onDuty[x]['clockIn'] = os.time()
        end
        if not onDuty[x]['job'] then
            onDuty[x]['job'] = job
        end
        local identifier = onDuty[x]['identifier']
        if not allBusiness[job] then
            newBusiness(job)
        end
        local business = allBusiness[job] or {}
        business['employees'] = business['employees'] or {}
        business['employees'][identifier] = business['employees'][identifier] or {}
        business['employees'][identifier]['lastSeen'] = os.date("%m/%d/%y %H:%M", os.time())
        if not today[job]['employees'][identifier] then
            today[job]['employees'][identifier] = {
                name = name,
                hours = 0,
                image = business['employees'][identifier]['image'] or ""
            }
        end
        exports['av_laptop']:toggleDuty(src, true)
        TriggerClientEvent("av_laptop:notification",src,Lang['app_title'],Lang['duty_on'], "success")
        sendLog("duty", src, job, {identifier = identifier, name = name, duty = true})
    end
end)

CreateThread(function()
    while true do
        for k, v in pairs(onDuty) do
            local now = os.time()
            local source = tonumber(k)
            local exists = GetPlayerPed(source)
            if exists then
                local identifier = v['identifier']
                local job = v['job']
                local clockIn = v['clockIn']
                local worked = getTodaysWorked(identifier,job)
                local diff = hoursWorked(worked, now, clockIn)
                if (diff and worked) and (diff > worked) then
                    setHoursWorked(job, identifier, diff)
                end
            else
                onDuty[k] = nil
            end
        end
        Wait(1 * 60 * 1000)
    end
end)

AddEventHandler('playerDropped', function()
    if not source then return end
    local x = tostring(source)
    if x and onDuty[x] then
        local now = os.time()
        local v = onDuty[x]
        local identifier = v['identifier']
        local job = v['job']
        local clockIn = v['clockIn']
        local worked = getTodaysWorked(identifier,job)
        local diff = hoursWorked(worked, now, clockIn)
        if (diff and worked) and (diff > worked) then
            setHoursWorked(job, identifier, diff)
        end
        onDuty[x] = nil
    end
end)