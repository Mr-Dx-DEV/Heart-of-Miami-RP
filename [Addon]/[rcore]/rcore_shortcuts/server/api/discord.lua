function sendCustomDiscordMessage(webhook,name,message,color,footer)
    footer = footer or "rcore_shortcuts | rcore.cz"
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

    return GetPlayerName(playerId)
end

function sendShortcutAddedDiscordMessage(playerId, shortcut, action, category)
    if not SConfig.Webhooks.SHORTCUT_ADDED then
        return
    end

    local message = string.format("Author: %s\n", getNiceName(playerId))
    message = message .. string.format("Shortcut: %s\n", shortcut)
    message = message .. string.format("Action: %s\n", action)
    message = message .. string.format("Category: %s", category or '-')
    sendCustomDiscordMessage(
        SConfig.Webhooks.SHORTCUT_ADDED, 'RCORE_SHORTCUTS: Shortcut added', message
    )
end

function sendShortcutEditedDiscordMessage(playerId, shortcut, action, category)
    if not SConfig.Webhooks.SHORTCUT_EDITED then
        return
    end

    local message = string.format("Author: %s\n", getNiceName(playerId))
    message = message .. string.format("Shortcut: %s\n", shortcut)
    message = message .. string.format("Action: %s\n", action)
    message = message .. string.format("Category: %s", category or '-')
    sendCustomDiscordMessage(
        SConfig.Webhooks.SHORTCUT_EDITED, 'RCORE_SHORTCUTS: Shortcut edited', message
    )
end

function sendShortcutDeletedDiscordMessage(playerId, shortcut, action)
    if not SConfig.Webhooks.SHORTCUT_DELETED then
        return
    end

    local message = string.format("Author: %s\n", getNiceName(playerId))
    message = message .. string.format("Shortcut: %s\n", shortcut)
    message = message .. string.format("Action: %s", action)
    sendCustomDiscordMessage(
        SConfig.Webhooks.SHORTCUT_DELETED, 'RCORE_SHORTCUTS: Shortcut deleted', message
    )
end

function sendPremadeShortcutAddedDiscordMessage(playerId, shortcut, action, category, jobs)
    if not SConfig.Webhooks.PREMADE_SHORTCUT_ADDED then
        return
    end

    local message = string.format("Author: %s\n", getNiceName(playerId))
    message = message .. string.format("Shortcut: %s\n", shortcut)
    message = message .. string.format("Action: %s\n", action)
    message = message .. string.format("Category: %s", category or '-')
    local jobsString = ""
    for index, job in pairs(jobs) do
        jobsString = jobsString .. job .. ', '
    end
    message = message .. string.format('Jobs: %s', jobsString)
    sendCustomDiscordMessage(
        SConfig.Webhooks.PREMADE_SHORTCUT_ADDED, 'RCORE_SHORTCUTS: Premade Shortcut added', message
    )
end

function sendPremadeShortcutEditedDiscordMessage(playerId, shortcut, action, category)
    if not SConfig.Webhooks.PREMADE_SHORTCUT_EDITED then
        return
    end

    local message = string.format("Author: %s\n", getNiceName(playerId))
    message = message .. string.format("Shortcut: %s\n", shortcut)
    message = message .. string.format("Action: %s\n", action)
    message = message .. string.format("Category: %s", category or '-')
    local jobsString = ""
    for index, job in pairs(jobs) do
        jobsString = jobsString .. job .. ', '
    end
    message = message .. string.format('Jobs: %s', jobsString)
    
    sendCustomDiscordMessage(
        SConfig.Webhooks.PREMADE_SHORTCUT_EDITED, 'RCORE_SHORTCUTS: Premade Shortcut edited', message
    )
end

function sendPremadeShortcutDeletedDiscordMessage(playerId, shortcut, action)
    if not SConfig.Webhooks.PREMADE_SHORTCUT_DELETED then
        return
    end

    local message = string.format("Author: %s\n", getNiceName(playerId))
    message = message .. string.format("Shortcut: %s\n", shortcut)
    message = message .. string.format("Action: %s", action)
    sendCustomDiscordMessage(
        SConfig.Webhooks.PREMADE_SHORTCUT_DELETED, 'RCORE_SHORTCUTS: Premade Shortcut deleted', message
    )
end

function sendCategoryAddedDiscordMessage(playerId, categoryName)
    if not SConfig.Webhooks.CATEGORY_ADDED then
        return
    end

    local message = string.format("Author: %s\n", getNiceName(playerId))
    message = message .. string.format("Category: %s", categoryName)
    sendCustomDiscordMessage(
        SConfig.Webhooks.CATEGORY_ADDED, 'RCORE_SHORTCUTS: Category added', message
    )
end

function sendCategoryEditedDiscordMessage(playerId, categoryName)
    if not SConfig.Webhooks.CATEGORY_EDITED then
        return
    end

    local message = string.format("Author: %s\n", getNiceName(playerId))
    message = message .. string.format("Category: %s", categoryName)
    sendCustomDiscordMessage(
        SConfig.Webhooks.CATEGORY_EDITED, 'RCORE_SHORTCUTS: Category edited', message
    )
end

function sendCategoryDeletedDiscordMessage(playerId, categoryName)
    if not SConfig.Webhooks.CATEGORY_DELETED then
        return
    end

    local message = string.format("Author: %s\n", getNiceName(playerId))
    message = message .. string.format("Category: %s", categoryName)
    sendCustomDiscordMessage(
        SConfig.Webhooks.CATEGORY_DELETED, 'RCORE_SHORTCUTS: Category deleted', message
    )
end

function sendAliasAddedDiscordMessage(playerId, command)
    if not SConfig.Webhooks.ALIAS_ADDED then
        return
    end

    local message = string.format("Author: %s\n", getNiceName(playerId))
    message = message .. string.format("Command: %s", command)
    sendCustomDiscordMessage(
        SConfig.Webhooks.ALIAS_ADDED, 'RCORE_SHORTCUTS: Alias added', message
    )
end

function sendAliasEditedDiscordMessage(playerId, command)
    if not SConfig.Webhooks.ALIAS_EDITED then
        return
    end

    local message = string.format("Author: %s\n", getNiceName(playerId))
    message = message .. string.format("Command: %s", command)
    sendCustomDiscordMessage(
        SConfig.Webhooks.ALIAS_EDITED, 'RCORE_SHORTCUTS: Alias edited', message
    )
end

function sendAliasDeletedDiscordMessage(playerId, command)
    if not SConfig.Webhooks.ALIAS_DELETED then
        return
    end

    local message = string.format("Author: %s\n", getNiceName(playerId))
    message = message .. string.format("Command: %s", command)
    sendCustomDiscordMessage(
        SConfig.Webhooks.ALIAS_DELETED, 'RCORE_SHORTCUTS: Alias deleted', message
    )
end