CreateThread(function()
    if Config.Framework ~= nil and Config.Framework ~= 1 and Config.Framework ~= 2 then
        Config.DisableDataPermissions = true
        ShowNotification = function(src, msg)
            return
        end

        GetPlayerIdentifierFw = function(src)
            local identifier = GetPlayerIdentifierSafe(src)

            return identifier
        end
    end
end)
