CreateThread(function()
    if Config.Notify == Notify.QBOX then
        ShowNotification = function(title, message, type, time)
            FrameworkService.ShowNotification(title, message, type, time)
        end
    end
end)
