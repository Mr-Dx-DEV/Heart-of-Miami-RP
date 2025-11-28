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
    Inventory = "ox", -- "ox" "qb" "codem" "origen" "tgiann" "esx" "lj" "ps", if you arent using any of these inventories, put it as "other" and you will need to edit the inventory export function, or open a ticket on discord.
    Dispatch = "cd", -- "ps" "cd" "origen" "tk" "codem" "rcore" "l2s" "redutzu" "lb" "sonoran" or "outlaw", if you arent using any of these dispatch systems, put it as "other" and you will need to edit the dispatch export function, or open a ticket on discord.
    Notification = "ox", -- "ox" or "qb" or "esx"
    Progressbar = "ox", -- "ox" or "qb"

    Interaction = 'ox_target', -- ox_target, qb-target, drawtext, interact -- You can type in your custom target name aswell

    -- Drawtext Options
    DrawtextButton = 38, -- [E] by default
    Drawtext = "OX", -- OLDQB for old qb-drawtext, QB for new qbcore drawtext, OX for ox_lib
    DrawTextZoneSize = vec3(0.8, 0.8, 2), -- Size of the drawtext zone
    DrawTextRotation = 70.0, -- Rotation of the drawtext zone

    -- Testing Mode (No Minigames)
    TestingMode = false, -- Enable/Disable Testing Mode

    DiscordLogStatus = true, -- Choose whether u want to turn on discord logs or not, you need to add a webhook below for it to work
    -- To add your webhook go to opensource -> server, line 1 and add your webhook there

    PoliceJobs = {["police"] = true}, -- Jobs that can receive the dispatch, to add more follow this format: {["police"] = true, ["fbi"] = true}
    MinimumPolice = 4, -- Minimum police required to start the robbery

    ResetHeist = 180, -- (Minutes) Time to reset the heist after a robbery
    AllRobberiesCooldown = false, -- For this to work you need to download projectx-utility from our github
    AutoAlarmOff = 10, -- (Minutes) Time to turn off the alarm automatically
    RequireBag = true, -- If they need a bag to loot

    DisableParticles = false, -- Disable Laser Damage
    DisableExplosions = false, -- Disable Explosions
    DisableLoudApproach = true, -- Disable loud approach
    DisableSilentApproach = false, -- Disable silent approach

    -- Strike System (Silent = High risk, Higher reward, Loud = No risk, Fixed reward)
    Strikes = 2, -- How many strikes players have to reach before having their reward cut

    -- Progression item (Item that can be obtained at the end of the heist, can be used for the next heist) 
    Bonus = {
        Status = true, -- Enable/Disable Bonus items
        BonusChance = 50, -- Chance of an item being given
        ItemCount = 1, -- How many items can be given from the table below
        Items = { -- You can remove items and add items as you wish
            {Name = "fleecacard", Chance = 30, Amount = {min = 1, max = 1}},
            {Name = "x_hammer", Chance = 20, Amount = {min = 1, max = 1}},
            {Name = "x_laptop", Chance = 10, Amount = {min = 1, max = 1}},

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
        ["Loud"] = true,
        ["Silent"] = true,

        ["Key"] = true, -- Opening the storage door
        ["Button"] = true, -- Pressing the button in the storage room
    },

    Code = { -- Password for the number pad
        ["Password"] = {min = 10000, max = 99999}, -- Code range
        ["Header"] = "Keypad code", -- Change Translation
        ["Content"] = "Code", -- Change Translation
        ["Input"] = {Title = 'Code', Label = 'Keypad code', Description = 'Enter the code', Icon = 'fas fa-lock'}, -- Change Translation
    },

    Props = {
        ["Button"] = "h4_prop_h4_casino_button_01b",
        ["Jammer"] = "ch_prop_ch_mobile_jammer_01x",
        ["Keypad"] = "ch_prop_fingerprint_scanner_01e",

        ["Clothing1"] = "ch_prop_ch_uni_stacks_02a",
        ["Clothing2"] = "ch_prop_ch_uni_stacks_02a",
        ["Clothing3"] = "prop_overalls_01",
        ["Clothing4"] = "prop_ftowel_08",
        ["Clothing5"] = "m23_2_prop_m32_jacket_valet_01a",
        ["Clothing6"] = "p_overalls_02_s",
        ["Clothing7"] = "ch_prop_ch_uni_stacks_01a",
        ["Clothing8"] = "ch_prop_ch_uni_stacks_01a",
        ["Clothing9"] = "xm3_prop_xm3_hat_ron_01a",
        ["Clothing10"] = "prop_ftowel_07",
    },

    -- Durations
    NotificationDuration = 2500, -- Notification duration

    NpcDuration = 6000, -- Npc duration
    ButtonDuration = 6000, -- Button duration
    KeypadDuration = 6000, -- Keypad duration
    ClothingDuration = 6000, -- Clothing duration
}

