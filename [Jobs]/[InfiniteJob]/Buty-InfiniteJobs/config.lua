local esxHas = GetResourceState('es_extended') == 'started'
local qbHas = GetResourceState('qb-core') == 'started'
Locales = Locales or {}

Configuration = {
    Framework = esxHas and 'esx' or qbHas and 'qb' or 'esx',
    Mysql = 'oxmysql', -- Database type: 'oxmysql', 'mysql-async', or 'ghmattisql'
    UseTarget = false, -- -- Activate it if you want to use target. Set to false if you want floating text
    Language = 'en', -- 'en' or 'es' by default (you can create more)
    JobForID = false, -- Do you want the jobs to be by database, i.e police?
    UseClothes = false,
    EquipToolAutomatically = false, -- If true,the tool will automatically equip when you need it, if false, you will have to use the key to equip it when you need it
    toolbelt = false, -- If true, then the tool will be visible on your belt when you unequip it, if false it will be invisible on your belt
    RequireJobFromAllGroup = true, -- If true, all group members must have the job; if false, only the leader needs the job (esto solo funcionara si JobForID = true)
    Limit_work = {use=false, totalwork=2 , WorkTime=10},
    ZoomandCameras = true, -- disable cameras and zooms
    Color_UI = "#3787ffff",
    Color_Marker = {106, 3, 247},
    Maxlevel = 1, -- maximum number of levels they can reach
    ControlKey_TakeObj = 73, -- Change the key with which objects in the trunk are grabbed to process (Default: X)
    split_lobby_payment = false, -- true: the payment will be divided among the players on the team, false: it will pay all players in the lobby the entire amount.
    UseCitizenID = false, -- ** ONLY FOR QB CORE ** true: The ID to invite your friends will be the citizenID.
} 

JobCenter = {
    {
        coord = vec4(-1082.041, -245.296, 37.763, 209.191), 
        model = "cs_barry",
        jobs = {},
    },
}

Config_Sell = {

    activate = false,

    CreateNPC = {
        {model = "cs_joeminuteman", coord = vec4(1549.2064, 2193.1531, 78.8437, 60.7733)},
        {model = "cs_joeminuteman", coord = vec4(1546.3419, 2199.2021, 78.7436, 17.6115)},
        {model = "cs_joeminuteman", coord = vec4(1542.6492, 2193.8923, 78.8395, 141.4520)},
        {model = "cs_joeminuteman", coord = vec4(1556.7509, 2198.4910, 78.9155, 272.3318)},
    },

    wholesale = 3000,
    retail = 10,

    paymentmethod = {
        option = "cash", -- cash/bank/item
        item_name = "" -- if you use <option = "item"> then put here the name of the item you will pay with.
    },

    items = {
        { 
            img = "./img/item.png", 
            name = "meth", 
            label = "wood", 
            price = {
                wholesale = {min = 2, max = 20},
                retail = {min = 2, max = 120},
            } 
        },
        { 
            img = "./img/item.png", 
            name = "meth",
            label = "Stone", 
            price = {
                wholesale = {min = 2, max = 20},
                retail = {min = 2, max = 120},
            } 
        },
    }
}

