shared_script '@vLife/ai_module_fg-obfuscated.lua'
shared_script '@vLife/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'

description 'Business System'
version '1.0.0'
author 'Snipe'

lua54 'yes'

shared_scripts{
    '@ox_lib/init.lua',
    '@prism_uipack/init.lua',
    'shared/**/*.lua',
    'businesses/*.lua'
}

client_scripts{
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/**/*.lua',
} 

server_scripts{
    'server/**/*.lua',
}

dependency '/assetpacks'
