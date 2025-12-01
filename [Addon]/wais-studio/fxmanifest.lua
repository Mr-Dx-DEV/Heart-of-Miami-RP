-- Author: Ayazwai
-- Github: https://github.com/ayazwai
-- Discord: https://discord.gg/0resmon
-- LinkendIn: https://www.linkedin.com/in/ayaz-ekrem-770305212/

fx_version 'bodacious'
lua54 'yes'
game 'gta5'

--[[ Resource Information ]]--

author 'Ayazwai'
version '1.1.2'
scriptname 'wais-studio'

--[[ Resource Information ]]--

shared_scripts {
    '@ox_lib/init.lua'
}

client_scripts {
    'config.lua',
    'client/client.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'config_sv.lua',
    'server/server.lua',
}

escrow_ignore {
    'config.lua',
    'config_sv.lua',
}

dependencys {
    'ox_lib',
}

ui_page "web/dist/index.html"
files {
    'web/dist/*.js',
    'web/dist/index.html',

    'web/public/**/*.png',
    'web/public/*.json',
    'web/public/css/*.*',
    'web/public/fonts/*.*',
}

dependency '/assetpacks'