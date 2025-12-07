local statsInited = false

local CATEGORY_TITLE = 'Whiteboards'
local STATS_CONFIG = {
    rcore_whiteboard_drawing_time = {
        title = 'Drawing time',
        serverTitle = 'Total drawing time',
        unit = 'time',
        achievements = {},
    },
    rcore_whiteboard_drew = {
        title = 'Boards drew',
        serverTitle = 'Total boards drew',
        unit = nil,
        achievements = {
            {title = 'Presentation for few friends', description = 'There is room for improvement, but it will be good enough for friends. Draw on the whiteboard for the first time!', icon = 'brush', goal = 1},
            {title = 'Ready to give a lecture', description = 'You already have 25 sketches done, that should be enough for the presentations.', icon = 'brush', goal = 25},
            {title = 'Artist', description = 'Drawing on the board is like art for you.', icon = 'brush', goal = 50},
        },
    },
    rcore_whiteboard_cleared = {
        title = 'Boards cleared',
        serverTitle = 'Total boards cleared',
        unit = nil,
        achievements = {
            {title = 'Clear the whiteboard for the first time', description = 'Even a master sometimes has to start over.', icon = 'droplet', goal = 1},
            {title = 'Clear the whiteboard again, again and again', description = 'Even a master sometimes has to start over. Again!', icon = 'droplet', goal = 20},
            {title = 'Perfectionist', description = 'It might have already been perfect, but it doesn\'t hurt to try again and make it better.', icon = 'droplet', goal = 50},
        },
    },
}

-- DO NOT EDIT BELOW THIS LINE
local function registerStatConfig(key)
    local serverKey = string.format('total_%s', key)
    local title = STATS_CONFIG[key].title
    local serverTitle = STATS_CONFIG[key].serverTitle
    local achievements = STATS_CONFIG[key].achievements
    local unit = STATS_CONFIG[key].unit

    TriggerEvent('rcore_stats:api:ensureStatType', key, title, "player", unit, 'rcore_whiteboard', true, nil, function()
        TriggerEvent('rcore_stats:api:ensureStatType', serverKey, serverTitle, "server", unit, 'rcore_whiteboard', true, key, function()
            for index, achievement in pairs(achievements) do
                local achievementKey = string.format('%s-%s', key, index)
                TriggerEvent('rcore_stats:api:ensureAchievement', achievementKey, achievement.title, achievement.description, achievement.icon, key, achievement.goal)
            end
        end)
    end)
end

local function setupStats() 
    if not statsInited then
        statsInited = true

        TriggerEvent('rcore_stats:api:ensureCategory', 'rcore_whiteboard', CATEGORY_TITLE, function()
            registerStatConfig('rcore_whiteboard_drawing_time')
            registerStatConfig('rcore_whiteboard_drew')
            registerStatConfig('rcore_whiteboard_cleared')
        end)
    end
end

if Config.RCORE_STATS then
    AddEventHandler('rcore_stats:api:ready', setupStats)

    CreateThread(function()
        if GetResourceState("rcore_stats") == "started" or GetResourceState("rcore_stats") == "starting" then
            while not statsInited do
                TriggerEvent('rcore_stats:api:isReady', function(isReady)
                    if isReady then
                        setupStats()
                    end
                end)
                Wait(1000)
            end
        end
    end)
end