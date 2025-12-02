fx_version "cerulean"

game "gta5"

version '1.0.9'

shared_scripts {
    '@ox_lib/init.lua',
    '@prism_uipack/init.lua',
    "config/config.lua",
    'locales/*.lua',
}

client_scripts {
    "opensource/client/client.lua",
    "encrypted/client/client.lua",
}

server_scripts {
    "opensource/server/server.lua",
    "encrypted/server/server.lua",
}

lua54 "yes"

escrow_ignore {
    'config/config.lua',
    'locales/*.lua',
    "opensource/client/client.lua",
    "opensource/server/server.lua",
}

dependency '/assetpacks'
dependency '/assetpacks'