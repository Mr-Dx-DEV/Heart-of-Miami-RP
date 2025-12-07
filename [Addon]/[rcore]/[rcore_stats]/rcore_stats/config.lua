Config = {
    Debug = false, -- turn this on if you are experiencing any issues and want to see more output in F8 console
    DebugLevel = {
        'INFO',
        'CRITICAL',
        'WARNING',
        'SUCCESS',
        'ERROR',
        'DEBUG',
        --'DEBUG_SPAM', -- uncomment this if you want to also see highly occuring debug outputs (potential spam warning)
    },

    Locale = 'en', -- Available languages: en, es, de, tr

    UseImperialUnits = false,

    Commands = {
        OPEN_UI = 'stats', -- command to open the stats UI to view your statistics (and more as admin)
    },

    -- Position of the achievement unlocked notification
    AchievementPosition = 'bottom-right', -- 'top-left', 'top-center', 'top-right', 'bottom-left', 'bottom-center', 'bottom-right'

    -----------------------------------------------------
    -- ❗❗❗ DANGER ZONE ❗❗❗
    --🔽 Do not edit if you don't know what you are doing
    -- ❗ CHANGE ONLY IF SOMETHING IS NOT WORKING PROPERLY ❗
    -----------------------------------------------------
    Framework = 0,               --[ 0 = Automatic detection, 1 = ESX / 2 = QBCore / 3 = Other ] Choose your framework
    FrameworkTriggers = {
        resourceName = '',       -- [ ESX = 'es_extended' / QBCore = 'qb-core' ] Set the resource name, if left blank, automatic detection will be performed
        load = '',               --[ ESX = 'esx:getSharedObject' / QBCore = 'QBCore:GetObject' ] Set the shared object event, if left blank, default will be used (deprecated for QBCore)
        notify = '',             -- [ ESX = 'esx:showNotification' / QBCore = 'QBCore:Notify' ] Set the notification event, if left blank, default will be used
        playerLoaded = '',       -- [ ESX = 'esx:playerLoaded' / QBCore = 'QBCore:Client:OnPlayerLoaded' ] Set the player loaded event, if left blank, default will be used
    },
    LicenseType = 'license',     -- license, steam, discord - used only for standalone mode
    LicenseWithoutPrefix = true, -- remove the prefix from the license identifier (e.g. license:1234 -> 1234) - used only for standalone mode
    UseFrameworkNotify = false,  -- If true, framework notification will be used instead of UI notifications, recommended to leave at false as this script only needs to notify while in UI
}
