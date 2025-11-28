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
    Inventory = "ox", -- "ox" or or "qb" or "codem" or "esx" or "lj" or "ps", if you arent using any of these inventories, put it as "other" and you will need to edit the inventory export function, or open a ticket on discord.
    Dispatch = "cd", -- "ps" "cd" "origen" "tk" "codem" "rcore" or "outlaw", if you arent using any of these dispatch systems, put it as "other" and you will need to edit the dispatch export function, or open a ticket on discord.
    Notification = "ox", -- "ox" or "qb" or "esx"
    Progressbar = "ox", -- "ox" or "qb"

    Target = 'ox_target', -- Target name, leave it as qb-target if you are using ox_target
    WorldInteract = false, -- Enable/Disable World Interactions (Only use this if you have the interact script, otherwise leave it as false)

    TestingMode = false, -- Enable/Disable Testing Mode (No Minigames)

    DiscordLogStatus = true, -- Choose whether u want to turn on discord logs or not, you need to add a webhook below for it to work
    -- To add your webhook go to opensource -> server, line 1 and add your webhook there

    Cooldown = {
        Global = true, -- Global cooldown (Set to false to have individual cooldowns on stores, true to have cooldowns on all stores when one is robbed)
        Timer = 30, -- (Minutes) timer duration
    },

    AllRobberiesCooldown = false, -- For this to work you need to download projectx-utility from our github
    DisableParticles = false, -- Disable particles on the robbery

    PoliceJobs = {["police"] = true}, -- Jobs that can receive the dispatch, to add more follow this format: {["police"] = true, ["fbi"] = true}
    MinimumPolice = 2, -- Minimum police required to start the robbery

    -- Progression item (Item that can be obtained at the end of the heist, can be used for the next heist) 
    Bonus = {
        Status = true, -- Enable/Disable Bonus items
        BonusChance = 50, -- Chance of an item being given
        ItemCount = 1, -- How many items can be given from the table below
        Items = { -- You can remove items and add items as you wish
            {Name = "nylonrope", Chance = 30, Amount = {min = 1, max = 1}}, -- Chance(%) -- Amount(Items given from that type)
            {Name = "ammunation_key", Chance = 20, Amount = {min = 1, max = 1}},
        },
    },

    -- Skill System 
    SkillSystem = false, -- If want to use a skill system to initiate the heist set this to true
    MinimumLevel = 0, -- Minimum level required to start the heist
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

    ComputerPassword = { -- Password for the computer
        ["Password"] = {min = 10000, max = 99999}, -- Code range
        ["Header"] = "Safe Code", -- Change Translation
        ["Content"] = "Code", -- Change Translation
        ["Input"] = {Title = 'Code', Label = 'Password', Description = 'Enter the code', Icon = 'fas fa-lock'}, -- Change Translation
    },

    -- Drawtext and Target options 
    Drawtext = "OX", -- OLDQB for old qb-drawtext, QB for new qbcore drawtext, OX for ox_lib
    DrawTextZoneSize = vec3(0.8, 0.8, 2), -- Size of the drawtext zone
    Interaction = {-- true = target, false = drawtext
        ["Button"] = 38, -- [E] by default

        ["Fusebox"] = true,
        ["Register"] = true,
        ["Atm"] = true,
        ["Server"] = true,
        ["Npc"] = true,
        ["Computer"] = true,
        ["Safe"] = true,
        ["Shelf"] = true,
    },

    -- Durations 
    NotificationDuration = 2500, -- Duration of the displayed notifications

    FuseboxDuration = 6000,
    RegisterDuration = 15000,
    ServerDuration = 6000,
    Computer1Duration = 6000,
    Computer2Duration = 6000,
    DoorDuration = 6000,
    AtmDuration = 6000,
    ShelfDuration = 2500,
    SafeDuration = 6000,
}

-- Add stores here if you have more than the default ones
Config.Stores247 = {"Strawberry", "DowntownVineWood", "BanhamCanyon", "Chumash", "MountChiliad", "SandyShores", "Harmony", "GrandSenoraDesert", "TataviamMountains"} -- 24/7 Stores
Config.GasStations = {"Davis", "LittleSeoul", "RichmanGlen", "MirrorPark", "GrapeSeed"} -- Gas Stations
Config.LiquorStores = {"VespucciCanals", "MorningWood", "GreatOceanHighway", "MurrietaHeights", "BolingBroke"} -- Liquor Stores
Config.AllStores = {"Strawberry", "DowntownVineWood", "BanhamCanyon", "Chumash", "MountChiliad", "SandyShores", "Harmony", "GrandSenoraDesert", "TataviamMountains", "Davis", "LittleSeoul", "RichmanGlen", "MirrorPark", "GrapeSeed", "VespucciCanals", "MorningWood", "GreatOceanHighway", "MurrietaHeights", "BolingBroke"} -- All Stores

Config.Register247 = {
    ['Cash'] = false,
    ['CashItem'] = "dirtymoney",
    ['StackAmount'] = {min = 3500, max = 4500},
    ['ItemInfo'] = false,
}

Config.RegisterLtdGasoline = {
    ['Cash'] = false,
    ['CashItem'] = "dirtymoney",
    ['StackAmount'] = {min = 3500, max = 4500},
    ['ItemInfo'] = false,
}

Config.RegisterLiquor = {
    ['Cash'] = false,
    ['CashItem'] = "dirtymoney",
    ['StackAmount'] = {min = 3500, max = 4500},
    ['ItemInfo'] = false,
}

Config.Atm247 = {
    ['Cash'] = false,
    ['CashItem'] = "dirtymoney",
    ['StackAmount'] = {min = 8000, max = 10000}, 
    ['ItemInfo'] = false,
}

Config.AtmLtdGasoline = {
    ['Cash'] = false,
    ['CashItem'] = "dirtymoney",
    ['StackAmount'] = {min = 8000, max = 10000}, 
    ['ItemInfo'] = false,
}

Config.SafeLiquor = {
    ['Cash'] = false,
    ['CashItem'] = "dirtymoney",
    ['StackAmount'] = {min = 70000, max = 75000},
    ['ItemInfo'] = false,
}

Config.SafeLtdGasoline = {
    ['Cash'] = false,
    ['CashItem'] = "dirtymoney",
    ['StackAmount'] = {min = 70000, max = 75000},
    ['ItemInfo'] = false,
}

Config.Safe247 = {
    ['Cash'] = false,
    ['CashItem'] = "dirtymoney",
    ['StackAmount'] = {min = 70000, max = 75000},
    ['ItemInfo'] = false,
}

Config.SafeCorrupt247 = {
    ['Cash'] = false,
    ['CashItem'] = "dirtymoney",
    ['StackAmount'] = {min = 70000, max = 75000},
    ['ItemInfo'] = false,
}

Config.MaxItems = 5 -- Max items that can be taken from the shelves
Config.RewardShelf = {
    {Name = "dx_uwuprops_cake_a", Chance = 100, Amount = {min = 1, max = 1}}, -- Chance(%) -- Amount(Items given from that type)
    {Name = "dx_food_grill_zucchini_grill_a", Chance = 100, Amount = {min = 1, max = 1}},
    {Name = "dx_uwuprops_coffee_a", Chance = 100, Amount = {min = 1, max = 1}},
    {Name = "glass_kiwi", Chance = 100, Amount = {min = 1, max = 1}},
    {Name = "fruit_grapefruit", Chance = 100, Amount = {min = 1, max = 1}},
}

Config.Items ={
    ["Circuit"] = "x_circuittester",
    ["Lockpick"] = "advancedlockpick",
    ["Harddrive"] = "x_harddrive", -- Item that is required before the robbery
    ["Device"] = "x_device",
    ["Key"] = "storekey",
}

