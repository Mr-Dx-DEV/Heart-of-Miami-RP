CreateThread(function()
    if Config.Framework ~= nil and Config.Framework ~= 1 and Config.Framework ~= 2 then
        ShowNotification = function(text)
            print(text)
        end

        GetPlayerBalance = function()
            return 0
        end
    end
end)
