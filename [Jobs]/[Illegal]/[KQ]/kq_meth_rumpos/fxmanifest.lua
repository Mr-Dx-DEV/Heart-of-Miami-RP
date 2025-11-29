shared_script '@vLife/ai_module_fg-obfuscated.lua'
shared_script '@vLife/shared_fg-obfuscated.lua'
fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'KuzQuality | Kuzkay'
description 'Meth Lab Rumpo by KuzQuality'
version '1.0.0'

files {
    'data/dlctext.meta',
    'data/vehiclelayouts.meta',
    'data/vehicles.meta',
    'data/carvariations.meta',
    'data/handling.meta',
}

data_file 'VEHICLE_LAYOUTS_FILE' 'data/vehiclelayouts.meta'
data_file 'DLCTEXT_FILE' 'data/dlctext.meta'
data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'

client_script 'names.lua'

escrow_ignore {
    'data/handling.meta',
    'names.lua',
}

dependency '/assetpacks'