Config.ItemsBreak ={
    ["Circuit"] = 100, -- % Break Chance
    ["Lockpick"] = 60, -- % Break Chance
    ["Device"] = 100, -- % Break Chance
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

Config.Stores = {
    ["Strawberry"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(28.36, -1349.44, 31.77),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(30.73, -1339.37, 25.38, 271.84),
        ["StoolCoords"] = vector3(24.35, -1348.4, 28.97),
        ["OfficeChairCoords"] = vector3(25.4, -1343.64, 25.38),
        ["NpcCoords"] = vector4(28.59, -1343.92, 25.38, 1.6),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 271.84,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(19.3, -1335.64, 29.28), -- Circle Zone Coords
                drawtext = vector3(19.13, -1335.71, 29.28),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(24.98, -1347.29, 29.61), -- Circle Zone Coords
                drawtext = vector3(24.52, -1347.29, 29.5),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(24.98, -1345.56, 29.61), -- Circle Zone Coords
                drawtext = vector3(24.38, -1345.55, 29.5),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(33.51, -1348.8, 29.7), -- Circle Zone Coords
                drawtext = vector3(33.5, -1348.2, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(30.73, -1339.37, 26.38), -- Circle Zone Coords
                drawtext = vector3(29.98, -1339.28, 26.38),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(28.59, -1343.92, 26.38), -- Circle Zone Coords
                drawtext = vector3(28.59, -1343.55, 26.38),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(26.06, -1343.57, 26.0), -- Circle Zone Coords
                drawtext = vector3(25.42, -1343.62, 26.38),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(26.06, -1343.57, 26.0), -- Circle Zone Coords
                drawtext = vector3(25.42, -1343.62, 26.38),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(24.26, -1344.33, 25.95), -- Circle Zone Coords
                drawtext = vector3(24.41, -1343.99, 26.38),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(26.32, -1341.47, 29.52),
                drawtext = vector3(26.35, -1341.86, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(28.02, -1341.27, 29.49),
                drawtext = vector3(28.05, -1341.84, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(29.74, -1341.25, 29.49),
                drawtext = vector3(29.69, -1341.8, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(28.34, -1345.5, 29.47),
                drawtext = vector3(27.88, -1345.5, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(30.89, -1345.51, 29.43),
                drawtext = vector3(30.36, -1345.51, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(34.31, -1343.8, 29.52),
                drawtext = vector3(33.64, -1343.8, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(34.41, -1345.61, 29.48),
                drawtext = vector3(33.82, -1345.62, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(34.35, -1347.39, 29.5),
                drawtext = vector3(33.65, -1347.4, 29.5),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(19.28, -1349.54, 28.48), vector3(39.94, -1349.71, 28.48), vector3(39.7, -1336.96, 28.48), vector3(19.31, -1336.38, 28.48)},
    },

    ["DowntownVineWood"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(376.54, 323.09, 105.62),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(380.53, 332.49, 99.45, 256.76),
        ["StoolCoords"] = vector3(372.17, 325.39, 103.04),
        ["OfficeChairCoords"] = vector3(374.36, 329.75, 99.45),
        ["NpcCoords"] = vector4(377.43, 328.71, 99.45, 344.18),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 256.76,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(371.02, 334.09, 103.43), -- Circle Zone Coords
                drawtext = vector3(370.4, 334.04, 103.44),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(373.06, 326.32, 103.68), -- Circle Zone Coords
                drawtext = vector3(372.51, 326.39, 103.57),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(373.48, 328.0, 103.68), -- Circle Zone Coords
                drawtext = vector3(372.94, 328.12, 103.57),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(381.07, 322.93, 103.82), -- Circle Zone Coords
                drawtext = vector3(381.19, 323.42, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(380.31, 332.49, 100.45), -- Circle Zone Coords
                drawtext = vector3(379.85, 332.77, 100.45),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(377.43, 328.71, 100.45), -- Circle Zone Coords
                drawtext = vector3(377.5, 329.43, 100.45),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(374.93, 329.67, 99.93), -- Circle Zone Coords
                drawtext = vector3(374.31, 329.77, 100.45),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(374.93, 329.67, 99.93), -- Circle Zone Coords
                drawtext = vector3(374.31, 329.77, 100.45),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(372.93, 329.25, 99.96), -- Circle Zone Coords
                drawtext = vector3(373.31, 329.68, 100.45),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(375.86, 332.01, 103.52),
                drawtext = vector3(375.53, 331.17, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(377.49, 331.43, 103.52),
                drawtext = vector3(377.3, 330.91, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(379.16, 331.11, 103.52),
                drawtext = vector3(379.03, 330.47, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(376.88, 327.22, 103.52),
                drawtext = vector3(376.21, 327.37, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(379.3, 326.6, 103.52),
                drawtext = vector3(378.64, 326.86, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(382.88, 327.45, 103.52),
                drawtext = vector3(382.47, 327.64, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(382.5, 325.68, 103.52),
                drawtext = vector3(382.03, 325.89, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(382.06, 323.97, 103.52),
                drawtext = vector3(381.6, 324.17, 103.57),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(384.37, 320.79, 103.24), vector3(386.26, 332.61, 103.24), vector3(371.79, 336.54, 103.24), vector3(368.82, 325.04, 103.24)},
    },

    ["BanhamCanyon"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-3038.12, 589.82, 9.87),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-3048.43, 587.74, 3.8, 17.02),
        ["StoolCoords"] = vector3(-3037.89, 584.75, 7.39),
        ["OfficeChairCoords"] = vector3(-3042.75, 584.3, 3.79),
        ["NpcCoords"] = vector4(-3043.27, 587.58, 3.8, 108.84),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 17.02,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(-3049.5, 589.39, 8.13), -- Circle Zone Coords
                drawtext = vector3(-3049.58, 589.62, 7.76),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-3039.15, 585.01, 8.02), -- Circle Zone Coords
                drawtext = vector3(-3039.0, 584.57, 7.91),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-3040.79, 584.48, 8.02), -- Circle Zone Coords
                drawtext = vector3(-3040.61, 583.95, 7.91),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-3040.31, 593.62, 8.16), -- Circle Zone Coords
                drawtext = vector3(-3040.82, 593.44, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-3048.43, 587.74, 4.8), -- Circle Zone Coords
                drawtext = vector3(-3048.26, 586.97, 4.8),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-3043.27, 587.58, 4.8), -- Circle Zone Coords
                drawtext = vector3(-3043.69, 587.47, 4.8),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-3043.08, 584.78, 4.27), -- Circle Zone Coords
                drawtext = vector3(-3042.88, 584.3, 4.8),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-3043.08, 584.78, 4.27), -- Circle Zone Coords
                drawtext = vector3(-3042.88, 584.3, 4.8),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-3041.57, 583.36, 4.2), -- Circle Zone Coords
                drawtext = vector3(-3042.14, 583.46, 4.8),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3045.25, 584.45, 8.1),
                drawtext = vector3(-3044.81, 584.67, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3045.69, 586.12, 8.1),
                drawtext = vector3(-3045.27, 586.28, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3046.22, 587.73, 8.1),
                drawtext = vector3(-3045.76, 587.82, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3041.82, 587.72, 8.1),
                drawtext = vector3(-3041.65, 587.12, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3042.65, 590.14, 8.1),
                drawtext = vector3(-3042.37, 589.52, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3045.37, 592.69, 8.1),
                drawtext = vector3(-3045.08, 592.36, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3043.53, 593.15, 8.1),
                drawtext = vector3(-3043.5, 592.86, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3041.89, 593.86, 8.1),
                drawtext = vector3(-3041.94, 593.36, 7.91),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-3040.03, 595.4, 7.7), vector3(-3051.89, 591.11, 7.7), vector3(-3047.47, 580.43, 7.7), vector3(-3036.24, 583.87, 7.7)},
    },

    ["Chumash"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-3239.72, 1004.37, 14.89),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-3249.58, 1006.71, 8.72, 359.06),
        ["StoolCoords"] = vector3(-3241.19, 999.77, 12.31),
        ["OfficeChairCoords"] = vector3(-3245.84, 1001.23, 8.71),
        ["NpcCoords"] = vector4(-3245.18, 1004.37, 8.72, 86.86),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 359.06,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(-3241.9, 1012.61, 12.58), -- Circle Zone Coords
                drawtext = vector3(-3241.88, 1012.94, 12.39),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-3242.25, 1000.49, 12.94), -- Circle Zone Coords
                drawtext = vector3(-3242.3, 999.99, 12.83),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-3244.01, 1000.8, 12.94), -- Circle Zone Coords
                drawtext = vector3(-3244.07, 1000.03, 12.83),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-3240.19, 1008.94, 12.78), -- Circle Zone Coords
                drawtext = vector3(-3240.77, 1009.0, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-3249.58, 1006.71, 9.72), -- Circle Zone Coords
                drawtext = vector3(-3249.68, 1006.33, 9.72),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-3245.19, 1004.44, 9.72), -- Circle Zone Coords
                drawtext = vector3(-3245.68, 1004.48, 9.72),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-3245.86, 1001.74, 9.07), -- Circle Zone Coords
                drawtext = vector3(-3245.96, 1001.16, 9.72),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-3245.86, 1001.74, 9.07), -- Circle Zone Coords
                drawtext = vector3(-3245.96, 1001.16, 9.72),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-3245.17, 999.91, 9.21), -- Circle Zone Coords
                drawtext = vector3(-3245.8, 1000.33, 9.72),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3248.18, 1002.34, 12.72),
                drawtext = vector3(-3247.57, 1002.25, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3247.98, 1004.06, 12.72),
                drawtext = vector3(-3247.38, 1004.03, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3247.84, 1005.73, 12.72),
                drawtext = vector3(-3247.27, 1005.66, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3243.8, 1004.14, 12.72),
                drawtext = vector3(-3243.86, 1003.54, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3243.57, 1006.63, 12.72),
                drawtext = vector3(-3243.59, 1005.91, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3244.91, 1010.16, 12.72),
                drawtext = vector3(-3245.0, 1009.57, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3243.13, 1010.07, 12.72),
                drawtext = vector3(-3243.2, 1009.38, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-3241.4, 1009.84, 12.5),
                drawtext = vector3(-3241.55, 1009.26, 12.83),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-3239.4, 1010.18, 12.26), vector3(-3252.61, 1010.8, 12.26), vector3(-3253.63, 998.03, 12.26), vector3(-3240.44, 996.85, 12.26)},
    },

    ["MountChiliad"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1731.18, 6411.3, 37.07),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(1736.86, 6419.64, 30.93, 245.41),
        ["StoolCoords"] = vector3(1727.26, 6414.3, 34.51),
        ["OfficeChairCoords"] = vector3(1730.32, 6418.09, 30.92),
        ["NpcCoords"] = vector4(1732.94, 6416.45, 30.93, 334.22),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 245.41,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(1723.33, 6413.2, 35.40), -- Circle Zone Coords
                drawtext = vector3(1723.21, 6413.03, 35.01),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1728.32, 6415.02, 35.15), -- Circle Zone Coords
                drawtext = vector3(1727.87, 6415.21, 35.04),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1729.09, 6416.57, 35.15), -- Circle Zone Coords
                drawtext = vector3(1728.66, 6416.79, 35.04),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(1735.43, 6410.16, 35.41), -- Circle Zone Coords
                drawtext = vector3(1735.55, 6410.4, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(1736.86, 6419.64, 31.93), -- Circle Zone Coords
                drawtext = vector3(1736.21, 6419.83, 31.93),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1732.94, 6416.45, 31.93), -- Circle Zone Coords
                drawtext = vector3(1733.1, 6416.87, 31.93),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(1730.83, 6417.92, 31.50), -- Circle Zone Coords
                drawtext = vector3(1730.31, 6418.18, 31.93),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(1730.83, 6417.92, 31.50), -- Circle Zone Coords
                drawtext = vector3(1730.31, 6418.18, 31.93),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1728.75, 6417.88, 31.21), -- Circle Zone Coords
                drawtext = vector3(1729.49, 6418.29, 31.93),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1732.2, 6419.86, 35.01),
                drawtext = vector3(1731.96, 6419.3, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1733.73, 6419.1, 35.01),
                drawtext = vector3(1733.44, 6418.63, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1735.24, 6418.29, 35.01),
                drawtext = vector3(1734.93, 6417.82, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1732.04, 6415.18, 34.82),
                drawtext = vector3(1731.69, 6415.51, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1734.5, 6413.97, 34.86),
                drawtext = vector3(1733.88, 6414.34, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1738.25, 6414.01, 34.89),
                drawtext = vector3(1737.83, 6414.36, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1737.46, 6412.38, 34.83),
                drawtext = vector3(1737.04, 6412.77, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1736.57, 6410.75, 34.84),
                drawtext = vector3(1736.22, 6411.14, 35.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(1739.45, 6406.82, 34.92), vector3(1744.68, 6417.64, 34.92), vector3(1727.6, 6426.13, 34.92), vector3(1721.94, 6414.05, 34.92)},
    },

    ["SandyShores"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1965.52, 3740.08, 33.91),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(1961.3, 3749.97, 28.23, 296.92),
        ["StoolCoords"] = vector3(1960.53, 3739.01, 31.82),
        ["OfficeChairCoords"] = vector3(1959.07, 3743.65, 28.22),
        ["NpcCoords"] = vector4(1962.03, 3744.92, 28.23, 29.62),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 296.92,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(1954.78, 3753.9, 32.62), -- Circle Zone Coords
                drawtext = vector3(1954.6, 3754.23, 32.18),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1960.52, 3740.29, 32.46), -- Circle Zone Coords
                drawtext = vector3(1960.01, 3740.0, 32.34),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1959.65, 3741.78, 32.46), -- Circle Zone Coords
                drawtext = vector3(1959.26, 3741.53, 32.34),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(1968.56, 3743.44, 32.84), -- Circle Zone Coords
                drawtext = vector3(1968.28, 3743.92, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(1961.3, 3749.97, 29.23), -- Circle Zone Coords
                drawtext = vector3(1960.96, 3749.78, 29.23),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1962.03, 3744.92, 29.23), -- Circle Zone Coords
                drawtext = vector3(1961.83, 3745.31, 29.23),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(1959.5, 3743.95, 28.87), -- Circle Zone Coords
                drawtext = vector3(1958.99, 3743.7, 29.23),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(1959.5, 3743.95, 28.87), -- Circle Zone Coords
                drawtext = vector3(1958.99, 3743.7, 29.23),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1958.41, 3742.42, 28.62), -- Circle Zone Coords
                drawtext = vector3(1958.52, 3743.07, 29.23),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1958.66, 3746.16, 32.32),
                drawtext = vector3(1958.93, 3745.66, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1960.13, 3747.06, 32.32),
                drawtext = vector3(1960.41, 3746.51, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1961.6, 3747.91, 32.31),
                drawtext = vector3(1961.89, 3747.44, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1962.7, 3743.61, 32.09),
                drawtext = vector3(1962.03, 3743.27, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1965.0, 3745.0, 31.93),
                drawtext = vector3(1964.17, 3744.63, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1966.79, 3747.96, 32.37),
                drawtext = vector3(1966.37, 3747.77, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1967.78, 3746.45, 32.36),
                drawtext = vector3(1967.33, 3746.2, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1968.64, 3744.95, 32.36),
                drawtext = vector3(1968.12, 3744.74, 32.34),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(1970.56, 3743.27, 32.21), vector3(1962.28, 3758.23, 32.21), vector3(1951.64, 3751.9, 32.21), vector3(1959.96, 3737.25, 32.21)},
    },

    ["Harmony"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(544.21, 2672.67, 43.8),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(544.02, 2662.7, 38.04, 97.8),
        ["StoolCoords"] = vector3(549.04, 2672.44, 41.63),
        ["OfficeChairCoords"] = vector3(548.62, 2667.58, 38.04),
        ["NpcCoords"] = vector4(545.41, 2667.5, 38.04, 184.63),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 97.8,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(555.08, 2665.51, 42.31), -- Circle Zone Coords
                drawtext = vector3(555.09, 2665.15, 42.2),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(548.57, 2671.25, 42.27), -- Circle Zone Coords
                drawtext = vector3(549.11, 2671.31, 42.16),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(548.79, 2669.53, 42.27), -- Circle Zone Coords
                drawtext = vector3(549.27, 2669.63, 42.16),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(539.91, 2671.47, 42.45), -- Circle Zone Coords
                drawtext = vector3(539.89, 2670.84, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(544.02, 2662.7, 39.04), -- Circle Zone Coords
                drawtext = vector3(544.49, 2662.75, 39.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(545.41, 2667.5, 39.04), -- Circle Zone Coords
                drawtext = vector3(545.47, 2667.03, 39.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(548.11, 2667.45, 38.72), -- Circle Zone Coords
                drawtext = vector3(548.68, 2667.49, 39.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(548.11, 2667.45, 38.72), -- Circle Zone Coords
                drawtext = vector3(548.68, 2667.49, 39.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(549.78, 2668.51, 38.57), -- Circle Zone Coords
                drawtext = vector3(549.57, 2667.79, 39.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(548.03, 2665.25, 41.92),
                drawtext = vector3(547.99, 2665.66, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(546.31, 2664.98, 41.94),
                drawtext = vector3(546.31, 2665.46, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(544.66, 2664.6, 41.94),
                drawtext = vector3(544.65, 2665.24, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(545.3, 2668.96, 41.92),
                drawtext = vector3(545.94, 2669.15, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(542.94, 2668.72, 41.82),
                drawtext = vector3(543.52, 2668.71, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(539.81, 2666.58, 41.83),
                drawtext = vector3(540.28, 2666.66, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(539.51, 2668.4, 42.02),
                drawtext = vector3(540.06, 2668.36, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(539.39, 2670.21, 42.02),
                drawtext = vector3(539.83, 2670.09, 42.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(550.1, 2673.66, 42.06), vector3(538.05, 2672.27, 42.06), vector3(540.3, 2655.47, 42.06), vector3(552.28, 2656.88, 42.06)},
    },

    ["GrandSenoraDesert"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(2682.49, 3281.84, 57.15),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(2673.97, 3288.49, 51.13, 329.31),
        ["StoolCoords"] = vector3(2678.93, 3278.77, 54.72),
        ["OfficeChairCoords"] = vector3(2675.29, 3282.01, 51.12),
        ["NpcCoords"] = vector4(2677.12, 3284.79, 51.13, 62.58),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 329.31,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(2676.56, 3293.89, 55.5), -- Circle Zone Coords
                drawtext = vector3(2676.8, 3294.18, 55.25),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(2678.26, 3279.86, 55.35), -- Circle Zone Coords
                drawtext = vector3(2678.04, 3279.46, 55.24),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(2676.75, 3280.7, 55.35), -- Circle Zone Coords
                drawtext = vector3(2676.46, 3280.3, 55.24),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(2683.39, 3286.81, 55.55), -- Circle Zone Coords
                drawtext = vector3(2683.07, 3287.0, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(2673.97, 3288.49, 52.13), -- Circle Zone Coords
                drawtext = vector3(2673.69, 3288.1, 52.13),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(2677.12, 3284.79, 52.13), -- Circle Zone Coords
                drawtext = vector3(2676.74, 3285.03, 52.13),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(2675.52, 3282.52, 51.79), -- Circle Zone Coords
                drawtext = vector3(2675.19, 3282.01, 52.13),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(2675.52, 3282.52, 51.79), -- Circle Zone Coords
                drawtext = vector3(2675.19, 3282.01, 52.13),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(2675.4, 3280.61, 51.59), -- Circle Zone Coords
                drawtext = vector3(2675.04, 3281.19, 52.13),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2673.66, 3283.92, 55.14),
                drawtext = vector3(2674.25, 3283.55, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2674.5, 3285.47, 55.14),
                drawtext = vector3(2675.02, 3284.95, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2675.28, 3286.97, 55.15),
                drawtext = vector3(2675.83, 3286.48, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2678.34, 3283.71, 55.07),
                drawtext = vector3(2678.09, 3283.24, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2679.76, 3286.14, 54.93),
                drawtext = vector3(2679.27, 3285.39, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2679.67, 3289.62, 55.09),
                drawtext = vector3(2679.55, 3289.24, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2681.37, 3288.92, 55.13),
                drawtext = vector3(2681.02, 3288.4, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2682.95, 3287.98, 55.14),
                drawtext = vector3(2682.58, 3287.54, 55.24),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(2685.52, 3288.63, 55.24), vector3(2675.6, 3294.4, 55.24), vector3(2669.48, 3282.91, 55.24), vector3(2679.6, 3277.74, 55.24)},
    },

    ["TataviamMountains"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(2559.97, 385.95, 110.27),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(2549.59, 387.21, 104.51, 359.48),
        ["StoolCoords"] = vector3(2558.29, 380.65, 108.1),
        ["OfficeChairCoords"] = vector3(2553.58, 381.9, 104.5),
        ["NpcCoords"] = vector4(2554.1, 385.14, 104.51, 90.03),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 359.48,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Test circuit", -- Text that appears when you target
                coords = vector3(2546.18, 371.89, 108.61), -- Circle Zone Coords
                drawtext = vector3(2545.79, 371.93, 108.61),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(2557.21, 381.32, 108.74), -- Circle Zone Coords
                drawtext = vector3(2557.25, 380.86, 108.62),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(2555.48, 381.39, 108.74), -- Circle Zone Coords
                drawtext = vector3(2555.47, 380.92, 108.62),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(2558.77, 389.82, 108.93), -- Circle Zone Coords
                drawtext = vector3(2558.28, 389.85, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(2549.59, 387.21, 105.51), -- Circle Zone Coords
                drawtext = vector3(2549.61, 386.72, 105.51),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(2554.1, 385.14, 105.51), -- Circle Zone Coords
                drawtext = vector3(2553.61, 385.15, 105.51),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(2553.56, 382.34, 105.24), -- Circle Zone Coords
                drawtext = vector3(2553.48, 381.84, 105.51),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(2553.56, 382.34, 105.24), -- Circle Zone Coords
                drawtext = vector3(2553.48, 381.84, 105.51),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(2554.28, 380.68, 104.98), -- Circle Zone Coords
                drawtext = vector3(2553.74, 381.04, 105.51),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2551.28, 382.88, 108.54),
                drawtext = vector3(2551.82, 382.92, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2551.3, 384.62, 108.56),
                drawtext = vector3(2551.88, 384.53, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2551.48, 386.3, 108.58),
                drawtext = vector3(2551.95, 386.22, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2555.55, 384.78, 108.38),
                drawtext = vector3(2555.56, 384.2, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2555.68, 387.34, 108.2),
                drawtext = vector3(2555.7, 386.76, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2554.09, 390.83, 108.55),
                drawtext = vector3(2554.11, 390.26, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2555.82, 390.74, 108.58),
                drawtext = vector3(2555.77, 390.2, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(2557.68, 390.69, 108.59),
                drawtext = vector3(2557.61, 390.12, 108.62),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(2560.0, 391.48, 108.47), vector3(2546.76, 392.14, 108.47), vector3(2546.6, 379.88, 108.47), vector3(2559.6, 379.53, 108.47)},
    },
}

if GetResourceState('cfx-fm-ltd-gasoline') == 'started' then
    Config.Stores["Davis"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-53.8, -1757.23, 30.93),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-41.69, -1753.44, 28.42, 229.83),
        ["NpcCoords"] = vector4(-41.74, -1750.38, 28.42, 153.23),
        ["ChairCoords"] = vector3(-40.59, -1751.05, 28.42),
        ["DigitalRegisterCoords"] = vector3(-47.51, -1755.71, 29.53),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 147.52,
        ["RegisterRotation2"] = 87.98,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-47.63, -1753.3, 29.46), -- Circle Zone Coords
                drawtext = vector3(-47.22, -1752.74, 29.43),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-47.51, -1755.71, 29.53), -- Circle Zone Coords
                drawtext = vector3(-46.66, -1755.82, 29.43),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-48.8, -1749.35, 29.66), -- Circle Zone Coords
                drawtext = vector3(-49.1, -1749.77, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-41.69, -1753.44, 29.42), -- Circle Zone Coords
                drawtext = vector3(-42.21, -1752.65, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-41.74, -1750.38, 29.82), -- Circle Zone Coords
                drawtext = vector3(-41.99, -1751.24, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-40.14, -1750.74, 29.29), -- Circle Zone Coords
                drawtext = vector3(-40.66, -1751.07, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-40.14, -1750.74, 29.29), -- Circle Zone Coords
                drawtext = vector3(-40.66, -1751.07, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-42.6, -1753.09, 28.88), -- Circle Zone Coords
                drawtext = vector3(-42.21, -1752.65, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-55.05, -1754.17, 29.42),
                drawtext = vector3(-54.6, -1753.61, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-56.79, -1752.64, 29.4),
                drawtext = vector3(-56.39, -1752.08, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-56.76, -1750.44, 29.42),
                drawtext = vector3(-56.34, -1750.89, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-55.5, -1748.85, 29.43),
                drawtext = vector3(-55.15, -1749.17, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-54.24, -1747.34, 29.43),
                drawtext = vector3(-53.88, -1747.65, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-54.16, -1751.91, 29.42),
                drawtext = vector3(-53.08, -1751.74, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-52.17, -1749.55, 29.44),
                drawtext = vector3(-51.45, -1749.46, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-50.42, -1747.6, 29.39),
                drawtext = vector3(-50.94, -1748.22, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-59.76, -1751.12, 29.25), vector3(-47.34, -1761.67, 29.25), vector3(-38.22, -1750.59, 29.25), vector3(-51.1, -1740.43, 29.25)},
    }

    Config.Stores["LittleSeoul"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-712.17, -909.45, 20.94),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-705.16, -906.89, 18.30, 274.03),
        ["NpcCoords"] = vector4(-706.87, -904.52, 18.22, 185.68),
        ["ChairCoords"] = vector3(-705.41, -905.81, 18.22),
        ["DigitalRegisterCoords"] = vector3(-708.14, -912.39, 19.33),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 187.53,
        ["RegisterRotation2"] = 127.99,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-709.78, -910.62, 19.26), -- Circle Zone Coords 
                drawtext = vector3(-709.84, -910.14, 19.22),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-708.14, -912.39, 19.33), -- Circle Zone Coords
                drawtext = vector3(-707.57, -912.1, 19.22),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-713.26, -907.85, 19.22), -- Circle Zone Coords
                drawtext = vector3(-713.27, -908.51, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-705.16, -906.89, 19.30), -- Circle Zone Coords
                drawtext = vector3(-705.84, -906.52, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-706.87, -904.52, 19.62), -- Circle Zone Coords
                drawtext = vector3(-706.81, -904.97, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-705.71, -903.82, 19.15), -- Circle Zone Coords
                drawtext = vector3(-705.82, -904.45, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-705.71, -903.82, 19.15), -- Circle Zone Coords
                drawtext = vector3(-705.82, -904.45, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-706.09, -907.1, 18.65), -- Circle Zone Coords
                drawtext = vector3(-705.84, -906.52, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-714.83, -916.1, 19.22),
                drawtext = vector3(-714.9, -915.27, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-717.25, -916.23, 19.22),
                drawtext = vector3(-717.28, -915.53, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-718.75, -914.39, 19.22),
                drawtext = vector3(-718.12, -914.21, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-718.77, -912.25, 19.22),
                drawtext = vector3(-718.22, -912.19, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-718.84, -910.16, 19.22),
                drawtext = vector3(-718.18, -910.2, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-715.86, -913.82, 19.22),
                drawtext = vector3(-715.14, -913.24, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-715.77, -910.69, 19.22),
                drawtext = vector3(-715.37, -910.05, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-715.55, -907.89, 19.22),
                drawtext = vector3(-715.52, -908.61, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-720.62, -916.81, 18.99), vector3(-704.17, -916.68, 18.99), vector3(-703.9, -900.17, 18.99), vector3(-720.36, -900.09, 18.99)},
    }

    Config.Stores["RichmanGlen"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-1821.94, 787.63, 141.08),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-1823.97, 799.82, 137.09, 311.31),
        ["NpcCoords"] = vector4(-1826.99, 800.48, 137.14, 235.59),
        ["ChairCoords"] = vector3(-1826.18, 801.22, 137.12),
        ["DigitalRegisterCoords"] = vector3(-1822.45, 793.76, 138.24),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 230.0,
        ["RegisterRotation2"] = 170.46,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1824.85, 793.96, 138.21), -- Circle Zone Coords
                drawtext = vector3(-1825.28, 794.34, 138.18),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1822.45, 793.76, 138.24), -- Circle Zone Coords
                drawtext = vector3(-1822.45, 794.52, 138.13),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-1828.92, 793.32, 138.48), -- Circle Zone Coords
                drawtext = vector3(-1828.68, 793.03, 138.25),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-1823.97, 799.82, 138.09), -- Circle Zone Coords
                drawtext = vector3(-1824.75, 799.45, 138.11),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-1826.99, 800.48, 138.54), -- Circle Zone Coords
                drawtext = vector3(-1826.46, 799.94, 138.14),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-1826.43, 801.6, 137.66), -- Circle Zone Coords
                drawtext = vector3(-1826.22, 801.14, 138.12),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-1826.43, 801.6, 137.66), -- Circle Zone Coords
                drawtext = vector3(-1826.22, 801.14, 138.12),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-1824.46, 799.13, 137.66), -- Circle Zone Coords
                drawtext = vector3(-1824.75, 799.45, 138.11),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1825.06, 786.52, 138.2),
                drawtext = vector3(-1825.42, 787.1, 138.25),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1826.9, 784.99, 138.19),
                drawtext = vector3(-1827.13, 785.46, 138.3),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1828.97, 785.26, 138.22),
                drawtext = vector3(-1828.52, 785.61, 138.32),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1830.29, 786.75, 138.22),
                drawtext = vector3(-1829.91, 787.15, 138.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1831.57, 788.19, 138.24),
                drawtext = vector3(-1831.18, 788.54, 138.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1827.09, 787.57, 138.21),
                drawtext = vector3(-1827.16, 788.5, 138.27),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1829.19, 789.67, 138.26),
                drawtext = vector3(-1829.24, 790.63, 138.28),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1830.69, 791.78, 138.29),
                drawtext = vector3(-1830.38, 791.45, 138.29),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-1828.56, 782.26, 138.84), vector3(-1816.18, 793.53, 138.84), vector3(-1826.2, 803.87, 138.84), vector3(-1838.57, 792.6, 138.84)},
    }

    Config.Stores["MirrorPark"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1159.93, -327.02, 71.67),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(1164.50, -315.93, 68.21, 278.87),
        ["NpcCoords"] = vector4(1162.13, -313.65, 68.21, 200.28),
        ["ChairCoords"] = vector3(1163.38, -313.58, 68.21),
        ["DigitalRegisterCoords"] = vector3(1162.5, -321.87, 69.32),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 197.53,
        ["RegisterRotation2"] = 137.99,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1160.58, -320.41, 69.25), -- Circle Zone Coords
                drawtext = vector3(1160.51, -319.85, 69.21),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1162.5, -321.87, 69.32), -- Circle Zone Coords
                drawtext = vector3(1162.88, -321.39, 69.21),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(1156.8, -318.77, 69.44), -- Circle Zone Coords
                drawtext = vector3(1156.86, -319.22, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(1164.50, -315.93, 69.21), -- Circle Zone Coords
                drawtext = vector3(1163.55, -315.86, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1162.13, -313.65, 69.61), -- Circle Zone Coords
                drawtext = vector3(1162.34, -314.12, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(1163.44, -312.95, 68.81), -- Circle Zone Coords
                drawtext = vector3(1163.3, -313.64, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(1163.44, -312.95, 68.81), -- Circle Zone Coords
                drawtext = vector3(1163.3, -313.64, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1163.62, -316.29, 68.77), -- Circle Zone Coords
                drawtext = vector3(1163.55, -315.86, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1156.41, -326.45, 69.09),
                drawtext = vector3(1156.3, -326.07, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1154.15, -326.91, 68.94),
                drawtext = vector3(1154.03, -326.46, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1152.55, -325.62, 69.02),
                drawtext = vector3(1152.96, -325.58, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1152.22, -323.54, 69.05),
                drawtext = vector3(1152.63, -323.38, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1151.76, -321.73, 69.24),
                drawtext = vector3(1152.31, -321.58, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1155.39, -324.46, 69.12),
                drawtext = vector3(1155.77, -323.81, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1154.66, -321.68, 69.14),
                drawtext = vector3(1155.25, -320.91, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1154.45, -318.82, 69.16),
                drawtext = vector3(1154.52, -319.53, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(1151.04, -328.32, 69.32), vector3(1167.47, -325.5, 69.32), vector3(1164.68, -311.37, 69.32), vector3(1148.37, -314.27, 69.32)},
    }

    Config.Stores["GrapeSeed"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1698.47, 4929.45, 43.93),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(1703.02, 4918.25, 41.07, 144.80),
        ["NpcCoords"] = vector4(1706.1, 4918.27, 41.07, 68.48),
        ["ChairCoords"] = vector3(1705.47, 4917.37, 41.07),
        ["DigitalRegisterCoords"] = vector3(1700.23, 4923.86, 42.18),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 62.53,
        ["RegisterRotation2"] = 2.99,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1702.62, 4924.18, 42.1), -- Circle Zone Coords
                drawtext = vector3(1703.03, 4923.78, 42.07),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1700.23, 4923.86, 42.18), -- Circle Zone Coords
                drawtext = vector3(1700.35, 4923.05, 42.07),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(1706.45, 4925.69, 42.3), -- Circle Zone Coords
                drawtext = vector3(1706.12, 4926.02, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(1703.02, 4918.25, 42.07), -- Circle Zone Coords
                drawtext = vector3(1703.72, 4918.81, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1706.1, 4918.27, 42.47), -- Circle Zone Coords
                drawtext = vector3(1705.62, 4918.51, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(1705.87, 4916.86, 41.94), -- Circle Zone Coords
                drawtext = vector3(1705.44, 4917.48, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(1705.87, 4916.86, 41.94), -- Circle Zone Coords
                drawtext = vector3(1705.44, 4917.48, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1703.3, 4919.18, 41.61), -- Circle Zone Coords
                drawtext = vector3(1703.72, 4918.81, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1701.25, 4931.45, 42.02),
                drawtext = vector3(1701.76, 4931.1, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1702.6, 4933.41, 41.98),
                drawtext = vector3(1702.95, 4933.09, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1704.72, 4933.61, 42.11),
                drawtext = vector3(1704.42, 4933.17, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1706.34, 4932.45, 42.15),
                drawtext = vector3(1706.06, 4931.95, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1708.02, 4931.37, 42.17),
                drawtext = vector3(1707.68, 4930.83, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1703.54, 4930.83, 42.05),
                drawtext = vector3(1703.68, 4930.04, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1705.89, 4929.04, 42.08),
                drawtext = vector3(1706.08, 4928.3, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1707.92, 4927.57, 42.04),
                drawtext = vector3(1707.52, 4927.83, 42.07),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(1705.07, 4938.0, 42.18), vector3(1693.64, 4921.75, 42.18), vector3(1706.17, 4912.73, 42.18), vector3(1718.39, 4928.88, 42.18)},
    }
else
    Config.Stores["Davis"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-53.8, -1757.23, 30.93),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-41.85, -1749.36, 28.42, 319.47),
        ["NpcCoords"] = vector4(-44.64, -1750.84, 28.42, 291.46),
        ["ChairCoords"] = vector3(-40.59, -1751.05, 28.42),
        ["DigitalRegisterCoords"] = vector3(-47.51, -1755.71, 29.53),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 49.99,
        ["RegisterRotation2"] = 49.99,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-48.51, -1759.23, 29.54), -- Circle Zone Coords
                drawtext = vector3(-47.93, -1759.37, 29.42),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-47.2, -1757.67, 29.41), -- Circle Zone Coords
                drawtext = vector3(-46.79, -1758.01, 29.42),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-57.3, -1751.8, 29.63), -- Circle Zone Coords
                drawtext = vector3(-56.94, -1752.1, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-41.85, -1749.36, 29.42), -- Circle Zone Coords
                drawtext = vector3(-42.21, -1749.84, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-44.64, -1750.84, 29.42), -- Circle Zone Coords
                drawtext = vector3(-44.24, -1750.65, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-44.61, -1749.06, 29.11), -- Circle Zone Coords
                drawtext = vector3(-44.14, -1749.46, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-44.61, -1749.06, 29.11), -- Circle Zone Coords
                drawtext = vector3(-44.14, -1749.46, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-43.85, -1748.06, 28.94), -- Circle Zone Coords
                drawtext = vector3(-43.29, -1748.5, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-48.77, -1754.54, 29.43),
                drawtext = vector3(-48.73, -1755.29, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-50.31, -1752.58, 29.41),
                drawtext = vector3(-50.4, -1753.09, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-52.38, -1752.62, 29.4),
                drawtext = vector3(-52.41, -1753.35, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-52.78, -1750.5, 29.38),
                drawtext = vector3(-52.74, -1751.15, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-56.33, -1750.28, 29.37),
                drawtext = vector3(-56.02, -1750.42, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-54.34, -1747.84, 29.38),
                drawtext = vector3(-54.12, -1748.08, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-51.51, -1747.42, 29.34),
                drawtext = vector3(-51.92, -1747.82, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-49.16, -1749.38, 29.33),
                drawtext = vector3(-49.6, -1749.78, 29.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-59.76, -1751.12, 29.25), vector3(-47.34, -1761.67, 29.25), vector3(-38.22, -1750.59, 29.25), vector3(-51.1, -1740.43, 29.25)},
    }

    Config.Stores["LittleSeoul"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-711.7, -916.78, 21.15),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-707.75, -903.86, 18.22, 3.06),
        ["NpcCoords"] = vector4(-709.13, -906.89, 18.22, 336.96),
        ["ChairCoords"] = vector3(-40.59, -1751.05, 28.42),
        ["DigitalRegisterCoords"] = vector3(-47.51, -1755.71, 29.53),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 90.0,
        ["RegisterRotation2"] = 90.0,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-706.64, -915.72, 19.33), -- Circle Zone Coords
                drawtext = vector3(-706.12, -915.48, 19.22),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-706.64, -913.69, 19.20), -- Circle Zone Coords
                drawtext = vector3(-706.11, -913.68, 19.22),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-718.19, -915.72, 19.83), -- Circle Zone Coords
                drawtext = vector3(-717.62, -915.72, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-707.75, -903.86, 19.22), -- Circle Zone Coords
                drawtext = vector3(-707.8, -904.35, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-709.13, -906.89, 19.22), -- Circle Zone Coords
                drawtext = vector3(-708.96, -906.56, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-710.19, -905.43, 18.97), -- Circle Zone Coords
                drawtext = vector3(-709.56, -905.47, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-710.19, -905.43, 18.97), -- Circle Zone Coords
                drawtext = vector3(-709.56, -905.47, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-710.23, -904.11, 18.79), -- Circle Zone Coords
                drawtext = vector3(-709.54, -904.1, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-709.72, -912.36, 19.21),
                drawtext = vector3(-709.2, -912.91, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-712.33, -911.75, 19.15),
                drawtext = vector3(-711.95, -912.24, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-713.81, -913.19, 19.14),
                drawtext = vector3(-713.42, -913.74, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-715.64, -911.76, 19.04),
                drawtext = vector3(-715.12, -912.3, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-718.72, -914.56, 19.06),
                drawtext = vector3(-718.11, -913.79, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-718.69, -910.71, 18.99),
                drawtext = vector3(-718.11, -910.69, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-716.53, -908.56, 19.05),
                drawtext = vector3(-716.58, -909.18, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-713.41, -908.67, 19.03),
                drawtext = vector3(-713.61, -909.18, 19.22),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-720.62, -916.81, 18.99), vector3(-704.17, -916.68, 18.99), vector3(-703.9, -900.17, 18.99), vector3(-720.36, -900.09, 18.99)},
    }

    Config.Stores["RichmanGlen"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-1822.28, 788.07, 139.85),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(-1827.93, 800.13, 137.16, 42.18),
        ["NpcCoords"] = vector4(-1826.86, 796.98, 137.17, 14.68),
        ["ChairCoords"] = vector3(-40.59, -1751.05, 28.42),
        ["DigitalRegisterCoords"] = vector3(-47.51, -1755.71, 29.53),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 132.47,
        ["RegisterRotation2"] = 132.47,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1819.09, 792.32, 138.21), -- Circle Zone Coords
                drawtext = vector3(-1818.8, 793.09, 138.08),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1820.47, 793.82, 138.08), -- Circle Zone Coords
                drawtext = vector3(-1819.88, 794.23, 138.08),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(-1827.51, 784.62, 138.8), -- Circle Zone Coords
                drawtext = vector3(-1827.19, 784.9, 138.3),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(-1827.93, 800.13, 138.16), -- Circle Zone Coords
                drawtext = vector3(-1827.36, 799.63, 138.15),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-1826.86, 796.98, 138.17), -- Circle Zone Coords
                drawtext = vector3(-1826.99, 797.44, 138.17),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(-1828.65, 797.54, 137.90), -- Circle Zone Coords
                drawtext = vector3(-1828.22, 797.93, 138.18),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(-1828.65, 797.54, 137.90), -- Circle Zone Coords
                drawtext = vector3(-1828.22, 797.93, 138.18),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-1829.61, 798.39, 137.79), -- Circle Zone Coords
                drawtext = vector3(-1829.05, 798.9, 138.19),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1823.58, 792.67, 138.08),
                drawtext = vector3(-1823.05, 792.68, 138.15),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1826.08, 791.36, 138.04),
                drawtext = vector3(-1825.43, 791.28, 138.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1826.37, 789.17, 138.06),
                drawtext = vector3(-1825.45, 789.22, 138.23),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1828.37, 789.21, 138.05),
                drawtext = vector3(-1827.76, 789.03, 138.27),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1829.26, 785.67, 138.14),
                drawtext = vector3(-1828.67, 786.1, 138.31),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1831.13, 788.07, 138.14),
                drawtext = vector3(-1830.91, 788.23, 138.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1831.1, 790.86, 138.19),
                drawtext = vector3(-1830.76, 790.38, 138.3),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1828.91, 792.99, 138.17),
                drawtext = vector3(-1828.55, 792.45, 138.25),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-1828.56, 782.26, 138.84), vector3(-1816.18, 793.53, 138.84), vector3(-1826.2, 803.87, 138.84), vector3(-1838.57, 792.6, 138.84)},
    }

    Config.Stores["MirrorPark"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1159.75, -327.2, 71.67),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(1161.28, -313.38, 68.21, 9.15),
        ["NpcCoords"] = vector4(1160.51, -316.84, 68.21, 336.91),
        ["ChairCoords"] = vector3(-40.59, -1751.05, 28.42),
        ["DigitalRegisterCoords"] = vector3(-47.51, -1755.71, 29.53),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 100.0,
        ["RegisterRotation2"] = 100.0,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1164.56, -324.89, 69.32), -- Circle Zone Coords
                drawtext = vector3(1165.04, -324.54, 69.21),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1164.21, -322.89, 69.19), -- Circle Zone Coords
                drawtext = vector3(1164.76, -322.75, 69.21),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(1153.21, -326.89, 69.51), -- Circle Zone Coords
                drawtext = vector3(1153.75, -326.8, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(1161.28, -313.38, 69.21), -- Circle Zone Coords
                drawtext = vector3(1161.41, -314.09, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1160.51, -316.84, 69.21), -- Circle Zone Coords
                drawtext = vector3(1160.76, -316.31, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(1159.2, -315.36, 68.86), -- Circle Zone Coords
                drawtext = vector3(1159.85, -315.32, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(1159.2, -315.36, 68.86), -- Circle Zone Coords
                drawtext = vector3(1159.85, -315.32, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1159.06, -314.13, 68.86), -- Circle Zone Coords
                drawtext = vector3(1159.7, -314.04, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1160.82, -322.06, 69.14),
                drawtext = vector3(1161.4, -322.5, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1158.26, -322.01, 69.13),
                drawtext = vector3(1158.74, -322.33, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1156.97, -323.65, 69.15),
                drawtext = vector3(1157.57, -324.03, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1155.12, -322.48, 69.08),
                drawtext = vector3(1155.64, -322.96, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1152.38, -325.1, 69.08),
                drawtext = vector3(1153.01, -324.99, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1151.93, -322.05, 69.09),
                drawtext = vector3(1152.41, -322.05, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1153.64, -319.7, 69.08),
                drawtext = vector3(1153.57, -320.18, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1156.65, -319.33, 69.08),
                drawtext = vector3(1156.65, -319.65, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(1151.04, -328.32, 69.32), vector3(1167.47, -325.5, 69.32), vector3(1164.68, -311.37, 69.32), vector3(1148.37, -314.27, 69.32)},
    }

    Config.Stores["GrapeSeed"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1698.78, 4929.27, 43.85),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["ServerCoords"] = vector4(1707.15, 4918.88, 41.06, 232.3),
        ["NpcCoords"] = vector4(1705.12, 4921.63, 41.06, 206.51),
        ["ChairCoords"] = vector3(-40.59, -1751.05, 28.42),
        ["DigitalRegisterCoords"] = vector3(-47.51, -1755.71, 29.53),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation1"] = 325.0,
        ["RegisterRotation2"] = 325.0,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1696.64, 4924.54, 42.18), -- Circle Zone Coords
                drawtext = vector3(1696.57, 4923.92, 42.06),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Register2"] = {
                name = "Register2",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1698.31, 4923.37, 42.05), -- Circle Zone Coords
                drawtext = vector3(1697.96, 4922.99, 42.06),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Insert USB", -- Text that appears when you target
                coords = vector3(1703.26, 4934.0, 42.26), -- Circle Zone Coords
                drawtext = vector3(1702.86, 4933.41, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fab fa-usb", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Server"] = {
                name = "Server",
                label = "Connect harddrive", -- Text that appears when you target
                coords = vector3(1707.15, 4918.88, 42.06), -- Circle Zone Coords
                drawtext = vector3(1706.62, 4919.21, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-server", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1705.12, 4921.63, 42.06), -- Circle Zone Coords
                drawtext = vector3(1705.35, 4921.16, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Computer1"] = {
                name = "Computer1",
                label = "Connect to the harddrive", -- Text that appears when you target
                coords = vector3(1707.12, 4921.51, 41.94), -- Circle Zone Coords
                drawtext = vector3(1706.78, 4921.0, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Computer2"] = {
                name = "Computer2",
                label = "Copy password", -- Text that appears when you target
                coords = vector3(1707.12, 4921.51, 41.94), -- Circle Zone Coords
                drawtext = vector3(1706.78, 4921.0, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-keyboard", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1708.2, 4920.92, 41.61), -- Circle Zone Coords
                drawtext = vector3(1707.78, 4920.28, 42.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1701.18, 4925.16, 42.09),
                drawtext = vector3(1161.4, -322.5, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1703.1, 4926.98, 41.95),
                drawtext = vector3(1158.74, -322.33, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1702.87, 4928.94, 41.96),
                drawtext = vector3(1157.57, -324.03, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1705.26, 4929.67, 41.88),
                drawtext = vector3(1155.64, -322.96, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1705.07, 4933.14, 41.94),
                drawtext = vector3(1153.01, -324.99, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1707.6, 4931.5, 41.92),
                drawtext = vector3(1152.41, -322.05, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1708.19, 4928.48, 41.88),
                drawtext = vector3(1153.57, -320.18, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf8"] = {
                name = "Shelf8",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1706.28, 4926.09, 41.88),
                drawtext = vector3(1156.65, -319.65, 69.21),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(1705.07, 4938.0, 42.18), vector3(1693.64, 4921.75, 42.18), vector3(1706.17, 4912.73, 42.18), vector3(1718.39, 4928.88, 42.18)},
    }
end

if GetResourceState('cfx-mxc-liquorstore') == 'started' then
    Config.Stores["VespucciCanals"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-1226.82, -902.07, 13.99),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(-1219.41, -910.58, 11.30, 123.00),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 32.7,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1221.42, -908.36, 12.29), -- Circle Zone Coords
                drawtext = vector3(-1221.16, -908.71, 12.33),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-1219.41, -910.58, 12.53), -- Circle Zone Coords
                drawtext = vector3(-1220.0, -911.16, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(-1219.22, -912.48, 12.53), -- Circle Zone Coords
                drawtext = vector3(-1219.17, -912.14, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-1216.98, -914.6, 12.38), -- Circle Zone Coords
                drawtext = vector3(-1217.16, -914.27, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1226.51, -907.17, 12.56),
                drawtext = vector3(-1226.06, -906.89, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1227.29, -906.03, 12.56),
                drawtext = vector3(-1226.8, -905.81, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1227.95, -905.03, 12.56),
                drawtext = vector3(-1227.46, -904.84, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1223.27, -902.93, 12.28),
                drawtext = vector3(-1223.67, -903.11, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1222.35, -904.23, 12.37),
                drawtext = vector3(-1222.88, -904.43, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1225.38, -908.55, 12.76),
                drawtext = vector3(-1225.09, -908.46, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1224.69, -906.14, 12.27),
                drawtext = vector3(-1225.15, -906.39, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-1222.64, -899.35, 12.39), vector3(-1210.81, -913.93, 12.39), vector3(-1223.09, -921.91, 12.39), vector3(-1232.55, -906.31, 12.39)},
    }

    Config.Stores["MorningWood"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-1491.47, -383.78, 42.39),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(-1483.87, -375.35, 39.16, 221.85),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 135.9,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1486.27, -377.68, 40.11), -- Circle Zone Coords
                drawtext = vector3(-1485.83, -377.22, 40.17),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-1483.87, -375.35, 40.16), -- Circle Zone Coords
                drawtext = vector3(-1483.32, -375.96, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(-1482.59, -374.61, 40.17), -- Circle Zone Coords
                drawtext = vector3(-1482.85, -374.89, 40.17),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-1480.76, -371.95, 40.16), -- Circle Zone Coords
                drawtext = vector3(-1481.38, -372.66, 40.17),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1484.7, -381.71, 40.35),
                drawtext = vector3(-1485.04, -381.24, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1485.81, -382.88, 40.35),
                drawtext = vector3(-1486.15, -382.36, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1486.89, -384.03, 40.35),
                drawtext = vector3(-1487.19, -383.44, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1488.28, -384.59, 40.35),
                drawtext = vector3(-1488.71, -384.22, 40.17),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1491.83, -380.94, 40.35),
                drawtext = vector3(-1491.4, -380.53, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1489.88, -379.47, 40.35),
                drawtext = vector3(-1489.52, -379.91, 40.17),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1487.95, -381.24, 39.8),
                drawtext = vector3(-1487.3, -381.89, 40.17),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(-1486.32, -389.65, 39.9), vector3(-1472.93, -375.89, 39.9), vector3(-1481.95, -366.53, 39.9), vector3(-1496.84, -378.62, 39.9)},
    }

    Config.Stores["GreatOceanHighway"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-2974.49, 390.58, 16.87),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(-2963.0, 390.87, 14.04, 173.4),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 86.9,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-2966.15, 391.35, 14.99), -- Circle Zone Coords
                drawtext = vector3(-2965.55, 391.32, 15.06),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-2963.0, 390.87, 15.04), -- Circle Zone Coords
                drawtext = vector3(-2963.0, 390.26, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(-2961.43, 390.63, 15.06), -- Circle Zone Coords
                drawtext = vector3(-2962.05, 390.7, 15.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-2958.19, 390.89, 15.03), -- Circle Zone Coords
                drawtext = vector3(-2959.06, 390.96, 15.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2968.13, 387.32, 14.95),
                drawtext = vector3(-2968.15, 387.6, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2969.78, 387.36, 14.95),
                drawtext = vector3(-2969.69, 387.82, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2971.29, 387.53, 14.95),
                drawtext = vector3(-2971.28, 387.89, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2972.66, 388.04, 14.95),
                drawtext = vector3(-2972.61, 389.04, 15.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2972.1, 393.2, 14.91),
                drawtext = vector3(-2971.71, 393.0, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2969.86, 392.92, 15.05),
                drawtext = vector3(-2969.9, 392.43, 15.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2969.93, 390.17, 14.72),
                drawtext = vector3(-2970.02, 389.32, 15.06),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(-2974.17, 382.18, 14.91), vector3(-2957.38, 380.53, 14.91), vector3(-2956.41, 395.43, 14.91), vector3(-2973.5, 396.57, 14.91)},
    }

    Config.Stores["MurrietaHeights"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1141.57, -980.89, 48.37),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(1130.77, -983.28, 45.42, 8.59),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 279.32,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1134.13, -983.1, 46.37), -- Circle Zone Coords
                drawtext = vector3(1133.44, -983.07, 46.43),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1130.77, -983.28, 46.42), -- Circle Zone Coords
                drawtext = vector3(1130.67, -982.75, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(1129.44, -983.4, 46.43), -- Circle Zone Coords
                drawtext = vector3(1129.9, -983.35, 46.43),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1126.29, -984.37, 46.39), -- Circle Zone Coords
                drawtext = vector3(1127.03, -984.24, 46.43),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1135.2, -978.71, 46.7),
                drawtext = vector3(1135.17, -979.05, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1137.09, -978.66, 46.7),
                drawtext = vector3(1136.9, -978.76, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.7, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1138.55, -978.81, 46.7),
                drawtext = vector3(1138.37, -978.56, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1139.8, -978.67, 46.7),
                drawtext = vector3(1137.78, -982.07, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1140.38, -983.64, 46.47),
                drawtext = vector3(1140.31, -983.06, 46.43),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1138.11, -984.0, 46.42),
                drawtext = vector3(1138.01, -983.27, 46.43),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1137.53, -980.92, 46.05),
                drawtext = vector3(1137.43, -980.24, 46.43),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(1140.81, -976.27, 46.25), vector3(1123.7, -978.93, 46.25), vector3(1124.47, -993.08, 46.25), vector3(1143.02, -990.4, 46.25)},
    }

    Config.Stores["BolingBroke"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1166.43, 2703.84, 39.18),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(1165.6, 2714.34, 37.16, 268.24),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 180.95,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1165.4, 2711.05, 38.09), -- Circle Zone Coords
                drawtext = vector3(1165.43, 2711.6, 38.16),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1165.6, 2714.34, 38.16), -- Circle Zone Coords
                drawtext = vector3(1166.09, 2714.33, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(1165.82, 2715.77, 38.16), -- Circle Zone Coords
                drawtext = vector3(1165.8, 2715.32, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1165.33, 2719.07, 38.15), -- Circle Zone Coords
                drawtext = vector3(1165.28, 2718.31, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1169.52, 2709.32, 38.32),
                drawtext = vector3(1169.23, 2709.3, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1169.46, 2707.69, 38.32),
                drawtext = vector3(1169.24, 2707.72, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1169.53, 2706.15, 38.32),
                drawtext = vector3(1169.32, 2706.15, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1168.83, 2704.85, 38.32),
                drawtext = vector3(1168.48, 2704.85, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1164.01, 2704.99, 38.32),
                drawtext = vector3(1164.12, 2705.29, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1164.14, 2707.24, 38.32),
                drawtext = vector3(1164.66, 2707.24, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1166.8, 2707.41, 38.32),
                drawtext = vector3(1167.61, 2707.41, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(1158.38, 2702.84, 38.12), vector3(1170.88, 2703.34, 38.12), vector3(1170.38, 2721.67, 38.12), vector3(1158.37, 2721.75, 38.12)},
    }
