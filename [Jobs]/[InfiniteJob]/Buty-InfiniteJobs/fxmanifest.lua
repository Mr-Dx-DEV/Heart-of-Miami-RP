shared_script '@vLife/ai_module_fg-obfuscated.lua'
shared_script '@vLife/shared_fg-obfuscated.lua'


fx_version 'cerulean'

game 'gta5'
author 'Buty'
version "2.0.1"

lua54 'yes'

dependencies {'ox_lib','Buty-InfiniteJobs-Props'}

ui_page "html/index.html"

shared_scripts {
	'@ox_lib/init.lua',
	'@prism_uipack/init.lua',
	'config.lua',
	'client/lang.lua',
	'locales/*.lua',
	'jobs/*.lua',
}

client_scripts {
	'client/framework/*.lua',
	'client/main.lua',
	'client/clothes.lua',
	'client/lang.lua',
	'locales/*.lua'
}

server_scripts {
	'server/framework/*.lua',
	'server/main.lua',
	'locales/*.lua',
}

files {
	'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/img/*',
    'html/background/*',
}

escrow_ignore {
	'config.lua',
	'locales/*.lua',
	'client/framework/*.lua',
	'client/clothes.lua',
	'server/framework/*.lua',
	'jobs/*.lua',
}

-- data_file 'DLC_ITYP_REQUEST' 'stream/prop_lumber_fury.ytyp'

-- data_file 'DLC_ITYP_REQUEST' 'fury-conveyor_prop.ytyp'
-- data_file 'DLC_ITYP_REQUEST' 'fury-belt_2.ytyp'
dependency '/assetpacks'
