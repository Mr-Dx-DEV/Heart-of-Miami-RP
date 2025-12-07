AddEventHandler('rcore_stats:api:isReady', function(cb)
    cb(IsInitFinished)
end)

AddEventHandler('rcore_stats:api:openUI', function()
    OpenNUI()
end)