else
    Config.Stores["VespucciCanals"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-1226.82, -902.07, 13.99),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(-1220.01, -911.22, 11.33, 123.84),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 32.7,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1222.33, -907.82, 12.43), -- Circle Zone Coords
                drawtext = vector3(-1222.01, -908.3, 12.33),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-1220.01, -911.22, 12.33), -- Circle Zone Coords
                drawtext = vector3(-1220.49, -911.49, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(-1220.55, -913.15, 12.22), -- Circle Zone Coords
                drawtext = vector3(-1220.89, -912.6, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-1221.2, -916.25, 11.33), -- Circle Zone Coords
                drawtext = vector3(-1220.68, -915.91, 11.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1225.74, -909.05, 12.39),
                drawtext = vector3(-1225.47, -909.02, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1226.76, -907.76, 12.39),
                drawtext = vector3(-1226.38, -907.61, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1227.64, -906.53, 12.39),
                drawtext = vector3(-1227.3, -906.28, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1223.36, -904.77, 12.39),
                drawtext = vector3(-1224.01, -905.12, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1223.62, -902.47, 12.39),
                drawtext = vector3(-1223.45, -902.79, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1222.03, -903.18, 12.39),
                drawtext = vector3(-1222.29, -903.37, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1220.88, -905.03, 12.39),
                drawtext = vector3(-1221.11, -905.22, 12.33),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },

        ["Zone"] = {vector3(-1222.64, -899.35, 12.39), vector3(-1210.81, -913.93, 12.39), vector3(-1223.09, -921.91, 12.39), vector3(-1232.55, -906.31, 12.39)},
    }

    Config.Stores["MorningWood"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-1491.47, -383.78, 42.39),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(-1483.87, -375.35, 39.16, 221.85),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 133.77,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-1486.67, -378.46, 40.27), -- Circle Zone Coords
                drawtext = vector3(-1486.22, -378.05, 40.16),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-1483.87, -375.35, 40.16), -- Circle Zone Coords
                drawtext = vector3(-1483.32, -375.96, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(-1481.99, -375.86, 40.13), -- Circle Zone Coords
                drawtext = vector3(-1482.36, -376.07, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-1478.62, -375.8, 39.16), -- Circle Zone Coords
                drawtext = vector3(-1479.03, -375.38, 39.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1484.7, -381.71, 40.35),
                drawtext = vector3(-1485.04, -381.24, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1485.81, -382.88, 40.35),
                drawtext = vector3(-1486.15, -382.36, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1486.89, -384.03, 40.35),
                drawtext = vector3(-1487.19, -383.44, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1489.44, -380.01, 40.35),
                drawtext = vector3(-1488.96, -380.58, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1491.83, -380.94, 40.35),
                drawtext = vector3(-1491.4, -380.53, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1491.17, -378.95, 40.35),
                drawtext = vector3(-1491.04, -379.34, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-1489.71, -377.49, 40.35),
                drawtext = vector3(-1489.5, -377.88, 40.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(-1486.32, -389.65, 39.9), vector3(-1472.93, -375.89, 39.9), vector3(-1481.95, -366.53, 39.9), vector3(-1496.84, -378.62, 39.9)},
    }

    Config.Stores["GreatOceanHighway"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(-2974.49, 390.58, 16.87),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(-2963.0, 390.87, 14.04, 173.4),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 85.24,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(-2967.03, 390.9, 15.15), -- Circle Zone Coords
                drawtext = vector3(-2966.46, 390.9, 15.04),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(-2963.0, 390.87, 15.04), -- Circle Zone Coords
                drawtext = vector3(-2963.0, 390.26, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(-2961.79, 389.05, 15.03), -- Circle Zone Coords
                drawtext = vector3(-2962.53, 389.09, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(-2959.6, 386.9, 14.04), -- Circle Zone Coords
                drawtext = vector3(-2959.56, 387.29, 14.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2968.13, 387.32, 14.85),
                drawtext = vector3(-2968.15, 387.6, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2969.78, 387.36, 14.84),
                drawtext = vector3(-2969.69, 387.82, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2971.29, 387.53, 14.93),
                drawtext = vector3(-2971.28, 387.89, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2969.92, 391.84, 14.98),
                drawtext = vector3(-2970.19, 391.22, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2972.1, 393.2, 14.91),
                drawtext = vector3(-2971.71, 393.0, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2970.47, 393.99, 15.0),
                drawtext = vector3(-2970.48, 393.64, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(-2968.23, 393.91, 15.0),
                drawtext = vector3(-2968.41, 393.43, 15.04),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(-2974.17, 382.18, 14.91), vector3(-2957.38, 380.53, 14.91), vector3(-2956.41, 395.43, 14.91), vector3(-2973.5, 396.57, 14.91)},
    }

    Config.Stores["MurrietaHeights"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1141.57, -980.89, 48.37),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(1130.77, -983.28, 45.42, 8.59),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 276.69,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1134.81, -982.36, 46.52), -- Circle Zone Coords
                drawtext = vector3(1134.19, -982.45, 46.42),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1130.77, -983.28, 46.42), -- Circle Zone Coords
                drawtext = vector3(1130.67, -982.75, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(1129.24, -981.67, 46.41), -- Circle Zone Coords
                drawtext = vector3(1129.79, -981.57, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1126.75, -979.62, 45.40), -- Circle Zone Coords
                drawtext = vector3(1126.8, -980.06, 45.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1135.2, -978.71, 46.37),
                drawtext = vector3(1135.17, -979.05, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1136.78, -978.34, 46.36),
                drawtext = vector3(1136.9, -978.76, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1138.33, -978.12, 46.35),
                drawtext = vector3(1138.37, -978.56, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1137.88, -982.58, 46.32),
                drawtext = vector3(1137.78, -982.07, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1140.15, -983.56, 46.2),
                drawtext = vector3(1139.82, -983.5, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1138.77, -984.61, 46.69),
                drawtext = vector3(1138.79, -984.3, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1136.61, -984.94, 46.69),
                drawtext = vector3(1136.59, -984.6, 46.42),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(1140.81, -976.27, 46.25), vector3(1123.7, -978.93, 46.25), vector3(1124.47, -993.08, 46.25), vector3(1143.02, -990.4, 46.25)},
    }

    Config.Stores["BolingBroke"] = {
        ["Reset"] = 40, -- (Minutes) Resets the store
        ["AlarmCoords"] = vector3(1166.43, 2703.84, 39.18),
        ["RegisterRobbingTime"] = 10, -- Seconds
        ["NpcCoords"] = vector4(1165.6, 2714.34, 37.16, 268.24),
        ["NpcModel"] = "ig_jimmyboston_02",
        ["RegisterRotation"] = 178.85,

        ["OnCooldown"] = false, -- Don't touch

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Register1"] = {
                name = "Register1",
                label = "Break open", -- Text that appears when you target
                coords = vector3(1165.96, 2710.2, 38.26), -- Circle Zone Coords
                drawtext = vector3(1165.95, 2710.77, 38.16),
                distance = 0.7, -- How far will you be able to interact with it
                icon = "fas fa-cash-register", -- Icon
                size = 0.4, -- Circle Zone size
            },
            ["Npc"] = {
                name = "Npc",
                label = "Threaten", -- Text that appears when you target
                coords = vector3(1165.6, 2714.34, 38.16), -- Circle Zone Coords
                drawtext = vector3(1166.09, 2714.33, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-person", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Atm"] = {
                name = "Atm",
                label = "Unlock door", -- Text that appears when you target
                coords = vector3(1167.46, 2715.53, 37.99), -- Circle Zone Coords
                drawtext = vector3(1167.46, 2715.01, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Safe"] = {
                name = "Safe",
                label = "Unlock safe", -- Text that appears when you target
                coords = vector3(1169.58, 2717.83, 37.58), -- Circle Zone Coords
                drawtext = vector3(1169.15, 2717.93, 37.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-lock", -- Icon
                size = 0.5, -- Circle Zone size
            },
            ["Shelf1"] = {
                name = "Shelf1",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1169.52, 2709.32, 38.05),
                drawtext = vector3(1169.23, 2709.3, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf2"] = {
                name = "Shelf2",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1169.46, 2707.69, 38.06),
                drawtext = vector3(1169.24, 2707.72, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf3"] = {
                name = "Shelf3",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1169.53, 2706.15, 38.06),
                drawtext = vector3(1169.32, 2706.15, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf4"] = {
                name = "Shelf4",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1165.11, 2707.23, 37.94),
                drawtext = vector3(1165.85, 2707.13, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf5"] = {
                name = "Shelf5",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1164.01, 2704.99, 38.32),
                drawtext = vector3(1164.12, 2705.29, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf6"] = {
                name = "Shelf6",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1163.11, 2706.67, 38.32),
                drawtext = vector3(1163.42, 2706.56, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
            ["Shelf7"] = {
                name = "Shelf7",
                label = "Grab", -- Text that appears when you target
                coords = vector3(1163.11, 2708.68, 38.34),
                drawtext = vector3(1163.53, 2708.73, 38.16),
                distance = 1.0, -- How far will you be able to interact with it
                icon = "fas fa-hand-back-fist", -- Icon
                size = 0.8, -- Circle Zone size
            },
        },
        ["Zone"] = {vector3(1158.38, 2702.84, 38.12), vector3(1170.88, 2703.34, 38.12), vector3(1170.38, 2721.67, 38.12), vector3(1158.37, 2721.75, 38.12)},
    }
end

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
    ["VespucciCanals"] = {},
    ["MorningWood"] = {},
    ["GreatOceanHighway"] = {},
    ["MurrietaHeights"] = {},
    ["BolingBroke"] = {},
}

if GetResourceState('cfx-mxc-liquorstore') == 'started' then
    Config.DoorList = {
        ["VespucciCanals"] = {
            {
                objYaw = 33.37,
                objCoords = vector3(-1219.81, -912.93, 12.4),
                objHash = 1760805631,
                locked = true,
            },
        },
        ["MorningWood"] = {
            {
                objYaw = 135.0,
                objCoords = vector3(-1481.97, -375.23, 40.24),
                objHash = 1760805631,
                locked = true,
            },
        },
        ["GreatOceanHighway"] = {
            {
                objYaw = 85.59,
                objCoords = vector3(-2961.49, 389.72, 15.13),
                objHash = 1760805631,
                locked = true,
            },
        },
        ["MurrietaHeights"] = {
            {
                objYaw = 278.42,
                objCoords = vector3(1129.22, -982.51, 46.5),
                objHash = 1760805631,
                locked = true,
            },
        },
        ["BolingBroke"] = {
            {
                objYaw = 179.6,
                objCoords = vector3(1166.71, 2715.82, 38.23),
                objHash = 1760805631,
                locked = true,
            },
        },
    }
else
    Config.DoorList = {
        ["VespucciCanals"] = {
            {
                objYaw = 33.86,
                objCoords = vector3(-1219.63, -912.41, 12.48),
                objHash = 1173348778,
                locked = true,
            },
        },
        ["MorningWood"] = {
            {
                objYaw = 134.93,
                objCoords = vector3(-1482.69, -374.94, 40.31),
                objHash = 1173348778,
                locked = true,
            },
        },
        ["GreatOceanHighway"] = {
            {
                objYaw = 86.39,
                objCoords = vector3(-2961.75, 390.26, 15.19),
                objHash = 1173348778,
                locked = true,
            },
        },
        ["MurrietaHeights"] = {
            {
                objYaw = 277.84,
                objCoords = vector3(1129.51, -982.78, 46.57),
                objHash = 1173348778,
                locked = true,
            },
        },
        ["BolingBroke"] = {
            {
                objYaw = 179.92,
                objCoords = vector3(1166.27, 2715.51, 38.31),
                objHash = 1173348778,
                locked = true,
            },
        },
    }
end

Config.Steps = {
    ["Strawberry"] = {},
    ["DowntownVineWood"] = {},
    ["BanhamCanyon"] = {},
    ["Chumash"] = {},
    ["MountChiliad"] = {},
    ["SandyShores"] = {},
    ["Harmony"] = {},
    ["GrandSenoraDesert"] = {},
    ["TataviamMountains"] = {},
    ["Davis"] = {},
    ["LittleSeoul"] = {},
    ["RichmanGlen"] = {},
    ["MirrorPark"] = {},
    ["GrapeSeed"] = {},
    ["VespucciCanals"] = {},
    ["MorningWood"] = {},
    ["GreatOceanHighway"] = {},
    ["MurrietaHeights"] = {},
    ["BolingBroke"] = {},
}

Config.ExtraSteps = {
    ["Strawberry"] = {},
    ["DowntownVineWood"] = {},
    ["BanhamCanyon"] = {},
    ["Chumash"] = {},
    ["MountChiliad"] = {},
    ["SandyShores"] = {},
    ["Harmony"] = {},
    ["GrandSenoraDesert"] = {},
    ["TataviamMountains"] = {},
    ["Davis"] = {},
    ["LittleSeoul"] = {},
    ["RichmanGlen"] = {},
    ["MirrorPark"] = {},
    ["GrapeSeed"] = {},
    ["VespucciCanals"] = {},
    ["MorningWood"] = {},
    ["GreatOceanHighway"] = {},
    ["MurrietaHeights"] = {},
    ["BolingBroke"] = {},
}

Config.Tasks = {
    ["Strawberry"] = {},
    ["DowntownVineWood"] = {},
    ["BanhamCanyon"] = {},
    ["Chumash"] = {},
    ["MountChiliad"] = {},
    ["SandyShores"] = {},
    ["Harmony"] = {},
    ["GrandSenoraDesert"] = {},
    ["TataviamMountains"] = {},
    ["Davis"] = {},
    ["LittleSeoul"] = {},
    ["RichmanGlen"] = {},
    ["MirrorPark"] = {},
    ["GrapeSeed"] = {},
    ["VespucciCanals"] = {},
    ["MorningWood"] = {},
    ["GreatOceanHighway"] = {},
    ["MurrietaHeights"] = {},
    ["BolingBroke"] = {},
}