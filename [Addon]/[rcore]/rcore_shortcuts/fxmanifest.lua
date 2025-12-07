fx_version 'bodacious' 
games { 'gta5' }

author 'Zeihi <info@rcore.cz>'
description 'rcore_shortcuts'
version '1.1.2'

ui_page 'client/ui/index.html'

lua54 'yes'

dependencies {
    'oxmysql',
    -- 'mysql-async'
}

files {
    'client/ui/*.js',
    'client/ui/*.html',
    'client/ui/*.css',
    'client/ui/*.png',
    'client/ui/*.svg',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    -- '@mysql-async/lib/MySQL.lua',
    'permissions.lua',
    'sconfig.lua',
    'server/api/*.lua',
    'server/init/*.lua',
    'server/lib/**/*.lua',
    'server/*.lua',
}

client_scripts {
    'client/init/*.lua',
    'client/api/*.lua',
    'client/util/*.lua',
    'client/lib/*.lua',
    'client/*.lua',
}

shared_scripts {
    'shared/const/*.lua',
    'shared/const.lua',
    'config.lua',
    'shared/*.lua',
    'locales/*.lua',
}

escrow_ignore {
    'client/api/*.lua',
    'client/util/**/*.lua',
    'server/api/**/*.lua',
    'config.lua',
    'sconfig.lua',
    'permissions.lua',
    'locales/**/*.lua',
    'shared/**/*.lua',
}

dependency '/assetpacks'