fx_version 'bodacious'
game 'gta5'
author 'Lixeiro Charmoso#1104'

ui_page "nui/index.html"

lua54 'yes'

escrow_ignore {
	'config.lua',
	'client.lua',
	'client_utils.lua',
	'server_utils.lua',
	'lang/*.lua',
}

client_scripts {
	"lang/*",
	"config.lua",
	"client_utils.lua",
	"client.lua"
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",

	"lang/*",
	"config.lua",
	"server.lua",
	"server_utils.lua",
}

files {
	"nui/lang/*",
	"nui/images/*",
	"nui/images/**",
	"nui/images/items/*",
	"nui/images/items/*.png",
	"nui/images/banner/*",
	"nui/images/banner/*.jpg",
	"nui/font/*",
	"nui/script.js",
	"nui/jquery-3.5.1.min.js",
	"nui/style.css",
	"nui/transition.css",
	"nui/index.html"
}
dependency '/assetpacks'