CreateThread(function()
    if Config.Notify == Notify.QBOX then
        ShowNotification = function(playerId, title, message, type, time)
            FrameworkService.ShowNotification(playerId, title, message, type, time)
        end
    end
end)

