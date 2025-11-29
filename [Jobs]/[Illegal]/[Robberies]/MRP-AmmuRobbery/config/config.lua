Config = Config or {}
Loc = {}

-- //////////////////////////////////////////////////
-- ///////////////// Our Discord ////////////////////
-- //////// https://discord.gg/bJNxYDAm5u ///////////
-- //////////////////////////////////////////////////

Config = {
    debug = false, -- Shows polyzones created inside the game
    Lan = 'en', -- Translation, 'en' 'pl' 'de' 'da' 'fr' 'in' 'am' 'ph' 'no' 'nl' 'ja' 'da' 'ru' 'gr' 'se' 'lt' 'ar' 'bg' 'bs', 'cn', 'cs', 'ee', 'el', 'en', 'es', 'et', 'fa', 'fi', 'ge', 'he', 'hu', 'id', 'is', 'it', 'lv', 'pt', 'pt-br', 'ro', 'rs', 'sl', 'sv', 'th', 'tr', 'vn'
    Framework = 'qbox', -- 'qb-core' 'qbox' 'esx' or 'custom'
    Core = {resource = "qb-core", name = "QBCore", abbrev = "qb"}, -- (QBCore Only) If you arent using qb-core no need to change anything here
    ESX = "new", -- (only for ESX users) "new" or "old" chosoe the version of ESX you are using
    Inventory = "ox", -- "ox" "qs" "qb" "codem" "tgiann" "esx" "lj" "ps", if you arent using any of these inventories, put it as "other" and you will need to edit the inventory export function, or open a ticket on discord.
    Dispatch = "cd", -- "ps" "cd" "qs" "origen" "tk" "codem" "rcore" "l2s" "redutzu" "lb" "sonoran" or "outlaw", if you arent using any of these dispatch systems, put it as "other" and you will need to edit the dispatch export function, or open a ticket on discord.
    Notification = "ox", -- "ox" or "qb" or "esx"
    Progressbar = "ox", -- "ox" or "qb"

    Target = 'ox_target', -- Target name, leave it as qb-target if you are using ox_target
    WorldInteract = false, -- Enable/Disable World Interactions (Only use this if you have the interact script, otherwise leave it as false)

    TestingMode = false, -- Enable/Disable Testing Mode

    DiscordLogStatus = true, -- Choose whether u want to turn on discord logs or not, you need to add a webhook below for it to work
    -- To add your webhook go to opensource -> server, line 1 and add your webhook there

    Cooldown = {
        Global = true, -- Global cooldown (Set to false to have individual cooldowns on stores, true to have cooldowns on all stores when one is robbed)
        Timer = 180, -- (Minutes) timer duration
    },

    PoliceJobs = {["police"] = true}, -- Jobs that can receive the dispatch
    MinimumPolice = 4, -- Minimum police required to start the robbery

    RequireBag = true, -- If you want to require a bag to rob crates
    AllRobberiesCooldown = false, -- For this to work you need to download projectx-utility from our github
    DisableParticles = false, -- Disable particles on the robbery

    -- Progression item (Item that can be obtained at the end of the heist, can be used for the next heist) 
    Bonus = {
        Status = true, -- Enable/Disable Bonus items
        BonusChance = 60, -- Chance of an item being given
        ItemCount = 1, -- How many items can be given from the table below
        Items = { -- You can remove items and add items as you wish
            {Name = "x_device", Chance = 40, Amount = {min = 1, max = 2}}, -- Chance(%) -- Amount(Items given from that type)
            {Name = "x_phone", Chance = 30, Amount = {min = 1, max = 1}},
            {Name = "x_hammer", Chance = 20, Amount = {min = 1, max = 1}},
            {Name = "fleecacard ", Chance = 10, Amount = {min = 1, max = 1}},
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

    CratePassword = {
        ["Header"] = "Code", -- Change Translation
        ["Drawer"] = "Crate Code", -- Change Translation
        ["Code1"] = "First half of the code", -- Change Translation
        ["Code2"] = "Second half of the code", -- Change Translation
        ["Input"] = {Title = 'Code', Label = 'Password', Description = 'Enter the code', Icon = 'fas fa-lock'}, -- Change Translation
    },

    -- Drawtext and Target options 
    Drawtext = "OX", -- OLDQB for old qb-drawtext, QB for new qbcore drawtext, OX for ox_lib
    DrawTextZoneSize = vec3(0.8, 0.8, 2), -- Size of the drawtext zone
    Interaction = { -- true = target, false = drawtext
        ["Button"] = 38, -- [E] by default

        ["Fusebox"] = true,
        ["Register"] = true,
        ["Keypad"] = true,
        ["Employee"] = true,
        ["Computer"] = true,
        ["Code"] = true,
        ["Timer"] = true,
        ["Loot"] = true
    },

    -- Durations 
    NotificationDuration = 2500, -- Duration of the displayed notifications

    FuseboxDuration = 6000,
    RegisterDuration = 15000,
    USBDuration = 6000,
    Computer1Duration = 6000,
    Computer2Duration = 6000,
    DoorDuration = 6000,
    CrateDuration = 10000,
    ExplosiveDuration = 10000,
    ArmorDuration = 3000,
    GrabbingDuration = 1500,
    GunDuration = 1500,
    AmmoBoxesDuration = 3000,
    KeypadDuration = 6000,
    TimerDuration = 6000,
}

Config.Items ={
    ["Circuit"] = "x_circuittester", -- For the Fuseboxes
    ["TrojanUSB"] = "x_trojanusb", -- Item that is required before the robbery
    ["TrojanUSB2"] = "x_trojanusb2", -- Item obtained within the robbery
    ["Lockpick"] = "advancedlockpick", -- For the Registers
    ["Bag"] = "bag", -- For picking up loot
    ["Key"] = "ammunation_key", -- progression item
    ["Phone"] = "x_phone", -- For the Computers
}

Config.ItemsBreak ={
    ["Circuit"] = 100, -- % Break Chance
    ["Device"] = 70, -- % Break Chance
    ["Lockpick"] = 100, -- % Break Chance
    ["Phone"] = 80, -- % Break Chance
}

Config.ShootingRanges = {"CypressFlats", "PillboxHill"} -- Add/Remove Shooting Ranges here
Config.GunStores = {"PaletoBay", "Hawick", "LaMesa", "SandyShores", "LittleSeoul", "MorningWood", "GreatChaparral", "Chumash", "TataviamMountains"} -- Add/Remove Gun Stores here
Config.AllStores = {"PillboxHill", "CypressFlats", "PaletoBay", "Hawick", "LaMesa", "SandyShores", "LittleSeoul", "MorningWood", "GreatChaparral", "Chumash", "TataviamMountains"} -- Add/Remove Stores here according to what you changed above

Config.Stores = {
    ["PillboxHill"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(17.19, -1115.31, 30.97),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["Register1Rotation"] = 160.00,
        ["Register2Rotation"] = 249.0,
        ["KeypadCoords"] = vector4(6.75, -1101.11, 30.0, -25.0),
        ["LaptopCoords"] = vector4(7.08, -1109.57, 29.91, -163.00),

        ["NPCs"] = {
            ["Employee"] = {Model = "a_m_m_socenlat_01", Coords = vector4(17.67, -1107.77, 28.8, 157.29)},
        },

        ["DrawTextRotation"] = 0.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text 
                coords = vector3(15.01, -1114.7, 29.8), -- Target coords
                drawtext = vector3(14.91, -1114.87, 29.79),
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Target size
            },

            ["Employee"] = {
                name = "Employee",
                label = "Intimidate employee", -- Text 
                coords = vector3(17.67, -1107.77, 30.2), -- Target coords
                drawtext = vector3(16.99, -1109.32, 29.8),
                distance = 1.5, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.5, -- Target size
            },

            ["Register1"] = {
                name = "Register1",
                label = "Break into register", -- Text 
                coords = vector3(18.49, -1109.05, 29.87), -- Target coords
                drawtext = vector3(18.83, -1108.17, 29.8),
                distance = 1.0, -- Target distance
                icon = "fab fa-keycdn", -- Icon
                size = 0.3, -- Target size
            },

            ["Register2"] = {
                name = "Register2",
                label = "Break into register", -- Text 
                coords = vector3(19.92, -1107.15, 30.05), -- Target coords
                drawtext = vector3(19.28, -1106.86, 29.8),
                distance = 1.0, -- Target distance
                icon = "fab fa-keycdn", -- Icon
                size = 0.3, -- Target size
            },

            ["Computer1"] = {
                name = "Computer1",
                label = "Obtain password", -- Text 
                coords = vector3(7.08, -1109.57, 29.91), -- Target coords
                drawtext = vector3(6.91, -1108.89, 29.8),
                distance = 1.0, -- Target distance
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Target size
            },

            ["Computer2"] = {
                name = "Computer2",
                label = "Obtain password", -- Text 
                coords = vector3(7.08, -1109.57, 29.91), -- Target coords
                drawtext = vector3(6.91, -1108.89, 29.8),
                distance = 1.0, -- Target distance
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Target size
            },

            ["Keypad"] = {
                name = "Keypad",
                label = "Enter Passcode", -- Text 
                coords = vector3(6.75, -1101.11, 30.0), -- Target coords
                drawtext = vector3(6.76, -1101.47, 29.8),
                distance = 1.0, -- Target distance
                icon = "fas fa-keyboard", -- Icon
                size = 0.3, -- Target size
            },

            ["Timer"] = {
                name = "Timer",
                label = "Enter Passcode", -- Text 
                coords = vector3(10.77, -1111.2, 29.79), -- Target coords
                drawtext = vector3(10.91, -1110.96, 29.8),
                distance = 1.0, -- Target distance
                icon = "fas fa-keyboard", -- Icon
                size = 0.3, -- Target size
            },

            ["Code1"] = {
                name = "Code1",
                label = "Read slippet", -- Text 
                coords = vector3(14.72, -1104.45, 29.75), -- Target coords
                drawtext = vector3(14.59, -1104.79, 29.8),
                distance = 1.0, -- Target distance
                icon = "fas fa-file", -- Icon
                size = 0.4, -- Target size
            },

            ["Code2"] = {
                name = "Code2",
                label = "Read slippet", -- Text 
                coords = vector3(17.39, -1105.37, 29.75), -- Target coords
                drawtext = vector3(17.17, -1105.96, 29.8),
                distance = 1.0, -- Target distance
                icon = "fas fa-file", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun1"] = {
                name = "Gun1",
                label = "Grab gun", -- Text 
                coords = vector3(14.18, -1100.38, 29.62), -- Target coords
                drawtext = vector3(14.29, -1099.94, 29.8),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["Ammo1"] = {
                name = "Ammo1",
                label = "Grab ammo", -- Text 
                coords = vector3(14.72, -1100.64, 29.60), -- Target coords
                drawtext = vector3(15.08, -1100.27, 29.8),
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun2"] = {
                name = "Gun2",
                label = "Grab gun", -- Text 
                coords = vector3(15.11, -1096.85, 29.82), -- Target coords
                drawtext = vector3(14.94, -1097.28, 29.8),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["Ammo2"] = {
                name = "Ammo2",
                label = "Grab ammo", -- Text 
                coords = vector3(16.21, -1097.23, 29.82), -- Target coords
                drawtext = vector3(16.17, -1097.69, 29.8),
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Ammo3"] = {
                name = "Ammo3",
                label = "Grab ammo", -- Text 
                coords = vector3(11.60, -1099.49, 29.60), -- Target coords
                drawtext = vector3(11.76, -1099.04, 29.8),
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["ArmorCrate1"] = {
                name = "ArmorCrate1",
                label = "Grab armor", -- Text 
                coords = vector3(10.5, -1088.78, 28.8), -- Target coords
                drawtext = vector3(11.09, -1089.13, 29.8),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["ArmorCrate2"] = {
                name = "ArmorCrate2",
                label = "Grab armor", -- Text 
                coords = vector3(11.42, -1086.26, 28.8), -- Target coords
                drawtext = vector3(12.0, -1086.52, 29.8),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["GunCrate1"] = {
                name = "GunCrate1",
                label = "Grab guns", -- Text 
                coords = vector3(6.67, -1099.29, 29.38), -- Target coords
                drawtext = vector3(7.38, -1099.51, 29.8),
                distance = 1.0, -- Target distance
                icon = "fas fa-boxes-stacked", -- Icon
                size = 0.6, -- Target size
            },

            ["GunCrate2"] = {
                name = "GunCrate2",
                label = "Grab guns", -- Text 
                coords = vector3(11.02, -1087.46, 28.8), -- Target coords
                drawtext = vector3(11.7, -1087.89, 29.8),
                distance = 1.5, -- Target distance
                icon = "fas fa-boxes-stacked", -- Icon
                size = 0.6, -- Target size
            },

            ["ExplosivesCrate"] = {
                name = "ExplosivesCrate",
                label = "Grab explosives", -- Text 
                coords = vector3(9.8, -1101.24, 29.24), -- Target coords
                drawtext = vector3(9.11, -1100.91, 29.8),
                distance = 1.0, -- Target distance
                icon = "fas fa-bomb", -- Icon
                size = 0.7, -- Target size
            },
        },
        
        -------- Don't touch anything under this line --------
        ["Zone"] = {vector3(19.25, -1119.28, 29.56), vector3(43.34, -1076.80, 29.56), vector3(13.94, -1064.35, 29.56), vector3(-10.85, -1108.51, 29.56)}, -- Don't touch
        ["OnCooldown"] = false, -- Don't touch
    },

    ["CypressFlats"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(811.88, -2148.01, 31.71),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["Register1Rotation"] = 0.0,
        ["Register2Rotation"] = 91.0,
        ["KeypadCoords"] = vector4(826.65, -2157.74, 29.67, 177.00),
        ["LaptopCoords"] = vector4(823.36, -2149.95, 29.74, 57.00),

        ["NPCs"] = {
            ["Employee"] = {Model = "a_m_m_socenlat_01", Coords = vector4(814.27, -2155.23, 28.62, 356.6)},
        },

        ["DrawTextRotation"] = 0.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text 
                coords = vector3(814.88, -2148.20, 29.65), -- Target coords
                drawtext = vector3(814.88, -2147.70, 29.46),
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Target size
            },

            ["Employee"] = {
                name = "Employee",
                label = "Intimidate employee", -- Text 
                coords = vector3(814.27, -2155.23, 30.0), -- Target coords
                drawtext = vector3(814.23, -2153.51, 29.62),
                distance = 1.5, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.5, -- Target size
            },

            ["Register1"] = {
                name = "Register1",
                label = "Break into register", -- Text 
                coords = vector3(812.88, -2154.33, 29.74), -- Target coords
                drawtext = vector3(812.89, -2155.24, 29.62),
                distance = 1.0, -- Target distance
                icon = "fab fa-keycdn", -- Icon
                size = 0.3, -- Target size
            },

            ["Register2"] = {
                name = "Register2",
                label = "Break into register", -- Text 
                coords = vector3(812.18, -2156.62, 29.84), -- Target coords
                drawtext = vector3(812.77, -2156.64, 29.62),
                distance = 1.0, -- Target distance
                icon = "fab fa-keycdn", -- Icon
                size = 0.3, -- Target size
            },

            ["Computer1"] = {
                name = "Computer1",
                label = "Obtain password", -- Text 
                coords = vector3(823.36, -2149.95, 29.74), -- Target coords
                drawtext = vector3(824.02, -2150.38, 29.62),
                distance = 1.0, -- Target distance
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Target size
            },

            ["Computer2"] = {
                name = "Computer2",
                label = "Obtain password", -- Text 
                coords = vector3(823.36, -2149.95, 29.74), -- Target coords
                drawtext = vector3(824.02, -2150.38, 29.62),
                distance = 1.0, -- Target distance
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Target size
            },

            ["Keypad"] = {
                name = "Keypad",
                label = "Enter Passcode", -- Text 
                coords = vector3(826.65, -2157.74, 30.01), -- Target coords
                drawtext = vector3(826.71, -2157.45, 29.62),
                distance = 1.0, -- Target distance
                icon = "fas fa-keyboard", -- Icon
                size = 0.3, -- Target size
            },

            ["Timer"] = {
                name = "Timer",
                label = "Enter Passcode", -- Text 
                coords = vector3(819.31, -2149.55, 29.54), -- Target coords
                drawtext = vector3(819.35, -2149.96, 29.62),
                distance = 1.0, -- Target distance
                icon = "fas fa-circle-dot", -- Icon
                size = 0.3, -- Target size
            },

            ["Code1"] = {
                name = "Code1",
                label = "Read slippet", -- Text 
                coords = vector3(818.01, -2157.23, 29.57), -- Target coords
                drawtext = vector3(817.97, -2156.99, 29.62),
                distance = 1.0, -- Target distance
                icon = "fas fa-file", -- Icon
                size = 0.4, -- Target size
            },

            
            ["Code2"] = {
                name = "Code2",
                label = "Read slippet", -- Text 
                coords = vector3(815.19, -2157.26, 29.56), -- Target coords
                drawtext = vector3(815.15, -2156.86, 29.62),
                distance = 1.0, -- Target distance
                icon = "fas fa-file", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun1"] = {
                name = "Gun1",
                label = "Grab gun", -- Text 
                coords = vector3(820.07, -2160.91, 29.55), -- Target coords
                drawtext = vector3(820.1, -2161.41, 29.62),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["Ammo1"] = {
                name = "Ammo1",
                label = "Grab ammo", -- Text 
                coords = vector3(819.33, -2160.85, 29.43), -- Target coords
                drawtext = vector3(819.25, -2161.49, 29.62),
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun2"] = {
                name = "Gun2",
                label = "Grab gun", -- Text 
                coords = vector3(820.16, -2164.75, 29.76), -- Target coords
                drawtext = vector3(820.26, -2164.16, 29.62),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["Ammo2"] = {
                name = "Ammo2",
                label = "Grab ammo", -- Text 
                coords = vector3(819.02, -2164.68, 29.67), -- Target coords
                drawtext = vector3(818.96, -2164.11, 29.62),
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Ammo3"] = {
                name = "Ammo3",
                label = "Grab ammo", -- Text 
                coords = vector3(822.52, -2160.94, 29.43), -- Target coords
                drawtext = vector3(822.54, -2161.48, 29.62),
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["ArmorCrate1"] = {
                name = "ArmorCrate1",
                label = "Grab armor", -- Text 
                coords = vector3(827.29, -2170.3, 28.62), -- Target coords
                drawtext = vector3(826.83, -2170.3, 29.63),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["ArmorCrate2"] = {
                name = "ArmorCrate2",
                label = "Grab armor", -- Text 
                coords = vector3(827.33, -2173.14, 28.62), -- Target coords
                drawtext = vector3(826.67, -2173.1, 29.62),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["GunCrate1"] = {
                name = "GunCrate1",
                label = "Grab guns", -- Text 
                coords = vector3(827.46, -2159.53, 29.2), -- Target coords
                drawtext = vector3(826.71, -2159.44, 29.62),
                distance = 1.0, -- Target distance
                icon = "fas fa-boxes-stacked", -- Icon
                size = 0.6, -- Target size
            },

            ["GunCrate2"] = {
                name = "GunCrate2",
                label = "Grab guns", -- Text 
                coords = vector3(827.33, -2171.69, 28.62), -- Target coords
                drawtext = vector3(826.69, -2171.74, 29.62),
                distance = 1.5, -- Target distance
                icon = "fas fa-boxes-stacked", -- Icon
                size = 0.6, -- Target size
            },

            ["ExplosivesCrate"] = {
                name = "ExplosivesCrate",
                label = "Grab explosives", -- Text 
                coords = vector3(823.77, -2158.64, 29.06), -- Target coords
                drawtext = vector3(824.55, -2158.65, 29.62),
                distance = 1.0, -- Target distance
                icon = "fas fa-bomb", -- Icon
                size = 0.7, -- Target size
            },
        },

        -------- Don't touch anything under this line --------
        ["Zone"] = {vector3(806.05, -2143.76, 29.23), vector3(806.11, -2195.41, 29.23), vector3(829.55, -2196.59, 29.23), vector3(830.11, -2143.49, 29.23)},  -- Don't touch
        ["OnCooldown"] = false, -- Don't touch

    },

    ["PaletoBay"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-325.35, 6076.34, 32.48),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["Register1Rotation"] = 177.00,
        ["Register2Rotation"] = 137.00,

        ["NPCs"] = {
            ["Employee"] = {Model = "a_m_m_socenlat_01", Coords = vector4(-327.1, 6082.22, 30.45, 128.42)},
        },

        ["DrawTextRotation"] = 0.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Cut off wries", -- Text 
                coords = vector3(-326.6, 6074.35, 31.68), -- Target coords
                drawtext = vector3(-326.38, 6074.09, 31.24),
                distance = 1.5, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.4, -- Target size
            },

            ["Employee"] = {
                name = "Employee",
                label = "Intimidate employee", -- Text 
                coords = vector3(-327.1, 6082.22, 31.85), -- Target coords
                drawtext = vector3(-328.29, 6080.94, 31.45),
                distance = 2, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.5, -- Target size
            },

            ["Register1"] = {
                name = "Register1",
                label = "Break into register", -- Text 
                coords = vector3(-326.00, 6080.20, 31.60), -- Target coords
                drawtext = vector3(-326.01, 6081.15, 31.45),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.3, -- Target size
            },

            ["Register2"] = {
                name = "Register2",
                label = "Break into register", -- Text 
                coords = vector3(-328.56, 6082.76, 31.71), -- Target coords
                drawtext = vector3(-328.05, 6083.25, 31.45),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.3, -- Target size
            },

            ["Ammo1"] = {
                name = "Ammo1",
                label = "Grab ammo", -- Text 
                coords = vector3(-329.31, 6083.55, 31.59), -- Target coords
                drawtext = vector3(-328.75, 6083.91, 31.45),
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Ammo2"] = {
                name = "Ammo2",
                label = "Grab ammo", -- Text 
                coords = vector3(-325.89, 6083.45, 31.64), -- Target coords
                drawtext = vector3(-326.21, 6083.09, 31.45),
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun1"] = {
                name = "Gun1",
                label = "Grab weapon", -- Text 
                coords = vector3(-331.56, 6078.24, 30.94), -- Target coords
                drawtext = vector3(-331.36, 6078.81, 31.45),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun2"] = {
                name = "Gun2",
                label = "Grab weapon", -- Text 
                coords = vector3(-329.66, 6087.21, 31.06), -- Target coords
                drawtext = vector3(-329.95, 6086.69, 31.67),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["ArmorCrate1"] = {
                name = "ArmorCrate1",
                label = "Grab armor", -- Text 
                coords = vector3(-334.47, 6081.76, 30.45), -- Target coords
                drawtext = vector3(-334.33, 6082.16, 31.45),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["ArmorCrate2"] = {
                name = "ArmorCrate2",
                label = "Grab armor", -- Text 
                coords = vector3(-334.09, 6081.35, 30.45), -- Target coords
                drawtext = vector3(-333.87, 6081.66, 31.45),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["GunCrate1"] = {
                name = "GunCrate1",
                label = "Grab guns", -- Text 
                coords = vector3(-329.88, 6083.81, 30.44), -- Target coords
                drawtext = vector3(-330.25, 6084.18, 31.45),
                distance = 1.5, -- Target distance
                icon = "fas fa-boxes-stacked", -- Icon
                size = 0.6, -- Target size
            },

            ["Drawer"] = {
                name = "Drawer",
                label = "Search for the code", -- Text 
                coords = vector3(-323.57, 6080.22, 30.84), -- Target coords
                drawtext = vector3(-323.57, 6080.22, 31.84),
                distance = 1.5, -- Target distance
                icon = "fas fa-magnifying-glass", -- Icon
                size = 0.4, -- Target size
            },

        },

        -------- Don't touch anything under this line --------
        ["Zone"] = {vector3(-318.6, 6078.9, 31.37), vector3(-336.48, 6097.39, 31.37), vector3(-346.36, 6087.14, 31.37), vector3(-326.87, 6070.98, 31.37)},  -- Don't touch
        ["OnCooldown"] = false, -- Don't touch
        
    },

    ["Hawick"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(244.28, -45.26, 71.31),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["Register1Rotation"] = 21.00,
        ["Register2Rotation"] = -20.00,

        ["NPCs"] = {
            ["Employee"] = {Model = "a_m_m_socenlat_01", Coords = vector4(248.18, -51.81, 68.94, 334.98)},
        },

        ["DrawTextRotation"] = 0.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Cut off wries", -- Text 
                coords = vector3(266.9, -62.35, 70.05), -- Target coords
                drawtext = vector3(266.79, -62.6, 70.05),
                distance = 1.5, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.4, -- Target size
            },

            ["Employee"] = {
                name = "Employee",
                label = "Intimidate employee", -- Text 
                coords = vector3(248.18, -51.81, 70.34), -- Target coords
                drawtext = vector3(248.59, -50.21, 69.94),
                distance = 2, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.5, -- Target size
            },

            ["Register1"] = {
                name = "Register1",
                label = "Break into register", -- Text 
                coords = vector3(246.62, -50.54, 70.17), -- Target coords
                drawtext = vector3(246.75, -51.31, 69.94),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.3, -- Target size
            },

            ["Register2"] = {
                name = "Register2",
                label = "Break into register", -- Text 
                coords = vector3(249.78, -51.68, 70.20), -- Target coords
                drawtext = vector3(249.64, -52.32, 69.94),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.3, -- Target size
            },

            ["Ammo1"] = {
                name = "Ammo1",
                label = "Grab ammo", -- Text 
                coords = vector3(253.50, -52.31, 70.28), -- Target coords
                drawtext = vector3(253.93, -52.55, 69.94),
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Ammo2"] = {
                name = "Ammo2",
                label = "Grab ammo", -- Text 
                coords = vector3(257.82, -51.78, 69.80), -- Target coords
                drawtext = vector3(257.21, -51.67, 69.94),
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun1"] = {
                name = "Gun1",
                label = "Grab weapon", -- Text 
                coords = vector3(258.63, -47.42, 69.57), -- Target coords
                drawtext = vector3(258.09, -48.11, 69.94),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun2"] = {
                name = "Gun2",
                label = "Grab weapon", -- Text 
                coords = vector3(256.87, -47.06, 69.54), -- Target coords
                drawtext = vector3(257.18, -47.69, 69.94),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["ArmorCrate1"] = {
                name = "ArmorCrate1",
                label = "Grab armor", -- Text 
                coords = vector3(253.58, -55.19, 68.94), -- Target coords
                drawtext = vector3(253.67, -54.75, 69.94),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["ArmorCrate2"] = {
                name = "ArmorCrate2",
                label = "Grab armor", -- Text 
                coords = vector3(254.39, -55.49, 68.94), -- Target coords
                drawtext = vector3(254.48, -55.12, 69.94),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["GunCrate1"] = {
                name = "GunCrate1",
                label = "Grab guns", -- Text 
                coords = vector3(254.52, -51.03, 68.94), -- Target coords
                drawtext = vector3(255.12, -51.15, 69.94),
                distance = 1.5, -- Target distance
                icon = "fas fa-boxes-stacked", -- Icon
                size = 0.6, -- Target size
            },

            ["Drawer"] = {
                name = "Drawer",
                label = "Search for the code", -- Text 
                coords = vector3(243.72, -49.66, 69.0), -- Target coords
                drawtext = vector3(243.72, -49.66, 70.0),
                distance = 1.5, -- Target distance
                icon = "fas fa-magnifying-glass", -- Icon
                size = 0.6, -- Target size
            },

        },

        -------- Don't touch anything under this line --------
        ["Zone"] = {vector3(237.62, -54.28, 69.49), vector3(268.11, -65.68, 69.49), vector3(273.99, -46.03, 69.49), vector3(244.01, -35.58, 69.49)},  -- Don't touch
        ["OnCooldown"] = false, -- Don't touch
        
    },

    ["LaMesa"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(844.08, -1025.34, 29.89),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["Register1Rotation"] = -47.00,
        ["Register2Rotation"] = -89.00,

        ["NPCs"] = {
            ["Employee"] = {Model = "a_m_m_socenlat_01", Coords = vector4(841.17, -1030.2, 27.19, 268.3)},
        },

        ["DrawTextRotation"] = 0.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Cut off wries", -- Text 
                coords = vector3(845.83, -1042.33, 28.4), -- Target coords
                drawtext = vector3(845.83, -1042.62, 27.96),
                distance = 1.5, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.4, -- Target size
            },

            ["Employee"] = {
                name = "Employee",
                label = "Intimidate employee", -- Text 
                coords = vector3(841.17, -1030.2, 28.59), -- Target coords
                drawtext = vector3(842.88, -1030.17, 28.19),
                distance = 2, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.5, -- Target size
            },

            ["Register1"] = {
                name = "Register1",
                label = "Break into register", -- Text 
                coords = vector3(841.79, -1027.91, 28.31), -- Target coords
                drawtext = vector3(841.12, -1028.67, 28.19),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.3, -- Target size
            },

            ["Register2"] = {
                name = "Register2",
                label = "Break into register", -- Text 
                coords = vector3(841.81, -1031.63, 28.45), -- Target coords
                drawtext = vector3(841.19, -1031.59, 28.19),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.3, -- Target size
            },

            ["Ammo1"] = {
                name = "Ammo1",
                label = "Grab ammo", -- Text 
                coords = vector3(841.63, -1032.15, 28.33), -- Target coords
                drawtext = vector3(841.14, -1032.57, 28.19), 
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Ammo2"] = {
                name = "Ammo2",
                label = "Grab ammo", -- Text 
                coords = vector3(839.42, -1030.31, 28.38), -- Target coords
                drawtext = vector3(839.88, -1030.14, 28.19),
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun1"] = {
                name = "Gun1",
                label = "Grab weapon", -- Text 
                coords = vector3(847.13, -1030.50, 27.68), -- Target coords
                drawtext = vector3(846.6, -1031.0, 28.23),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun2"] = {
                name = "Gun2",
                label = "Grab weapon", -- Text 
                coords = vector3(839.41, -1035.56, 27.80), -- Target coords
                drawtext = vector3(839.86, -1035.23, 28.41),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["ArmorCrate1"] = {
                name = "ArmorCrate1",
                label = "Grab armor", -- Text 
                coords = vector3(846.74, -1034.99, 27.21), -- Target coords
                drawtext = vector3(846.26, -1035.14, 28.28),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["ArmorCrate2"] = {
                name = "ArmorCrate2",
                label = "Grab armor", -- Text 
                coords = vector3(846.75, -1034.40, 27.21), -- Target coords
                drawtext = vector3(846.33, -1034.32, 28.2),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["GunCrate1"] = {
                name = "GunCrate1",
                label = "Grab guns", -- Text 
                coords = vector3(841.96, -1033.31, 27.19), -- Target coords
                drawtext = vector3(841.98, -1033.86, 28.19),
                distance = 1.5, -- Target distance
                icon = "fas fa-boxes-stacked", -- Icon
                size = 0.6, -- Target size
            },

            ["Drawer"] = {
                name = "Drawer",
                label = "Search for the code", -- Text 
                coords = vector3(840.16, -1026.01, 27.27), -- Target coords
                drawtext = vector3(840.16, -1026.01, 28.27),
                distance = 1.5, -- Target distance
                icon = "fas fa-magnifying-glass", -- Icon
                size = 0.6, -- Target size
            },

        },

        -------- Don't touch anything under this line --------
        ["Zone"] = {vector3(852.64, -1023.02, 27.89), vector3(833.34, -1022.55, 27.89), vector3(833.91, -1046.93, 27.89), vector3(850.29, -1047.8, 27.89)},  -- Don't touch
        ["OnCooldown"] = false, -- Don't touch
        
    },

    ["SandyShores"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1698.69, 3752.69, 36.27),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["Register1Rotation"] = -179.00,
        ["Register2Rotation"] = 137.00,

        ["NPCs"] = {
            ["Employee"] = {Model = "a_m_m_socenlat_01", Coords = vector4(1696.87, 3758.4, 33.71, 129.96)},
        },

        ["DrawTextRotation"] = 0.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Cut off wries", -- Text 
                coords = vector3(1700.19, 3758.92, 34.96), -- Target coords
                drawtext = vector3(1700.49, 3759.38, 34.43),
                distance = 1.5, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.4, -- Target size
            },

            ["Employee"] = {
                name = "Employee",
                label = "Intimidate employee", -- Text 
                coords = vector3(1696.87, 3758.4, 35.11), -- Target coords
                drawtext = vector3(1695.82, 3757.08, 34.71),
                distance = 2, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.5, -- Target size
            },

            ["Register1"] = {
                name = "Register1",
                label = "Break into register", -- Text 
                coords = vector3(1698.10, 3756.41, 34.82), -- Target coords
                drawtext = vector3(1698.04, 3757.43, 34.71),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.3, -- Target size
            },

            ["Register2"] = {
                name = "Register2",
                label = "Break into register", -- Text 
                coords = vector3(1695.34, 3758.89, 34.97), -- Target coords
                drawtext = vector3(1695.79, 3759.46, 34.71),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.3, -- Target size
            },

            ["Ammo1"] = {
                name = "Ammo1",
                label = "Grab ammo", -- Text 
                coords = vector3(1695.06, 3759.42, 34.85), -- Target coords
                drawtext = vector3(1695.32, 3759.82, 34.71), 
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Ammo2"] = {
                name = "Ammo2",
                label = "Grab ammo", -- Text 
                coords = vector3(1698.13, 3759.84, 34.9), -- Target coords
                drawtext = vector3(1697.72, 3759.36, 34.71),
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun1"] = {
                name = "Gun1",
                label = "Grab weapon", -- Text 
                coords = vector3(1692.55, 3754.29, 34.2), -- Target coords
                drawtext = vector3(1692.77, 3754.83, 34.71),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun2"] = {
                name = "Gun2",
                label = "Grab weapon", -- Text 
                coords = vector3(1694.11, 3763.35, 34.32), -- Target coords
                drawtext = vector3(1693.99, 3762.72, 34.92),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["ArmorCrate1"] = {
                name = "ArmorCrate1",
                label = "Grab armor", -- Text 
                coords = vector3(1689.58, 3757.53, 33.71), -- Target coords
                drawtext = vector3(1689.86, 3757.93, 34.71),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["ArmorCrate2"] = {
                name = "ArmorCrate2",
                label = "Grab armor", -- Text 
                coords = vector3(1689.97, 3757.11, 33.71), -- Target coords
                drawtext = vector3(1690.41, 3757.45, 34.71),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["GunCrate1"] = {
                name = "GunCrate1",
                label = "Grab guns", -- Text 
                coords = vector3(1694.07, 3759.90, 33.71), -- Target coords
                drawtext = vector3(1693.59, 3760.16, 34.71),
                distance = 1.5, -- Target distance
                icon = "fas fa-boxes-stacked", -- Icon
                size = 0.6, -- Target size
            },

            ["Drawer"] = {
                name = "Drawer",
                label = "Search for the code", -- Text 
                coords = vector3(1700.3, 3756.64, 33.81), -- Target coords
                drawtext = vector3(1700.3, 3756.64, 34.81),
                distance = 1.5, -- Target distance
                icon = "fas fa-magnifying-glass", -- Icon
                size = 0.6, -- Target size
            },

        },

        -------- Don't touch anything under this line --------
        ["Zone"] = {vector3(1696.51, 3746.52, 34.14), vector3(1706.06, 3755.31, 34.14), vector3(1689.37, 3771.03, 34.14), vector3(1680.43, 3761.15, 34.14)},  -- Don't touch
        ["OnCooldown"] = false, -- Don't touch
        
    },

    ["LittleSeoul"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-663.96, -943.94, 23.52),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["Register1Rotation"] = 132.00,
        ["Register2Rotation"] = 90.00,

        ["NPCs"] = {
            ["Employee"] = {Model = "a_m_m_socenlat_01", Coords = vector4(-659.09, -938.44, 20.83, 83.45)},
        },

        ["DrawTextRotation"] = 0.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Cut off wries", -- Text 
                coords = vector3(-678.98, -924.3, 23.32), -- Target coords
                drawtext = vector3(-678.98, -923.93, 23.08),
                distance = 1.5, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.4, -- Target size
            },

            ["Employee"] = {
                name = "Employee",
                label = "Intimidate employee", -- Text 
                coords = vector3(-659.09, -938.44, 22.23), -- Target coords
                drawtext = vector3(-660.83, -938.39, 21.83),
                distance = 2, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.5, -- Target size
            },

            ["Register1"] = {
                name = "Register1",
                label = "Break into register", -- Text 
                coords = vector3(-659.81, -940.36, 22.05), -- Target coords
                drawtext = vector3(-659.12, -939.9, 21.83),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.3, -- Target size
            },

            ["Register2"] = {
                name = "Register2",
                label = "Break into register", -- Text 
                coords = vector3(-659.83, -936.96, 22.09), -- Target coords
                drawtext = vector3(-659.13, -936.97, 21.83),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.3, -- Target size
            },

            ["Ammo1"] = {
                name = "Ammo1",
                label = "Grab ammo", -- Text 
                coords = vector3(-660.35, -933.35, 22.17), -- Target coords
                drawtext = vector3(-660.47, -932.76, 21.83), 
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Ammo2"] = {
                name = "Ammo2",
                label = "Grab ammo", -- Text 
                coords = vector3(-662.49, -929.36, 21.69), -- Target coords
                drawtext = vector3(-662.29, -930.01, 21.83),
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun1"] = {
                name = "Gun1",
                label = "Grab weapon", -- Text 
                coords = vector3(-666.87, -930.17, 21.46), -- Target coords
                drawtext = vector3(-666.02, -930.38, 21.83),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun2"] = {
                name = "Gun2",
                label = "Grab weapon", -- Text 
                coords = vector3(-666.57, -931.86, 21.43), -- Target coords
                drawtext = vector3(-666.01, -931.68, 22.04),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["ArmorCrate1"] = {
                name = "ArmorCrate1",
                label = "Grab armor", -- Text 
                coords = vector3(-657.85, -932.10, 20.83), -- Target coords
                drawtext = vector3(-658.3, -932.26, 21.83),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["ArmorCrate2"] = {
                name = "ArmorCrate2",
                label = "Grab armor", -- Text 
                coords = vector3(-657.84, -931.36, 20.83), -- Target coords
                drawtext = vector3(-658.21, -931.33, 21.83),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["GunCrate1"] = {
                name = "GunCrate1",
                label = "Grab guns", -- Text 
                coords = vector3(-662.07, -932.73, 20.83), -- Target coords
                drawtext = vector3(-662.2, -932.14, 21.83),
                distance = 1.5, -- Target distance
                icon = "fas fa-boxes-stacked", -- Icon
                size = 0.6, -- Target size
            },

            ["Drawer"] = {
                name = "Drawer",
                label = "Search for the code", -- Text 
                coords = vector3(-659.54, -943.33, 20.85), -- Target coords
                drawtext = vector3(-659.54, -943.33, 21.85),
                distance = 1.5, -- Target distance
                icon = "fas fa-magnifying-glass", -- Icon
                size = 0.6, -- Target size
            },

        },

        -------- Don't touch anything under this line --------
        ["Zone"] = {vector3(-668.1, -947.33, 23.08), vector3(-653.82, -947.32, 23.08), vector3(-651.26, -919.87, 23.08), vector3(-693.85, -920.55, 23.08)},  -- Don't touch
        ["OnCooldown"] = false, -- Don't touch
        
    },

    ["MorningWood"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-1313.69, -390.43, 38.5),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["Register1Rotation"] = 30.00,
        ["Register2Rotation"] = -15.00,

        ["NPCs"] = {
            ["Employee"] = {Model = "a_m_m_socenlat_01", Coords = vector4(-1309.43, -394.58, 35.7, 341.95)},
        },

        ["DrawTextRotation"] = 0.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Cut off wries", -- Text 
                coords = vector3(-1298.78, -397.1, 36.38), -- Target coords
                drawtext = vector3(-1298.58, -397.35, 36.36),
                distance = 1.5, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.4, -- Target size
            },

            ["Employee"] = {
                name = "Employee",
                label = "Intimidate employee", -- Text 
                coords = vector3(-1309.43, -394.58, 37.1), -- Target coords
                drawtext = vector3(-1309.11, -392.91, 36.7),
                distance = 2, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.5, -- Target size
            },

            ["Register1"] = {
                name = "Register1",
                label = "Break into register", -- Text 
                coords = vector3(-1311.41, -393.40, 36.80), -- Target coords
                drawtext = vector3(-1310.93, -394.27, 36.7),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.3, -- Target size
            },

            ["Register2"] = {
                name = "Register2",
                label = "Break into register", -- Text 
                coords = vector3(-1307.83, -394.28, 36.96), -- Target coords
                drawtext = vector3(-1307.92, -394.95, 36.7),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.3, -- Target size
            },

            ["Ammo1"] = {
                name = "Ammo1",
                label = "Grab ammo", -- Text 
                coords = vector3(-1307.33, -394.62, 36.84), -- Target coords
                drawtext = vector3(-1307.06, -395.16, 36.7), 
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Ammo2"] = {
                name = "Ammo2",
                label = "Grab ammo", -- Text 
                coords = vector3(-1309.80, -396.31, 36.89), -- Target coords
                drawtext = vector3(-1309.83, -395.74, 36.7),
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun1"] = {
                name = "Gun1",
                label = "Grab weapon", -- Text 
                coords = vector3(-1307.56, -388.91, 36.19), -- Target coords
                drawtext = vector3(-1307.33, -389.5, 36.7),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun2"] = {
                name = "Gun2",
                label = "Grab weapon", -- Text 
                coords = vector3(-1304.62, -397.60, 36.31), -- Target coords
                drawtext = vector3(-1304.84, -396.98, 36.91),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["ArmorCrate1"] = {
                name = "ArmorCrate1",
                label = "Grab armor", -- Text 
                coords = vector3(-1303.32, -390.33, 35.7), -- Target coords
                drawtext = vector3(-1303.42, -390.79, 36.7),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["ArmorCrate2"] = {
                name = "ArmorCrate2",
                label = "Grab armor", -- Text 
                coords = vector3(-1303.96, -390.25, 35.7), -- Target coords
                drawtext = vector3(-1303.96, -390.63, 36.7),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["GunCrate1"] = {
                name = "GunCrate1",
                label = "Grab guns", -- Text 
                coords = vector3(-1306.21, -394.50, 35.7), -- Target coords
                drawtext = vector3(-1305.65, -394.52, 36.7),
                distance = 1.5, -- Target distance
                icon = "fas fa-boxes-stacked", -- Icon
                size = 0.6, -- Target size
            },

            ["Drawer"] = {
                name = "Drawer",
                label = "Search for the code", -- Text 
                coords = vector3(-1313.55, -394.35, 35.7), -- Target coords
                drawtext = vector3(-1313.55, -394.35, 36.7),
                distance = 1.5, -- Target distance
                icon = "fas fa-magnifying-glass", -- Icon
                size = 0.6, -- Target size
            },

        },

        -------- Don't touch anything under this line --------
        ["Zone"] = {vector3(-1317.47, -385.91, 36.6), vector3(-1320.74, -396.11, 36.6), vector3(-1294.9, -401.53, 36.6), vector3(-1309.17, -369.51, 36.6)},  -- Don't touch
        ["OnCooldown"] = false, -- Don't touch
        
    },

    ["GreatChaparral"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-1113.23, 2690.88, 20.1),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["Register1Rotation"] = 175.00,
        ["Register2Rotation"] = 130.00,

        ["NPCs"] = {
            ["Employee"] = {Model = "a_m_m_socenlat_01", Coords = vector4(-1113.54, 2698.34, 17.55, 131.24)},
        },

        ["DrawTextRotation"] = 0.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Cut off wries", -- Text 
                coords = vector3(-1126.47, 2693.62, 18.69), -- Target coords
                drawtext = vector3(-1126.58, 2693.77, 18.8),
                distance = 1.5, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.4, -- Target size
            },

            ["Employee"] = {
                name = "Employee",
                label = "Intimidate employee", -- Text 
                coords = vector3(-1113.54, 2698.34, 18.95), -- Target coords
                drawtext = vector3(-1114.86, 2697.24, 18.55),
                distance = 2, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.5, -- Target size
            },

            ["Register1"] = {
                name = "Register1",
                label = "Break into register", -- Text 
                coords = vector3(-1112.57, 2696.34, 18.78), -- Target coords
                drawtext = vector3(-1112.35, 2697.17, 18.55),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.3, -- Target size
            },

            ["Register2"] = {
                name = "Register2",
                label = "Break into register", -- Text 
                coords = vector3(-1114.83, 2698.86, 18.81), -- Target coords
                drawtext = vector3(-1114.36, 2699.25, 18.55),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.3, -- Target size
            },

            ["Ammo1"] = {
                name = "Ammo1",
                label = "Grab ammo", -- Text 
                coords = vector3(-1117.73, 2701.26, 18.89), -- Target coords
                drawtext = vector3(-1118.25, 2701.43, 18.55),
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Ammo2"] = {
                name = "Ammo2",
                label = "Grab ammo", -- Text 
                coords = vector3(-1121.98, 2702.79, 18.41), -- Target coords
                drawtext = vector3(-1121.7, 2702.23, 18.69),
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun1"] = {
                name = "Gun1",
                label = "Grab weapon", -- Text 
                coords = vector3(-1124.63, 2699.23, 18.18), -- Target coords
                drawtext = vector3(-1123.91, 2699.67, 18.69),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun2"] = {
                name = "Gun2",
                label = "Grab weapon", -- Text 
                coords = vector3(-1123.29, 2698.17, 18.15), -- Target coords
                drawtext = vector3(-1123.16, 2698.67, 18.76),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["ArmorCrate1"] = {
                name = "ArmorCrate1",
                label = "Grab armor", -- Text 
                coords = vector3(-1116.87, 2703.67, 17.55), -- Target coords
                drawtext = vector3(-1117.36, 2703.22, 18.55),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["ArmorCrate2"] = {
                name = "ArmorCrate2",
                label = "Grab armor", -- Text 
                coords = vector3(-1117.43, 2704.36, 17.55), -- Target coords
                drawtext = vector3(-1117.81, 2703.79, 18.69),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["GunCrate1"] = {
                name = "GunCrate1",
                label = "Grab guns", -- Text 
                coords = vector3(-1119.38, 2700.49, 17.55), -- Target coords
                drawtext = vector3(-1119.72, 2701.0, 18.55),
                distance = 1.5, -- Target distance
                icon = "fas fa-boxes-stacked", -- Icon
                size = 0.6, -- Target size
            },

            ["Drawer"] = {
                name = "Drawer",
                label = "Search for the code", -- Text 
                coords = vector3(-1110.56, 2694.33, 17.55), -- Target coords
                drawtext = vector3(-1110.56, 2694.33, 18.55),
                distance = 1.5, -- Target distance
                icon = "fas fa-magnifying-glass", -- Icon
                size = 0.6, -- Target size
            },

        },

        -------- Don't touch anything under this line --------
        ["Zone"] = {vector3(-1105.01, 2694.11, 18.61), vector3(-1117.93, 2682.27, 18.61), vector3(-1135.5, 2703.01, 18.61), vector3(-1111.94, 2724.24, 18.61)},  -- Don't touch
        ["OnCooldown"] = false, -- Don't touch
        
    },

    ["Chumash"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-3164.85, 1082.76, 22.71),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["Register1Rotation"] = -161.00,
        ["Register2Rotation"] = 157.00,

        ["NPCs"] = {
            ["Employee"] = {Model = "a_m_m_socenlat_01", Coords = vector4(-3168.25, 1087.44, 19.84, 147.43)},
        },

        ["DrawTextRotation"] = 0.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Cut off wries", -- Text 
                coords = vector3(-3182.25, 1085.98, 20.8), -- Target coords
                drawtext = vector3(-3182.67, 1086.09, 20.84),
                distance = 1.5, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.4, -- Target size
            },

            ["Employee"] = {
                name = "Employee",
                label = "Intimidate employee", -- Text 
                coords = vector3(-3168.25, 1087.44, 21.24), -- Target coords
                drawtext = vector3(-3168.99, 1085.9, 20.84),
                distance = 2, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.5, -- Target size
            },

            ["Register1"] = {
                name = "Register1",
                label = "Break into register", -- Text 
                coords = vector3(-3166.52, 1086.02, 20.96), -- Target coords
                drawtext = vector3(-3166.92, 1086.95, 20.84),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.3, -- Target size
            },

            ["Register2"] = {
                name = "Register2",
                label = "Break into register", -- Text 
                coords = vector3(-3169.94, 1087.47, 21.10), -- Target coords
                drawtext = vector3(-3169.73, 1088.07, 20.84),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.3, -- Target size
            },

            ["Ammo1"] = {
                name = "Ammo1",
                label = "Grab ammo", -- Text 
                coords = vector3(-3170.33, 1087.85, 20.98), -- Target coords
                drawtext = vector3(-3170.4, 1088.43, 20.84), 
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Ammo2"] = {
                name = "Ammo2",
                label = "Grab ammo", -- Text 
                coords = vector3(-3167.48, 1089.07, 21.03), -- Target coords
                drawtext = vector3(-3167.69, 1088.58, 20.84),
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun1"] = {
                name = "Gun1",
                label = "Grab weapon", -- Text 
                coords = vector3(-3171.00, 1082.13, 20.33), -- Target coords
                drawtext = vector3(-3171.21, 1082.83, 20.84),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun2"] = {
                name = "Gun2",
                label = "Grab weapon", -- Text 
                coords = vector3(-3172.57, 1091.25, 20.45), -- Target coords
                drawtext = vector3(-3172.56, 1090.67, 21.05),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["ArmorCrate1"] = {
                name = "ArmorCrate1",
                label = "Grab armor", -- Text 
                coords = vector3(-3175.00, 1084.26, 19.84), -- Target coords
                drawtext = vector3(-3174.91, 1084.78, 20.84),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["ArmorCrate2"] = {
                name = "ArmorCrate2",
                label = "Grab armor", -- Text 
                coords = vector3(-3174.40, 1084.01, 19.84), -- Target coords
                drawtext = vector3(-3174.1, 1084.4, 20.84),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["GunCrate1"] = {
                name = "GunCrate1",
                label = "Grab guns", -- Text 
                coords = vector3(-3171.46, 1087.97, 19.84), -- Target coords
                drawtext = vector3(-3172.04, 1088.09, 20.84),
                distance = 1.5, -- Target distance
                icon = "fas fa-boxes-stacked", -- Icon
                size = 0.6, -- Target size
            },

            ["Drawer"] = {
                name = "Drawer",
                label = "Search for the code", -- Text 
                coords = vector3(-3164.35, 1086.79, 19.87), -- Target coords
                drawtext = vector3(-3164.35, 1086.79, 20.87),
                distance = 1.5, -- Target distance
                icon = "fas fa-magnifying-glass", -- Icon
                size = 0.6, -- Target size
            },

        },

        -------- Don't touch anything under this line --------
        ["Zone"] = {vector3(-3164.21, 1074.75, 20.84), vector3(-3158.23, 1088.53, 20.84), vector3(-3180.13, 1097.32, 20.84), vector3(-3187.77, 1081.3, 20.84)},  -- Don't touch
        ["OnCooldown"] = false, -- Don't touch
        
    },

    ["TataviamMountains"] = {
        ["Reset"] = 120, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(2569.65, 302.99, 110.34),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["Register1Rotation"] = -48.00,
        ["Register2Rotation"] = -91.00,

        ["NPCs"] = {
            ["Employee"] = {Model = "a_m_m_socenlat_01", Coords = vector4(2564.77, 297.49, 107.73, 266.25)},
        },

        ["DrawTextRotation"] = 0.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Cut off wries", -- Text 
                coords = vector3(2572.91, 279.57, 108.47), -- Target coords
                drawtext = vector3(2572.9, 279.2, 108.52),
                distance = 1.5, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.4, -- Target size
            },

            ["Employee"] = {
                name = "Employee",
                label = "Intimidate employee", -- Text 
                coords = vector3(2564.77, 297.49, 109.13), -- Target coords
                drawtext = vector3(2566.55, 297.43, 108.73),
                distance = 2, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.5, -- Target size
            },

            ["Register1"] = {
                name = "Register1",
                label = "Break into register", -- Text 
                coords = vector3(2565.49, 299.38, 108.96), -- Target coords
                drawtext = vector3(2564.74, 298.95, 108.73),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.3, -- Target size
            },

            ["Register2"] = {
                name = "Register2",
                label = "Break into register", -- Text 
                coords = vector3(2565.47, 295.94, 108.99), -- Target coords
                drawtext = vector3(2564.84, 295.93, 108.73),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.3, -- Target size
            },

            ["Ammo1"] = {
                name = "Ammo1",
                label = "Grab ammo", -- Text 
                coords = vector3(2566.08, 292.41, 109.07), -- Target coords
                drawtext = vector3(2566.11, 291.82, 108.73), 
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Ammo2"] = {
                name = "Ammo2",
                label = "Grab ammo", -- Text 
                coords = vector3(2568.14, 288.36, 108.59), -- Target coords
                drawtext = vector3(2568.22, 289.02, 108.73),
                distance = 1.0, -- Target distance
                icon = "fas fa-pen", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun1"] = {
                name = "Gun1",
                label = "Grab weapon", -- Text 
                coords = vector3(2572.51, 289.19, 108.36), -- Target coords
                drawtext = vector3(2571.69, 289.38, 108.73),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["Gun2"] = {
                name = "Gun2",
                label = "Grab weapon", -- Text 
                coords = vector3(2572.25, 290.87, 108.33), -- Target coords
                drawtext = vector3(2571.71, 290.76, 108.95),
                distance = 1.0, -- Target distance
                icon = "fas fa-gun", -- Icon
                size = 0.4, -- Target size
            },

            ["ArmorCrate1"] = {
                name = "ArmorCrate1",
                label = "Grab armor", -- Text 
                coords = vector3(2563.47, 291.16, 107.73), -- Target coords
                drawtext = vector3(2563.98, 291.21, 108.74),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["ArmorCrate2"] = {
                name = "ArmorCrate2",
                label = "Grab armor", -- Text 
                coords = vector3(2563.48, 290.38, 107.73), -- Target coords
                drawtext = vector3(2563.92, 290.53, 108.74),
                distance = 1.5, -- Target distance
                icon = "fas fa-shield-halved", -- Icon
                size = 0.6, -- Target size
            },

            ["GunCrate1"] = {
                name = "GunCrate1",
                label = "Grab guns", -- Text 
                coords = vector3(2567.74, 291.77, 107.73), -- Target coords
                drawtext = vector3(2567.85, 291.15, 108.74),
                distance = 1.5, -- Target distance
                icon = "fas fa-boxes-stacked", -- Icon
                size = 0.6, -- Target size
            },

            ["Drawer"] = {
                name = "Drawer",
                label = "Search for the code", -- Text 
                coords = vector3(2565.23, 302.19, 107.74), -- Target coords
                drawtext = vector3(2565.23, 302.19, 108.74),
                distance = 1.5, -- Target distance
                icon = "fas fa-magnifying-glass", -- Icon
                size = 0.6, -- Target size
            },

        },

        -------- Don't touch anything under this line --------
        ["Zone"] = {vector3(2579.99, 311.19, 108.53), vector3(2557.5, 312.82, 108.53), vector3(2539.35, 232.07, 108.53), vector3(2590.73, 217.47, 108.53)},  -- Don't touch
        ["OnCooldown"] = false, -- Don't touch
        
    },

}

Config.RegisterGunStores = {
    ['Cash'] = false, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "dirtymoney", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 450, max = 1250}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.RegisterShootingRanges = {
    ['Cash'] = false, -- Set this to false to use a cash "item", or true to use cash
    ['CashItem'] = "dirtymoney", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 4000, max = 7500}, -- Cash that is recieved
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.Loot = {
    ["GunStores"] = {
        ["Ammo1ItemCount"] = 1,
        ["Ammo1"] = {
            {Name = "pistol_ammo", Chance = 30, Amount = {min = 50, max = 60}},
        },

        ["Ammo2ItemCount"] = 1,
        ["Ammo2"] = {
            {Name = "rifle_ammo", Chance = 30, Amount = {min = 50, max = 70}},
            {Name = "smg_ammo", Chance = 30, Amount = {min = 60, max = 80}},
        },


        -- ****** Gun 1's reward is in the **Props Section (Approx Line 2093) ** below change the prop according to the reward ****** --

        -- ****** Gun 2's reward is in the **Props Section (Approx Line 2093) ** below change the prop according to the reward ****** --


        ["GunCrate1ItemCount"] = 1,
        ["GunCrate1"] = { -- Total chance should be equal to 100
            {Name = "weapon_trigger", Chance = 10, Amount = {min = 1, max = 1}},
            {Name = "weapon_magazine", Chance = 10, Amount = {min = 1, max = 1}},
            {Name = "weapon_grip", Chance = 10, Amount = {min = 1, max = 1}},
        },

        ["ArmorCrate1ItemCount"] = 1,
        ["ArmorCrate1"] = { -- Total chance should be equal to 100
            {Name = "armour", Chance = 70, Amount = {min = 1, max = 1}},
        },

        ["ArmorCrate2ItemCount"] = 1,
        ["ArmorCrate2"] = { -- Total chance should be equal to 100
            {Name = "armor_plate", Chance = 70, Amount = {min = 15, max = 25}},
        },
    },
    
    ["ShootingRanges"] = {
        ["Ammo1ItemCount"] = 1,
        ["Ammo1"] = { -- Shooting Range
            {Name = "pistol_ammo", Chance = 30, Amount = {min = 50, max = 60}},
        },

        ["Ammo2ItemCount"] = 1,
        ["Ammo2"] = {
            {Name = "rifle_ammo", Chance = 30, Amount = {min = 50, max = 70}},
            {Name = "smg_ammo", Chance = 30, Amount = {min = 50, max = 70}},
            {Name = "pistol_ammo", Chance = 40, Amount = {min = 50, max = 70}},
        },

        ["Ammo3ItemCount"] = 1,
        ["Ammo3"] = { -- Green Ammo boxes (Storage room)
            {Name = "rifle_ammo", Chance = 30, Amount = {min = 50, max = 70}},
            {Name = "smg_ammo", Chance = 30, Amount = {min = 50, max = 70}},
            {Name = "pistol_ammo", Chance = 40, Amount = {min = 50, max = 70}},
        },


        -- ****** Gun 1's reward is in **Props Section (Approx Line 2093) ** below change the prop according to the reward ****** --

        -- ****** Gun 2's reward is in **Props Section (Approx Line 2093) ** below change the prop according to the reward ****** --


        ["GunCrate1ItemCount"] = 1,
        ["GunCrate1"] = { -- Total chance should be equal to 100
            {Name = "traphousekey", Chance = 20, Amount = {min = 1, max = 1}}, -- Chance(%) -- Amount(Items given from that type)
            {Name = "x_hammer", Chance = 10, Amount = {min = 1, max = 1}},
        },

        ["GunCrate2ItemCount"] = 1,
        ["GunCrate2"] = { -- Total chance should be equal to 100
            {Name = "pistol_body", Chance = 10, Amount = {min = 1, max = 1}},
            {Name = "smg_body", Chance = 10, Amount = {min = 1, max = 1}},
            {Name = "rifle_body", Chance = 10, Amount = {min = 1, max = 1}},
        },

        ["ArmorCrate1ItemCount"] = 1,
        ["ArmorCrate1"] = { -- Total chance should be equal to 100
            {Name = "armour", Chance = 70, Amount = {min = 1, max = 1}},
        },

        ["ArmorCrate2ItemCount"] = 1,
        ["ArmorCrate2"] = { -- Total chance should be equal to 100
            {Name = "armor_plate", Chance = 70, Amount = {min = 15, max = 25}},
        },

        ["ExplosivesCrateItemCount"] = 1,
        ["ExplosivesCrate"] = { -- Total chance should be equal to 100
            {Name = "smokegrenade", Chance = 25, Amount = {min = 1, max = 1}}, -- Chance(%) -- Amount(Items given from that type)
            {Name = "thermite", Chance = 60, Amount = {min = 1, max = 1}},
            {Name = "weapon_stickybomb", Chance = 40, Amount = {min = 1, max = 1}},
        },
    },
}

Config.Props = {
    ["PillboxHill"] = {
        ["Ammo1"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(14.82, -1100.77, 29.60, 0), Rotation = vector3(0.0, 0.0, -148.00)},
        ["Ammo2"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(14.95, -1100.62, 29.60, 0), Rotation = vector3(0.0, 0.0, 0.0)},
        ["Ammo3"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(14.72, -1100.64, 29.60, 0), Rotation = vector3(0.0, 0.0, 59.00)},
        ["Ammo4"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(14.53, -1100.69, 29.60, 0), Rotation = vector3(0.0, 0.0, 0.0)},
        ["Ammo5"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(14.61, -1100.50, 29.60, 0), Rotation = vector3(0.0, 0.0, -130.0)},
        ["Gun1"] = {Reward = "WEAPON_BLESSEDMANE_STRIKER", Model = "w_sb_blessedmane_striker", Coords = vector4(14.18, -1100.38, 29.62, 0), Rotation = vector3(90.0, 0.0, -10.00)},

        ["Ammo6"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(16.22, -1097.01, 29.82, 0), Rotation = vector3(0.0, 0.0, 0.0)},
        ["Ammo7"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(16.02, -1097.15, 29.82, 0), Rotation = vector3(0.0, 0.0, 27.00)},
        ["Ammo8"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(16.21, -1097.23, 29.82, 0), Rotation = vector3(0.0, 0.0, -126.00)},
        ["Ammo9"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(16.40, -1097.06, 29.82, 0), Rotation = vector3(0.0, 0.0, 91.00)},
        ["Ammo10"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(16.40, -1097.30, 29.82, 0), Rotation = vector3(0.0, 0.0, 0.0)},
        ["Gun2"] = {Reward = "WEAPON_AUTISMO", Model = "w_sb_autismo", Coords = vector4(15.11, -1096.85, 29.82, 0), Rotation = vector3(90.0, 0.0, 0.0)},

        ["GunCrate1"] = {Model = "ch_prop_ch_crate_full_01a", ModelSwap = "ch_prop_ch_crate_empty_01a", Coords = vector4(6.67, -1099.29, 29.38, 0), Rotation = vector3(0.0, 0.0, 69.11)},
        ["GunCrate2"] = {Model = "ch_prop_ch_crate_full_01a", ModelSwap = "ch_prop_ch_crate_empty_01a", Coords = vector4(11.02, -1087.46, 28.8, 0), Rotation = vector3(0.0, 0.0, 67.44)},

        ["ArmorCrate1"] = {Model = "h4_prop_h4_crate_cloth_01a", ModelSwap = "v_ind_cf_crate2", Coords = vector4(10.5, -1088.78, 28.8, 0), Rotation = vector3(0.0, 0.0, 74.01)},
        ["ArmorCrate2"] = {Model = "h4_prop_h4_crate_cloth_01a", ModelSwap = "v_ind_cf_crate2", Coords = vector4(11.42, -1086.26, 28.8, 0), Rotation = vector3(0.0, 0.0, 71.83)},

        ["ExplosivesCrate"] = {Model = "imp_prop_impexp_cargo_01", Coords = vector4(9.8, -1101.24, 29.24, 0.0), Rotation = vector3(0.0, 0.0, 73.05)},

        ["AmmoBox1"] = {Model = "prop_box_ammo07a", ModelSwap = "prop_box_ammo07b", Coords = vector4(11.85, -1099.57, 29.60, 0.0), Rotation = vector3(0.0, 0.0, 176.00)},
        ["AmmoBox2"] = {Model = "prop_box_ammo07a", ModelSwap = "prop_box_ammo07b", Coords = vector4(11.60, -1099.49, 29.60, 0.0), Rotation = vector3(0.0, 0.0, 157.00)},
        ["AmmoBox3"] = {Model = "prop_box_ammo07a", ModelSwap = "prop_box_ammo07b", Coords = vector4(11.38, -1099.39, 29.60, 0.0), Rotation = vector3(0.0, 0.0, 139.00)},
    },

    ["CypressFlats"] = {
        ["Ammo1"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(819.14, -2160.83, 29.42, 0), Rotation = vector3(0.0, 0.0, 60.00)},
        ["Ammo2"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(819.21, -2161.00, 29.42, 0), Rotation = vector3(0.0, 0.0, 0.0)},
        ["Ammo3"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(819.33, -2160.85, 29.42, 0), Rotation = vector3(0.0, 0.0, 155.00)},
        ["Ammo4"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(819.53, -2160.82, 29.42, 0), Rotation = vector3(0.0, 0.0, 114.00)},
        ["Ammo5"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(819.48, -2161.00, 29.42, 0), Rotation = vector3(0.0, 0.0, 21.00)},
        ["Gun1"] = {Reward = "weapon_microsmg", Model = "w_sb_microsmg", Coords = vector4(820.07, -2160.91, 29.42, 0), Rotation = vector3(90.0, 0.0, 21.00)},

        ["Ammo6"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(819.22, -2164.64, 29.64, 0), Rotation = vector3(0.0, 0.0, 112.00)},
        ["Ammo7"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(819.10, -2164.87, 29.64, 0), Rotation = vector3(0.0, 0.0, 49.00)},
        ["Ammo8"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(819.02, -2164.68, 29.64, 00), Rotation = vector3(0.0, 0.0, 0.0)},
        ["Ammo9"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(818.89, -2164.86, 29.64, 0), Rotation = vector3(0.0, 0.0, 0.0)},
        ["Ammo10"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(818.83, -2164.61, 29.64, 0), Rotation = vector3(0.0, 0.0, 59.00)},
        ["Gun2"] = {Reward = "WEAPON_BLESSEDMANE_STRIKER", Model = "w_sb_smg", Coords = vector4(820.16, -2164.75, 29.64, 0), Rotation = vector3(90.0, 0.0, 15.0)},

        ["GunCrate1"] = {Model = "ch_prop_ch_crate_full_01a", ModelSwap = "ch_prop_ch_crate_empty_01a", Coords = vector4(827.46, -2159.53, 29.2, 0), Rotation = vector3(0.0, 0.0, 266.98)},
        ["GunCrate2"] = {Model = "ch_prop_ch_crate_full_01a", ModelSwap = "ch_prop_ch_crate_empty_01a", Coords = vector4(827.33, -2171.69, 28.62, 0), Rotation = vector3(0.0, 0.0, 268.16)},

        ["ArmorCrate1"] = {Model = "h4_prop_h4_crate_cloth_01a", ModelSwap = "v_ind_cf_crate2", Coords = vector4(827.29, -2170.3, 28.62, 0), Rotation = vector3(0.0, 0.0, 268.16)},
        ["ArmorCrate2"] = {Model = "h4_prop_h4_crate_cloth_01a", ModelSwap = "v_ind_cf_crate2", Coords = vector4(827.33, -2173.14, 28.62, 0), Rotation = vector3(0.0, 0.0, 266.68)},

        ["ExplosivesCrate"] = {Model = "imp_prop_impexp_cargo_01", Coords = vector4(823.77, -2158.64, 29.06, 0), Rotation = vector3(0.0, 0.0, 93.09)},

        ["AmmoBox1"] = {Model = "prop_box_ammo07a", ModelSwap = "prop_box_ammo07b", Coords = vector4(822.28, -2160.99, 29.42, 0.0), Rotation = vector3(0.0, 0.0, 25.0)},
        ["AmmoBox2"] = {Model = "prop_box_ammo07a", ModelSwap = "prop_box_ammo07b", Coords = vector4(822.52, -2160.94, 29.42, 0.0), Rotation = vector3(0.0, 0.0, 0.0)},
        ["AmmoBox3"] = {Model = "prop_box_ammo07a", ModelSwap = "prop_box_ammo07b", Coords = vector4(822.78, -2160.98, 29.42, 0.0), Rotation = vector3(0.0, 0.0, -21.00)},
    },

    ["PaletoBay"] = {
        ["Ammo1"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-329.07, 6083.46, 31.59, 0), Rotation = vector3(0.0, 0.0, -150.00)},
        ["Ammo2"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-329.31, 6083.55, 31.59, 0), Rotation = vector3(0.0, 0.0, 104.00)},
        ["Ammo3"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-329.15, 6083.60, 31.59, 0), Rotation = vector3(0.0, 0.0, 178.00)},

        ["Ammo6"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-325.70, 6083.46, 31.64, 0), Rotation = vector3(0.0, 0.0, -93.00)},
        ["Ammo7"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-325.89, 6083.45, 31.64, 0), Rotation = vector3(0.0, 0.0, -66.00)},
        ["Ammo8"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-325.88, 6083.68, 31.64, 0), Rotation = vector3(0.0, 0.0, -18.00)},

        ["Gun1"] = {Reward = "weapon_bat", Model = "p_cs_bbbat_01", Coords = vector4(-331.56, 6078.24, 30.94, 0.0), Rotation = vector3(89.8, 0.0, 229)},
        ["Gun2"] = {Reward = "weapon_machete", Model = "ch_prop_ch_bloodymachete_01a", Coords = vector4(-329.66, 6087.21, 31.06, 0.0), Rotation = vector3(90.0, 0.0, 45.0)},

        ["GunCrate1"] = {Model = "sm_prop_smug_rsply_crate02a", Coords = vector4(-329.88, 6083.81, 30.44, 0), Rotation = vector3(0.0, 0.0, 45)},

        ["ArmorCrate1"] = {Model = "prop_bodyarmour_06", Coords = vector4(-334.47, 6081.76, 30.45, 0.0), Rotation = vector3(0.0, 0.0, 135.00)},
        ["ArmorCrate2"] = {Model = "prop_bodyarmour_06", Coords = vector4(-334.09, 6081.35, 30.45, 0.0), Rotation = vector3(0.0, 0.0, 137.00)},
    },

    ["Hawick"] = {
        ["Ammo1"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(253.42, -52.47, 70.28, 0), Rotation = vector3(0.00, -0.00, 98.00)},
        ["Ammo2"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(253.50, -52.31, 70.28, 0), Rotation = vector3(0.00, 0.00, 139.00)},
        ["Ammo3"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(253.50, -52.14, 70.28, 0), Rotation = vector3(0.00, -0.00, -1.00)},

        ["Ammo6"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(257.68, -51.85, 69.80, 0), Rotation =  vector3(0.00, 0.00, -91.00)},
        ["Ammo7"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(257.82, -51.78, 69.80, 0), Rotation = vector3(0.00, -0.00, 73.00)},
        ["Ammo8"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(257.97, -51.82, 69.80, 0), Rotation = vector3(0.00, -0.00, -56.00)},

        ["Gun1"] = {Reward = "weapon_bat", Model = "p_cs_bbbat_01", Coords = vector4(258.63, -47.42, 69.57, 0), Rotation = vector3(0, 0.00, 0)},
        ["Gun2"] = {Reward = "weapon_machete", Model = "ch_prop_ch_bloodymachete_01a", Coords = vector4(256.87, -47.06, 69.54, 0.00), Rotation = vector3(90, -0.00, 73)},

        ["GunCrate1"] = {Model = "sm_prop_smug_rsply_crate02a", Coords = vector4(254.52, -51.03, 68.94, 0), Rotation = vector3(0.00, -0.00, -109.00)},

        ["ArmorCrate1"] = {Model = "prop_bodyarmour_06", Coords = vector4(253.58, -55.19, 68.94, 0), Rotation = vector3(-0.00, -0.00, 157.00)},
        ["ArmorCrate2"] = {Model = "prop_bodyarmour_06", Coords = vector4(254.39, -55.49, 68.94, 0), Rotation = vector3(-0.00, -0.00, 159.00)},
    },

    ["LaMesa"] = {
        ["Ammo1"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(841.65, -1031.99, 28.33, 0), Rotation = vector3(0.00, 0.00, 24.00)},
        ["Ammo2"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(841.63, -1032.15, 28.33, 0), Rotation = vector3(0.00, 0.00, 38.00)},
        ["Ammo3"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(841.69, -1032.30, 28.33,0), Rotation = vector3(0.00, -0.00, -113.00)},
        
        ["Ammo6"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(839.41, -1030.14, 28.38, 0), Rotation =  vector3(-0.00, -0.00, 29.00)},
        ["Ammo7"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(839.42, -1030.31, 28.38, 0), Rotation = vector3(0.00, -0.00, 59.00)},
        ["Ammo8"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(839.22, -1030.25, 28.38, 0), Rotation = vector3(0.00, -0.00, 119.00)},

        ["Gun1"] = {Reward = "weapon_bat", Model = "p_cs_bbbat_01", Coords = vector4(847.13, -1030.50, 27.68, 0.00), Rotation = vector3(89, -0.00, 0.00)},
        ["Gun2"] = {Reward = "weapon_machete", Model = "ch_prop_ch_bloodymachete_01a", Coords = vector4(839.41, -1035.56, 27.80, 0.00), Rotation = vector3(90, -0.00, 180)},

        ["GunCrate1"] = {Model = "sm_prop_smug_rsply_crate02a", Coords = vector4(841.96, -1033.31, 27.19, 0), Rotation = vector3(0.00, -0.00, 179.00)},

        ["ArmorCrate1"] = {Model = "prop_bodyarmour_06", Coords = vector4(846.74, -1034.99, 27.21, 0), Rotation = vector3(-0.00, -0.00, -92.00)},
        ["ArmorCrate2"] = {Model = "prop_bodyarmour_06", Coords = vector4(846.75, -1034.40, 27.21, 0), Rotation = vector3(0.00, -0.00, -90.00)},
    },

    ["SandyShores"] = {
        ["Ammo1"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(1695.17, 3759.31, 34.85, 0.00), Rotation = vector3(0.00, -0.00, -145.00)},
        ["Ammo2"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(1695.06, 3759.42, 34.85, 0), Rotation = vector3(0.00, -0.00, -172.00)},
        ["Ammo3"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(1694.93, 3759.53, 34.85, 0), Rotation = vector3(-0.00, -0.00, -133.00)},
        
        ["Ammo6"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(1698.07, 3759.70, 34.9, 0), Rotation =  vector3(0.00, -0.00, 0)},
        ["Ammo7"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(1698.13, 3759.84, 34.9, 0.00), Rotation = vector3(0.00, -0.00, 29.00)},
        ["Ammo8"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(1698.29, 3759.65, 34.9, 0.00), Rotation = vector3(0.00, -0.00, 89.00)},

        ["Gun1"] = {Reward = "weapon_bat", Model = "p_cs_bbbat_01", Coords = vector4(1692.55, 3754.29, 34.2, 0.00), Rotation = vector3(89, -0.00, 222.42)},
        ["Gun2"] = {Reward = "weapon_machete", Model = "ch_prop_ch_bloodymachete_01a", Coords = vector4(1694.11, 3763.35, 34.32, 0), Rotation = vector3(90, 0.00, 55.00)},

        ["GunCrate1"] = {Model = "sm_prop_smug_rsply_crate02a", Coords = vector4(1694.07, 3759.90, 33.71, 0), Rotation = vector3(0.00, 0.00, 47.00)},

        ["ArmorCrate1"] = {Model = "prop_bodyarmour_06", Coords = vector4(1689.58, 3757.53, 33.71, 0), Rotation = vector3(0.00, -0.00, 136.00)},
        ["ArmorCrate2"] = {Model = "prop_bodyarmour_06", Coords = vector4(1689.97, 3757.11, 33.71, 0), Rotation = vector3(0.00, -0.00, 134.00)},
    },

    ["LittleSeoul"] = {
        ["Ammo1"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-660.46, -933.23, 22.17, 0.00), Rotation = vector3(0.0, 0.0, -169.00)},
        ["Ammo2"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-660.35, -933.35, 22.17, 0), Rotation = vector3(-0.00, -0.00, -152.00)},
        ["Ammo3"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-660.63, -933.34, 22.17, 0), Rotation = vector3(0.00, 0.00, -32.00)},

        ["Ammo6"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-662.38, -929.48, 21.69, 0), Rotation =  vector3(0.00, 0.00, 0)},
        ["Ammo7"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-662.49, -929.36, 21.69, 0.00), Rotation = vector3(0.00, -0.00, -151.00)},
        ["Ammo8"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4( -662.49, -929.18, 21.69, 0), Rotation = vector3(-0.00, -0.00, 44.00)},

        ["Gun1"] = {Reward = "weapon_bat", Model = "p_cs_bbbat_01", Coords = vector4(-666.87, -930.17, 21.46, 0.00), Rotation = vector3(0, -0.00, 0)},
        ["Gun2"] = {Reward = "weapon_machete", Model = "ch_prop_ch_bloodymachete_01a", Coords = vector4(-666.57, -931.86, 21.43, 0.00), Rotation = vector3(90, -0.00, 180)},

        ["GunCrate1"] = {Model = "sm_prop_smug_rsply_crate02a", Coords = vector4(-662.07, -932.73, 20.83, 0.00), Rotation = vector3(0.00, -0.00, -0.00)},

        ["ArmorCrate1"] = {Model = "prop_bodyarmour_06", Coords = vector4(-657.85, -932.10, 20.83, 0), Rotation = vector3(0.00, -0.00, -90.00)},
        ["ArmorCrate2"] = {Model = "prop_bodyarmour_06", Coords = vector4(-657.84, -931.36, 20.83, 0), Rotation = vector3(0.00, -0.00, -90.00)}, 
    },

    ["MorningWood"] = {
        ["Ammo1"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-1307.51, -394.57, 36.84, 0), Rotation = vector3(0.00, 0.00, 89.00)},
        ["Ammo2"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-1307.33, -394.62, 36.84, 0), Rotation = vector3(0.00, -0.00, 56.00)},
        ["Ammo3"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-1307.20, -394.64, 36.84, 0), Rotation = vector3(-0.00, -0.00, -99.00)},

        ["Ammo6"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-1309.89, -396.46, 36.89, 0), Rotation =  vector3(0.00, 0.00, 0)},
        ["Ammo7"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-1309.80, -396.31, 36.89, 0), Rotation = vector3(0.00, 0.00, 137.00)},
        ["Ammo8"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-1309.99, -396.29, 36.89, 0), Rotation = vector3(0.00, -0.00, 55.00)},

        ["Gun1"] = {Reward = "weapon_bat", Model = "p_cs_bbbat_01", Coords = vector4(-1307.56, -388.91, 36.19, 0.00), Rotation = vector3(89, -0.00, 430.6)},
        ["Gun2"] = {Reward = "weapon_machete", Model = "ch_prop_ch_bloodymachete_01a", Coords = vector4(-1304.62, -397.60, 36.31, 0.00), Rotation = vector3(90, -0.00, 258)},

        ["GunCrate1"] = {Model = "sm_prop_smug_rsply_crate02a", Coords = vector4(-1306.21, -394.50, 35.7, 0), Rotation = vector3(0.00, -0.00, -104.00)},

        ["ArmorCrate1"] = {Model = "prop_bodyarmour_06", Coords = vector4(-1303.32, -390.33, 35.7, 0), Rotation = vector3(-0.00, -0.00, -19.00)},
        ["ArmorCrate2"] = {Model = "prop_bodyarmour_06", Coords = vector4(-1303.96, -390.25, 35.7, 0), Rotation = vector3(-0.00, -0.00, -15.00)},
    },

    ["GreatChaparral"] = {
        ["Ammo1"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-1117.90, 2701.18, 18.89, 0.00), Rotation = vector3(0.00, -0.00, -128.00)},
        ["Ammo2"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-1117.73, 2701.26, 18.89, 0), Rotation = vector3(0.00, -0.00, 114.00)},
        ["Ammo3"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-1117.80, 2701.06, 18.89, 0), Rotation = vector3(0.00, -0.00, 56.00 )},

        ["Ammo6"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-1121.80, 2702.73, 18.41, 0), Rotation =  vector3(0.00, -0.00, 21.00)},
        ["Ammo7"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-1121.98, 2702.79, 18.41, 0), Rotation = vector3(0.00, -0.00, 60.00)},
        ["Ammo8"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-1122.06, 2702.95, 18.41, 0), Rotation = vector3(0.00, 0.00, -95.00)},

        ["Gun1"] = {Reward = "weapon_bat", Model = "p_cs_bbbat_01", Coords = vector4(-1124.63, 2699.23, 18.18, 0.00), Rotation = vector3(0, -0.00, 0)},
        ["Gun2"] = {Reward = "weapon_machete", Model = "ch_prop_ch_bloodymachete_01a", Coords = vector4(-1123.29, 2698.17, 18.15, 0.00), Rotation = vector3(90, -0.00, -127.00)},

        ["GunCrate1"] = {Model = "sm_prop_smug_rsply_crate02a", Coords = vector4(-1119.38, 2700.49, 17.55, 0), Rotation = vector3(0.00, 0.00, 41.49)},

        ["ArmorCrate1"] = {Model = "prop_bodyarmour_06", Coords = vector4(-1116.87, 2703.67, 17.55, 0), Rotation = vector3(0.00, -0.00, -48.00)},
        ["ArmorCrate2"] = {Model = "prop_bodyarmour_06", Coords = vector4(-1117.43, 2704.36, 17.55, 0), Rotation = vector3(0.00, -0.00, -50.00)},
    },
 
    ["Chumash"] = {
        ["Ammo1"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-3170.21, 1087.73, 20.98, 0), Rotation = vector3(0.00, -0.00, 82.00)},
        ["Ammo2"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-3170.33, 1087.85, 20.98, 0.00), Rotation = vector3(0.00, -0.00, 94.00)},
        ["Ammo3"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-3170.48, 1087.87, 20.98, 0), Rotation = vector3(-0.00, -0.00, -103.00)},

        ["Ammo6"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-3167.63, 1089.26, 21.03, 0.00), Rotation =  vector3(0.00, -0.00, 0.00)},
        ["Ammo7"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-3167.48, 1089.07, 21.03, 0), Rotation = vector3(0.00, 0.00, -73.00)},
        ["Ammo8"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(-3167.69, 1089.08, 21.03, 0), Rotation = vector3(0.00, -0.00, -37.00)},

        ["Gun1"] = {Reward = "weapon_bat", Model = "p_cs_bbbat_01", Coords = vector4(-3171.00, 1082.13, 20.33, 0.00), Rotation = vector3(89, -0.00, 244.73)},
        ["Gun2"] = {Reward = "weapon_machete", Model = "ch_prop_ch_bloodymachete_01a", Coords = vector4(-3172.57, 1091.25, 20.45, 0.00), Rotation = vector3(90, -0.00, 71)},

        ["GunCrate1"] = {Model = "sm_prop_smug_rsply_crate02a", Coords = vector4(-3171.46, 1087.97, 19.84, 0), Rotation = vector3(0.00, 0.00, 68.00)},

        ["ArmorCrate1"] = {Model = "prop_bodyarmour_06", Coords = vector4(-3175.00, 1084.26, 19.84, 0), Rotation = vector3(0.00, -0.00, 158.00)},
        ["ArmorCrate2"] = {Model = "prop_bodyarmour_06", Coords = vector4(-3174.40, 1084.01, 19.84, 0), Rotation = vector3(0.00, -0.00, 157.00)},
    },

    ["TataviamMountains"] = {
        ["Ammo1"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(2565.91, 292.28, 109.07, 0), Rotation = vector3(0.00, -0.00, -119.00)},
        ["Ammo2"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(2566.08, 292.41, 109.07, 0.00), Rotation = vector3(0.00, -0.00, -15.00)},
        ["Ammo3"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(2566.15, 292.27, 109.07, 0), Rotation = vector3(0.00, -0.00, 21.00)},

        ["Ammo6"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(2568.14, 288.22, 108.59, 0), Rotation =  vector3(0.00, -0.00, 32.00)},
        ["Ammo7"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(2568.14, 288.36, 108.59, 0), Rotation = vector3(-0.00, -0.00, -158.00)},
        ["Ammo8"] = {Model = "prop_ld_ammo_pack_01", Coords = vector4(2568.03, 288.51, 108.59, 0), Rotation = vector3(-0.00, -0.00, 173.00)},

        ["Gun1"] = {Reward = "weapon_bat", Model = "p_cs_bbbat_01", Coords = vector4(2572.51, 289.19, 108.36, 0.00), Rotation = vector3(0, -0.00, 0)},
        ["Gun2"] = {Reward = "weapon_machete", Model = "ch_prop_ch_bloodymachete_01a", Coords = vector4(2572.25, 290.87, 108.33, 0.00), Rotation = vector3(90, -0.00, 0)},

        ["GunCrate1"] = {Model = "sm_prop_smug_rsply_crate02a", Coords = vector4(2567.74, 291.77, 107.73, 0), Rotation = vector3(0.00, -0.00, 180.00)},

        ["ArmorCrate1"] = {Model = "prop_bodyarmour_06", Coords = vector4(2563.47, 291.16, 107.73, 0), Rotation = vector3(0.00, -0.00, 85.00)},
        ["ArmorCrate2"] = {Model = "prop_bodyarmour_06", Coords = vector4(2563.48, 290.38, 107.73, 0), Rotation = vector3(-0.00, -0.00, 90.00)},
    },
}

