CreateThread(function()
    if Config.Notify == Notify.QBCORE then
        ShowNotification = function(title, message, type, time)
            FrameworkService.ShowNotification(title, message, type, time)
        end
    end
end)

