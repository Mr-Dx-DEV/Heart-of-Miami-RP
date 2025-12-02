fx_version 'cerulean'

game 'gta5'

description 'Sleep Or Sex by luthanirgi#4471'

version '2.5.0'

lua54 'yes'

client_scripts {
  'locales/en.lua',
  'config.lua',
  'client/client.lua',
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  --'@oxmysql/lib/MySQL.lua',
  'locales/en.lua',
  'config.lua',
  'server/server.lua',
}

escrow_ignore {
  'image/*.png',
  'sql/pregnant.sql',
  'sql/shared.lua',
  'locales/en.lua',
  'config.lua',
}
dependency '/assetpacks'