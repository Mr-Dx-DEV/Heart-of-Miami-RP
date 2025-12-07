local statsInited = false

local CATEGORY_TITLE = 'Shortcuts'
local STATS_CONFIG = {
    rcore_shortcuts_used = {
        title = 'Shortcuts used',
        serverTitle = 'Total shortcuts used',
        unit = nil,
        achievements = {
            {title = 'First shortcut used', description = 'Use your first shortcut!', goal = 1},
            {title = 'Twenty shortcuts used', description = 'You definitely know how to save some time!', goal = 20},
            {title = 'Shortcuts master', description = 'You mastered time saving skills!', goal = 100},
        }
    },
    rcore_shortcuts_added = {
        title = 'Shortcuts added',
        serverTitle = 'Total shortcuts added',
        unit = nil,
        achievements = {},
    },
}

-- DO NOT EDIT BELOW THIS LINE
local function registerStatConfig(key)
    local serverKey = string.format('total_%s', key)
    local title = STATS_CONFIG[key].title
    local serverTitle = STATS_CONFIG[key].serverTitle
    local achievements = STATS_CONFIG[key].achievements
    local unit = STATS_CONFIG[key].unit

    TriggerEvent('rcore_stats:api:ensureStatType', key, title, "player", unit, 'rcore_shortcuts', true, nil, function()
        TriggerEvent('rcore_stats:api:ensureStatType', serverKey, serverTitle, "server", unit, 'rcore_shortcuts', true, key, function()
            for index, achievement in pairs(achievements) do
                local achievementKey = string.format('%s-%s', key, index)
                TriggerEvent('rcore_stats:api:ensureAchievement', achievementKey, achievement.title, achievement.description, 'fast-forward', key, achievement.goal)
            end
        end)
    end)
end

local function setupStats() 
    if not statsInited then
        statsInited = true

        TriggerEvent('rcore_stats:api:ensureCategory', 'rcore_shortcuts', CATEGORY_TITLE, function()
            registerStatConfig('rcore_shortcuts_used')
            registerStatConfig('rcore_shortcuts_added')
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