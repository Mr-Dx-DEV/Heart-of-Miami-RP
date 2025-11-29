shared_script '@vLife/ai_module_fg-obfuscated.lua'
shared_script '@vLife/shared_fg-obfuscated.lua'
fx_version "cerulean"
game "gta5"
lua54 "yes"

author "17movement"
description "A city hall job center resource"
version "2.0.3"

shared_scripts {
    "shared/core.lua",
    "shared/locale.lua",
    "locale/*.lua",
    "Config.lua",
}

client_scripts {
    "bridge/**/client/*.lua",
    "client/utils.lua",
    "client/core.lua",
    "client/main.lua",
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "bridge/**/server/*.lua",
    "server/database.lua",
    "server/utils.lua",
    "server/core.lua",
    "server/main.lua",
}

ui_page "web/index.html"
files {
    "web/**.*",
    "web/**/**.*",
    "web/**/**/**.*",
}

escrow_ignore {
    "Config.lua",
    "locale/*.lua",
    "client/utils.lua",
    "server/utils.lua",
    "bridge/**/**/*.lua"
}
dependency '/assetpacks'