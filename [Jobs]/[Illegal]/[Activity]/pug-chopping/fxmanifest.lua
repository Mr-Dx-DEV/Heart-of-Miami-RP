lua54 'yes'
fx_version 'cerulean'
game 'gta5'

author 'Pug'
description 'Discord: zpug'
version '1.3.7'

client_script {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/client.lua',
    'client/open.lua',
    '@ox_lib/init.lua', -- This can be hashed out if you are not using ox_lib
    '@prism_uipack/init.lua',

}

server_script {
    '@oxmysql/lib/MySQL.lua',
	'server/server.lua',
}

shared_script {
    'config/config-framework.lua',
    'config/config-garage-upgrades.lua',
    'config/config-vehicle-spawns.lua',
    'config/config.lua',
    'config/config-translation.lua',
}

ui_page 'html/index.html'

files {
    'html/*.html',
    'html/sounds/*',
}

escrow_ignore {
    'config/config-framework.lua',
    'config/config-translation.lua',
    'config/config-garage-upgrades.lua',
    'config/config-vehicle-spawns.lua',
    'config/config.lua',
    -- 'client/client.lua',
    'client/open.lua',
    'server/server.lua',
    'html/index.html',
}
dependency '/assetpacks'