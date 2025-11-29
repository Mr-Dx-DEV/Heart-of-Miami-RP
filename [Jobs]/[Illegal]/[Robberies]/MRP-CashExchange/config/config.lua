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
    MinimumPolice = 100, -- Minimum police required to start the robbery (SECURITY: Changed from 0 to prevent farming)

    ResetHeist = 180, -- (Minutes) Time to reset the heist after a robbery
    AllRobberiesCooldown = false, -- For this to work you need to download projectx-utility from our github
    AutoAlarmOff = 15, -- (Minutes) Time to turn off the alarm automatically
    RequireBag = true, -- If they need a bag to loot

    DisableParticles = false, -- Disable Laser Damage
    ParticleTimer = 10, -- (Minutes) How long the smoke lasts

    -- Progression item (Item that can be obtained at the end of the heist, can be used for the next heist) 
    Bonus = {
        Status = false, -- Enable/Disable Bonus items
        BonusChance = 15, -- Chance of an item being given
        ItemCount = 1, -- How many items can be given from the table below
        Items = { -- You can remove items and add items as you wish
            {Name = "pacificcard", Chance = 30, Amount = {min = 1, max = 1}}, -- Chance(%) -- Amount(Items given from that type)
            {Name = "fleececard", Chance = 50, Amount = {min = 1, max = 1}},
            {Name = "paletocardone", Chance = 20, Amount = {min = 1, max = 1}},
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
        ["Silent"] = false,

        ["Security"] = false, -- Security step
        ["Key"] = false, -- Opening the vault
        ["Fusebox"] = true, -- Fusebox step
    },

    Code = { -- Password for the number pad
        ["Password"] = {min = 10000, max = 99999}, -- Code range
        ["Header"] = "Keypad code", -- Change Translation
        ["Content"] = "Code", -- Change Translation
        ["Input"] = {Title = 'Code', Label = 'Keypad code', Description = 'Enter the code', Icon = 'fas fa-lock'}, -- Change Translation
    },

    Props = {
        ["Keypad"] = "ch_prop_fingerprint_scanner_01e",
        ["Envelope"] = "prop_cash_envelope_01",
        ["Bonds"] = "h4_prop_h4_cash_bon_01a",
        ["PowerBox"] = "xm_prop_x17_powerbox_01",
    },

    -- Durations
    NotificationDuration = 2500, -- Notification duration

    NpcDuration = 6000, -- Npc duration
    ButtonDuration = 6000, -- Button duration
    KeypadDuration = 6000, -- Keypad duration
    PropDuration = 6000, -- Clothing duration
    VentilationDuration = 6000, -- Ventilation duration
    FuseboxDuration = 6000, -- Fusebox duration
}

Config.StartingPoint = {
    Npc = vector4(40.91, -1020.02, 28.51, 66.21),
    Model = "g_m_y_armgoon_02",
    Animation = "WORLD_HUMAN_AA_SMOKE",
}

