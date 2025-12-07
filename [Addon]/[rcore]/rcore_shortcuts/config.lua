Config = {}
Config.Locale = 'en'

Config.RCORE_STATS = GetResourceState('rcore_stats') ~= 'missing'

-- If you see anything wrong and you would like to know more, for example to show in support ticket
-- you can set Config.Debug = true to see more debug info in client (F8) console ingame, or server console.
Config.Debug = false
Config.DebugLevel = {
    'INFO',
    'SECURITY',
    'CRITICAL',
    'SUCCESS',
    'ERROR',
    'DEBUG',
}

Config.BPS = 128000

-- when set to `true` group system is ignored. 
Config.UseAcePermissions = false
-- All groups specified here have admin permissions.
Config.AllowedGroups = {
    'superadmin', --ESX
    'admin', --ESX
    'god', --QBCore
}

--Frameworks.QBCORE
--Frameworks.ESX
--Frameworks.STANDALONE
Config.Framework = Frameworks.ESX
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

Config.LicenseType = "license"
Config.LicenseWithoutPrefix = true

Config.Commands = {
    KEYBOARD = 'shortcutskeyboard',
    OVERVIEW = 'shortcuts',
    ADMIN = 'shortcutsadmin',
}

Config.DefaultShortcutsKeyboardHotkey = 'I'

Config.RequireShortcutConfirmationWithEnter = true
Config.RequireNativeShortcutConfirmationWithEnter = true

Config.BlockedShortcutActions = {
    'revive',
    'teleport',
}

Config.ShortcutsLimit = 10
Config.ShortcutsPerPlayerLimit = {
    IDENTIFIER = 15
}

-- nil - disable limit
Config.NativeShortcutsLimit = 5
Config.NativeShortcutsPerPlayerLimit = {
    IDENTIFIER = 5,
}

Config.AliasesLimit = 5
Config.AliasesPerPlayerLimit = {
    IDENTIFIER = 5,
}
