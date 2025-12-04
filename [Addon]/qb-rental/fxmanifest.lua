fx_version 'cerulean'
game 'gta5'

name "qb-rental"
description "Vehicle Rental Script Made By escoriny"
author "escoriny"
version "2.0.0"

lua54 'yes'

shared_scripts {
	'@ox_lib/init.lua',
	'@prism_uipack/init.lua',
	'config.lua',
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
}

dependencies {
	'ox_lib',
	'ox_target',
	'ox_inventory',
}
