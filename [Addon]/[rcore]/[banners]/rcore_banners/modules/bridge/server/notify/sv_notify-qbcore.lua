CreateThread(function()
    if Config.Notify == Notify.QBCORE then
        ShowNotification = function(playerId, title, message, type, time)
            FrameworkService.ShowNotification(playerId, title, message, type, time)
        end
    end
end)

