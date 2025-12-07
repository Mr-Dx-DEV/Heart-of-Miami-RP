if isBridgeLoaded('Framework', Framework.QBX) then
    function Framework.showHelpNotification(text)
        DisplayHelpTextThisFrame(text, false)
        BeginTextCommandDisplayHelp(text)
        EndTextCommandDisplayHelp(0, false, false, -1)
    end

    function Framework.sendNotification(message, type)
        if message == nil then return end

        exports[Framework.QBX]:Notify(message, type, 5000)
    end
end
