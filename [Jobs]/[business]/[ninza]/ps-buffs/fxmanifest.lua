fx_version 'cerulean'
game 'gta5'

name "ps-buffs"
description "Buff tracker for qbcore"
author "Idris"
version "0.0.1"

lua54 'yes'
use_fxv2_oal 'yes'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/style.css',
	'html/script.js'
}

shared_scripts {
	'shared/config.lua',
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}

dependencies {
	'qb-core'
}