Config.Npc = {
    ["Employee"] = {
        ["Model"] = "a_m_m_salton_02",
        ["Coords"] = vector4(-1416.52, -382.85, 35.63, 174.39),
    },
}

Config.LaundromatSteps = {
    ["PlantEMP"] = {
        name = "PlantEMP",
        label = "Plant EMP",
        coords = vector3(-1436.31, -372.62, 38.2),
        drawtext = vector3(-1437.59, -373.52, 38.21),
        distance = 1.0,
        icon = "fas fa-bolt-lightning",
        size = 0.5,
    },
    ["Employee1"] = {
        name = "Employee1",
        label = "Threaten employee",
        coords = vector3(-1415.9, -384.25, 36.92),
        drawtext = vector3(-1416.09, -385.36, 36.63),
        distance = 2.0,
        icon = "fas fa-comment-dots",
        size = 0.8,
    },
    ["Employee2"] = {
        name = "Employee2",
        label = "Ask for code",
        coords = vector3(-1416.52, -382.85, 37.0),
        drawtext = vector3(-1417.9, -383.53, 36.63),
        distance = 2.0,
        icon = "fas fa-comment-dots",
        size = 0.5,
    },
    ["Code"] = {
        name = "Code",
        label = "Read code",
        coords = vector3(-1419.13, -382.69, 37.0),
        drawtext = vector3(-1418.26, -382.75, 36.63),
        distance = 1.5,
        icon = "fas fa-note-sticky",
        size = 0.6,
    },
    ["Key"] = {
        name = "Key",
        label = "Unlock door",
        coords = vector3(-1425.37, -387.37, 36.61),
        drawtext = vector3(-1424.34, -387.35, 36.63),
        distance = 1.0,
        icon = "fas fa-key",
        size = 0.4,
    },
    ["ClothesTrolly"] = {
        name = "ClothesTrolly",
        label = "Move Trolly",
        coords = vector3(-1428.66, -385.78, 36.39),
        drawtext = vector3(-1428.48, -386.49, 36.63),
        distance = 1.5,
        icon = "fas fa-hand-back-fist",
        size = 0.8,
    },
    ["Button"] = {
        name = "Button",
        label = "Toggle button",
        coords = vector3(-1428.38, -384.06, 36.06),
        drawtext = vector3(-1429.03, -384.17, 36.63),
        distance = 1.5,
        icon = "fas fa-circle-dot",
        size = 0.4,
    },
    ["Keypad"] = {
        name = "Keypad",
        label = "Enter code",
        coords = vector3(-1423.25, -386.45, 31.04),
        drawtext = vector3(-1423.91, -386.59, 30.78),
        distance = 1.0,
        icon = "fas fa-code-commit",
        size = 0.3,
    },
    ["Clothing1"] = {
        name = "Clothing1",
        label = "Steal clothes",
        coords = vector3(-1425.16, -385.18, 36.68),
        drawtext = vector3(-1424.37, -385.13, 36.63),
        distance = 1.0,
        icon = "fas fa-shirt",
        size = 0.4,
    },
    ["Clothing2"] = {
        name = "Clothing2",
        label = "Steal clothes",
        coords = vector3(-1420.99, -388.21, 36.12),
        drawtext = vector3(-1420.91, -389.02, 36.63),
        distance = 1.0,
        icon = "fas fa-shirt",
        size = 0.4,
    },
    ["Clothing3"] = {
        name = "Clothing3",
        label = "Steal clothes",
        coords = vector3(-1421.20, -387.18, 36.53),
        drawtext = vector3(-1421.3, -386.59, 36.63),
        distance = 1.0,
        icon = "fas fa-shirt",
        size = 0.4,
    },
    ["Clothing4"] = {
        name = "Clothing4",
        label = "Steal Towels",
        coords = vector3(-1421.23, -391.46, 35.85),
        drawtext = vector3(-1421.58, -390.8, 36.62),
        distance = 1.5,
        icon = "fas fa-shirt",
        size = 0.4,
    },
    ["Clothing5"] = {
        name = "Clothing5",
        label = "Steal clothes",
        coords = vector3(-1424.23, -390.39, 36.97),
        drawtext = vector3(-1423.32, -390.29, 36.63),
        distance = 1.0,
        icon = "fas fa-shirt",
        size = 0.4,
    },
    ["Clothing6"] = {
        name = "Clothing6",
        label = "Steal clothes",
        coords = vector3(-1420.23, -388.04, 36.53),
        drawtext = vector3(-1420.17, -388.73, 36.63),
        distance = 1.0,
        icon = "fas fa-shirt",
        size = 0.4,
    },
    ["Clothing7"] = {
        name = "Clothing6",
        label = "Steal clothes",
        coords = vector3(-1421.88, -388.22, 36.53),
        drawtext = vector3(-1421.83, -389.07, 36.63),
        distance = 1.0,
        icon = "fas fa-shirt",
        size = 0.4,
    },
    ["Clothing8"] = {
        name = "Clothing8",
        label = "Steal clothes",
        coords = vector3(-1420.33, -387.13, 36.53),
        drawtext = vector3(-1420.4, -386.47, 36.63),
        distance = 1.0,
        icon = "fas fa-shirt",
        size = 0.4,
    },
    ["Clothing9"] = {
        name = "Clothing9",
        label = "Steal clothes",
        coords = vector3(-1416.31, -389.08, 36.05),
        drawtext = vector3(-1416.61, -388.47, 36.63),
        distance = 1.0,
        icon = "fas fa-shirt",
        size = 0.4,
    },
    ["Clothing10"] = {
        name = "Clothing10",
        label = "Steal Towels",
        coords = vector3(-1425.06, -386.32, 36.25),
        drawtext = vector3(-1424.22, -386.18, 36.63),
        distance = 1.0,
        icon = "fas fa-shirt",
        size = 0.4,
    },
    ["WashingMachine1"] = {
        name = "WashingMachine1",
        label = "Break washing machine",
        coords = vector3(-1419.31, -390.04, 36.75),
        drawtext = vector3(-1419.71, -389.43, 36.63),
        distance = 1.0,
        icon = "fab fa-shirtsinbulk",
        size = 0.6,
    },
    ["WashingMachine2"] = {
        name = "WashingMachine2",
        label = "Break washing machine",
        coords = vector3(-1420.57, -390.63, 36.75),
        drawtext = vector3(-1420.9, -390.13, 36.63),
        distance = 1.0,
        icon = "fab fa-shirtsinbulk",
        size = 0.6,
    },
    ["WashingMachine3"] = {
        name = "WashingMachine3",
        label = "Break washing machine",
        coords = vector3(-1422.24, -391.7, 36.75),
        drawtext = vector3(-1422.47, -391.3, 36.63),
        distance = 1.0,
        icon = "fab fa-shirtsinbulk",
        size = 0.6,
    },
    ["WashingMachine4"] = {
        name = "WashingMachine4",
        label = "Break washing machine",
        coords = vector3(-1423.47, -392.24, 36.75),
        drawtext = vector3(-1423.68, -391.86, 36.63),
        distance = 1.0,
        icon = "fab fa-shirtsinbulk",
        size = 0.6,
    },
    ["WashingMachine5"] = {
        name = "WashingMachine5",
        label = "Break washing machine",
        coords = vector3(-1419.99, -385.11, 36.75),
        drawtext = vector3(-1420.03, -385.73, 36.63),
        distance = 1.0,
        icon = "fab fa-shirtsinbulk",
        size = 0.6,
    },
    ["WashingMachine6"] = {
        name = "WashingMachine6",
        label = "Break washing machine",
        coords = vector3(-1421.31, -385.11, 36.75),
        drawtext = vector3(-1421.47, -385.64, 36.63),
        distance = 1.0,
        icon = "fab fa-shirtsinbulk",
        size = 0.6,
    },
    ["WashingMachine7"] = {
        name = "WashingMachine7",
        label = "Break washing machine",
        coords = vector3(-1422.75, -384.92, 36.75),
        drawtext = vector3(-1422.89, -385.45, 36.63),
        distance = 1.0,
        icon = "fab fa-shirtsinbulk",
        size = 0.6,
    },
    ["WashingMachine8"] = {
        name = "WashingMachine8",
        label = "Break washing machine",
        coords = vector3(-1412.34, -392.37, 30.2),
        drawtext = vector3(-1412.44, -391.76, 30.1),
        distance = 1.0,
        icon = "fab fa-shirtsinbulk",
        size = 0.6,
    },
    ["WashingMachine9"] = {
        name = "WashingMachine9",
        label = "Break washing machine",
        coords = vector3(-1410.86, -392.46, 30.2),
        drawtext = vector3(-1410.95, -391.71, 30.1),
        distance = 1.0,
        icon = "fab fa-shirtsinbulk",
        size = 0.6,
    },
    ["WashingMachine10"] = {
        name = "WashingMachine10",
        label = "Break washing machine",
        coords = vector3(-1409.22, -392.19, 30.2),
        drawtext = vector3(-1409.2, -391.41, 30.1),
        distance = 1.0,
        icon = "fab fa-shirtsinbulk",
        size = 0.6,
    },
    ["WashingMachine11"] = {
        name = "WashingMachine11",
        label = "Break washing machine",
        coords = vector3(-1407.76, -391.91, 30.2),
        drawtext = vector3(-1407.87, -391.12, 30.1),
        distance = 1.0,
        icon = "fab fa-shirtsinbulk",
        size = 0.6,
    },
    ["WashingMachine12"] = {
        name = "WashingMachine12",
        label = "Break washing machine",
        coords = vector3(-1405.25, -391.64, 30.2),
        drawtext = vector3(-1405.4, -390.84, 30.1),
        distance = 1.0,
        icon = "fab fa-shirtsinbulk",
        size = 0.6,
    },
    ["WashingMachine13"] = {
        name = "WashingMachine13",
        label = "Break washing machine",
        coords = vector3(-1403.97, -391.37, 30.2),
        drawtext = vector3(-1404.09, -390.74, 30.1),
        distance = 1.0,
        icon = "fab fa-shirtsinbulk",
        size = 0.6,
    },
    ["Cutting1"] = {
        name = "Cutting1",
        label = "Counterfeit money",
        coords = vector3(-1407.98, -387.43, 29.97),
        drawtext = vector3(-1407.9, -388.18, 30.1),
        distance = 1.0,
        icon = "fas fa-money-bill-wave",
        size = 0.5,
    },
    ["Cutting2"] = {
        name = "Cutting2",
        label = "Counterfeit money",
        coords = vector3(-1407.98, -387.43, 29.97),
        drawtext = vector3(-1407.9, -388.18, 30.1),
        distance = 1.0,
        icon = "fas fa-money-bill-wave",
        size = 0.5,
    },
}

