shared_script '@vLife/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'

author 'GM'
version '1.2.0'
description 'GM_DrugSell - Production-ready drug selling script'

lua54 'yes'

dependencies {
  'ox_lib',
  'ox_target'
}

shared_scripts {
  '@ox_lib/init.lua',
  '@prism_uipack/init.lua',
  'config.lua',
  'bridge/shared.lua'
}

client_scripts {
  'bridge/client.lua',
  'locales/en.lua',
  'client/*.lua'
}

server_scripts {
  'bridge/server.lua',
  'locales/en.lua',
  'server/*.lua'
}

escrow_ignore {
  "config.lua",
  "bridge/shared.lua",
  "locales/en.lua"
}
dependency '/assetpacks'
dependency '/assetpacks'