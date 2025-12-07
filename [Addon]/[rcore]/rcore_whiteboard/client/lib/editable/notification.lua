function showHelpNotification(msg)
    AddTextEntry('rcoreWhiteboardHelp', msg)
    DisplayHelpTextThisFrame('rcoreWhiteboardHelp', false)
end

function showNotification(msg)
    if Config.Framework == Frameworks.QBCORE then
        TriggerEvent('QBCore:Notify', msg)
    end

    if Config.Framework == Frameworks.ESX then
        TriggerEvent('esx:showNotification', msg)
    end

    if Config.Framework == Frameworks.STANDALONE then
        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0, 1)
    end
end

RegisterNetEvent(triggerName('showNotification'), function(msg)
    showNotification(msg)
end)

function showSubtitle(message, duration)
    duration = duration or 1000
    BeginTextCommandPrint('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandPrint(duration, 1)
end