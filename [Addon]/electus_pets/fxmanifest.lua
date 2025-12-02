fx_version("cerulean")
author("krillee1 (discord) (ELECTUS SCRIPTS)")
game("gta5")
lua54("yes")
version("4.3.1")

files({
	-- "data/**/*.meta",
	"ui/build/index.html",
	"ui/build/**/*",
})

shared_scripts({
	"config/*.lua",
	"config/**/*.lua",
	"shared/utils.lua",
	"@ox_lib/init.lua",
	'@prism_uipack/init.lua',
})

client_scripts({
	"client/*.lua",
	"client/frameworks/*.lua",
	"escrowed/client/*.lua",
})

server_scripts({
	"server/frameworks/*.lua",
	"server/*.lua",
	"@mysql-async/lib/MySQL.lua",
	"escrowed/server/*.lua",
})

escrow_ignore({
	"client/*",
	"client/frameworks/*",
	"shared/*",
	"config/*",
	"config/**/*",
	"shared/**/*",
	"server/frameworks/*",
	"server/*",
})

ui_page("ui/build/index.html")

dependency '/assetpacks'