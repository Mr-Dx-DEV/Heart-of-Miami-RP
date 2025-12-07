function placedBannerLog(source, taskType, ...)
    if SConfig.DiscordSetting.PLACE_BANNER then
        sendLog(source, taskType, ...)
    end
end

function jobPostersLog(source, taskType, ...)
    if SConfig.DiscordSetting.JOB_POSTERS then
        sendLog(source, taskType, ...)
    end
end

function addServerBanner(source, taskType, ...)
    if SConfig.DiscordSetting.ADDED_SERVER_BANNER then
        sendLog(source, taskType, ...)
    end
end

function editorLog(source, taskType, ...)
    if SConfig.DiscordSetting.EDITOR_LOG then
        sendLog(source, taskType, ...)
    end
end

function removedBannerLog(source, taskType, ...)
    if SConfig.DiscordSetting.REMOVE_BANNER then
        sendLog(source, taskType, ...)
    end
end

function businessLog(source, taskType, ...)
    if SConfig.DiscordSetting.BUSINESS then
        sendLog(source, taskType, ...)
    end
end

function sendLog(source, taskType, ...)
    if not taskType then
        taskType = 'UNK'
    end

    local msg = 'CONSOLE'
    local fields = {}

    if source == -1 then
        msg = 'CONSOLE | ' .. ...
    else
        msg = ...
        fields = {
            {
                ["name"] = "Player",
                ["value"] = GetPlayerName(source),
                ["inline"] = true,
            },
            {
                ["name"] = "Identifier",
                ["value"] = FrameworkService.GetPlayerIdentifier(source),
                ["inline"] = true,
            },
            {
                ["name"] = "serverId",
                ["value"] = source,
                ["inline"] = true,
            },
            {
                ["name"] = "Data",
                ["value"] = ...,
                ["inline"] = true,
            },
        }
    end

    sendCustomDiscordMessage(SConfig.Webhook, taskType or 'UNK', msg, SConfig.DiscordColors.Orange, fields)
end

function sendCustomDiscordMessage(webhook, name, message, color, fields)
    local footer = footer or "rcore_banners | rcore.cz"
    local color = color or SConfig.DiscordColors.Green

    local embeds = {
        ["title"] = name,
        ["description"] = message,
        ["type"] = "rich",
        ["color"] = color,
        ["footer"] = {
            ["text"] = 'Date | ' .. os.date("%Y-%m-%d %H:%M:%S"),
        },
    }

    if fields then
        embeds["fields"] = fields
    end

    PerformHttpRequest(webhook, function(err, text, headers) 
    end, 'POST', json.encode(
        {username = 'rcore_banners', embeds = { embeds } }
    ), { ['Content-Type'] = 'application/json' })
end