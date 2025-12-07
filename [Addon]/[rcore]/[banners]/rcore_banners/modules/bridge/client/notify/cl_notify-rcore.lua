CreateThread(function()
    if Config.Notify == Notify.RCORE then
        ShowNotification = function(title, message, type, time)
            LoadIncludedNotify(title, message, type, time)
        end
    end
end)

