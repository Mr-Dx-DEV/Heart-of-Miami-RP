--[[ FX Information ]]--
fx_version   'cerulean'
lua54        'yes'
game         'gta5'

--[[ Resource Information ]]--
name         'rcore_banners'
author       'NewEdit | rcore.cz'
description  'Animated banners, functional billboards, custom banners with Business - all in solution.'
version '1.1.0'

--[[ Manifest ]]--

escrow_ignore {
    'assets/**/*',
    'readme.md',
    'business.md',
    'how_to_begin.md',
    'configs/job.lua',
    'configs/business.lua',
    'configs/billboards.lua',
    'configs/general.lua',
    'configs/permissions.lua',
    'config.lua',
    'sconfig.lua',
    'locales/*.lua',
    'shared/permissions.lua',

    'hideBillboards.json',
    'billboards.json',
    'modules/bridge/server/sv-commands.lua',
    'modules/bridge/server/**/*.lua',
    'modules/bridge/client/**/*.lua',
}

client_scripts {
    'modules/base/client/init/*.lua',

    'modules/bridge/client/utils/*.lua',
    'modules/bridge/cl-bridge.lua',
    'modules/bridge/client/framework/*.lua',
    'modules/bridge/client/boss_menu/*.lua',
    'modules/bridge/client/notify/*.lua',

    'modules/base/client/lifecycle/init/*.lua',
    'modules/base/client/lib/*.lua',
    'modules/base/client/lib/secret/*.lua',

    "modules/base/client/menu/*.lua",
    "modules/base/client/menu/menus/*.lua",
    "modules/bridge/client/business/*.lua",
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',

    'sconfig.lua',

    'modules/bridge/server/sv-deployer.lua',
    'modules/base/server/init/*.lua',

    'modules/bridge/sv-bridge.lua',
    'modules/bridge/server/database/*.lua',
    'modules/bridge/server/framework/*.lua',
    'modules/bridge/server/api/*.lua',
    'modules/bridge/server/society/*.lua',
    'modules/bridge/server/notify/*.lua',
    'modules/bridge/server/inventory/*.lua',

    'modules/base/server/lifecycle/init/*.lua',
    'modules/base/server/lib/*.lua',
    'modules/bridge/server/sv-fetcher.lua',

    'modules/bridge/server/sv-commands.lua',
    'modules/base/server/deploys/*.lua',
}

shared_scripts {
    "shared/const.lua",
    "shared/debug.lua",
    'shared/init.lua',
    'shared/utils.lua',
    'locales/*.lua',
    "shared/locale.lua",
    "shared/tableHelper.lua",
    'configs/job.lua',
    'configs/business.lua',
    'configs/billboards.lua',
    'configs/general.lua',
    'configs/permissions.lua',
    "config.lua",
    "configs/*.lua",
    'shared/permissions.lua',
}

ui_page 'modules/ui/web/build/index.html'

files {
    'billboards.json',
    'hideBillboards.json',
    'modules/ui/web/build/index.html',
    'modules/ui/web/build/image.html',
    'modules/ui/web/build/images/zones/*.png',
    'modules/ui/web/build/images/*.png',
    'modules/ui/web/build/images/*.jpg',
    'modules/ui/web/build/images/*.jpeg',
	'modules/ui/web/build/**/*',
}

dependencies {
	'/server:5104',
	'/onesync',
    'rcore_banners_assets',
}

dependency '/assetpacks'