Config.NPCs = {
    ["Security"] = {
        ['Model'] = "s_f_y_cop_01", -- Model (https://docs.fivem.net/docs/game-references/ped-models/)
        ['Coords'] = vector4(133.28, -1348.47, 28.29, 46.43), -- Coords
    },
    ["Employee1"] = {
        ['Model'] = "a_f_y_business_04", -- Model (https://docs.fivem.net/docs/game-references/ped-models/)
        ['Coords'] = vector4(130.73, -1344.83, 28.29, 178.52), -- Coords
    },
    ["Employee2"] = {
        ['Model'] = "s_m_m_fiboffice_02", -- Model (https://docs.fivem.net/docs/game-references/ped-models/)
        ['Coords'] = vector4(129.44, -1344.37, 28.29, 134.18), -- Coords
    },
    ["Employee3"] = {
        ['Model'] = "a_m_m_business_01", -- Model (https://docs.fivem.net/docs/game-references/ped-models/)
        ['Coords'] = vector4(128.95, -1343.36, 28.29, 90.42), -- coords
    }
}

Config.CashExchangeSteps = {
    ["NpcLegion"] = {
        name = "NpcLegion",
        label = "Talk to cash exchange employee",
        coords = vector3(40.91, -1020.02, 30.01),
        drawtext = vector3(40.22, -1019.76, 29.5),
        distance = 1.5,
        icon = "fas fa-note-sticky",
        size = 0.5,
    },
    ["VentilationLegion"] = {
        name = "VentilationLegion",
        label = "Turn off ventilation",
        coords = vector3(137.32, -1334.37, 29.51),
        drawtext = vector3(137.81, -1333.99, 29.2),
        distance = 1.0,
        icon = "fas fa-bolt-lightning",
        size = 0.5,
    },
    ["Keypad"] = {
        name = "Keypad",
        label = "Enter code",
        coords = vector3(139.24, -1336.73, 29.4),
        drawtext = vector3(139.79, -1336.26, 29.2),
        distance = 1.0,
        icon = "fas fa-bolt-lightning",
        size = 0.5,
    },
    ["Security"] = {
        name = "Security",
        label = "Threaten security",
        coords = vector3(133.28, -1348.47, 29.69),
        drawtext = vector3(132.45, -1347.79, 29.29),
        distance = 2.0,
        icon = "fas fa-comment-dots",
        size = 0.8,
    },
    ["Employee1"] = {
        name = "Employee1",
        label = "Threaten employee",
        coords = vector3(130.73, -1344.83, 29.69),
        drawtext = vector3(131.63, -1344.31, 29.29),
        distance = 2.0,
        icon = "fas fa-comment-dots",
        size = 0.8,
    },
    ["Employee2"] = {
        name = "Employee1",
        label = "Threaten employee",
        coords = vector3(129.44, -1344.37, 29.69),
        drawtext = vector3(130.21, -1343.61, 29.29),
        distance = 2.0,
        icon = "fas fa-comment-dots",
        size = 0.8,
    },
    ["Employee3"] = {
        name = "Employee1",
        label = "Threaten employee",
        coords = vector3(128.95, -1343.36, 29.69),
        drawtext = vector3(129.44, -1342.54, 29.29),
        distance = 2.0,
        icon = "fas fa-comment-dots",
        size = 0.8,
    },
    ["PowerBox"] = {
        name = "PowerBox",
        label = "Turn off power box",
        coords = vector3(133.73, -1337.09, 29.66),
        drawtext = vector3(133.16, -1337.54, 29.29),
        heading = 315.13,
        distance = 1.0,
        icon = "fas fa-bolt-lightning",
        size = 0.4,
    },
    ["Fusebox"] = {
        name = "Fusebox",
        label = "Disable fusebox",
        coords = vector3(132.54, -1337.25, 29.59),
        drawtext = vector3(132.8, -1337.57, 29.29),
        distance = 1.0,
        icon = "fas fa-bolt-lightning",
        size = 0.4,
    },
    ["Key"] = {
        name = "Key",
        label = "Unlock door",
        coords = vector3(133.07, -1339.69, 29.60),
        drawtext = vector3(132.7, -1339.36, 29.29),
        distance = 1.0,
        icon = "fas fa-key",
        size = 0.4,
    },
    ["Prop1"] = {
        name = "Prop1",
        label = "Collect Envelope",
        coords = vector3(130.30, -1339.94, 29.47),
        drawtext = vector3(130.71, -1340.38, 29.29),
        distance = 1.0,
        icon = "fas fa-money-bill-wave",
        size = 0.4,
    },
    ["Prop2"] = {
        name = "Prop2",
        label = "Collect Envelope",
        coords = vector3(133.19, -1344.69, 29.12),
        drawtext = vector3(132.66, -1344.95, 29.29),
        distance = 1.0,
        icon = "fas fa-money-bill-wave",
        size = 0.4,
    },
    ["Prop3"] = {
        name = "Prop3",
        label = "Collect Bonds",
        coords = vector3(128.04, -1340.79, 29.19),
        drawtext = vector3(128.45, -1340.69, 29.29),
        distance = 1.0,
        icon = "fas fa-money-bill-wave",
        size = 0.4,
    },
}

Config.Sounds = {
    ["DoorUnlockSound"] = 'DoorOpen', -- The sound that is played when unlocking doors
    ["DoorUnlockSoundVolume"] = 2.0, -- The volume of the sound that is played
    ["DoorUnlockSoundDistance"] = 3.0, -- The distance that the sound reaches
    ["AlarmSound"] = 'security-alarm', -- The sound name
    ["AlarmVolume"] = 0.01, -- The volume of the sound that is played
    ["AlarmDistance"] = 10.0, -- The distance that the sound reaches
    ["AlarmLocation"] = vector3(122.81, -1348.37, 30.3), -- The location of the alarm
}

Config.Items = {
    ["USB"] = "x_device",
    ["USB2"] = "x_device_pin",
    ["Key"] = "cashexchange2key",
    ["Bag"] = "bag",
    ["Circuit"] = "x_circuittester",
}

Config.ItemsBreak = { -- Percentage for the item to break on use
    ["Circuit"] = 0,
}

Config.Rewardcash = {
    ["ObtainPerPickup"] = true, -- Obtain the specified items below per cash stack pickup from the trolley, false - Obtain the item/cash specified below at the end of the trolley animation
    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
    ['Item'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 115, max = 265}, -- Cash that is recieved from each cash stack, if you have ["ObtainPerPickup"] set to false, this will be the amount of cash you recieve at the end of the trolley animation
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.PropsRewards = {
    ["Prop1"] = {
        CashReward = true, -- if this is true, the player wont get a item reward
        Cash = 345,
        Item = "x_shirt_pile", Amount = {min = 1, max = 1}
    },
    ["Prop2"] = {
        CashReward = true, -- if this is true, the player wont get a item reward
        Cash = 345,
        Item = "x_shirt_pile", Amount = {min = 1, max = 1}
    },
    ["Prop3"] = {
        CashReward = true, -- if this is true, the player wont get a item reward
        Cash = 345,
        Item = "x_shirt_pile", Amount = {min = 1, max = 1}
    },
}

Config.Trollys = {
    ['Trolly1'] = {
        Type = "cash", -- Type of the trolley (cash/gold/diamond)
        Name = 'Trolly1', -- !!! Do not touch !!!
        Coords = vector3(133.48, -1342.55, 29.29),
        Drawtext = vector3(133.78, -1342.22, 29.29),
        Heading = 318.33,
        Icon = 'fas fa-hand-back-fist',
        Distance = 1.0, -- Target Distance
        Size = 0.5, -- Circle Zone size
    },
    ['Trolly2'] = {
        Type = "cash", -- Type of the trolley (cash/gold/diamond)
        Name = 'Trolly2', -- !!! Do not touch !!!
        Coords = vector3(132.76, -1341.69, 29.29),
        Drawtext = vector3(132.98, -1341.46, 29.29),
        Heading = 319.88,
        Icon = 'fas fa-hand-back-fist',
        Distance = 1.0, -- Target Distance
        Size = 0.5, -- Circle Zone size
    },
}

Config.SecurityGuards = {
    ["Security1"] = {
        Status = true, -- Set weather you want to spawn this ped or not
        Model = "s_f_y_cop_01", -- Security guards ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(133.28, -1348.47, 28.29, 46.43), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
}

Config.SecurityOptions = { -- Those options are applied for all the security guard peds
    ["MaxHealth"] = 100, -- 0-200
    ["Health"] = 100, -- 0-200
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

Config.Weapons = {
    -- Project X Weapons
    "WEAPON_PROJECTXPISTOL", -- PROJECT X PISTOL
    "WEAPON_PROJECTXPISTOLUM", -- PROJECT X PISTOL
    "WEAPON_PROJECTXSMG", -- PROJECT X SMG
    "WEAPON_PROJECTXSMGUM", -- PROJECT X SMG UM
    "WEAPON_PROJECTX", -- PROJECT X WEAPON
    "WEAPON_PROJECTXUM", -- PROJECT X UM Rifle
    "WEAPON_RATREV", -- PROJECT X RAT REVOLVER
    "WEAPON_ORIGIN12", -- PROJECT X ORIGIN-12
    "WEAPON_ORIGIN12B", -- PROJECT X ORIGIN-12B
    "WEAPON_ORIGIN12P", -- PROJECT X ORIGIN-12P
    "WEAPON_ARCTIC516", -- PROJECT X ARCTIC 516
    "WEAPON_ARPW", -- PROJECT X ARP Rifle
    "WEAPON_M1", -- PROJECT X M1 Garand
    -- Melee
    "WEAPON_NIGHTSTICK", -- Night Stick
    "WEAPON_HAMMER", -- Hammer
    "WEAPON_BAT", -- Bat
    "WEAPON_CROWBAR", -- Crowbar
    "WEAPON_GOLFCLUB", -- Golfclub
    "WEAPON_HATCHET", -- Hatchet
    "WEAPON_MACHETE", -- Machete
    "WEAPON_WRENCH", -- Wrench
    "WEAPON_BATTLEAXE", -- Battle Axe

    -- Pistols
    "WEAPON_PISTOL", -- Pistol
    "WEAPON_PISTOL_MK2", -- Pistol Mk2
    "WEAPON_COMBATPISTOL", -- Combat Pistol
    "WEAPON_PISTOL50", -- Pistol 50
    "WEAPON_SNSPISTOL", -- SNS Pistol 
    "WEAPON_HEAVYPISTOL", -- Heavy Pistol
    "WEAPON_VINTAGEPISTOL", -- Vintage Pistol
    "WEAPON_MARKSMANPISTOL", -- Marksman Pistol
    "WEAPON_REVOLVER", -- Revolver
    "WEAPON_APPISTOL", -- AP Pistol
    "WEAPON_STUNGUN", -- Stun Gun
    "WEAPON_FLAREGUN", -- Flare Gun

    -- SMGs
    "WEAPON_MICROSMG", -- Micro SMG
    "WEAPON_MACHINEPISTOL", -- Machine Pistol
    "WEAPON_SMG", -- SMG
    "WEAPON_SMG_MK2", -- SMG Mk2
    "WEAPON_ASSAULTSMG", -- Assault SMG
    "WEAPON_COMBATPDW", -- Combat PDW
    "WEAPON_MG", -- MG
    "WEAPON_COMBATMG", -- Combat MG
    "WEAPON_COMBATMG_MK2", -- Combat MG Mk2
    "WEAPON_GUSENBERG", -- Gusenberg
    "WEAPON_MINISMG", -- Mini SMG

    -- Assault Rifles
    "WEAPON_ASSAULTRIFLE", -- Assault Rifle
    "WEAPON_ASSAULTRIFLE_MK2", -- Assault Rifle Mk2
    "WEAPON_CARBINERIFLE", -- Carbine Rifle
    "WEAPON_CARBINERIFLE_MK2", -- Carbine Rifle Mk2
    "WEAPON_ADVANCEDRIFLE", -- Advanced Rifle
    "WEAPON_SPECIALCARBINE", -- Special Carbine
    "WEAPON_BULLPUPRIFLE", -- Bullpup Rifle
    "WEAPON_COMPACTRIFLE", -- Compact Rifle
    "WEAPON_MILITARYRIFLE", -- Military Rifle
    "WEAPON_TACTICALRIFLE", -- Tactical Rifle

    -- Sniper rifles
    "WEAPON_SNIPERRIFLE", -- Sniper Rifle
    "WEAPON_HEAVYSNIPER", -- Heavy Sniper
    "WEAPON_HEAVYSNIPER_MK2", -- Heavy Sniper Mk2
    "WEAPON_MARKSMANRIFLE", -- Marksman Rifle

    -- Shotguns
    "WEAPON_PUMPSHOTGUN", -- Pump Shotgun
    "WEAPON_SAWNOFFSHOTGUN", -- Sawnoff Shotgun
    "WEAPON_BULLPUPSHOTGUN", -- Bullpup Shotgun
    "WEAPON_ASSAULTSHOTGUN", -- Assault Shotgun
    "WEAPON_MUSKET", -- Musket
    "WEAPON_HEAVYSHOTGUN", -- Heavy Shotgun
    "WEAPON_DBSHOTGUN", -- Double Barrel Shotgun
    "WEAPON_AUTOSHOTGUN", -- Auto Shotgun

    -- Heavy Weapons
    "WEAPON_GRENADELAUNCHER", -- Grenade Launcher
    "WEAPON_RPG", -- RPG
    "WEAPON_MINIGUN", -- Minigun
    "WEAPON_FIREWORK", -- Firework
    "WEAPON_RAILGUN", -- Railgun
    "WEAPON_HOMINGLAUNCHER", -- Homing Launcher
    "WEAPON_GRENADELAUNCHER_SMOKE", -- Smoke Grenade Launcher 
    "WEAPON_COMPACTLAUNCHER", -- Compact Launcher
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
    	-- Main Door (1)
	{
        objCoords = vector3(133.75, -1347.67, 29.46),
        objHash = 749848321,
        objYaw = 316.0,
        locked = true,
	},
        -- Jail Door (2)
    {
        objCoords = vector3(132.12, -1340.82, 29.65),
        objHash = 1138434540,
        objYaw = 45.94,
        locked = true,
	},
        -- Backdoor (3)
    {
        objCoords = vector3(139.82, -1338.36, 29.36),
        objHash = 1163942983,
        objYaw = 126.35,
        locked = true,
    },
}