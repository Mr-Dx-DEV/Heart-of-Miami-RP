function sendCustomDiscordMessage(webhook, name, message, color, footer)
    footer = footer or "rcore_report | rcore.cz"
    color = color or SConfig.DiscordColors.Grey

    if not webhook or webhook == "WEBHOOK_HERE" or webhook == 'webhook' then
        return
    end

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

AddEventHandler(triggerName('updated'), function(boardId, playerId)
    dbg.debug('Whiteboard %s updated by %s', boardId, playerId)
    local board = findWhiteboardById(boardId)
    if not board then
        dbg.critical('Cannot find whiteboard %s', boardId)
        return
    end

    local player = getNiceName(playerId)

    local message = string.format('**%s** edited whiteboard content **%s** at coords %s', player, board.id, GetEntityCoords(GetPlayerPed(playerId)))
    sendCustomDiscordMessage(SConfig.BoardEditedByPlayerWebhook, 'rcore_whiteboard', message, 0xff5050, 'rcore_whiteboard | rcore.cz')
end)

function adminCreatedBoardDiscordMessage(boardId, boardConfigData, playerId)
    local coords = boardConfigData.pos
    local formattedCoords = string.format('%.2f, %.2f, %.2f', coords.x, coords.y, coords.z)
    local player = getNiceName(playerId)
    
    local message = string.format('**%s** created whiteboard **%s** at coords %s', player, boardId, formattedCoords)
    message = message .. string.format('\n**Board ID:** %s', boardConfigData.id)
    message = message .. string.format('\n**Model:** %s', boardConfigData.model)
    local formattedJobs = ''
    for _, job in ipairs(boardConfigData.jobs) do
        formattedJobs = formattedJobs .. string.format('%s, ', job)
    end
    message = message .. string.format('\n**Jobs:** %s', formattedJobs)
    local formattedGrades = ''
    for _, grade in ipairs(boardConfigData.grades) do
        formattedGrades = formattedGrades .. string.format('%s, ', grade)
    end
    message = message .. string.format('\n**Grades:** %s', formattedGrades)
    message = message .. string.format('\n**Readonly:** %s', boardConfigData.readOnly and 'true' or 'false')
    message = message .. string.format('\n**ACE:** %s', boardConfigData.ace and 'true' or 'false')
    message = message .. string.format('\n**Interaction distance:** %s', boardConfigData.interactionDistance or Config.WhiteboardInteractionDistance)
    message = message .. string.format('\n**URL:** %s', boardConfigData.url or 'none')
    
    sendCustomDiscordMessage(SConfig.BoardCreatedWebhook, 'rcore_whiteboard', message, 0x00ff00, 'rcore_whiteboard | rcore.cz')
end

function adminUpdatedBoardDiscordMessage(boardId, boardConfigData, playerId)
    local coords = boardConfigData.pos
    local formattedCoords = string.format('%.2f, %.2f, %.2f', coords.x, coords.y, coords.z)
    local player = getNiceName(playerId)
    
    local message = string.format('**%s** updated whiteboard **%s** at coords %s', player, boardId, formattedCoords)
    message = message .. string.format('\n**Board ID:** %s', boardConfigData.id)
    message = message .. string.format('\n**Model:** %s', boardConfigData.model)
    local formattedJobs = ''
    for _, job in ipairs(boardConfigData.jobs) do
        formattedJobs = formattedJobs .. string.format('%s, ', job)
    end
    message = message .. string.format('\n**Jobs:** %s', formattedJobs)
    local formattedGrades = ''
    for _, grade in ipairs(boardConfigData.grades) do
        formattedGrades = formattedGrades .. string.format('%s, ', grade)
    end
    message = message .. string.format('\n**Grades:** %s', formattedGrades)
    message = message .. string.format('\n**Readonly:** %s', boardConfigData.readOnly and 'true' or 'false')
    message = message .. string.format('\n**ACE:** %s', boardConfigData.ace and 'true' or 'false')
    message = message .. string.format('\n**Interaction distance:** %s', boardConfigData.interactionDistance or Config.WhiteboardInteractionDistance)
    message = message .. string.format('\n**URL:** %s', boardConfigData.url or 'none')
    
    sendCustomDiscordMessage(SConfig.BoardUpdatedWebhook, 'rcore_whiteboard', message, 0x00ff00, 'rcore_whiteboard | rcore.cz')
end

function adminDeletedBoardDiscordMessage(boardId, coords, playerId)
    local formattedCoords = string.format('%.2f, %.2f, %.2f', coords.x, coords.y, coords.z)
    local player = getNiceName(playerId)
    local message = string.format('**%s** deleted whiteboard **%s** at coords %s', player, boardId, formattedCoords)
    sendCustomDiscordMessage(SConfig.BoardDeletedWebhook, 'rcore_whiteboard', message, 0xff5050, 'rcore_whiteboard | rcore.cz')
end

function playerPlacedBoardDiscordMessage(boardId, boardConfigData, playerId)
    local coords = boardConfigData.pos
    local formattedCoords = string.format('%.2f, %.2f, %.2f', coords.x, coords.y, coords.z)
    local player = getNiceName(playerId)
    
    local message = string.format('**%s** placed whiteboard **%s** at coords %s', player, boardId, formattedCoords)
    message = message .. string.format('\n**Board ID:** %s', boardConfigData.id)
    message = message .. string.format('\n**Model:** %s', boardConfigData.model)
    
    sendCustomDiscordMessage(SConfig.BoardCreatedWebhook, 'rcore_whiteboard', message, 0x00ff00, 'rcore_whiteboard | rcore.cz')
end

function playerPickedUpBoardDiscordMessage(boardId, coords, playerId)
    local formattedCoords = string.format('%.2f, %.2f, %.2f', coords.x, coords.y, coords.z)
    local player = getNiceName(playerId)
    local message = string.format('**%s** picked up whiteboard **%s** at coords %s', player, boardId, formattedCoords)
    sendCustomDiscordMessage(SConfig.BoardDeletedWebhook, 'rcore_whiteboard', message, 0xff5050, 'rcore_whiteboard | rcore.cz')
end