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