Config.Sounds = {
    ["DoorUnlockSound"] = 'DoorOpen', -- The sound that is played when unlocking doors
    ["DoorUnlockSoundVolume"] = 2.0, -- The volume of the sound that is played
    ["DoorUnlockSoundDistance"] = 3.0, -- The distance that the sound reaches
    ["JammerSound"] = 'nv', -- The sound that is played when the bomb is beeping
    ["JammerSoundVolume"] = 1.0, -- The volume of the sound that is played
    ["JammerSoundDistance"] = 15.0, -- The distance that the sound reaches
    ["BombBeeping"] = 'heartmonbeat', -- The sound that is played when the bomb is beeping
    ["BombBeepingSoundVolume"] = 0.1, -- The volume of the sound that is played
    ["BombBeepingSoundDistance"] = 15.0, -- The distance that the sound reaches
    ["AlarmVolume"] = 0.01, -- The volume of the sound that is played
    ["AlarmDistance"] = 10.0, -- The distance that the sound reaches
    ["AlarmLocation"] = vector3(-1411.95, -385.86, 37.23), -- The location of the alarm
    ["HittingSound"] = 'jaildoor', -- The sound that is played when the bomb is beeping
    ["HittingSoundVolume"] = 0.1, -- The volume of the sound that is played
    ["HittingSoundDistance"] = 15.0, -- The distance that the sound reaches
}

