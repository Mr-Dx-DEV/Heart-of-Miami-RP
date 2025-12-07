Config = {}
Config.Locale = 'en'
Config.Debug = false
Config.DebugLevel = {
    'INFO',
    'WARNING',
    'ERROR',
    'CRITICAL',
    'DEBUG',
    'SECURITY',
}

-- Enable rcore_stats? (https://store.rcore.cz/package/6273968)
Config.RCORE_STATS = GetResourceState('rcore_stats') ~= 'missing'


--Not load all whiteboards at start, but load them when player is near them
Config.DynamicLoading = true
Config.DynamicLoadingDistance = 100.0

--If user is more than 20 meters away from the whiteboard, it will be deleted
Config.NearObjectDistance = 20.0
Config.RenderDistance = 10.0

-- It is possible to overrides this with `interactionDistance` defined for specific whiteboard
Config.WhiteboardInteractionDistance = 2.0

--Targets.QB_TARGET
--Targets.OX_TARGET
--Targets.STANDALONE
-- ⚠️ We recommend to use QB_TARGET/OX_TARGET
-- STANDALONE system could cause higher CPU usage. Create ticket for any support when you don't have neither OX_TARGET nor QB_TARGET
Config.TargetSystem = Targets.OX_TARGET

Config.BPS = 512000

--In-game editor
--can be open via server console rw_editor playerId
--or in-game with proper ace permission rw_editor
Config.OpenEditorCommand = 'rw_editor'

--Frameworks.QBCORE
--Frameworks.ESX
--Frameworks.STANDALONE
Config.Framework = Frameworks.ESX
Config.LicenseType = "license"
Config.LicenseWithoutPrefix = true

Config.ox_inventory = false

-- used in UI for adding/editing boards to list usable models
Config.BoardsModels = {
    'ch_prop_whiteboard_03',
    'rcore_prop_whiteboard_small',
    'rcore_prop_whiteboard_medium',
    'rcore_prop_whiteboard_large',
}

Config.ModelSettings = {
    ['ch_prop_whiteboard_03'] = {
        scale = vector3(0.013940, -0.003680, 0.000000),
        offset = vector3(-1.141020, -0.017280, 0.858060),
    },
    ['rcore_prop_whiteboard_small'] = {
        scale = vector3(0.001680, 0.000980, 0.000000),
        offset = vector3(-0.574000, -0.007500, 0.325000),
    },
    ['rcore_prop_whiteboard_medium'] = {
        scale = vector3(0.003200, 0.002080, 0.000000),
        offset = vector3(-0.840000, -0.014000, 0.472000),
    },
    ['rcore_prop_whiteboard_large'] = {
        scale = vector3(0.003960, 0.002700, 0.000000),
        offset = vector3(-1.164470, -0.012150, 0.644535),
    },
}

Config.FrameworkTriggers = {
    [Frameworks.ESX] = {
        load = 'esx:playerLoaded',
        notify = 'esx:showNotification',
        object = 'esx:getSharedObject',
        resourceName = 'es_extended',
    },
    [Frameworks.QBCORE] = {
        load = 'QBCore:Server:OnPlayerLoaded',
        notify = 'QBCore:Notify',
        object = 'QBCore:GetObject',
        resourceName = 'qb-core',
    }
}

Config.UsableItems = {
    -- {
    --     usableItem = 'itemName',
    --     boardModel = 'rcore_prop_whiteboard_large',
    -- }
}