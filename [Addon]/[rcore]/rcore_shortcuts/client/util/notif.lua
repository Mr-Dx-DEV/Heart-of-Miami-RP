function showHelpNotification(msg, thisFrame, beep, duration)
    AddTextEntry('rcore-shortcuts', msg)

    if thisFrame then
        DisplayHelpTextThisFrame('rcore-shortcuts', false)
    else
        if beep == nil then beep = true end
        BeginTextCommandDisplayHelp('rcore-shortcuts')
        EndTextCommandDisplayHelp(0, false, beep, 2000)
    end
end