Config.Items = {
    ["Jammer"] = "x_cratejammer",
    ["Device"] = "x_device",
    ["Key"] = "laundromatkey",
    ["Bag"] = "bag"
}

Config.ItemsBreak = { -- Percentage for the item to break on use
    ["Device"] = 100,
}

Config.TopWashingMachineRewards = {
    ['Cash'] = false,
    ['Item'] = "dirtymoney",
    ['StackAmount'] = {min = 1700, max = 1900}, 
    ['ItemInfo'] = false,
}

Config.BottomWashingMachineRewards = {
    ['Cash'] = false,
    ['Item'] = "dirtymoney",
    ['StackAmount'] = {min = 3800, max = 4200},
    ['ItemInfo'] = false,
}

Config.CashPileReward = {
    ['Cash'] = false,
    ['Item'] = "dirtymoney",
    ['StackAmount'] = {min = 35000, max = 42000},
    ['ItemInfo'] = false,
}

--x_shirt_pile = 1,600
--x_shirt = 2,200
--x_overalls = 5,000
--x_towel = 1,350
--x_hat = 3,300

Config.ClothingRewards = {
    ["Clothing1"] = {Item = "x_shirt_pile", Amount = {min = 1, max = 1}},
    ["Clothing2"] = {Item = "x_shirt_pile", Amount = {min = 1, max = 1}},
    ["Clothing3"] = {Item = "x_overalls", Amount = {min = 1, max = 1}},
    ["Clothing4"] = {Item = "x_towel", Amount = {min = 2, max = 4}},
    ["Clothing5"] = {Item = "x_shirt", Amount = {min = 1, max = 1}},
    ["Clothing6"] = {Item = "x_overalls", Amount = {min = 1, max = 1}},
    ["Clothing7"] = {Item = "x_shirt_pile", Amount = {min = 1, max = 1}},
    ["Clothing8"] = {Item = "x_shirt_pile", Amount = {min = 1, max = 1}},
    ["Clothing9"] = {Item = "x_hat", Amount = {min = 1, max = 1}},
    ["Clothing10"] = {Item = "x_towel", Amount = {min = 2, max = 4}},
}

