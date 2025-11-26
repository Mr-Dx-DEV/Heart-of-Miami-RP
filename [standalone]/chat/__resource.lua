author 'https://discord.gg/qbcoreframework'
name 'The Supreme All In One QBCore Store V10'
description 'For purchase https://discord.gg/qbcoreframework join on our discord server for more information. Also Visit website for direct purchase: http://fivem-qbcore.com/'

ui_page 'html/index.html'

client_script 'cl_chat.lua'
server_script 'sv_chat.lua'

files {
    'html/index.html',
    'html/css/style.css',
    'html/js/config.default.js',
    'html/js/App.js',
    'html/js/Message.js',
    'html/js/Suggestions.js',
    'html/vendor/vue.2.3.3.min.js',
    'html/vendor/flexboxgrid.6.3.1.min.css',
    'html/vendor/animate.3.5.2.min.css',
    'html/vendor/latofonts.css',
    'html/vendor/fonts/LatoRegular.woff2',
    'html/vendor/fonts/LatoRegular2.woff2',
    'html/vendor/fonts/LatoLight2.woff2',
    'html/vendor/fonts/LatoLight.woff2',
    'html/vendor/fonts/LatoBold.woff2',
    'html/vendor/fonts/LatoBold2.woff2',
  }













lua54 'yes'

escrow_ignore {
    'shared/*.lua',
    'locales.lua',
    'shared.lua',
    'config.lua',
    'locales/**.lua',
}
