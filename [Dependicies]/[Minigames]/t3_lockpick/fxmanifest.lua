shared_script '@vLife/ai_module_fg-obfuscated.lua'
shared_script '@vLife/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'


author 't3mpu5'
description 't3_lockpick'
version '1.0.0'

ui_page 'html/index.html'

client_scripts {
	'client/main.lua',
}

shared_scripts {
    'config.lua',
}

files {
	'html/index.html',
	'html/images/*.png',
	'html/sounds/*.mp3',
	'html/sounds/*.wav',
}