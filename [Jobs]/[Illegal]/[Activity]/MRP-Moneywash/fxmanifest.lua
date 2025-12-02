fx_version 'cerulean'
game 'gta5'

author 'GalibMahin - CyclopsGM'
description 'GM Money Washing'

version '1.0.2'

lua54 'yes'

dependencies {
	'/onesync',
}

shared_scripts {
    '@ox_lib/init.lua',
    '@prism_uipack/init.lua',
    'shared/*.lua',
}

client_scripts {
    '@mka-lasers/client/client.lua',
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
    '@oxmysql/lib/MySQL.lua'
}


files {
    'locales/*.json'
}

escrow_ignore {
    'shared/*.lua',
}
dependency '/assetpacks'