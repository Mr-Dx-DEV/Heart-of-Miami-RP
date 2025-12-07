NONE_RESOURCE = 'none'
AUTO_DETECT = 'auto_detect'

Framework = {
    ESX = 'es_extended',
    QBCore = 'qb-core',
    QBX = 'qbx_core',
    Standalone = NONE_RESOURCE,
    RFLX = 'rflx_extended',
    AUTO_DETECT = AUTO_DETECT
}

Inventory = {
    OX = 'ox_inventory',
    QB = 'qb-inventory',
    QS = 'qs-inventory',
    MF = 'mf-inventory',
    PS = 'ps-inventory',
    LJ = 'lj-inventory',
    CORE = 'core_inventory',
    CHEZZA = 'inventory',
    CODEM = 'codem-inventory',
    ORIGEN = 'origen_inventory',
    TGIANN = 'tgiann-inventory',
    AK47_QB = 'ak47_qb_inventory',
    ESX = 'esx_inventory',
    AK47 = 'ak47_inventory',
    NONE = NONE_RESOURCE,
    AUTO_DETECT = AUTO_DETECT
}

Target = {
    OX = 'ox_target',
    QB = 'qb-target',
    Q = 'qtarget',
    NONE = NONE_RESOURCE,
    AUTO_DETECT = AUTO_DETECT
}

Database = {
    OX = 'oxmysql',
    MYSQL_ASYNC = 'mysql-async',
    GHMATTI = 'ghmattimysql',
    AUTO_DETECT = AUTO_DETECT
}

XMAS_PLAYER_IDENTIFIER = 'rcore_xmas:player_identifier'

PRESENT_HUNT_PLAYER_STATE_KEY = 'rcore_xmas:present_hunt'
SNOWMAN_BUILD_PART_STATE_KEY = 'rcore_xmas:snowman_build_part'
SNOWMAN_ID_STATE_KEY = 'rcore_xmas:snowman_id'

TREES_SPAWN_EVENTS_SPLIT_TABLE_SIZE = 20
TREE_ID_STATE_KEY = 'rcore_xmas:tree_id'
TREE_OWNER_STATE_KEY = 'rcore_xmas:tree_owner'
TREE_STASH_INVENTORY_ID = 'tree_%s'

GIFT_UNPACKED_INVENTORY_ID = 'gift_%s'
GIFT_PACKED_INVENTORY_ID = 'packed_gift_%s'

SNOWMAN_PART_BODY = 'Body'
SNOWMAN_PART_HEAD = 'Head'
SNOWMAN_PART_HAT = 'Hat'
SNOWMAN_PART_NOSE = 'Nose'
SNOWMAN_PART_SCARF = 'Scarf'
SNOWMAN_PART_FACE = 'Face'
SNOWMAN_PART_HANDS = 'Hands'

Logs = {
    TREE_PLACED = 'tree_placed',
    TREE_DESTROYED = 'tree_destroyed',
    TREE_DECORATED = 'tree_decorated',
    TREE_ADMIN_DELETE = 'tree_admin_delete',

    SNOWMAN_BUILT_PART = 'snowman_built_part',
    SNOWMAN_BUILT_FULL = 'snowman_built_full',
    SNOWMAN_DESTROYED = 'snowman_destroyed',
    SNOWMAN_ADMIN_DELETE_PART = 'snowman_admin_delete_part',
    SNOWMAN_ADMIN_DELETE_FULL = 'snowman_admin_delete_full',

    PRESENT_COLLECTED = 'present_collected',

    GIFT_UNPACKED = 'gift_unpacked',
    GIFT_PACKED = 'gift_packed',
}
