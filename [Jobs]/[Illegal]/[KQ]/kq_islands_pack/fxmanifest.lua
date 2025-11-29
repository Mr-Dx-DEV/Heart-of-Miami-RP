
fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'KuzQuality | Kuzkay'
description 'Coca islands pack by KuzQuality'
version '1.1.1'

this_is_a_map 'yes'

data_file 'DLC_ITYP_REQUEST' 'stream/kq_coca_island2.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/kq_coca_island3.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/kq_coca_island4.ytyp'

files {
    'MINIMAP_LOADER.gfx',
    'stream/*.*',
}

client_scripts {
    'config.lua',
    'map.lua',
    'ocean-calmer.lua',
}

escrow_ignore {
    'stream/**.ymap',
    'stream/**.ytd',
    'config.lua',
    'ocean-calmer.lua',
}

dependency '/assetpacks'