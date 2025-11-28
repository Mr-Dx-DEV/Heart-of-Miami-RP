fx_version 'cerulean'
game 'gta5'

description "Multijob Script"
author "GM"
version '1.0.1'
description 'A multijob script mainly made for Qbox'
license 'GPL-3.0'

lua54 'yes'

ui_page 'web/build/index.html'

shared_scripts {
	'@ox_lib/init.lua',
	'utils/*.lua',
}

client_scripts {
	'@qbx_core/modules/playerdata.lua',
	"client/**/*.lua"
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/server.lua',
	'server/duty_time.lua',
}

files {
	"config.lua",
	'web/build/index.html',
	'web/build/**/*',
}

escrow_ignore {
    "config.lua",
    "utils/debug.lua",
}

dependencies {
    'oxmysql',
    'ox_lib',
    'qbx_core'
}
dependency '/assetpacks'