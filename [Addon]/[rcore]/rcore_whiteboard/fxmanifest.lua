fx_version 'cerulean'
games { 'gta5' }

author 'Isigar <info@rcore.cz>'
description 'RCore whiteboard system'
version '2.1.5'

lua54 "yes"

ui_page 'html/index.html'

files {
    'html/assets/**/*',
    'html/fonts/*.woff',
    'html/*.js',
    'html/*.js.map',
    'html/*.css',
    'html/*.css.map',
    'html/*.svg',
    'html/*.png',
    'html/rcore_placer/*.js',
    'html/index.html',
    'html/content.html',
    'html/whiteboard.html',
}

client_scripts {
    'client/lib/editable/*.lua',
    'client/init/*.lua',
    'client/lib/**/*.lua',

    'client/rcore_placer/utils.lua',
    'client/rcore_placer/editor.lua',
    'client/rcore_placer/threejs.lua',
    'client/rcore_placer/client.lua',

    'client/editor/**/*.lua',
    'client/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'permissions.lua',
    'server_config.lua',
    'server/init/state.lua',
    'server/init/object.lua',
    'server/editable/*.lua',
    'server/init/*.lua',
    'server/framework/*.lua',
    'server/lib/*.js',
    'server/lib/*.lua',
    'server/editor/*.lua',
    'server/*.lua',
}

shared_scripts {
    'shared/const/*.lua',
    'config.lua',
    'shared/*.lua',
    'locales/*.lua',
}

dependencies {
    'rcore_whiteboard_scaleform',
    'oxmysql',
    --'mysql-async',
}

escrow_ignore {
    'config.lua',
    'permissions.lua',
    'server_config.lua',
    'client/lib/editable/*.lua',
    'client/lib/target.lua',
    'client/lib/event.lua',
    'server/editable/*.lua',
    'server/lib/*.lua',
    'shared/**/*.lua',
    'server/init/object.lua',
    'server/lib/*.lua',
    'locales/*.lua',
}

dependency '/assetpacks'