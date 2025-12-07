fx_version 'bodacious'
games { 'gta5' }

author 'Isigar <info@rcore.cz>'
description 'Created by Isigar - rcore.cz'
lua54 'yes'

ui_page 'client/html/index.html'

files {
    'client/html/index.html',
    'client/html/script.js',
    'client/html/style.css',
    'client/html/vue.js',
    'client/html/bgcover.png'
}

shared_scripts {
    'enums.lua',
    'config.lua',
    'shared/*.lua',
    'common.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'sconfig.lua',
    'locales/*.lua',

    'server/events.lua',

    'server/db/bridge.lua',
    'server/db/api.lua',

    'server/framework/bridge.lua',
    'server/framework/type/esx.lua',
    'server/framework/type/qbcore.lua',
    'server/framework/type/standalone.lua',

    'server/inventory/bridge.lua',
    'server/inventory/type/esx_inventory.lua',
    'server/inventory/type/qb_inventory.lua',
    'server/inventory/type/ox_inventory.lua',

    'server/lib/*.lua',
    'server/main.lua',
    'server/extend/*.lua',
}

client_scripts {
    'locales/*.lua',
    'client/lib/*.lua',
    'client/main.lua',
    'client/extend/*.lua',
}

escrow_ignore {
    'locales/*.lua',
    'sconfig.lua',
    'enums.lua',
    'config.lua',
    'shared/*.lua',
    'common.lua',
    'server/framework/**/*.lua',
    'server/inventory/**/*.lua',
    'server/db/*.lua',
    'server/events.lua',
    'server/lib/*.lua',
    'client/lib/*.lua',
    'client/extend/extended.lua',
    'server/extend/extended.lua',
}

dependencies {
    '/server:4752',
}

dependency '/assetpacks'