Config.Sounds = {
    ["DoorUnlockSound"] = 'DoorOpen', -- The sound that is played when unlocking doors
    ["DoorUnlockSoundVolume"] = 2.0, -- The volume of the sound that is played
    ["DoorUnlockSoundDistance"] = 3.0, -- The distance that the sound reaches
    ["AlarmSound"] = 'security-alarm', -- The sound that is played when the alarm is on
    ["AlarmSoundVolume"] = 0.01, -- The volume of the sound that is played
    ["AlarmSoundDistance"] = 35.0, -- The distance that the sound reaches
    ["AlarmRepeat"] = 30, -- At 30 and Wait at 10000, the alarm will blare every 10 seconds for a total of 5 minutes
    ["AlarmWait"] = 10000, -- Waits between each alarm blare
}

Config.Weapons = { -- Choose which weapons are required to have in hand to initiate the heist (Loud way)
    
    "WEAPON_FNX45",

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

Config.DoorStates = { -- Sync
    ["PillboxHill"] = {},
    ["CypressFlats"] = {},
}

Config.DoorList = {
    ["PillboxHill"] = {
                -- First Door (1)
        {
            objYaw = 340.0,
            objCoords = vector3(7.15, -1101.13, 29.9),
            objHash = 44561767,
            locked = true,
        },

                -- Second Door (2)
        {
            objYaw = 340.39,
            objCoords = vector3(8.04, -1098.66, 29.9),
            objHash = 44561767,
            locked = true,
        },

                -- Shooting Range (3)
        {
            objYaw = 340.0,
            objCoords = vector3(8.49, -1094.39, 29.91),
            objHash = 44561767,
            locked = true,
        },
    },

    ["CypressFlats"] = {
                -- First Door (1)
        {
            objYaw = 180.39,
            objCoords = vector3(826.23, -2157.86, 29.72),
            objHash = 44561767,
            locked = true,
        },

                -- Second Door (2)
        {
            objYaw = 180.39,
            objCoords = vector3(826.23, -2160.49, 29.72),
            objHash = 44561767,
            locked = true,
        },

                -- Shooting Range (3)
        {
            objYaw = 180.39,
            objCoords = vector3(827.27, -2164.65, 29.74),
            objHash = 44561767,
            locked = true,
        },
    },
}

Config.Steps = {
    ["PillboxHill"] = {},
    ["CypressFlats"] = {},
    ["PaletoBay"] = {},
    ["Hawick"] = {},
    ["LaMesa"] = {},
    ["SandyShores"] = {},
    ["LittleSeoul"] = {},
    ["MorningWood"] = {},
    ["GreatChaparral"] = {},
    ["Chumash"] = {},
    ["TataviamMountains"] = {},
}

Config.ExtraSteps = {
    ["PillboxHill"] = {},
    ["CypressFlats"] = {},
    ["PaletoBay"] = {},
    ["Hawick"] = {},
    ["LaMesa"] = {},
    ["SandyShores"] = {},
    ["LittleSeoul"] = {},
    ["MorningWood"] = {},
    ["GreatChaparral"] = {},
    ["Chumash"] = {},
    ["TataviamMountains"] = {},
}

Config.Tasks = {
    ["PillboxHill"] = {},
    ["CypressFlats"] = {},
    ["PaletoBay"] = {},
    ["Hawick"] = {},
    ["LaMesa"] = {},
    ["SandyShores"] = {},
    ["LittleSeoul"] = {},
    ["MorningWood"] = {},
    ["GreatChaparral"] = {},
    ["Chumash"] = {},
    ["TataviamMountains"] = {},
}