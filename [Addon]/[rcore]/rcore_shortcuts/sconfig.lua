SConfig = {}

SConfig.DiscordColors = {
    Green = 56108,
    Grey = 8421504,
    Red = 16711680,
    Orange = 16744192,
    Blue = 2061822,
    Purple = 11750815
}

SConfig.Webhooks = {
    SHORTCUT_ADDED = nil,
    SHORTCUT_EDITED = nil,
    SHORTCUT_DELETED = nil,
    PREMADE_SHORTCUT_ADDED = nil,
    PREMADE_SHORTCUT_EDITED = nil,
    PREMADE_SHORTCUT_DELETED = nil,
    CATEGORY_ADDED = nil,
    CATEGORY_EDITED = nil,
    CATEGORY_DELETED = nil,
    ALIAS_ADDED = nil,
    ALIAS_EDITED = nil,
    ALIAS_DELETED = nil,
}

-- logs in `rcore_shortcuts_logger` are automatically deleted after x days defined here
-- you should also set higher value than 30 if you want all statistics from last 30 days
-- to be calculated correctly
SConfig.AutoCleanAfterDays = 31