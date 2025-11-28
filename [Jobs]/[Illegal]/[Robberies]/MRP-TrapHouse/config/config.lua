Config = Config or {}
Loc = {}

-- //////////////////////////////////////////////////
-- ///////////////// Our Discord ////////////////////
-- //////// https://discord.gg/bJNxYDAm5u ///////////
-- //////////////////////////////////////////////////

Config = {
    debug = false, -- Shows polyzones created inside the game
    Lan = 'en', -- Translation, 'en' 'pl' 'de' 'da' 'fr' 'in' 'am' 'ph' 'no' 'nl' 'ja' 'da' 'ru' 'gr' 'se' 'lt' 'ar' 'bg' 'bs', 'cn', 'cs', 'ee', 'en', 'es', 'et', 'fa', 'fi', 'ge', 'he', 'hu', 'id', 'is', 'it', 'lv', 'pt', 'pt-br', 'ro', 'rs', 'sl', 'sv', 'th', 'tr', 'vn'
    Framework = 'qbox', -- 'qb-core' 'qbox' 'esx' or 'custom'
    Core = {resource = "qb-core", name = "QBCore", abbrev = "qb"}, -- (QBCore Only) If you arent using qb-core no need to change anything here
    ESX = "new", -- (only for ESX users) "new" or "old" chosoe the version of ESX you are using
    Inventory = "ox", -- "ox" "qs" "qb" "codem" "tgiann" "esx" "lj" "ps", if you arent using any of these inventories, put it as "other" and you will need to edit the inventory export function, or open a ticket on discord.
    Dispatch = "cd", -- "ps" "cd" "qs" "origen" "tk" "codem" "rcore" "l2s" "redutzu" "lb" "sonoran" or "outlaw", if you arent using any of these dispatch systems, put it as "other" and you will need to edit the dispatch export function, or open a ticket on discord.
    Notification = "ox", -- "ox" or "qb" or "esx"
    Progressbar = "ox", -- "ox" or "qb"

    Target = 'ox_target', -- Target name
    WorldInteract = false, -- Enable/Disable World Interaction

    TestingMode = false, -- Enable/Disable Testing Mode (No Minigames)

    DiscordLogStatus = true, -- Choose whether u want to turn on discord logs or not, you need to add a webhook below for it to work
    -- To add your webhook go to opensource -> server, line 1 and add your webhook there

    Drawtext = "OX", -- OLDQB for old qb-drawtext, QB for new qbcore drawtext, OX for ox_lib
    DrawTextZoneSize = vec3(0.8, 0.8, 2), -- Size of the drawtext zone
    DrawTextRotation = 70.0, -- Rotation of the drawtext zone
    Interaction = { -- true for target, false for drawtext
        ["Button"] = 38, -- [E] by default

        ["Npc"] = false,
        ["Key"] = true,
        ["Keypad"] = true,
        ["Gate"] = true,
        ["Coke"] = true,
        ["CokeBags"] = true,
        ["Safe"] = true,
        ["C4Safe"] = true,
        ["Document"] = true,
    },

    PoliceJobs = {["police"] = true}, -- Jobs that can receive the dispatch
    MinimumPolice = 4, -- Minimum police required to start the robbery

    ResetHeist = 180, -- (Minutes) Time to reset the heist after a robbery
    AllRobberiesCooldown = false, -- For this to work you need to download projectx-utility from our github

    DisableC4Explosion = false, -- Disable the C4 explosion effects
    DisableTheNeedForGrenades = false, -- Disable the need for grenades to blow up the safe
    DisableBurntDocuments = true, -- Disable the burnt documents after the safe is blown up (Loud Approach)

    -- Progression item (Item that can be obtained at the end of the heist, can be used for the next heist) 
    Bonus = {
        Status = true, -- Enable/Disable Bonus items
        BonusChance = 60, -- Chance of an item being given
        ItemCount = 1, -- How many items can be given from the table below
        Items = { -- You can remove items and add items as you wish
            {Name = "laundromatkey", Chance = 30, Amount = {min = 1, max = 1}}, -- Chance(%) -- Amount(Items given from that type)
            {Name = "x_laptop", Chance = 20, Amount = {min = 1, max = 1}}, 
            
        },
    },

    -- Skill System
    SkillSystem = false, -- If want to use a skill system to initiate the heist set this to true
    MinimumLevel = 10, -- Minimum level required to start the heist
    ServerSideEvents = true, -- If you use a server sided skill events set this to true, if you use a client sided skill events set this to false

    -- Evidence and Stress Systems
    Evidence = {
        ["Status"] = true, -- Choose whether you want to have evidence dropped on the crime scene
        ["Chance"] = 50, -- Chance of fingerprints on the crime scene
    },

    Stress = { -- Stress gets applied on minigames failing only
        ["Status"] = true, -- Choose whether you want to have stress system
        ["Chance"] = 90, -- Chance of stress on the crime scene
        ["Amount"] = {min = 1, max = 3}, -- Amount of stress applied
    },

    DispatchLocation = { -- Choose where the alarm gets triggered, only one should be picked
        ["Keypad"] = true,
        ["Coke"] = true,
    },

    Password = { -- Password for the computer
        ["Password"] = {min = 1000, max = 9999}, -- Code range
        ["Header"] = "Door Pin", -- Change Translation
        ["Content"] = "Pin", -- Change Translation
        ["Input"] = {Title = 'Pin', Label = 'Door Pin', Description = 'Enter the pin', Icon = 'fas fa-lock'}, -- Change Translation
    },

    -- Stealth
    StealthScore = 100, -- If a player reaches this score, the alarm will be enabled (Increment to make it easier or decrement to make it harder)
    WearingShoes = 0.10, -- (Every step taken) Adds this amount to the stealth score if the player is wearing shoes every
    SilencedWeapon = 20.0, -- (Every shot) Adds this amount to the stealth score if the player is using a silenced weapon
    Crouching = 0.005, -- (Every step taken) Adds this amount to the stealth score if the player is crouching
    Jumping = 20.0, -- (Every jump) Adds this amount to the stealth score if the player is jumping
    Sprinting = 1.5, -- (Every step taken) Adds this amount to the stealth score if the player is sprinting
    Running = 3.0, -- (Every step taken) Adds this amount to the stealth score if the player is running

    -- Durations
    NotificationDuration = 2500, -- Notification duration

    NpcDuration = 3000, -- Duration for obtaining the pin
    KeyDuration = 6000, -- Duration for inserting the key
    KeypadDuration = 6000, -- Duration for entering the pin
    CokeDuration = 6000, -- Duration for picking up coke
    CokeBagDuration = 6000, -- Duration for picking up coke bags
    PackageDuration = 6000, -- Duration for picking up the package
}

