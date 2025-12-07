fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'kralik <https://store.rcore.cz/>'
name 'rcore_stats'
description 'rcore statistics & achievements system'
version '1.0.5'

ui_page 'client/ui/index.html'

files {
    "client/ui/index.html",
    "client/ui/**/*",
}

client_scripts {
    "client/init/*.lua",
    "client/api/*.lua",
    "client/lib/**/*.lua",
    "client/modules/permissions/*.lua",
    "client/modules/kvp/*.lua",
    "client/modules/nui/*.lua",
    "client/modules/achievements/*.lua",
    "client/modules/stats/*.lua",
    "client/modules/monitor/cl-monitor-const.lua",
    "client/modules/monitor/cl-monitor-state-helpers.lua",
    "client/modules/monitor/cl-monitor-states.lua",
    "client/modules/monitor/cl-monitor-main.lua",
    "client/modules/monitor/cl-monitor-gameEvent.lua",
    "client/modules/monitor/cl-monitor-combat.lua",
    "client/modules/monitor/cl-monitor-money.lua",
    "client/modules/monitor/cl-monitor-movement.lua",
    "client/modules/monitor/cl-monitor-favorite.lua",
    "client/*.lua",
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "server/lib/**/*.lua",
    "server/init/*.lua",
    "server/api/*.lua",
    "server/modules/ace/*.lua",
    "server/modules/achievements/*.lua",
    "server/modules/stats/*.lua",
    "server/modules/storage/*.lua",
    "server/modules/monitor/sv-monitor-main.lua",
    "server/*.lua",
}

shared_scripts {
    "shared/lib/fw-object.lua",
    'shared/sh-init.lua',
    'shared/sh-const.lua',
    'locales/*.lua',
    "shared/lib/validate.lua",
    "shared/lib/common.lua",
    "shared/lib/debug.lua",
    "shared/lib/locale.lua",
    "shared/lib/tableHelper.lua",
    "config.lua",
    "configs/*.lua",
    "permissions.lua",
}

escrow_ignore {
    "configs/*.lua",
    "config.lua",
    "permissions.lua",
    "locales/*.lua",
    "client/api/*.lua",
    "client/init/*.lua",
    "client/lib/**/*.lua",
    "client/modules/nui/cl-nui.lua",
    "client/modules/permissions/*.lua",
    "server/api/sv-api-helper.lua",
    "server/api/sv-api-storage.lua",
    "server/lib/**/*.lua",
    "shared/**/*.lua",
}

dependency '/assetpacks'