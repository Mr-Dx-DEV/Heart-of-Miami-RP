CreateThread(function()
    if Config.Notify == Notify.RCORE then
        ShowNotification = function(playerId, title, message, type, time)
            StartClient(playerId, 'showNotify', title, message, type, time)
        end
    end
end)

