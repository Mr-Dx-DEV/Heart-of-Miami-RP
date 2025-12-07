Config = {
    Debug = false,
    DebugNetwork = false,

    DebugBillboardViewCone = false,

    DebugLevel = {
        'CRITICAL',
        'SOCIETY',
        'BUSINESS',
        'INVENTORY',
        'NETWORK',
        'BRIDGE',
        'INFO',
        'WARNING',
        'SUCCESS',
        'ERROR',
        'FETCHER',
        'DEBUG',
        'LOD',
        'MENU',
        'FRONTEND',
        'SECURITY',
    },

    PosterJob = {
        Enable = true
    },

    Interact = {
        Key = 'E'
    },

    DisableIPL = false, -- Used for Billboards - Weazel News location

    UseAcePermissions = true,
    ShowConflictAssets = true, -- Show conflicting assets in console,

    -- Material ID

    AllowAllMaterials = true, 

    Materials = {
        [-583213831] = true,
        [282940568] = true,
        [-1447280105] = true,
        [1907048430] = true,
        [1913209870] = true,
        [-1595148316] = true,
        [510490462] = true,
        [909950165] = true,
        [-1907520769] = true,
        [-1136057692] = true,
        [509508168] = true,
        [1288448767] = true,
        [-786060715] = true,
        [-1931024423] = true,
        [-1937569590] = true,
        [-878560889] = true,
        [1619704960] = true,
        [1550304810] = true,
        [951832588] = true,
        [2128369009] = true,
        [-356706482] = true,
        [1925605558] = true,
        [-1885547121] = true,
        [-1942898710] = true,
        [312396330] = true,
        [1635937914] = true,
        [-273490167] = true,
        [1109728704] = true,
        [223086562] = true,
        [1584636462] = true,
        [-461750719] = true,
        [1333033863] = true,
        [-1286696947] = true,
        [-1833527165] = true,
        [581794674] = true,
        [-913351839] = true,
        [-2041329971] = true,
        [-309121453] = true,
        [-1915425863] = true,
        [1429989756] = true,
        [673696729] = true,
        [244521486] = true,
        [435688960] = true,
        [-634481305] = true,
        [-1634184340] = true,
        [-231260695] = true,
        [-251888898] = true,
        [-840216541] = true,
        [2100727187] = true,
        [-1775485061] = true,
    },
    -- All settings related to banners UI.

    UI_SETTINGS = {
        MINIGAME_LINE_THICKNESS = 25,   -- Thickness of the minigame line
        MINIGAME_POINTS_PER_LEVEL = 15, -- How many points player needs to get to next level
        MINIGAME_MAX_LEVEL = 1,         -- Max level for minigame

        APP_LOGO = 'logo.png',          -- Can be found in client/ui/web/build/logo.png
        MAX_IMAGE_SIZE = 10.0,          --Maximum size on images from URL (in MB)

        EnableAppDebug = false,          -- This allow to enable debug the application behind scenes.

        -- (edit in configs/general.lua)
        NEED_EDITOR_ITEM_STATE = Config.General.NEED_EDITOR_ITEM_STATE,           -- Validate if user needs item for placing banners
        NEED_EDITOR_ITEM_NAME = Config.General.Items.BANNER_PLACER,               -- Name of the item player needs if value above is true
        NEED_PRODUCTION_ITEM_STATE = Config.Business.Printers.ProductionItemNeed, -- What item does player need for production?
        NEED_PRODUCTION_ITEM_NAME = Config.Business.Printers.ProductionItem,      -- Is item required for production of banners?

        BILLBOARD_MAP = {
            LEGEND_COLORS = {
                OWNED = '#ffc107',         -- your business owns the billboard
                AVAILABLE = '#00ff00',     -- billboard is available for purchase
                NOT_AVAILABLE = '#ff0000', -- billboard is owned by someone else
                USER_MARKER = 'white'      -- color of the user icon (current location of user)
            }
        }
    },

    HideBillboardStands = true, -- Used for hideBillboards.json that it should hide stands model

    -- Framework events, if you are using adjusted / renamed framework then adjust it in here.
    Events = {
        ['qb-openBossMenu'] = 'qb-bossmenu:client:OpenMenu',
        ['esx-openBossMenu'] = 'esx_society:openBossMenu',
        ['esx:playerLoaded'] = 'esx:playerLoaded',
        ['esx:setJob'] = 'esx:setJob',
        ['esx:playerLogout'] = 'esx:onPlayerLogout',
        ['QBCore:Client:OnPlayerLoaded'] = 'QBCore:Client:OnPlayerLoaded',
        ['QBCore:Client:OnJobUpdate'] = 'QBCore:Client:OnJobUpdate',
        ['esx_addonaccount:getSharedAccount'] = 'esx_addonaccount:getSharedAccount',
        ['esx_society:registerSociety'] = 'esx_society:registerSociety',
    },

    Menu = {
        -- MENU POSITIONS: top-left | top-right | bottom-left | bottom-right
        -- HELPKEYS POSITIONS: top-left | top-right | bottom-left | bottom-right
        
        JobSettings = {
            menuPosition = 'top-right',   -- menu position
            helpKeysPosition = 'top-left' -- Help keys position for settings menu
        },
        MINIGAME = {
            helpKeysPosition = 'top-left' -- Help keys position for controls
        },
        Production = {
            menuPosition = 'top-right' -- menu position
        },
        Banners = {
            helpKeysPosition = 'top-right' -- Help keys position for controls
        },
        Billboards = {
            menuPosition = 'top-right' -- menu position
        }
    },

    RemoveBannerDuration = 10, -- Time it takes to remove a poster. (default 10 seconds)
    PlaceBannerDuration = 1,   -- How long it will take to place a banner. (default 1 second)

    Database = AUTO_DETECT,

    --[[
        Supported database connectors:
            * AUTO_DETECT: auto-detect db connector
            * Database.OX: oxmysql,
            * Database.MYSQL_ASYNC: mysql-async,
            * STANDALONE: no db connector found
    ]]

    Framework = AUTO_DETECT,

    --[[
        Supported frameworks:
            * AUTO_DETECT: auto-detect framework
            * Framework.ESX: es_extended, https://github.com/esx-framework/esx_core
            * Framework.QBCORE: qb-core, https://github.com/qbcore-framework/qb-core
            * Framework.QBOX: qbx_core, https://github.com/Qbox-project/qbx_core
            * STANDALONE: no framework found, you will need to integrate it
    ]]

    Society = AUTO_DETECT,

    --[[
        Supported Society system:
            * AUTO_DETECT: auto-detect Society resource
            * Society.ESX: esx_society,
            * Society.QB_BANKING: qb-banking,
            * Society.QB_MANAGEMENT: qb-management,
            * Society.RENEWED, Renewed-Banking,
            * Society.FD_BANKING, fd_banking,
            * Society.OKOK, okokBanking
            * STANDALONE: no society resource found
    ]]


    Inventory = AUTO_DETECT,


    --[[
        Supported inventories:
            * AUTO_DETECT: auto-detect inventory [Only detecting supported inventories below]
            * Inventory.ESX: es_extended, https://github.com/esx-framework/esx_core
            * Inventory.QB: qb-inventory, https://github.com/qbcore-framework/qb-inventory
            * Inventory.QS, qs-inventory,
            * Inventory.LJ, lj-inventory,
            * Inventory.MF, mf-inventory,
            * Inventory.CHEEZA, inventory,
            * Inventory.TGIANN, tgiann-inventory
            * Inventory.CORE, core_inventory
            * STANDALONE: no inventory found, you will need to integrate it
    ]]
    
    Notify = AUTO_DETECT,

    -- Posters used for poster job.

    Posters = {
        {
            model = 'ba_prop_battle_poster_skin_01'
        },
        {
            model = 'ba_prop_battle_poster_skin_02'
        },
        {
            model = 'ba_prop_battle_poster_skin_03'
        },
        {
            model = 'ba_prop_battle_poster_skin_04'
        },
    },

    Locale = 'en', -- Choose you language ['en' - english]

    Commands = {
        debugMaterial = 'debugMaterial',
        banners = 'banners',                        -- Command used for opening main dashboard, where are all banners.
        removeBanners = 'rbanner',                  -- Command used for removing closest banner.
        bannersDebug = 'banners_debug',             -- Command used for admins, which allows to see info about closest banners around ped if any found.
        billboardHide = 'billboardHide',            -- Command used for hiding billboards - it will enable tool, which allows to select billboards to hide!.
        billboardHideMarker = 'billboardHideMarker'                       -- Command used for hiding billboards - it will enable tool, which allows to select billboards to hide!
    },

    Animations = {
        REMOVE_BANNER = { -- Animation used for removing a banner
            dict = 'timetable@maid@cleaning_window@idle_a',
            name = 'idle_a'
        },
        PLACE_BANNER = { -- Animation used for placing a banner
            dict = 'anim@amb@nightclub@poster@',
            name = 'poster_placement'
        }
    },

    -- Settings for render distance of banners and billboards

    LOD = {
        AREA_DEBUG = false,                -- Enable area debug for LOD
        RENDER_DISTANCE_TOLERANCE = 250.0, -- How far banners are rendered
    },

    InteractZone = {
        InRadius = 1.5,              -- Radius of the interact zone
        Scale = vec3(1.0, 1.0, 1.0), -- Scale of the interact zone
        RenderMarkerDistance = 5.0,  -- How far the interact zone marker is rendered
    },

    Editor = {
        DEFAULT_BANNER_SCALE       = 1.0, -- Default scale for the banner.
        SCALE_FACTOR               = 0.2, -- How much scale is increased/decreased when using mouse wheel.

        MIN_HEIGHT                 = 500, -- Min height for in editor (in pixels)
        MAX_HEIGHT                 = 3000, -- Max height for in editor (in pixels)
        MIN_WIDTH                  = 500, -- Min width for in editor (in pixels)
        MAX_WIDTH                  = 4000, -- Max width for in editor (in pixels)

        -- Not recommended to change these values
        MIN_BANNER_SCALE           = 1.0,  -- Min scale for the banner in editor
        MAX_BANNER_SCALE           = 2.0,  -- Max scale for the banner in editor

        CLOSE_TO_ANY_BANNER_CHECK  = 2.5,  -- Used for checking closest placed banner.
        CHECK_SURFACE_DIST         = 8.0,  -- How far player can be from the surface to see preview of the banner in editor.
        CHECK_EDITOR_RAYCAST_RANGE = 30.0, -- How far the raycast is perfomed from player camera when in editor.

        KEYS                       = {
            ExitEditor = 'BACK',
            ExitEditorKeyName = 'Backspace',
            CreateBanner = 'E',
            CreateBannerKeyName = 'E',
            ScaleBannerUp = 'IOM_WHEEL_UP',       -- Help keys
            ScaleBannerUpKeyName = 'WheelUp',     -- Help keys
            ScaleBannerDown = 'IOM_WHEEL_DOWN',   -- Help keys
            ScaleBannerDownKeyName = 'WheelDown', -- Help keys
        }
    },


    Jobs = {
        Boss = {
            IncludeSecondHighestAsBoss = false,
        }
    },
    
    Experimental = {
        DisableUnload = false,
        Vehicle =  {
            Enable = false, -- This allow to enable/disable improve performance when vehicle is speeding >= Speed then it will not load any banners around player in vehicle.
            Speed = 100,
        },

        Performance =  {
            Enable = false, -- This allow to enable/disable improve performance when billboard is not visible
        },

        ViewConeBillboardMode = false,
        ViewCone = {
            Angle = 180.0,
            Range = 300.0,
            Height = 300.0,
        },
    },
}

Jobs = {
    ['printers'] = {
        grades = {
            {
                isBoss = true,
                name = "boss",
                label = "Boss",
                grade = 4,
            },
            {
                name = "manager",
                label = "Manager",
                grade = 3,
            },
            {
                name = "novice",
                label = "Novice",
                grade = 2,
            },
            {
                name = "member",
                label = "Member",
                grade = 1,
            }
        }
    },
    ['gov'] = {
        grades = {
            {
                isBoss = true,
                name = "boss",
                label = "Boss",
                grade = 4,
            },
            {
                name = "manager",
                label = "Manager",
                grade = 3,
            },
            {
                name = "novice",
                label = "Novice",
                grade = 2,
            },
            {
                name = "member",
                label = "Member",
                grade = 1,
            }
        }
    }
}