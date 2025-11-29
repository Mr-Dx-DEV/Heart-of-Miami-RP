shared_script '@vLife/ai_module_fg-obfuscated.lua'
shared_script '@vLife/shared_fg-obfuscated.lua'
fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'KuzQuality | Kuzkay'
description 'Weed Production by KuzQuality'
version '1.4.2'

data_file 'DLC_ITYP_REQUEST' 'stream/kq_weed_lockups.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/kq_weed_plants.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/kq_weed_growop.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/kq_weed_other.ytyp'

shared_scripts {
    'config.lua',
    'config.strains.lua',
    'config.lockups.lua',
    'config.growops.lua',
    'config.fertilizers.lua',

    'shared/cache.lua',
    'shared/locale.lua',
    'shared/utils.lua',
    'shared/shared.lua',
    'shared/hasher.lua',
    'shared/syncObject.lua',
}

client_scripts {
    'client/utils.lua',
    'client/editable/debug.lua',
    'client/editable/editable.lua',

    'client/activities/watering.lua',
    'client/activities/fertilizing.lua',
    'client/activities/collecting.lua',
    'client/activities/bagging.lua',
    'client/activities/rolling.lua',
    'client/activities/pressing.lua',
    'client/activities/insectSpraying.lua',
    'client/active.lua',
    'client/pedAnim.lua',
    'client/dataDisplay.lua',

    'client/vendor.lua',

    'client/cctv.lua',

    'client/functions.lua',

    'client/classes/syncObject.lua',
    'client/classes/pot.lua',
    'client/classes/lockup.lua',
    'client/classes/growop.lua',
    'client/classes/workbench.lua',
    'client/classes/press.lua',

    'client/client.lua',
    'client/placement/placement.lua',
}

server_scripts {
    'server/editable/init.lua',
    'server/editable/debug.lua',
    'server/editable/sql.lua',
    'server/editable/editable.lua',
    'server/server.lua',
    'server/callbacks.lua',

    'server/classes/syncObject.lua',
    'server/classes/pot.lua',
    'server/classes/lockup.lua',
    'server/classes/growop.lua',
    'server/classes/workbench.lua',
    'server/classes/press.lua',
}

files {
    'locales/*.json'
}

escrow_ignore {
    'config.lua',
    'config.strains.lua',
    'config.lockups.lua',
    'config.growops.lua',
    'config.fertilizers.lua',

    'client/editable/**.*',
    'server/editable/**.*',
    'locales/*.json',
}

dependency '/assetpacks'