local CachedCallBacks = {}

function AddTimeEvent(h, m, cb)
    table.insert(CachedCallBacks, {
        h = h,
        m = m,
        cb = cb,
    })
end

function AddHourEvent(h, cb)
    table.insert(CachedCallBacks, {
        h = h,
        m = -1,
        cb = cb,
    })
end

function CheckAllTimeEvents()
    SetTimeout(60 * 1000, CheckAllTimeEvents)

    local time = os.date("*t")

    for k, v in pairs(CachedCallBacks) do
        if v.h == time.hour then
            if v.m == -1 and time.min == 0 then
                v.cb()
            end
            if v.m == time.min then
                v.cb()
            end
        end
    end
end

CreateThread(function()
    -- Small delay to allow other resources to register events on startup.
    Wait(5000)
    CheckAllTimeEvents()
end, "TimeEventChecker")