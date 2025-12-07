RegisterNetEvent(triggerName("PlayerHitTarget"), function(gunrangeIndex, score, newCoords)
    if Config.Debug then
        --[[
        print(string.format(" TriggerEvent(triggerName('makePointOnTarget'), { x = %s, y = %s, }, %s) ", newCoords.x, newCoords.y, score), GetPlayerName(source))
        --]]
    end
end)

RegisterNetEvent(triggerName('leaveLine'))
AddEventHandler(triggerName('leaveLine'), function(bullets, gunrangeIndex, boxIndex, targetIndex)
    local _source = source
    local points = 0;
    for i, v in pairs(bullets) do
        points = points + tonumber(v.hitPoints)
    end

    local message = _U('discord_description_leave', GetPlayerName(_source), points, targetIndex)
    sendCustomDiscordMessage(SConfig.Webhook, _U('discord_title'), message, 16711680)

    if Config.Debug then
        print("[rcore_gunrange] Sended discord notification: ", message)
    end
end)
