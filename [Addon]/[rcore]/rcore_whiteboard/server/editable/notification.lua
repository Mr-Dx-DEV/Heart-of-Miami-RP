function showNotification(src, text)
    TriggerClientEvent(triggerName('showNotification'), src, text)
end