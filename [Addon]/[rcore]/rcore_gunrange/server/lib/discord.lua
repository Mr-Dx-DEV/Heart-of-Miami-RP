function sendCustomDiscordMessage(webhook,name,message,color,footer)
    if webhook == 'WEBHOOK' then
        return
    end

    footer = footer or "rcore_reports | rcore.cz"
    color = color or SConfig.DiscordColors.Grey
    local embeds = {
        {
            ["title"] = name,
            ["description"] = message,
            ["type"] = "rich",
            ["color"] = color,
            ["footer"] = {
                ["text"] = footer,
            },
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = name, embeds = embeds }), { ['Content-Type'] = 'application/json' })
end

local function findDiscordIdentifier(source)
    local discordId
    for _, id in ipairs(GetPlayerIdentifiers(source)) do
        if string.match(id, "discord:") then
            discordId = string.gsub(id, "discord:", "")
        end
    end
    return discordId
end

local function getNiceName(playerId)
    local discordLicense = findDiscordIdentifier(playerId)
    if discordLicense then
        return string.format('%s <@%s>', GetPlayerName(playerId), discordLicense)
    end

    return nil
end
