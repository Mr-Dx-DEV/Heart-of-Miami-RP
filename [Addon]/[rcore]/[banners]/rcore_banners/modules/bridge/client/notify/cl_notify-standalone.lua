CreateThread(function()
    if Config.Notify == Notify.NONE or Config.Notify == STANDALONE then
        ShowNotification = function(title, message, type, time)
            if Config.Framework == Framework.ESX then
                FrameworkService.ShowNotification(title, message, type, time)
            elseif Config.Framework == Framework.QBCORE then
                FrameworkService.ShowNotification(title, message, type, time)
            elseif Config.Framework == Framework.QBOX then
                FrameworkService.ShowNotification(title, message, type, time)
            else
                LoadIncludedNotify(title, message, type, time)
            end
        end
    end
end)
