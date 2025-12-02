fx_version 'cerulean'
game 'gta5'

name "dynyx-rings"
description "Rings System that gives you armor, health, stamina, or stress depending on the ring you use."
author "Green"
version "2.0.0"

shared_scripts {
	'@ox_lib/init.lua',
	'@prism_uipack/init.lua',
	'config.lua',
	'bridge/framework.lua',
	'bridge/inventory.lua'
}

client_scripts {
	'bridge/progress.lua',
	'client/*.lua',
}

server_scripts {
	'server/*.lua'
}

dependencies {
	'ps-buffs'
}

