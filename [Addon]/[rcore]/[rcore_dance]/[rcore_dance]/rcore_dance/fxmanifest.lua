fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'kralik <https://store.rcore.cz/>'
name 'rcore_dance'
description 'Perfect your moves and challenge friends in the rcore_dance minigame!'
version '1.1.1'

ui_page 'client/ui/index.html'

files {
    "client/ui/index.html",
    "client/ui/**/*",
}

client_scripts {
    "client/init/*.lua",
    "client/api/*.lua",
    "client/lib/*.lua",
    "client/modules/kvp/*.lua",
    "client/modules/anim/*.lua",
    "client/modules/camera/*.lua",
    "client/modules/helpkeys/*.lua",
    "client/modules/object/*.lua",
    "client/modules/menu/*.lua",
    "client/modules/menu/menus/*.lua",
    "client/modules/minigame/*.lua",
    "client/modules/nui/*.lua",
    "client/modules/sound/*.lua",
    "client/modules/session/*.lua",
    "client/modules/player/*.lua",
    "client/*.lua",
}

server_scripts {
    "server/lib/*.lua",
    "server/init/*.lua",
    "server/modules/session/*.lua",
    "server/modules/object/*.lua",
    "server/*.lua",
}

shared_scripts {
    'shared/init.lua',
    'locales/*.lua',
    "shared/kvp.lua",
    "shared/common.lua",
    "shared/const.lua",
    "shared/defaultConfig.lua",
    "shared/debug.lua",
    "shared/locale.lua",
    "shared/tableHelper.lua",
    "config.lua",
}

escrow_ignore {
    "config.lua",
    "locales/*.lua",
    "client/api/cl-api-minigame.lua",
    "client/lib/*.lua",
}

dependency '/assetpacks'