Config.LootTables = {
    ['Table1'] = {
        Name = 'Table1', -- !!! Do not touch !!!
        Coords = vector3(-1406.88, -387.23, 29.90),
        Drawtext = vector3(-1406.86, -387.9, 30.1),
        Heading = 6.63,
        Icon = 'fas fa-coins',
        Distance = 1.5, -- Target Distance
        Size = 0.5, -- Circle Zone size
    },
    ['Table2'] = {
        Name = 'Table2', -- !!! Do not touch !!!
        Coords = vector3(-1406.88, -387.23, 29.90),
        Drawtext = vector3(-1406.86, -387.9, 30.1),
        Heading = 6.63,
        Icon = 'fas fa-coins',
        Distance = 1.5, -- Target Distance
        Size = 0.5, -- Circle Zone size
    },
}

Config.SecurityGuards = {
    ["Security1"] = {
        Status = true, -- Set weather you want to spawn this ped or not
        Model = "g_m_y_korean_01", -- Security guards ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(-1414.66, -391.97, 29.1, 65.47), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
    ["Security2"] = {
        Status = true, -- Set weather you want to spawn this ped or not
        Model = "g_m_y_korean_02", -- Security guards ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(-1401.91, -391.4, 29.1, 73.16), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
    ["Security3"] = {
        Status = true, -- Set weather you want to spawn this ped or not
        Model = "g_m_y_korean_01", -- Security guards ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(-1423.12, -393.85, 29.1, 356.53), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
}

Config.SecurityOptions = { -- Those options are applied for all the security guard peds
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

Config.MeleeWeapons = { -- Choose which weapons are required to have in hand to initiate the heist (Loud way)
    
    "WEAPON_BAT", -- Bat

}

Config.Weapons = {

    "WEAPON_FNX45",

}

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-- |   |   |   |   |   |   |   |   |   |   |    DO NOT TOUCH ANYTHING UNDER THIS LINE  |   |   |   |   |   |   |   |   |   |   |    |
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

Config.Steps = {}
Config.ExtraSteps = {}
Config.Tasks = {}

Config.DoorStates = {} -- Sync
Config.DoorList = {
    	-- Office Door (1)
	{
        objCoords = vector3(-1418.66, -383.98, 36.79),
        objHash = -1381181030,
        objYaw = 355.57,
        locked = true,
	},
        -- Storage Room (2)
    {
        objCoords = vector3(-1425.28, -388.53, 36.78),
        objHash = 919731067,
        objYaw = 95.93,
        locked = true,
	},
        -- Workshop Left (3)
    {
        objCoords = vector3(-1426.89, -384.32, 36.71),
        objHash = -1263512143,
        objYaw = 186.33,
        locked = true,
    },
        -- Workshop Left (4)
    {
        objCoords = vector3(-1424.73, -388.09, 30.99),
        objHash = -1381181030,
        objYaw = 6.9,
        locked = true,
    },
}
