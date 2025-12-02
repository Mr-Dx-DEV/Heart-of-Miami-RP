fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Cadburry (Bytecode Studios)'
description 'Notepad'
version '1.1'

shared_scripts {
    -- '@ox_lib/init.lua', -- Uncomment if using ox_lib
    'shared.lua'
}

client_scripts {
    'bridge/client.lua',
    'notepad/client.lua',
}

server_scripts {
    'bridge/server.lua',
    'notepad/server.lua',
    'version.lua'
}

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/**/*'
}

escrow_ignore {
    'bridge/*',
    'shared.lua'
}
dependency '/assetpacks'