Config.Npc = {
    Npc = vector4(274.26, -1760.28, 0.0, 315.74),
    Model = "g_m_y_armgoon_02",
    Animation = "WORLD_HUMAN_AA_SMOKE",
    CodeLength = {min = 1000, max = 9999},
    CodeHeader = "Traphouse pin", -- Change Translation
    CodeContent = "Pin", -- Change Translation
    CodeInput = {Title = 'Pin', Label = 'Pin', Description = 'Enter the pin', Icon = 'fas fa-lock'}, -- Change Translation
}

Config.TraphouseSteps = {
    ["Npc"] = {
        name = "Npc",
        label = "Chat with gang member", -- Text that appears when you target
        coords = vector3(274.26, -1760.28, 0.0),
        drawtext = vector3(274.62, -1759.91, 0.0),
        distance = 1.0, -- How far will you be able to interact with it
        icon = "fas fa-comment", -- Icon
        size = 0.7, -- Circle Zone size
    },

    ["Key"] = {
        name = "Key",
        label = "Insert Key", -- Text that appears when you target
        coords = vector3(500.6, -1813.87, 28.9), -- Circle Zone Coords
        drawtext = vector3(500.67, -1813.25, 28.89),
        distance = 1.0, -- How far will you be able to interact with it
        icon = "fas fa-key", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Keypad"] = {
        name = "Keypad",
        label = "Enter pin", -- Text that appears when you target
        coords = vector3(501.479, -1813.15, 29.10), -- Circle Zone Coords
        drawtext = vector3(501.23, -1812.99, 28.89),
        distance = 1.0, -- How far will you be able to interact with it
        icon = "fas fa-keyboard", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Gate"] = {
        name = "Gate",
        label = "Plant C4", -- Text that appears when you target
        coords = vector3(500.36, -1815.07, 29.2), -- Circle Zone Coords
        drawtext = vector3(500.15, -1814.87, 28.9),
        distance = 1.0, -- How far will you be able to interact with it
        icon = "fas fa-bomb", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Coke1"] = {
        name = "Coke1",
        label = "Pick up coke package", -- Text that appears when you target
        coords = vector3(508.38, -1819.59, 28.88), -- Circle Zone Coords
        drawtext = vector3(508.75, -1819.07, 28.9),
        distance = 1.0, -- How far will you be able to interact with it
        icon = "fas fa-joint", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Coke2"] = {
        name = "Coke2",
        label = "Pick up coke package", -- Text that appears when you target
        coords = vector3(509.66, -1815.93, 28.84), -- Circle Zone Coords
        drawtext = vector3(509.15, -1816.54, 28.9),
        distance = 1.0, -- How far will you be able to interact with it
        icon = "fas fa-joint", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Coke3"] = {
        name = "Coke3",
        label = "Pick up coke package", -- Text that appears when you target
        coords = vector3(513.3, -1819.2, 28.55), -- Circle Zone Coords
        drawtext = vector3(512.33, -1818.77, 28.9),
        distance = 1.0, -- How far will you be able to interact with it
        icon = "fas fa-joint", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Coke4"] = {
        name = "Coke4",
        label = "Pick up coke package", -- Text that appears when you target
        coords = vector3(505.8, -1818.91, 28.37), -- Circle Zone Coords
        drawtext = vector3(506.41, -1818.94, 28.9),
        distance = 1.0, -- How far will you be able to interact with it
        icon = "fas fa-joint", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["CokeBags"] = {
        name = "CokeBags",
        label = "Pick up coke bags", -- Text that appears when you target
        coords = vector3(508.66, -1815.42, 28.84), -- Circle Zone Coords
        drawtext = vector3(508.33, -1815.87, 28.9),
        distance = 1.0, -- How far will you be able to interact with it
        icon = "fas fa-joint", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Safe"] = {
        name = "Safe",
        label = "Unlock Safe", -- Text that appears when you target
        coords = vector3(506.78, -1813.75, 28.89), -- Circle Zone Coords
        drawtext = vector3(506.86, -1814.33, 28.9),
        distance = 1.0, -- How far will you be able to interact with it
        icon = "fas fa-lock", -- Icon
        size = 0.5, -- Circle Zone size
    },

    ["C4Safe"] = {
        name = "C4Safe",
        label = "Plant C4", -- Text that appears when you target
        coords = vector3(506.83, -1813.93, 28.9), -- Circle Zone Coords
        drawtext = vector3(506.86, -1814.33, 28.9),
        distance = 1.0, -- How far will you be able to interact with it
        icon = "fas fa-bomb", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Document"] = {
        name = "Document",
        label = "Pickup document", -- Text that appears when you target
        coords = vector3(506.83, -1813.93, 28.9), -- Circle Zone Coords
        drawtext = vector3(506.86, -1814.33, 28.9),
        distance = 1.0, -- How far will you be able to interact with it
        icon = "fas fa-file-lines", -- Icon
        size = 0.4, -- Circle Zone size
    },

    ["Package"] = {
        name = "Package",
        label = "Open package", -- Text that appears when you target
        coords = vector3(507.8, -1819.32, 28.28), -- Circle Zone Coords
        drawtext = vector3(507.46, -1819.72, 28.9),
        distance = 1.0, -- How far will you be able to interact with it
        icon = "fas fa-box-archive", -- Icon
        size = 0.3, -- Circle Zone size
    },
}

Config.Items = {
    ["Key"] = "traphousekey",
    ["USB"] = "x_device",
    ["USB2"] = "x_device_pin",
    ["Document"] = "x_document",
    ["C4"] = "weapon_stickybomb",
    ["Stethoscope"] = "x_stethoscope",
}

Config.ItemsBreak = {
    ["Stethoscope"] = 70, -- Percentage of item getting broken on use
}

Config.Safe = {
    ["GetReward"] = true, -- Enable/Disable getting a reward from the safe (other than the document)
    ['Cash'] = false, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "dirtymoney", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 120000, max = 180000}, -- Cash that is recieved from each cash stack, if you have ["ObtainPerPickup"] set to false, this will be the amount of cash you recieve at the end of the trolley animation
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.Package = {
    ['Item'] = "x_harddrive", -- Coke package item name
    ['Amount'] = {min = 1, max = 1}, -- Amount of coke packages you recieve from each pickup (4 in total)
}

Config.Coke = {
    ['Item'] = "kq_cocaine_brick", -- Coke package item name
    ['Amount'] = {min = 1, max = 2}, -- Amount of coke packages you recieve from each pickup (4 in total)
}

Config.CokeBags = {
    ['Item'] = "coke", -- Coke bag item name
    ['Amount'] = {min = 1, max = 4}, -- Amount of coke bags you recieve from each bag (3 in total, this will play 3 times)
}

Config.Props = {
    ["Coke1"] = {ObjectHash = "prop_drug_package_02", x = 508.38, y = -1819.59, z = 28.88, heading = 2.98, rotx = 0.0, roty = 0.0, rotz = 137.39},
    ["Coke2"] = {ObjectHash = "prop_drug_package_02", x = 509.66, y = -1815.93, z = 28.84, heading = 2.98, rotx = 0.0, roty = 0.0, rotz = 137.39},
    ["Coke3"] = {ObjectHash = "prop_drug_package_02", x = 513.3, y = -1819.2, z = 28.55, heading = 68.33, rotx = 0.0, roty = 0.0, rotz = 137.39},
    ["Coke4"] = {ObjectHash = "prop_drug_package_02", x = 505.8, y = -1818.91, z = 28.37, heading = 239.36, rotx = 0.0, roty = 0.0, rotz = 137.39},
    ["CokeBag1"] = {ObjectHash = "xm3_prop_xm3_bag_coke_01a", x = 508.66, y = -1815.42, z = 28.84, heading = 137.39, rotx = 90.0, roty = 0.0, rotz = 137.39},
    ["CokeBag2"] = {ObjectHash = "xm3_prop_xm3_bag_coke_01a", x = 508.49, y = -1815.34, z = 28.84, heading = 355.5, rotx = 90.0, roty = 180.0, rotz = 137.39},
    ["CokeBag3"] = {ObjectHash = "xm3_prop_xm3_bag_coke_01a", x = 508.74, y = -1815.63, z = 28.84, heading = 281.96, rotx = 90.0, roty = 180.0, rotz = 137.39},
}

Config.Sounds = {
    ["DoorUnlockSound"] = 'DoorOpen', -- The sound that is played when unlocking doors
    ["DoorUnlockSoundVolume"] = 2.0, -- The volume of the sound that is played
    ["DoorUnlockSoundDistance"] = 3.0, -- The distance that the sound reaches
    ["BombBeeping"] = 'heartmonbeat', -- The sound that is played when the bomb is beeping
    ["BombBeepingSoundVolume"] = 3.0, -- The volume of the sound that is played
    ["BombBeepingSoundDistance"] = 15.0, -- The distance that the sound reaches
}

Config.Peds = {
    ["Ped1"] = {
        Status = true, -- Set whether you want to spawn this ped or not
        Model = "g_m_y_mexgoon_01", -- ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(512.55, -1820.05, 29.47, 48.93), -- You can change his location (only choose locations in the backhallway and security room)
    },
    ["Ped2"] = {
        Status = true, -- Set whether you want to spawn this ped or not
        Model = "g_f_y_lost_01", -- ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(511.79, -1820.79, 29.47, 48.2), -- You can change his location (only choose locations in the backhallway and security room)
    },
    ["Ped3"] = {
        Status = true, -- Set whether you want to spawn this ped or not
        Model = "g_m_y_pologoon_01", -- ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(502.96, -1818.86, 29.35, 51.75), -- You can change his location (only choose locations in the backhallway and security room)
    },
    ["Ped4"] = {
        Status = true, -- Set whether you want to spawn this ped or not
        Model = "g_f_importexport_01", -- ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(503.92, -1812.33, 28.9, 172.48), -- You can change his location (only choose locations in the backhallway and security room)
    },
    ["Ped5"] = {
        Status = true, -- Set whether you want to spawn this ped or not
        Model = "g_m_y_armgoon_02", -- ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(496.79, -1816.98, 28.5, 356.89), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 	453432689, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
    ["Ped6"] = {
        Status = true, -- Set whether you want to spawn this ped or not
        Model = "g_m_y_armgoon_02", -- ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(492.47, -1813.42, 28.43, 301.37), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 	453432689, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
    ["Ped7"] = {
        Status = true, -- Set whether you want to spawn this ped or not
        Model = "g_f_importexport_01", -- ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(482.91, -1795.82, 28.47, 241.85), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 	453432689, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
    ["Ped8"] = {
        Status = true, -- Set whether you want to spawn this ped or not
        Model = "g_m_y_pologoon_01", -- ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(504.78, -1795.6, 28.49, 147.61), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 	453432689, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
    ["Ped9"] = {
        Status = true, -- Set whether you want to spawn this ped or not
        Model = "g_m_y_pologoon_01", -- ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(513.63, -1805.06, 28.52, 141.92), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 	453432689, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
    ["Ped10"] = {
        Status = true, -- Set whether you want to spawn this ped or not
        Model = "g_m_y_mexgoon_01", -- ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(518.73, -1810.31, 28.5, 93.15), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 	453432689, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
    ["Ped11"] = {
        Status = true, -- Set whether you want to spawn this ped or not
        Model = "g_m_y_mexgoon_01", -- ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(515.12, -1817.18, 28.5, 53.43), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 	453432689, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
}

Config.PedOptions = { -- Those options are applied for all the peds
    ["MaxHealth"] = 100, -- 0-200
    ["Health"] = 200, -- 0-200
    ["Armour"] = 100, -- 0-100
    ["CombatMovement"] = 1,
    ["CombatRange"] = 2,
    ["Accuracy"] = 100, -- 0-100
    ["CombatAbility"] = 100,
    ["SeeingRange"] = 150.0,
    ["HearingRange"] = 150.0,
    ["Alertness"] = 3,
}

Config.MaleNoGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [16] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true}
Config.FemaleNoGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true}
Config.UseDecor = false
Config.Decorname = "SpawnedPed"

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-- |   |   |   |   |   |   |   |   |   |   |    DO NOT TOUCH ANYTHING UNDER THIS LINE  |   |   |   |   |   |   |   |   |   |   |    |
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

Config.Steps = {}
Config.ExtraSteps = {}
Config.Tasks = {}

Config.SpawnedPeds = {}
Config.DoorStates = {} -- Sync
Config.DoorList = {
	{
        objCoords = vector3(499.66, -1813.17, 29.0),
        objHash = 1413743677,
        objYaw = 140.4,
        locked = true,
	},
}