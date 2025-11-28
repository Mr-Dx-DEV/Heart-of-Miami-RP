shared_script '@vLife/ai_module_fg-obfuscated.lua'
shared_script '@vLife/shared_fg-obfuscated.lua'
fx_version 'bodacious'

game 'gta5'

ui_page 'build/index.html'

client_script('client.lua')

files {
	'build/index.html',
	'build/main.js',
	'build/style.css',
    'build/sounds/*',
}