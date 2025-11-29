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

    Target = 'ox_target', -- Target name, leave it as qb-target if you are using ox_target
    WorldInteract = false, -- Enable/Disable World Interactions (Only use this if you have the interact script, otherwise leave it as false)

    TestingMode = false, -- Enable/Disable Testing Mode (No Minigames)

    DiscordLogStatus = true, -- Choose whether u want to turn on discord logs or not, you need to add a webhook below for it to work
    -- To add your webhook go to opensource -> server, line 1 and add your webhook there

    Cooldown = {
        Global = true, -- Global cooldown (Set to false to have individual cooldowns on fleecas, true to have cooldowns on all fleecas when one is robbed)
        Timer = 180, -- (Minutes) timer duration
    },

    AllRobberiesCooldown = false, -- For this to work you need to download projectx-utility from our github

    PoliceJobs = {["police"] = true}, -- Add the jobs that will be checked
    MinimumPolice = 6, -- Minimum police required to rob a fleeca (SECURITY: Changed from 0 to prevent farming)

    ListLength = 100, -- Length of the employee list that will appear on the board
    DisableEmployeePuzzle = false, -- Disable the employee puzzle
    DisableParticles = false, -- Disable particle effects
    DisableLoudApproach = false, -- Disable loud approach
    DisableSilentApproach = false, -- Disable silent approach

    GruppeSechsJob17mov = false, -- Enable/Disable GruppeSechs Job Compatibility by 17mov

    -- Progression item (Item that can be obtained at the end of the heist, can be used for the next heist) 
    Bonus = {
        Status = true, -- Enable/Disable Bonus items
        BonusChance = 60, -- Chance of an item being given
        ItemCount = 1, -- How many items can be given from the table below
        Items = { -- You can remove items and add items as you wish
            {Name = "x_device", Chance = 20, Amount = {min = 1, max = 1}}, -- Chance(%) -- Amount(Items given from that type)
            {Name = "x_phone", Chance = 10, Amount = {min = 1, max = 1}},
            {Name = "cashexchange2key", Chance = 30, Amount = {min = 1, max = 1}},
        },
    },

    RequireBag = true, -- Require bag to pickup loot

    -- Strike System (Silent = High risk, Higher reward, Loud = No risk, Fixed reward)
    TotalTrolleys = 4, -- Total maximum amount of trolleys that could spawn, they spawn depending on the settings below
    Strikes = 2, -- How many strikes players have to reach before having their reward cut
    StrikeAmount = 2, -- (Silent Approach ONLY) How many trollys will be removed if they reach the strike limit
    StrikeLoud = 3, -- (Loud Approach ONLY) How many trollys will spawn (preferably less than TotalTrolleys by 1, to give them insentive to do the loud approach aswell)

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
        ["Fusebox"] = true,
        ["FirstKeypad"] = false, -- Alarm gets triggered instantly when they start the heist
        ["KeypadTwo"] = true,
        ["Vault"] = true,
    },

    -- Drawtext and Target options 
    Drawtext = "OX", -- OLDQB for old qb-drawtext, QB for new qbcore drawtext, OX for ox_lib
    DrawTextZoneSize = vec3(0.8, 0.8, 2), -- Size of the drawtext zone
    Interaction = { -- true = target, false = drawtext
        ["Button"] = 38, -- [E] by default

        ["KeypadOne"] = true,
        ["Fingerprint"] = true,
        ["KeypadTwo"] = true,
        ["Board"] = true,
        ["Printer"] = true,
        ["Fusebox"] = true,
        ["ShelfOne"] = true,
        ["ShelfTwo"] = true,
        ["ShelfThree"] = true,
        ["Search"] = true,
        ["Vault"] = true,
        ["JailDoorKeypad"] = true,
        ["JailDoor"] = true,
        ["Trollys"] = true,
    },

    -- Durations 
    NotificationDuration = 2500, -- Duration of the displayed notifications
    FingerprintDuration = 6000, -- Duration of the fingerprint progressbar
    FuseboxDuration = 6000, -- Duration of the fusebox progressbar
    ShelfDuration = 5000, -- Duration of the shelf progressbar
    KeypadOneDuration = 6000, -- Duration of the keypad progressbar
    KeypadTwoDuration = 6000, -- Duration of the keypad progressbar
    SearchDuration = 6000, -- Duration of the search progressbar
    PrinterDuration = 7500, -- Duration of the printer progressbar
    JailDoorDuration = 5000, -- Duration of the jaildoor progressbar
    VaultDuration = 15000, -- Duration of the vault progressbar
    JailDoorKeypadDuration = 15000, -- Duration of the jaildoor keypad progressbar
}

Config.Inputs = { -- All the ox_lib Input texts
    ["SecretCombination"] = {Title = 'Hidden Password', Label = 'Password', Description = 'Enter the login password', Icon = 'fas fa-lock'},
}

Config.Items ={
    ["Device"] = "x_device",
    ["Pliers"] = "pliers",
    ["Pictures"] = "employeepictures",
    ["Bag"] = "bag",
    ["Keys"] = "fleeca_key",
    ["Keycard"] = "fleecacard",
    ["Laptop"] = "x_laptop",
}

Config.ItemsBreak = {
    ["Device"] = 100, -- % chance of breaking
    ["Pliers"] = 100, -- % chance of breaking
    ["Laptop"] = 100, -- % chance of breaking
}

Config.Fleecas = {
    ["RockfordHills"] = {
        ["Reset"] = 120, -- (Minutes) Resets the bank
        ["AlarmCoords"] = vector3(-1218.73, -329.83, 40.09),
        ["KeypadOneCoords"] = vector3(-1215.25, -335.51, 38.08),
        ["KeypadOneHeading"] = 299.0,
        ["KeypadTwoCoords"] = vector3(-1214.03, -337.89, 38.08),
        ["KeypadTwoHeading"] = 299.0,
        ["KeypadThreeCoords"] = vector3(-1209.31, -335.85, 38.08),
        ["KeypadThreeHeading"] = 206.10,

        ["OnCooldown"] = false,

        ["DrawTextRotation"] = -60.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Cut wires", -- Text that appears when you target
                coords = vector3(-1217.27, -332.98, 42.13), -- Circle Zone Coords
                drawtext = vector3(-1216.89, -332.87, 42.12),
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Target size
            },

            ["Fingerprint"] = {
                name = "Fingerprint",
                label = "Fake Fingerprint", -- Text that appears when you target
                coords = vector3(-1215.25, -335.51, 38.08), -- Circle Zone Coords
                drawtext = vector3(-1215.48, -335.59, 37.78),
                distance = 1.0, -- Target distance
                icon = "fas fa-fingerprint", -- Icon
                size = 0.3, -- Target size
            },

            ["KeypadOne"] = {
                name = "KeypadOne",
                label = "Disable Keypad", -- Text that appears when you target
                coords = vector3(-1215.25, -335.51, 38.08), -- Circle Zone Coords
                drawtext = vector3(-1215.48, -335.59, 37.78),
                distance = 1.0, -- Target distance
                icon = "fas fa-keyboard", -- Icon
                size = 0.3, -- Target size
            },

            ["KeypadTwo"] = {
                name = "KeypadTwo",
                label = "Enter Keyword", -- Text that appears when you target
                coords = vector3(-1214.03, -337.89, 38.08), -- Circle Zone Coords
                drawtext = vector3(-1214.31, -338.05, 37.78),
                distance = 1.0, -- Target distance
                icon = "fas fa-keyboard", -- Icon
                size = 0.3, -- Target size
            },

            ["Printer"] = {
                name = "Printer",
                label = "Print out pictures", -- Text that appears when you target
                coords = vector3(-1208.91, -331.09, 37.77), -- Circle Zone Coords
                drawtext = vector3(-1209.30, -331.29, 37.78),
                distance = 1.0, -- Target distance
                icon = "fas fa-print", -- Icon
                size = 0.3, -- Target size
            },

            ["Board"] = {
                name = "Board",
                label = "Employee list", -- Text that appears when you target
                coords = vector3(-1213.77, -334.45, 38.37), -- Circle Zone Coords
                drawtext = vector3(-1213.9, -334.2, 37.78),
                distance = 1.0, -- Target distance
                icon = "fas fa-paperclip", -- Icon
                size = 0.5, -- Target size
            },

            ["ShelfOne"] = {
                name = "ShelfOne",
                label = "Search through papers", -- Text that appears when you target
                coords = vector3(-1209.79, -332.66, 37.78), -- Circle Zone Coords
                drawtext = vector3(-1209.97, -332.23, 37.78),
                distance = 1.0, -- Target distance
                icon = "fas fa-sheet-plastic", -- Icon
                size = 0.3, -- Target size
            },

            ["ShelfTwo"] = {
                name = "ShelfTwo",
                label = "Search through papers", -- Text that appears when you target
                coords = vector3(-1211.09, -333.26, 37.78), -- Circle Zone Coords
                drawtext = vector3(-1211.3, -332.98, 37.78),
                distance = 1.0, -- Target distance
                icon = "fas fa-sheet-plastic", -- Icon
                size = 0.3, -- Target size
            },

            ["ShelfThree"] = {
                name = "ShelfThree",
                label = "Search through papers", -- Text that appears when you target
                coords = vector3(-1212.0, -333.68, 37.78), -- Circle Zone Coords
                drawtext = vector3(-1212.27, -333.49, 37.78),
                distance = 1.0, -- Target distance
                icon = "fas fa-sheet-plastic", -- Icon
                size = 0.3, -- Target size
            },

            ["Search"] = {
                name = "Search",
                label = "Crack", -- Text that appears when you target
                coords = vector3(-1211.98, -337.46, 37.92), -- Circle Zone Coords
                drawtext = vector3(-1211.98, -337.46, 37.92),
                vaultOpen = 290.0, -- (Don't touch this) Heading of the vault when it is open
                vaultClosed = 206.86, -- (Don't touch this) Heading of the vault when it is closed
                distance = 1.0, -- Target distance
                icon = "fas fa-vault", -- Icon
                size = 0.4, -- Target size
            },

            ["Vault"] = {
                name = "Vault",
                label = "Unlock Vault", -- Text that appears when you target
                coords = vector3(-1210.31, -336.39, 38.21), -- Circle Zone Coords
                drawtext = vector3(-1210.70, -336.52, 37.78),
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.3, -- Target size
                VaultOpenHeading = 188.86373901367, -- (Don't touch this) Heading of the vault when it is open
                VaultCloseHeading = 296.86373901367, -- (Don't touch this) Heading of the vault when it is closed
                VaultCoords = vector3(-1211.261, -334.5596, 37.91989), -- (Don't touch this) Coords of the vault
            },

            ["JailDoorKeypad"] = {
                name = "JailDoorKeypad",
                label = "Scan employee pictures", -- Text that appears when you target
                coords = vector3(-1209.31, -335.85, 38.08), -- Circle Zone Coords
                drawtext = vector3(-1209.55, -335.33, 37.76),
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.3, -- Target size
            },

            ["JailDoor"] = {
                name = "JailDoor",
                label = "Unlock", -- Text that appears when you target
                coords = vector3(-1208.62, -335.57, 37.98), -- Circle Zone Coords
                drawtext = vector3(-1208.7, -335.31, 37.78),
                distance = 1.0, -- Target distance
                icon = "fab fa-keycdn", -- Icon
                size = 0.3, -- Target size
            },
        },

        ["Zone"] = {vector3(-1211.42, -315.51, 37.74), vector3(-1228.35, -323.95, 37.74), vector3(-1216.77, -346.8, 37.74), vector3(-1200.45, -336.72, 37.74)},
    },

    ["Legion"] = {
        ["Reset"] = 120, -- (Minutes) Resets the bank
        ["AlarmCoords"] = vector3(148.76, -1036.29, 32.14),
        ["KeypadOneCoords"] = vector3(144.63, -1042.04, 29.51),
        ["KeypadOneHeading"] = 249.8,
        ["KeypadTwoCoords"] = vector3(143.7, -1044.62, 29.51),
        ["KeypadTwoHeading"] = 249.8,
        ["KeypadThreeCoords"] = vector3(148.47, -1046.70, 29.51),
        ["KeypadThreeHeading"] = 159.04,

        ["OnCooldown"] = false,

        ["DrawTextRotation"] = -110.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Cut wires", -- Text that appears when you target
                coords = vector3(135.64, -1046.56, 29.84), -- Circle Zone Coords
                drawtext = vector3(135.41, -1046.76, 29.33),
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Target size
            },

            ["Fingerprint"] = {
                name = "Fingerprint",
                label = "Fake Fingerprint", -- Text that appears when you target
                coords = vector3(144.63, -1042.04, 29.51), -- Circle Zone Coords
                drawtext = vector3(144.38, -1041.94, 29.37),
                distance = 1.0, -- Target distance
                icon = "fas fa-fingerprint", -- Icon
                size = 0.3, -- Target size
            },

            ["KeypadOne"] = {
                name = "KeypadOne",
                label = "Disable Keypad", -- Text that appears when you target
                coords = vector3(144.63, -1042.04, 29.51), -- Circle Zone Coords
                drawtext = vector3(144.38, -1041.94, 29.37),
                distance = 1.0, -- Target distance
                icon = "fas fa-keyboard", -- Icon
                size = 0.3, -- Target size
            },

            ["KeypadTwo"] = {
                name = "KeypadTwo",
                label = "Enter Keyword", -- Text that appears when you target
                coords = vector3(143.7, -1044.62, 29.51), -- Circle Zone Coords
                drawtext = vector3(143.43, -1044.46, 29.37),
                distance = 1.0, -- Target distance
                icon = "fas fa-keyboard", -- Icon
                size = 0.3, -- Target size
            },

            ["Printer"] = {
                name = "Printer",
                label = "Print out pictures", -- Text that appears when you target
                coords = vector3(152.37, -1043.79, 29.34), -- Circle Zone Coords
                drawtext = vector3(151.85, -1043.59, 29.37),
                distance = 1.0, -- Target distance
                icon = "fas fa-print", -- Icon
                size = 0.3, -- Target size
            },

            ["Board"] = {
                name = "Board",
                label = "Employee list", -- Text that appears when you target
                coords = vector3(146.49, -1042.44, 29.88), -- Circle Zone Coords
                drawtext = vector3(146.54, -1042.27, 29.37),
                distance = 1.0, -- Target distance
                icon = "fas fa-paperclip", -- Icon
                size = 0.5, -- Target size
            },
            
            ["ShelfOne"] = {
                name = "ShelfOne",
                label = "Search through papers", -- Text that appears when you target
                coords = vector3(150.46, -1044.23, 29.37), -- Circle Zone Coords
                drawtext = vector3(150.54, -1043.74, 29.37),
                distance = 1.0, -- Target distance
                icon = "fas fa-sheet-plastic", -- Icon
                size = 0.3, -- Target size
            },

            ["ShelfTwo"] = {
                name = "ShelfTwo",
                label = "Search through papers", -- Text that appears when you target
                coords = vector3(149.08, -1043.65, 29.37), -- Circle Zone Coords
                drawtext = vector3(149.17, -1043.25, 29.37),
                distance = 1.0, -- Target distance
                icon = "fas fa-sheet-plastic", -- Icon
                size = 0.3, -- Target size
            },

            ["ShelfThree"] = {
                name = "ShelfThree",
                label = "Search through papers", -- Text that appears when you target
                coords = vector3(148.11, -1043.37, 29.37), -- Circle Zone Coords
                drawtext = vector3(148.25, -1042.82, 29.37),
                distance = 1.0, -- Target distance
                icon = "fas fa-sheet-plastic", -- Icon
                size = 0.3, -- Target size
            },

            ["Search"] = {
                name = "Search",
                label = "Crack", -- Text that appears when you target
                coords = vector3(145.40, -1045.85, 29.37), -- Circle Zone Coords
                drawtext = vector3(145.49, -1045.57, 29.37),
                vaultOpen = 290.0, -- (Don't touch this) Heading of the vault when it is open
                vaultClosed = 160.0, -- (Don't touch this) Heading of the vault when it is closed
                distance = 1.0, -- Target distance
                icon = "fas fa-vault", -- Icon
                size = 0.4, -- Target size
            },

            ["Vault"] = {
                name = "Vault",
                label = "Unlock Vault", -- Text that appears when you target
                coords = vector3(147.33, -1046.30, 29.79), -- Circle Zone Coords
                drawtext = vector3(147.03, -1046.12, 29.37),
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.3, -- Target size
                VaultOpenHeading = 141.84619140625, -- (Don't touch this) Heading of the vault when it is open
                VaultCloseHeading = 250.0442199707, -- (Don't touch this) Heading of the vault when it is closed
                VaultCoords = vector3(148.005, -1044.360, 29.626), -- (Don't touch this) Coords of the vault
            },
            
            ["JailDoorKeypad"] = {
                name = "JailDoorKeypad",
                label = "Scan employee pictures", -- Text that appears when you target
                coords = vector3(148.47, -1046.70, 29.67), -- Circle Zone Coords
                drawtext = vector3(148.53, -1046.2, 29.37),                
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.3, -- Target size
            },

            ["JailDoor"] = {
                name = "JailDoor",
                label = "Unlock", -- Text that appears when you target
                coords = vector3(148.92, -1046.93, 29.57), -- Circle Zone Coords
                drawtext = vector3(149.19, -1046.88, 29.37),
                distance = 1.0, -- Target distance
                icon = "fab fa-keycdn", -- Icon
                size = 0.3, -- Target size
            },
        },

        ["Zone"] = {vector3(156.71, -1033.39, 29.26), vector3(149.98, -1052.85, 29.26), vector3(140.06, -1049.24, 29.26), vector3(146.39, -1028.81, 29.26)},
    },

    ["Burton"] = {
        ["Reset"] = 120, -- (Minutes) Resets the bank
        ["AlarmCoords"] = vector3(-353.73, -42.97, 52.5),
        ["KeypadOneCoords"] = vector3(-356.18, -51.34, 49.18),
        ["KeypadOneHeading"] = 250.02,
        ["KeypadTwoCoords"] = vector3(-357.07, -53.93, 49.18),
        ["KeypadTwoHeading"] = 250.02,
        ["KeypadThreeCoords"] = vector3(-352.21, -55.89, 49.18),
        ["KeypadThreeHeading"] = 159.08,
        ["OnCooldown"] = false,

        ["DrawTextRotation"] = -110.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Cut wires", -- Text that appears when you target
                coords = vector3(-365.26, -71.52, 45.69), -- Circle Zone Coords
                drawtext = vector3(-365.39, -71.92, 45.66),
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Target size
            },

            ["Fingerprint"] = {
                name = "Fingerprint",
                label = "Fake Fingerprint", -- Text that appears when you target
                coords = vector3(-356.18, -51.34, 49.18), -- Circle Zone Coords
                drawtext = vector3(-356.43, -51.22, 49.04),
                distance = 1.0, -- Target distance
                icon = "fas fa-fingerprint", -- Icon
                size = 0.3, -- Target size
            },

            ["KeypadOne"] = {
                name = "KeypadOne",
                label = "Disable Keypad", -- Text that appears when you target
                coords = vector3(-356.18, -51.34, 49.18), -- Circle Zone Coords
                drawtext = vector3(-356.43, -51.22, 49.04),
                distance = 1.0, -- Target distance
                icon = "fas fa-keyboard", -- Icon
                size = 0.3, -- Target size
            },

            ["KeypadTwo"] = {
                name = "KeypadTwo",
                label = "Enter Keyword", -- Text that appears when you target
                coords = vector3(-357.07, -53.93, 49.18), -- Circle Zone Coords
                drawtext = vector3(-357.38, -53.84, 49.04),
                distance = 1.0, -- Target distance
                icon = "fas fa-keyboard", -- Icon
                size = 0.3, -- Target size
            },

            ["Printer"] = {
                name = "Printer",
                label = "Print out pictures", -- Text that appears when you target
                coords = vector3(-348.66, -52.84, 49.04), -- Circle Zone Coords
                drawtext = vector3(-349.02, -52.72, 49.04),
                distance = 1.0, -- Target distance
                icon = "fas fa-print", -- Icon
                size = 0.3, -- Target size
            },

            ["Board"] = {
                name = "Board",
                label = "Employee list", -- Text that appears when you target
                coords = vector3(-354.4, -51.64, 49.66), -- Circle Zone Coords
                drawtext = vector3(-354.35, -51.5, 49.04),
                distance = 1.0, -- Target distance
                icon = "fas fa-paperclip", -- Icon
                size = 0.5, -- Target size
            },
            
            ["ShelfOne"] = {
                name = "ShelfOne",
                label = "Search through papers", -- Text that appears when you target
                coords = vector3(-350.33, -53.31, 49.04), -- Circle Zone Coords
                drawtext = vector3(-350.2, -52.92, 49.04),
                distance = 1.0, -- Target distance
                icon = "fas fa-sheet-plastic", -- Icon
                size = 0.3, -- Target size
            },

            ["ShelfTwo"] = {
                name = "ShelfTwo",
                label = "Search through papers", -- Text that appears when you target
                coords = vector3(-351.71, -52.82, 49.04), -- Circle Zone Coords
                drawtext = vector3(-351.6, -52.34, 49.04),
                distance = 1.0, -- Target distance
                icon = "fas fa-sheet-plastic", -- Icon
                size = 0.3, -- Target size
            },

            ["ShelfThree"] = {
                name = "ShelfThree",
                label = "Search through papers", -- Text that appears when you target
                coords = vector3(-352.66, -52.54, 49.04), -- Circle Zone Coords
                drawtext = vector3(-352.69, -52.06, 49.04),
                distance = 1.0, -- Target distance
                icon = "fas fa-sheet-plastic", -- Icon
                size = 0.3, -- Target size
            },

            ["Search"] = {
                name = "Search",
                label = "Crack", -- Text that appears when you target
                coords = vector3(-355.39, -55.05, 49.05), -- Circle Zone Coords
                drawtext = vector3(-355.23, -54.52, 49.05),
                vaultOpen = 290.0, -- (Don't touch this) Heading of the vault when it is open
                vaultClosed = 161.0, -- (Don't touch this) Heading of the vault when it is closed
                distance = 1.0, -- Target distance
                icon = "fas fa-vault", -- Icon
                size = 0.4, -- Target size
            },

            ["Vault"] = {
                name = "Vault",
                label = "Unlock Vault", -- Text that appears when you target
                coords = vector3(-353.39, -55.52, 49.46), -- Circle Zone Coords
                drawtext = vector3(-353.75, -55.33, 49.04),
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.3, -- Target size
                VaultOpenHeading = 142.85983276367, -- (Don't touch this) Heading of the vault when it is open
                VaultCloseHeading = 250.85983276367, -- (Don't touch this) Heading of the vault when it is closed
                VaultCoords = vector3(-352.7365, -53.57248, 49.17543), -- (Don't touch this) Coords of the vault
            },

            ["JailDoorKeypad"] = {
                name = "JailDoorKeypad",
                label = "Scan employee pictures", -- Text that appears when you target
                coords = vector3(-352.21, -55.89, 49.34), -- Circle Zone Coords
                drawtext = vector3(-352.2, -55.53, 49.04),
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.3, -- Target size
            },

            ["JailDoor"] = {
                name = "JailDoor",
                label = "Unlock", -- Text that appears when you target
                coords = vector3(-351.69, -56.27, 49.24), -- Circle Zone Coords
                drawtext = vector3(-351.55, -55.88, 49.04),
                distance = 1.0, -- Target distance
                icon = "fab fa-keycdn", -- Icon
                size = 0.3, -- Target size
            },
        },

        ["Zone"] = {vector3(-355.27, -38.79, 49.02), vector3(-343.72, -43.26, 49.02), vector3(-350.61, -62.6, 49.02), vector3(-368.76, -56.43, 49.02)},
    },

    ["Alta"] = {
        ["Reset"] = 120, -- (Minutes) Resets the bank
        ["AlarmCoords"] = vector3(318.57, -275.84, 58.7),
        ["KeypadOneCoords"] = vector3(308.94, -280.47, 54.30),
        ["KeypadOneHeading"] = 249.89,
        ["KeypadTwoCoords"] = vector3(308.03, -283.0, 54.30),
        ["KeypadTwoHeading"] = 249.89,
        ["KeypadThreeCoords"] = vector3(312.82, -285.07, 54.30),
        ["KeypadThreeHeading"] = 159.83,

        ["OnCooldown"] = false,

        ["DrawTextRotation"] = -110.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Cut wires", -- Text that appears when you target
                coords = vector3(258.69, -308.01, 49.76), -- Circle Zone Coords
                drawtext = vector3(258.79, -307.66, 49.65),
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Target size
            },

            ["Fingerprint"] = {
                name = "Fingerprint",
                label = "Fake Fingerprint", -- Text that appears when you target
                coords = vector3(308.94, -280.47, 54.30), -- Circle Zone Coords
                drawtext = vector3(308.7, -280.35, 54.16),
                distance = 1.0, -- Target distance
                icon = "fas fa-fingerprint", -- Icon
                size = 0.3, -- Target size
            },

            ["KeypadOne"] = {
                name = "KeypadOne",
                label = "Disable Keypad", -- Text that appears when you target
                coords = vector3(308.94, -280.47, 54.30), -- Circle Zone Coords
                drawtext = vector3(308.7, -280.35, 54.16),
                distance = 1.0, -- Target distance
                icon = "fas fa-keyboard", -- Icon
                size = 0.3, -- Target size
            },

            ["KeypadTwo"] = {
                name = "KeypadTwo",
                label = "Enter Keyword", -- Text that appears when you target
                coords = vector3(308.03, -283.0, 54.30), -- Circle Zone Coords
                drawtext = vector3(307.75, -282.88, 54.16),
                distance = 1.0, -- Target distance
                icon = "fas fa-keyboard", -- Icon
                size = 0.3, -- Target size
            },

            ["Printer"] = {
                name = "Printer",
                label = "Print out pictures", -- Text that appears when you target
                coords = vector3(316.43, -282.08, 54.14), -- Circle Zone Coords
                drawtext = vector3(316.08, -281.96, 54.16),
                distance = 1.0, -- Target distance
                icon = "fas fa-print", -- Icon
                size = 0.3, -- Target size
            },

            ["Board"] = {
                name = "Board",
                label = "Employee list", -- Text that appears when you target
                coords = vector3(310.82, -280.77, 54.55), -- Circle Zone Coords
                drawtext = vector3(310.87, -280.66, 54.16),
                distance = 1.0, -- Target distance
                icon = "fas fa-paperclip", -- Icon
                size = 0.5, -- Target size
            },
            
            ["ShelfOne"] = {
                name = "ShelfOne",
                label = "Search through papers", -- Text that appears when you target
                coords = vector3(314.79, -282.45, 54.16), -- Circle Zone Coords
                drawtext = vector3(314.94, -282.13, 54.16),
                distance = 1.0, -- Target distance
                icon = "fas fa-sheet-plastic", -- Icon
                size = 0.3, -- Target size
            },

            ["ShelfTwo"] = {
                name = "ShelfTwo",
                label = "Search through papers", -- Text that appears when you target
                coords = vector3(313.38, -282.05, 54.16), -- Circle Zone Coords
                drawtext = vector3(313.59, -281.66, 54.16),
                distance = 1.0, -- Target distance
                icon = "fas fa-sheet-plastic", -- Icon
                size = 0.3, -- Target size
            },

            ["ShelfThree"] = {
                name = "ShelfThree",
                label = "Search through papers", -- Text that appears when you target
                coords = vector3(312.43, -281.57, 54.16), -- Circle Zone Coords
                drawtext = vector3(312.48, -281.27, 54.16),
                distance = 1.0, -- Target distance
                icon = "fas fa-sheet-plastic", -- Icon
                size = 0.3, -- Target size
            },

            ["Search"] = {
                name = "Search",
                label = "Crack", -- Text that appears when you target
                coords = vector3(309.72, -284.20, 54.16), -- Circle Zone Coords
                drawtext = vector3(309.86, -283.78, 54.16),
                vaultOpen = 290.0, -- (Don't touch this) Heading of the vault when it is open
                vaultClosed = 207.0, -- (Don't touch this) Heading of the vault when it is closed
                distance = 1.0, -- Target distance
                icon = "fas fa-vault", -- Icon
                size = 0.4, -- Target size
            },

            ["Vault"] = {
                name = "Vault",
                label = "Unlock Vault", -- Text that appears when you target
                coords = vector3(311.66, -284.67, 54.59), -- Circle Zone Coords
                drawtext = vector3(311.32, -284.47, 54.16),
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.3, -- Target size
                VaultOpenHeading = 141.86598205566, -- (Don't touch this) Heading of the vault when it is open
                VaultCloseHeading = 249.86598205566, -- (Don't touch this) Heading of the vault when it is closed
                VaultCoords = vector3(312.358, -282.7301, 54.30365), -- (Don't touch this) Coords of the vault
            },
            
            ["JailDoorKeypad"] = {
                name = "JailDoorKeypad",
                label = "Scan employee pictures", -- Text that appears when you target
                coords = vector3(312.82, -285.07, 54.46), -- Circle Zone Coords
                drawtext = vector3(312.96, -284.75, 54.14),
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.3, -- Target size
            },
            
            ["JailDoor"] = {
                name = "JailDoor",
                label = "Unlock", -- Text that appears when you target
                coords = vector3(313.39, -285.42, 54.36), -- Circle Zone Coords
                drawtext = vector3(313.47, -285.22, 54.16),
                distance = 1.0, -- Target distance
                icon = "fab fa-keycdn", -- Icon
                size = 0.3, -- Target size
            },
        },

        ["Zone"] = {vector3(306.58, -265.0, 53.96), vector3(326.7, -272.52, 53.93), vector3(315.11, -302.47, 53.95), vector3(291.94, -295.0, 53.95)},
    },

    ["GrandSenoraDesert"] = {
        ["Reset"] = 120, -- (Minutes) Resets the bank
        ["AlarmCoords"] = vector3(1171.15, 2702.71, 40.67), -- Alarm coords
        ["KeypadOneCoords"] = vector3(1179.53, 2709.9, 38.23),
        ["KeypadOneHeading"] = 90.0, -- Heading of the keypad one
        ["KeypadTwoCoords"] = vector3(1179.52, 2712.59, 38.23),
        ["KeypadTwoHeading"] = 90.0, -- Heading of the keypad two
        ["KeypadThreeCoords"] = vector3(1174.29, 2712.89, 38.23),
        ["KeypadThreeHeading"] = 359.23, -- Heading of the keypad three

        ["OnCooldown"] = false,

        ["DrawTextRotation"] = -90.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Cut wires", -- Text that appears when you target
                coords = vector3(1158.14, 2708.95, 37.98), -- Circle Zone Coords
                drawtext = vector3(1157.68, 2708.98, 37.98),
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Target size
            },

            ["Fingerprint"] = {
                name = "Fingerprint",
                label = "Fake Fingerprint", -- Text that appears when you target
                coords = vector3(1179.53, 2709.9, 38.23), -- Circle Zone Coords
                drawtext = vector3(1179.89, 2709.9, 38.09),
                distance = 1.0, -- Target distance
                icon = "fas fa-fingerprint", -- Icon
                size = 0.3, -- Target size
            },

            ["KeypadOne"] = {
                name = "KeypadOne",
                label = "Disable Keypad", -- Text that appears when you target
                coords = vector3(1179.53, 2709.9, 38.23), -- Circle Zone Coords
                drawtext = vector3(1179.89, 2709.9, 38.09),
                distance = 1.0, -- Target distance
                icon = "fas fa-keyboard", -- Icon
                size = 0.3, -- Target size
            },

            ["KeypadTwo"] = {
                name = "KeypadTwo",
                label = "Enter Keyword", -- Text that appears when you target
                coords = vector3(1179.52, 2712.59, 38.23), -- Circle Zone Coords
                drawtext = vector3(1179.84, 2712.55, 38.09),
                distance = 1.0, -- Target distance
                icon = "fas fa-keyboard", -- Icon
                size = 0.3, -- Target size
            },

            ["Printer"] = {
                name = "Printer",
                label = "Print out pictures", -- Text that appears when you target
                coords = vector3(1171.87, 2708.84, 38.09), -- Circle Zone Coords
                drawtext = vector3(1172.31, 2708.84, 38.09),
                distance = 1.0, -- Target distance
                icon = "fas fa-print", -- Icon
                size = 0.3, -- Target size
            },

            ["Board"] = {
                name = "Board",
                label = "Employee list", -- Text that appears when you target
                coords = vector3(1177.67, 2709.82, 38.49), -- Circle Zone Coords
                drawtext = vector3(1177.66, 2709.41, 38.09),
                distance = 1.0, -- Target distance
                icon = "fas fa-paperclip", -- Icon
                size = 0.5, -- Target size
            },
            
            ["ShelfOne"] = {
                name = "ShelfOne",
                label = "Search through papers", -- Text that appears when you target
                coords = vector3(1173.29, 2709.82, 38.08), -- Circle Zone Coords
                drawtext = vector3(1173.29, 2709.42, 38.09),
                distance = 1.0, -- Target distance
                icon = "fas fa-sheet-plastic", -- Icon
                size = 0.3, -- Target size
            },

            ["ShelfTwo"] = {
                name = "ShelfTwo",
                label = "Search through papers", -- Text that appears when you target
                coords = vector3(1174.61, 2709.79, 38.08), -- Circle Zone Coords
                drawtext = vector3(1174.78, 2709.37, 38.09),
                distance = 1.0, -- Target distance
                icon = "fas fa-sheet-plastic", -- Icon
                size = 0.3, -- Target size
            },

            ["ShelfThree"] = {
                name = "ShelfThree",
                label = "Search through papers", -- Text that appears when you target
                coords = vector3(1175.74, 2709.81, 38.08), -- Circle Zone Coords
                drawtext = vector3(1175.92, 2709.4, 38.09),
                distance = 1.0, -- Target distance
                icon = "fas fa-sheet-plastic", -- Icon
                size = 0.3, -- Target size
            },

            ["Search"] = {
                name = "Search",
                label = "Crack", -- Text that appears when you target
                coords = vector3(1177.52, 2713.30, 38.09), -- Circle Zone Coords
                drawtext = vector3(1177.50, 2712.86, 38.09),
                vaultOpen = 100.0, -- (Don't touch this) Heading of the vault when it is open
                vaultClosed = 0.0, -- (Don't touch this) Heading of the vault when it is closed
                distance = 1.0, -- Target distance
                icon = "fas fa-vault", -- Icon
                size = 0.4, -- Target size
            },

            ["Vault"] = {
                name = "Vault",
                label = "Unlock Vault", -- Text that appears when you target
                coords = vector3(1175.52,  2712.92, 38.51), -- Circle Zone Coords
                drawtext = vector3(1175.92, 2712.85, 38.09),
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.3, -- Target size
                VaultOpenHeading = 1.0, -- (Don't touch this) Heading of the vault when it is open
                VaultCloseHeading = 90.0, -- (Don't touch this) Heading of the vault when it is closed
                VaultCoords = vector3(1175.542, 2710.861, 38.22689), -- (Don't touch this) Coords of the vault
            },

            ["JailDoorKeypad"] = {
                name = "JailDoorKeypad",
                label = "Scan employee pictures", -- Text that appears when you target
                coords = vector3(1174.29, 2712.89, 38.39), -- Circle Zone Coords
                drawtext = vector3(1174.42, 2712.56, 38.09),
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.3, -- Target size
            },

            ["JailDoor"] = {
                name = "JailDoor",
                label = "Unlock", -- Text that appears when you target
                coords = vector3(1173.76, 2712.98, 38.27), -- Circle Zone Coords
                drawtext = vector3(1173.48, 2712.53, 38.09),
                distance = 1.0, -- Target distance
                icon = "fab fa-keycdn", -- Icon
                size = 0.3, -- Target size
            },
        },

        ["Zone"] = {vector3(1181.73, 2698.29, 38.0), vector3(1171.2, 2698.28, 38.0), vector3(1171.17, 2721.76, 38.0), vector3(1181.54, 2721.39, 38.0)},
    },

    ["BanhamCanyon"] = {
        ["Reset"] = 120, -- (Minutes) Resets the bank
        ["AlarmCoords"] = vector3(-2966.54, 480.14, 18.35), -- Alarm coords
        ["KeypadOneCoords"] = vector3(-2959.72, 478.33, 15.84), -- Keypad one coords
        ["KeypadOneHeading"] = 358.0, -- Heading of the keypad one
        ["KeypadTwoCoords"] = vector3(-2957.02, 478.22, 15.84), -- Keypad two coords
        ["KeypadTwoHeading"] = 358.0, -- Heading of the keypad one
        ["KeypadThreeCoords"] = vector3(-2956.45, 483.33, 15.84), -- Keypad two coords
        ["KeypadThreeHeading"] = 266.27, -- Heading of the keypad one

        ["OnCooldown"] = false,

        ["DrawTextRotation"] = -90.0, -- Rotation of the drawtext

        Interactions = {
            ["Fusebox"] = {
                name = "Fusebox",
                label = "Cut wires", -- Text that appears when you target
                coords = vector3(-2948.08, 481.18, 15.44), -- Circle Zone Coords
                drawtext = vector3(-2947.67, 481.29, 15.44),
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.5, -- Target size
            },

            ["Fingerprint"] = {
                name = "Fingerprint",
                label = "Fake Fingerprint", -- Text that appears when you target
                coords = vector3(-2959.72, 478.31, 15.84), -- Circle Zone Coords
                drawtext = vector3(-2959.75, 478.06, 15.7),
                distance = 1.0, -- Target distance
                icon = "fas fa-fingerprint", -- Icon
                size = 0.3, -- Target size
            },

            ["KeypadOne"] = {
                name = "KeypadOne",
                label = "Disable Keypad", -- Text that appears when you target
                coords = vector3(-2959.72, 478.31, 15.84), -- Circle Zone Coords
                drawtext = vector3(-2959.75, 478.06, 15.7),
                distance = 1.0, -- Target distance
                icon = "fas fa-keyboard", -- Icon
                size = 0.3, -- Target size
            },

            ["KeypadTwo"] = {
                name = "KeypadTwo",
                label = "Enter Keyword", -- Text that appears when you target
                coords = vector3(-2957.02, 478.22, 15.84), -- Circle Zone Coords
                drawtext = vector3(-2957.06, 477.87, 15.7),
                distance = 1.0, -- Target distance
                icon = "fas fa-keyboard", -- Icon
                size = 0.3, -- Target size
            },

            ["Printer"] = {
                name = "Printer",
                label = "Print out pictures", -- Text that appears when you target
                coords = vector3(-2960.42, 485.96, 15.70), -- Circle Zone Coords
                drawtext = vector3(-2960.44, 485.58, 15.70),
                distance = 1.0, -- Target distance
                icon = "fas fa-print", -- Icon
                size = 0.3, -- Target size
            },

            ["Board"] = {
                name = "Board",
                label = "Employee list", -- Text that appears when you target
                coords = vector3(-2959.76, 480.16, 16.30), -- Circle Zone Coords
                drawtext = vector3(-2960.06, 480.2, 15.7),
                distance = 1.0, -- Target distance
                icon = "fas fa-paperclip", -- Icon
                size = 0.5, -- Target size
            },

            ["ShelfOne"] = {
                name = "ShelfOne",
                label = "Search through papers", -- Text that appears when you target
                coords = vector3(-2959.49, 484.52, 15.7), -- Circle Zone Coords
                drawtext = vector3(-2959.87, 484.49, 15.7),
                distance = 1.0, -- Target distance
                icon = "fas fa-sheet-plastic", -- Icon
                size = 0.3, -- Target size
            },

            ["ShelfTwo"] = {
                name = "ShelfTwo",
                label = "Search through papers", -- Text that appears when you target
                coords = vector3(-2959.53, 482.96, 15.7), -- Circle Zone Coords
                drawtext = vector3(-2959.93, 483.06, 15.7),
                distance = 1.0, -- Target distance
                icon = "fas fa-sheet-plastic", -- Icon
                size = 0.3, -- Target size
            },

            ["ShelfThree"] = {
                name = "ShelfThree",
                label = "Search through papers", -- Text that appears when you target
                coords = vector3(-2959.56, 481.98, 15.7), -- Circle Zone Coords
                drawtext = vector3(-2959.97, 482.07, 15.7),
                distance = 1.0, -- Target distance
                icon = "fas fa-sheet-plastic", -- Icon
                size = 0.3, -- Target size
            },

            ["Search"] = {
                name = "Search",
                label = "Crack", -- Text that appears when you target
                coords = vector3(-2956.34, 480.20, 15.70), -- Circle Zone Coords
                drawtext = vector3(-2956.63, 480.17, 15.70),
                vaultOpen = 10.0, -- (Don't touch this) Heading of the vault when it is open
                vaultClosed = 268.0, -- (Don't touch this) Heading of the vault when it is closed
                distance = 1.0, -- Target distance
                icon = "fas fa-vault", -- Icon
                size = 0.4, -- Target size
            },

            ["Vault"] = {
                name = "Vault",
                label = "Unlock Vault", -- Text that appears when you target
                coords = vector3(-2956.47, 482.19, 16.12), -- Circle Zone Coords
                drawtext = vector3(-2956.54, 481.77, 15.70),
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.3, -- Target size
                VaultOpenHeading = 250.0, -- (Don't touch this) Heading of the vault when it is open
                VaultCloseHeading = 358.0, -- (Don't touch this) Heading of the vault when it is closed
                VaultCoords = vector3(-2958.539, 482.2706, 15.83595), -- (Don't touch this) Coords of the vault
            },

            ["JailDoorKeypad"] = {
                name = "JailDoorKeypad",
                label = "Scan employee pictures", -- Text that appears when you target
                coords = vector3(-2956.45, 483.33, 16.0), -- Circle Zone Coords
                drawtext = vector3(-2956.82, 483.37, 15.7),
                distance = 1.0, -- Target distance
                icon = "fas fa-bolt", -- Icon
                size = 0.3, -- Target size
            },

            ["JailDoor"] = {
                name = "JailDoor",
                label = "Unlock", -- Text that appears when you target
                coords = vector3(-2956.23, 484.01, 16.0), -- Circle Zone Coords
                drawtext = vector3(-2956.59, 484.26, 15.7),
                distance = 1.0, -- Target distance
                icon = "fab fa-keycdn", -- Icon
                size = 0.3, -- Target size
            },
        },
        ["Zone"] = {vector3(-2972.54, 490.35, 15.3), vector3(-2942.93, 488.71, 15.3), vector3(-2944.23, 468.44, 15.3), vector3(-2973.19, 469.75, 15.3)}, 
    },
}

Config.Sounds = {
    ["DoorUnlockSound"] = 'DoorOpen', -- The sound that is played when unlocking doors
    ["DoorUnlockSoundVolume"] = 2.0, -- The volume of the sound that is played
    ["DoorUnlockSoundDistance"] = 3.0, -- The distance that the sound reaches
    ["AlarmSound"] = 'security-alarm', -- The sound that is played when the alarm is on
    ["AlarmSoundVolume"] = 0.05, -- The volume of the sound that is played
    ["AlarmSoundDistance"] = 35.0, -- The distance that the sound reaches
    ["AlarmRepeat"] = 75, -- At 75 and Wait at 8000, the alarm will blare every 8 seconds for a total of 10 minutes
    ["AlarmWait"] = 8000, -- Waits between each alarm blare
}

Config.PuzzleSettings = {
    ["ShowFirstLetter"] = {
        ["Status"] = true, -- Show the first letter of the hidden word
        ["Replace"] = "?" -- If ["Status"] is false, replace the hidden word with the chosen string
    },

    ["ShowLastLetter"] = {
        ["Status"] = false, -- Show the first letter of the hidden word
        ["Replace"] = "?" -- If ["Status"] is false, replace the hidden word with the chosen string
    },

    ["HideOneClue"] = {
        ["Status"] = true, -- Hide one of the clues
        ["Replace"] = "* **Missing** *" -- If ["Status"] is false, replace the hidden word with the chosen string
    }
}

Config.Rewardcash = {
    ["ObtainPerPickup"] = false, -- Obtain the specified items below per cash stack pickup from the trolley, false - Obtain the item/cash specified below at the end of the trolley animation
    ['Cash'] = false, -- Set this to false to use a cash "item", or true to use cash
    ['Item'] = "dirtymoney", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 90000, max = 100000}, -- Cash that is recieved from each cash stack, if you have ["ObtainPerPickup"] set to false, this will be the amount of cash you recieve at the end of the trolley animation
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.Rewardgold = {
    ["ObtainPerPickup"] = false, -- Obtain the specified items below per gold bar pickup from the trolley, false - Obtain the item/cash specified below at the end of the trolley animation
    ['Cash'] = false, -- Set this to false to use a cash "item", or true to use cash
    ['Item'] = "goldbar", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 3, max = 5}, -- Cash that is recieved from each cash stack, if you have ["ObtainPerPickup"] set to false, this will be the amount of gold bars you recieve at the end of the trolley animation
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.Rewarddiamond = {
    ["ObtainPerPickup"] = false, -- Obtain the specified items below per diamond box pickup from the trolley, false - Obtain the item/cash specified below at the end of the trolley animation
    ['Cash'] = false, -- Set this to false to use a cash "item", or true to use cash
    ['Item'] = "diamond", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 1, max = 1}, -- Cash that is recieved from each cash stack, if you have ["ObtainPerPickup"] set to false, this will be the amount of diamonds you recieve at the end of the trolley animation
    ['ItemInfo'] = false, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.Trollys = {
    ["RockfordHills"] = {
        ['Trolly1'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly1', -- !!! Do not touch !!!
            Coords = vector3(-1208.92, -333.35, 37.55),
            Drawtext = vector3(-1208.69, -333.88, 37.76),
            Heading = 206.08,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
        ['Trolly2'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly2', -- !!! Do not touch !!!
            Coords = vector3(-1209.22, -337.06, 37.55),
            Drawtext = vector3(-1208.71, -336.64, 37.76),
            Heading = 293.29,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
        ['Trolly3'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly3', -- !!! Do not touch !!!
            Coords = vector3(-1206.28, -335.39, 37.55),
            Drawtext = vector3(-1206.7, -335.55, 37.76),
            Heading = 112.60,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
        ['Trolly4'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly4', -- !!! Do not touch !!!
            Coords = vector3(-1207.85, -339.24, 37.55),
            Drawtext = vector3(-1208.12, -338.81, 37.76),
            Heading = 22.91,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
    },

    ["Legion"] = {
        ['Trolly1'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly1', -- !!! Do not touch !!!
            Coords = vector3(150.01, -1045.07, 29.14),
            Drawtext = vector3(149.84, -1045.71, 29.35),
            Heading = 158.45,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
        ['Trolly2'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly2', -- !!! Do not touch !!!
            Coords = vector3(150.74, -1048.64, 29.14),
            Drawtext = vector3(150.29, -1048.38, 29.35),
            Heading = 67.31,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
        ['Trolly3'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly3', -- !!! Do not touch !!!
            Coords = vector3(147.67, -1047.58, 29.14),
            Drawtext = vector3(148.27, -1047.65, 29.35),
            Heading = 250.00,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
        ['Trolly4'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly4', -- !!! Do not touch !!!
            Coords = vector3(147.05, -1049.84, 29.14),
            Drawtext = vector3(147.07, -1049.07, 29.35),
            Heading = 340.03,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
    },

    ["Burton"] = {
        ['Trolly1'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly1', -- !!! Do not touch !!!
            Coords = vector3(-350.26, -54.47, 48.81),
            Drawtext = vector3(-350.43, -54.99, 49.01),
            Heading = 161.88,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
        ['Trolly2'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly2', -- !!! Do not touch !!!
            Coords = vector3(-353.17, -56.60, 48.81),
            Drawtext = vector3(-352.62, -56.82, 49.01),
            Heading = 249.10,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
        ['Trolly3'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly3', -- !!! Do not touch !!!
            Coords = vector3(-350.05, -57.86, 48.81),
            Drawtext = vector3(-350.61, -57.51, 49.01),
            Heading = 71.61,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
        ['Trolly4'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly4', -- !!! Do not touch !!!
            Coords = vector3(-353.85, -59.26, 48.81),
            Drawtext = vector3(-353.68, -58.84, 49.01),
            Heading = 341.20,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
    },

    ["Alta"] = {
        ['Trolly1'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly1', -- !!! Do not touch !!!
            Coords = vector3(314.76, -283.70, 53.94),
            Drawtext = vector3(314.66, -284.09, 54.14),
            Heading = 160.0,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
        ['Trolly2'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly2', -- !!! Do not touch !!!
            Coords = vector3(311.94, -285.85, 53.94),
            Drawtext = vector3(312.3, -286.02, 54.14),
            Heading = 250.0,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
        ['Trolly3'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly3', -- !!! Do not touch !!!
            Coords = vector3(315.01, -286.94, 53.94),
            Drawtext = vector3(314.57, -286.75, 54.14),
            Heading = 70.0,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
        ['Trolly4'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly4', -- !!! Do not touch !!!
            Coords = vector3(312.76, -288.96, 53.94),
            Drawtext = vector3(312.93, -288.37, 54.14),
            Heading = 340.0,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
    },

    ["GrandSenoraDesert"] = {
        ['Trolly1'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly1', -- !!! Do not touch !!!
            Coords = vector3(1172.82, 2710.87, 37.87),
            Drawtext = vector3(1172.87, 2711.41, 38.07),
            Heading = 359.64,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
        ['Trolly2'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly2', -- !!! Do not touch !!!
            Coords = vector3(1174.95, 2714.00, 37.87),
            Drawtext = vector3(1173.97, 2713.76, 38.07),
            Heading = 90.32,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
        ['Trolly3'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly3', -- !!! Do not touch !!!
            Coords = vector3(1171.60, 2713.88, 37.87),
            Drawtext = vector3(1172.34, 2713.95, 38.07),
            Heading = 267.97,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
        ['Trolly4'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly4', -- !!! Do not touch !!!
            Coords = vector3(1174.60, 2716.59, 37.87),
            Drawtext = vector3(1174.82, 2715.77, 38.07),
            Heading = 178.65,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
    },

    ["BanhamCanyon"] = {
        ['Trolly1'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly1', -- !!! Do not touch !!!
            Coords = vector3(-2958.52, 485.04, 15.47),
            Drawtext = vector3(-2958.03, 484.96, 15.68),
            Heading = 263.77,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
        ['Trolly2'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly2', -- !!! Do not touch !!!
            Coords = vector3(-2955.43, 482.84, 15.47),
            Drawtext = vector3(-2955.51, 483.53, 15.68),
            Heading = 353.27,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
        ['Trolly3'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly3', -- !!! Do not touch !!!
            Coords = vector3(-2955.37, 486.02, 15.47),
            Drawtext = vector3(-2955.42, 485.35, 15.68),
            Heading = 179.22,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
        ['Trolly4'] = {
            Type = "cash", -- Type of loot (cash/gold/diamond)
            Name = 'Trolly4', -- !!! Do not touch !!!
            Coords = vector3(-2952.77, 482.98, 15.47),
            Drawtext = vector3(-2953.53, 482.91, 15.68),
            Heading = 90.85,
            Icon = 'fas fa-dollar-sign', -- Icon
            Distance = 1.0, -- Target distance
            Size = 0.5, -- Target size
        },
    },
}

Config.Employees = {
    [1] = {first = "Olivia", last = "Roberts", residence = "Hawaii", age = "27"},
    [2] = {first = "Ethan", last = "Parker", residence = "Kentucky", age = "34"},
    [3] = {first = "Sophia", last = "Adams", residence = "Mississippi", age = "45"},
    [4] = {first = "Benjamin", last = "Taylor", residence = "Montana", age = "19"},
    [5] = {first = "Ava", last = "Wright", residence = "SouthDakota", age = "31"},
    [6] = {first = "Liam", last = "Davis", residence = "Arizona", age = "40"},
    [7] = {first = "Emma", last = "Wilson", residence = "Connecticut", age = "22"},
    [8] = {first = "Noah", last = "Martinez", residence = "WestVirginia", age = "29"},
    [9] = {first = "Isabella", last = "Anderson", residence = "Delaware", age = "36"},
    [10] = {first = "Alexander", last = "Nelson", residence = "Maryland", age = "50"},
    [11] = {first = "Mia", last = "Johnson", residence = "Iowa", age = "25"},
    [12] = {first = "Elijah", last = "Garcia", residence = "NewMexico", age = "33"},
    [13] = {first = "Sofia", last = "Clark", residence = "Vermont", age = "28"},
    [14] = {first = "William", last = "Brown", residence = "Minnesota", age = "42"},
    [15] = {first = "Charlotte", last = "Harris", residence = "Tennessee", age = "37"},
    [16] = {first = "James", last = "Turner", residence = "Wisconsin", age = "30"},
    [17] = {first = "Amelia", last = "Smith", residence = "NorthDakota", age = "23"},
    [18] = {first = "Liam", last = "Anderson", residence = "Texas", age = "26"},
    [19] = {first = "Olivia", last = "Walker", residence = "Virginia", age = "39"},
    [20] = {first = "Emma", last = "Roberts", residence = "Louisiana", age = "32"},
    [21] = {first = "Ethan", last = "Johnson", residence = "Alabama", age = "33"},
    [22] = {first = "Sophia", last = "Garcia", residence = "Alaska", age = "42"},
    [23] = {first = "Benjamin", last = "Lee", residence = "Arkansas", age = "19"},
    [24] = {first = "Ava", last = "Anderson", residence = "California", age = "30"},
    [25] = {first = "Liam", last = "Williams", residence = "Colorado", age = "40"},
    [26] = {first = "Emma", last = "Brown", residence = "Florida", age = "24"},
    [27] = {first = "Noah", last = "Davis", residence = "Georgia", age = "29"},
    [28] = {first = "Isabella", last = "Taylor", residence = "Idaho", age = "35"},
    [29] = {first = "Alexander", last = "Harris", residence = "Illinois", age = "47"},
    [30] = {first = "Mia", last = "Moore", residence = "Indiana", age = "26"},
    [31] = {first = "Elijah", last = "Clark", residence = "Kansas", age = "39"},
    [32] = {first = "Sofia", last = "Martinez", residence = "Iowa", age = "28"},
    [33] = {first = "William", last = "Turner", residence = "Kentucky", age = "41"},
    [34] = {first = "Charlotte", last = "Johnson", residence = "Louisiana", age = "31"},
    [35] = {first = "James", last = "Anderson", residence = "Maine", age = "27"},
    [36] = {first = "Amelia", last = "Walker", residence = "Maryland", age = "23"},
    [37] = {first = "Liam", last = "Smith", residence = "Massachusetts", age = "36"},
    [38] = {first = "Olivia", last = "Taylor", residence = "Michigan", age = "44"},
    [39] = {first = "Emma", last = "Parker", residence = "Minnesota", age = "32"},
    [40] = {first = "Noah", last = "Garcia", residence = "Mississippi", age = "25"},
    [41] = {first = "Sophia", last = "Moore", residence = "Missouri", age = "38"},
    [42] = {first = "Alexander", last = "Davis", residence = "Nebraska", age = "49"},
    [43] = {first = "Ava", last = "Brown", residence = "Nevada", age = "29"},
    [44] = {first = "Benjamin", last = "Johnson", residence = "NewHampshire", age = "21"},
    [45] = {first = "Ethan", last = "Martinez", residence = "NewJersey", age = "37"},
    [46] = {first = "Olivia", last = "Clark", residence = "NewMexico", age = "43"},
    [47] = {first = "Sophia", last = "Williams", residence = "NewYork", age = "28"},
    [48] = {first = "Liam", last = "Turner", residence = "NorthCarolina", age = "30"},
    [49] = {first = "Emma", last = "Walker", residence = "NorthDakota", age = "26"},
    [50] = {first = "Oliver", last = "Wilson", residence = "Ohio", age = "33"},
    [51] = {first = "Lily", last = "Morris", residence = "Georgia", age = "28"},
    [52] = {first = "Carter", last = "Smith", residence = "Florida", age = "32"},
    [53] = {first = "Ghazi", last = "Bekker", residence = "NorthCarolina", age = "41"},
    [54] = {first = "Henry", last = "Baker", residence = "Texas", age = "41"},
    [55] = {first = "Ella", last = "Foster", residence = "California", age = "29"},
    [56] = {first = "Aiden", last = "Gomez", residence = "NewYork", age = "27"},
    [57] = {first = "Scarlett", last = "Rivera", residence = "Arizona", age = "36"},
    [58] = {first = "Logan", last = "Wright", residence = "Montana", age = "33"},
    [59] = {first = "Aria", last = "Mitchell", residence = "Kansas", age = "23"},
    [60] = {first = "Gabriel", last = "Sanchez", residence = "Colorado", age = "30"},
    [61] = {first = "Madison", last = "Lopez", residence = "Alabama", age = "26"},
    [62] = {first = "Wyatt", last = "Turner", residence = "Louisiana", age = "35"},
    [63] = {first = "Luna", last = "Ward", residence = "Maryland", age = "38"},
    [64] = {first = "Owen", last = "Green", residence = "Minnesota", age = "31"},
    [65] = {first = "Avery", last = "Coleman", residence = "NorthDakota", age = "29"},
    [66] = {first = "Jack", last = "Jenkins", residence = "Michigan", age = "43"},
    [67] = {first = "Isabelle", last = "Russell", residence = "NewMexico", age = "22"},
    [68] = {first = "Luke", last = "Stewart", residence = "SouthDakota", age = "26"},
    [69] = {first = "Emily", last = "White", residence = "Wisconsin", age = "31"},
    [70] = {first = "Mason", last = "Robinson", residence = "Tennessee", age = "34"},
    [71] = {first = "Zoey", last = "Gonzalez", residence = "Delaware", age = "25"},
    [72] = {first = "Sebastian", last = "Lee", residence = "Iowa", age = "39"},
    [73] = {first = "Addison", last = "Cooper", residence = "Mississippi", age = "28"},
    [74] = {first = "Eli", last = "Hernandez", residence = "NewJersey", age = "30"},
    [75] = {first = "Natalie", last = "Phillips", residence = "Ohio", age = "37"},
    [76] = {first = "Grayson", last = "Reed", residence = "Indiana", age = "33"},
    [77] = {first = "Hannah", last = "Price", residence = "Maine", age = "24"},
    [78] = {first = "Caleb", last = "Simmons", residence = "Kentucky", age = "29"},
    [79] = {first = "Elizabeth", last = "Barnes", residence = "WestVirginia", age = "39"},
    [80] = {first = "Levi", last = "Ross", residence = "Alaska", age = "28"},
    [81] = {first = "Chloe", last = "Butler", residence = "Arkansas", age = "36"},
    [82] = {first = "Andrew", last = "Fisher", residence = "Connecticut", age = "31"},
    [83] = {first = "Eleanor", last = "Griffin", residence = "Hawaii", age = "30"},
    [84] = {first = "Lincoln", last = "Hart", residence = "Nebraska", age = "35"},
    [85] = {first = "Hazel", last = "Hawkins", residence = "Idaho", age = "27"},
    [86] = {first = "Ezra", last = "Washington", residence = "Missouri", age = "32"},
    [87] = {first = "Penelope", last = "Morgan", residence = "NewHampshire", age = "26"},
    [88] = {first = "Daniel", last = "Hughes", residence = "Illinois", age = "29"},
    [89] = {first = "Aubrey", last = "Diaz", residence = "Virginia", age = "33"},
    [90] = {first = "Mateo", last = "Bell", residence = "Nevada", age = "31"},
    [91] = {first = "Samantha", last = "Hayes", residence = "Wisconsin", age = "26"},
    [92] = {first = "Adrian", last = "Kim", residence = "Oregon", age = "38"},
    [93] = {first = "Zoe", last = "Harrison", residence = "NorthDakota", age = "30"},
    [94] = {first = "Nolan", last = "Peterson", residence = "Kansas", age = "29"},
    [95] = {first = "Ariana", last = "Gardner", residence = "Iowa", age = "24"},
    [96] = {first = "Dominic", last = "Cole", residence = "SouthCarolina", age = "31"},
    [97] = {first = "Riley", last = "Campbell", residence = "Oklahoma", age = "28"},
    [98] = {first = "Brooklyn", last = "Sullivan", residence = "RhodeIsland", age = "29"},
    [99] = {first = "Elias", last = "Perry", residence = "Louisiana", age = "37"},
    [100] = {first = "Layla", last = "Powell", residence = "Utah", age = "26"},
    [101] = {first = "Max", last = "Rossi", residence = "Vermont", age = "25"},
    [102] = {first = "Bella", last = "Gutierrez", residence = "Michigan", age = "28"},
    [103] = {first = "Adam", last = "Ward", residence = "Mississippi", age = "31"},
    [104] = {first = "Stella", last = "Chapman", residence = "Connecticut", age = "27"},
    [105] = {first = "Ian", last = "Medina", residence = "Arizona", age = "33"},
    [106] = {first = "Violet", last = "Meyer", residence = "Montana", age = "29"},
    [107] = {first = "Lucas", last = "Zhang", residence = "NorthCarolina", age = "35"},
    [108] = {first = "Hannah", last = "Lin", residence = "Texas", age = "32"},
    [109] = {first = "Nathan", last = "Molina", residence = "California", age = "30"},
    [110] = {first = "Paisley", last = "Reyes", residence = "NewYork", age = "26"},
    [111] = {first = "Evan", last = "Ibrahim", residence = "Alabama", age = "29"},
    [112] = {first = "Lila", last = "Garcia", residence = "Louisiana", age = "28"},
    [113] = {first = "Miles", last = "Larson", residence = "Maryland", age = "31"},
    [114] = {first = "Ariana", last = "Khan", residence = "Missouri", age = "27"},
    [115] = {first = "Caleb", last = "Nelson", residence = "SouthDakota", age = "33"},
    [116] = {first = "Nova", last = "Chen", residence = "NorthDakota", age = "25"},
    [117] = {first = "Aaron", last = "Li", residence = "Wisconsin", age = "30"},
    [118] = {first = "Brielle", last = "Gomez", residence = "Tennessee", age = "29"},
    [119] = {first = "Hudson", last = "Roberts", residence = "Delaware", age = "36"},
    [120] = {first = "Ayla", last = "Wright", residence = "Iowa", age = "27"},
    [121] = {first = "Jace", last = "Adams", residence = "Mississippi", age = "32"},
    [122] = {first = "Sophie", last = "Hall", residence = "Nebraska", age = "31"},
    [123] = {first = "Caden", last = "Rivera", residence = "NorthDakota", age = "24"},
    [124] = {first = "Nora", last = "Hernandez", residence = "Kansas", age = "29"},
    [125] = {first = "Grayson", last = "Gonzalez", residence = "Virginia", age = "30"},
    [126] = {first = "Elaina", last = "Bennett", residence = "Nevada", age = "28"},
    [127] = {first = "Harrison", last = "Sanchez", residence = "Wisconsin", age = "33"},
    [128] = {first = "Skylar", last = "Morris", residence = "Oregon", age = "27"},
    [129] = {first = "Theo", last = "Perez", residence = "Washington", age = "31"},
    [130] = {first = "Mila", last = "Cook", residence = "Indiana", age = "26"},
    [131] = {first = "Beckett", last = "Jackson", residence = "NewHampshire", age = "29"},
    [132] = {first = "Savannah", last = "Ward", residence = "Illinois", age = "28"},
    [133] = {first = "Ezra", last = "Barnes", residence = "Ohio", age = "33"},
    [134] = {first = "Ruby", last = "Wright", residence = "Oklahoma", age = "26"},
    [135] = {first = "Oscar", last = "Foster", residence = "RhodeIsland", age = "31"},
    [136] = {first = "Luna", last = "Jenkins", residence = "Arkansas", age = "29"},
    [137] = {first = "Carter", last = "Cruz", residence = "Minnesota", age = "32"},
    [138] = {first = "Clara", last = "Hamilton", residence = "WestVirginia", age = "27"},
    [139] = {first = "Micah", last = "Sullivan", residence = "Alaska", age = "30"},
    [140] = {first = "Summer", last = "Bell", residence = "Hawaii", age = "28"},
    [141] = {first = "Tristan", last = "Kim", residence = "Colorado", age = "33"},
    [142] = {first = "Valentina", last = "Peterson", residence = "Kentucky", age = "25"},
    [143] = {first = "Easton", last = "Gardner", residence = "Michigan", age = "29"},
    [144] = {first = "Maddison", last = "Rossi", residence = "Mississippi", age = "30"},
    [145] = {first = "August", last = "Diaz", residence = "Missouri", age = "26"},
    [146] = {first = "Remi", last = "Hayes", residence = "NewMexico", age = "32"},
    [147] = {first = "Hayden", last = "Washington", residence = "NewYork", age = "27"},
    [148] = {first = "Brynlee", last = "Martin", residence = "NorthCarolina", age = "30"},
    [149] = {first = "Maximus", last = "Lin", residence = "Texas", age = "28"},
    [150] = {first = "Evangeline", last = "Gomez", residence = "California", age = "33"},
    [151] = {first = "Roman", last = "Sanchez", residence = "Louisiana", age = "29"},
    [152] = {first = "Emery", last = "Young", residence = "Iowa", age = "28"},
    [153] = {first = "Sawyer", last = "Allen", residence = "NorthDakota", age = "33"},
    [154] = {first = "Jordyn", last = "Fisher", residence = "NewYork", age = "26"},
    [155] = {first = "Ryder", last = "Gomez", residence = "Florida", age = "31"},
    [156] = {first = "Emerson", last = "Harris", residence = "Arizona", age = "29"},
    [157] = {first = "Elliot", last = "Williams", residence = "Montana", age = "32"},
    [158] = {first = "Harmony", last = "Rivera", residence = "NorthCarolina", age = "27"},
    [159] = {first = "Phoenix", last = "Sullivan", residence = "Colorado", age = "30"},
    [160] = {first = "Lennon", last = "Martinez", residence = "California", age = "28"},
    [161] = {first = "Kieran", last = "Lee", residence = "NewJersey", age = "33"},
    [162] = {first = "Cameron", last = "Clark", residence = "Missouri", age = "26"},
    [163] = {first = "Rowan", last = "Davis", residence = "Ohio", age = "31"},
    [164] = {first = "Skyler", last = "Morris", residence = "Illinois", age = "29"},
    [165] = {first = "Zion", last = "Perry", residence = "Florida", age = "32"},
    [166] = {first = "Sage", last = "Parker", residence = "Georgia", age = "27"},
    [167] = {first = "Marley", last = "Turner", residence = "Indiana", age = "30"},
    [168] = {first = "Archer", last = "Nelson", residence = "Kentucky", age = "28"},
    [169] = {first = "Lyric", last = "Smith", residence = "Louisiana", age = "33"},
    [170] = {first = "Elliott", last = "Allen", residence = "Maine", age = "26"},
    [171] = {first = "Olivia", last = "Roberts", residence = "Hawaii", age = "27"},
    [172] = {first = "Ethan", last = "Parker", residence = "Kentucky", age = "34"},
    [173] = {first = "Sophia", last = "Adams", residence = "Mississippi", age = "45"},
    [174] = {first = "Benjamin", last = "Taylor", residence = "Montana", age = "19"},
    [175] = {first = "Ava", last = "Wright", residence = "SouthDakota", age = "31"},
    [176] = {first = "Liam", last = "Davis", residence = "Arizona", age = "40"},
    [177] = {first = "Emma", last = "Wilson", residence = "Connecticut", age = "22"},
    [178] = {first = "Noah", last = "Martinez", residence = "WestVirginia", age = "29"},
    [179] = {first = "Isabella", last = "Anderson", residence = "Delaware", age = "36"},
    [180] = {first = "Alexander", last = "Nelson", residence = "Maryland", age = "50"},
    [181] = {first = "Mia", last = "Johnson", residence = "Iowa", age = "25"},
    [182] = {first = "Elijah", last = "Garcia", residence = "NewMexico", age = "33"},
    [183] = {first = "Sofia", last = "Clark", residence = "Vermont", age = "28"},
    [184] = {first = "William", last = "Brown", residence = "Minnesota", age = "42"},
    [185] = {first = "Charlotte", last = "Harris", residence = "Tennessee", age = "37"},
    [186] = {first = "James", last = "Turner", residence = "Wisconsin", age = "30"},
    [187] = {first = "Amelia", last = "Smith", residence = "NorthDakota", age = "23"},
    [188] = {first = "Liam", last = "Anderson", residence = "Texas", age = "26"},
    [189] = {first = "Olivia", last = "Walker", residence = "Virginia", age = "39"},
    [190] = {first = "Emma", last = "Roberts", residence = "Louisiana", age = "32"},
    [191] = {first = "Ethan", last = "Johnson", residence = "Alabama", age = "33"},
    [192] = {first = "Sophia", last = "Garcia", residence = "Alaska", age = "42"},
    [193] = {first = "Benjamin", last = "Lee", residence = "Arkansas", age = "19"},
    [194] = {first = "Ava", last = "Anderson", residence = "California", age = "30"},
    [195] = {first = "Liam", last = "Williams", residence = "Colorado", age = "40"},
    [196] = {first = "Emma", last = "Brown", residence = "Florida", age = "24"},
    [197] = {first = "Noah", last = "Davis", residence = "Georgia", age = "29"},
    [198] = {first = "Isabella", last = "Taylor", residence = "Idaho", age = "35"},
    [199] = {first = "Alexander", last = "Harris", residence = "Illinois", age = "47"},
    [200] = {first = "Mia", last = "Moore", residence = "Indiana", age = "26"},
    [201] = {first = "Elijah", last = "Clark", residence = "Kansas", age = "39"},
    [202] = {first = "Sofia", last = "Martinez", residence = "Iowa", age = "28"},
    [203] = {first = "William", last = "Turner", residence = "Kentucky", age = "41"},
    [204] = {first = "Charlotte", last = "Johnson", residence = "Louisiana", age = "31"},
    [205] = {first = "James", last = "Anderson", residence = "Maine", age = "27"},
    [206] = {first = "Amelia", last = "Walker", residence = "Maryland", age = "23"},
    [207] = {first = "Liam", last = "Smith", residence = "Massachusetts", age = "36"},
    [208] = {first = "Olivia", last = "Taylor", residence = "Michigan", age = "44"},
    [209] = {first = "Emma", last = "Parker", residence = "Minnesota", age = "32"},
    [210] = {first = "Noah", last = "Garcia", residence = "Mississippi", age = "25"},
    [211] = {first = "Sophia", last = "Moore", residence = "Missouri", age = "38"},
    [212] = {first = "Alexander", last = "Davis", residence = "Nebraska", age = "49"},
    [213] = {first = "Ava", last = "Brown", residence = "Nevada", age = "29"},
    [214] = {first = "Benjamin", last = "Johnson", residence = "NewHampshire", age = "21"},
    [215] = {first = "Ethan", last = "Martinez", residence = "NewJersey", age = "37"},
    [216] = {first = "Olivia", last = "Clark", residence = "NewMexico", age = "43"},
    [217] = {first = "Sophia", last = "Williams", residence = "NewYork", age = "28"},
    [218] = {first = "Liam", last = "Turner", residence = "NorthCarolina", age = "30"},
    [219] = {first = "Emma", last = "Walker", residence = "NorthDakota", age = "26"},
    [220] = {first = "Oliver", last = "Wilson", residence = "Ohio", age = "33"},
    [221] = {first = "Lily", last = "Morris", residence = "Georgia", age = "28"},
    [222] = {first = "Carter", last = "Smith", residence = "Florida", age = "32"},
    [223] = {first = "Grace", last = "Allen", residence = "NorthCarolina", age = "24"},
    [224] = {first = "Sophia", last = "Nguyen", residence = "Florida", age = "28"},
    [225] = {first = "Ella", last = "Foster", residence = "California", age = "29"},
    [226] = {first = "Aiden", last = "Gomez", residence = "NewYork", age = "27"},
    [227] = {first = "Scarlett", last = "Rivera", residence = "Arizona", age = "36"},
    [228] = {first = "Logan", last = "Wright", residence = "Montana", age = "33"},
    [229] = {first = "Aria", last = "Mitchell", residence = "Kansas", age = "23"},
    [230] = {first = "Gabriel", last = "Sanchez", residence = "Colorado", age = "30"},
    [231] = {first = "Madison", last = "Lopez", residence = "Alabama", age = "26"},
    [232] = {first = "Wyatt", last = "Turner", residence = "Louisiana", age = "35"},
    [233] = {first = "Luna", last = "Ward", residence = "Maryland", age = "38"},
    [234] = {first = "Owen", last = "Green", residence = "Minnesota", age = "31"},
    [235] = {first = "Avery", last = "Coleman", residence = "NorthDakota", age = "29"},
    [236] = {first = "Jack", last = "Jenkins", residence = "Michigan", age = "43"},
    [237] = {first = "Isabelle", last = "Russell", residence = "NewMexico", age = "22"},
    [238] = {first = "Luke", last = "Stewart", residence = "SouthDakota", age = "26"},
    [239] = {first = "Emily", last = "White", residence = "Wisconsin", age = "31"},
    [240] = {first = "Mason", last = "Robinson", residence = "Tennessee", age = "34"},
    [241] = {first = "Zoey", last = "Gonzalez", residence = "Delaware", age = "25"},
    [242] = {first = "Sebastian", last = "Lee", residence = "Iowa", age = "39"},
    [243] = {first = "Addison", last = "Cooper", residence = "Mississippi", age = "28"},
    [244] = {first = "Eli", last = "Hernandez", residence = "NewJersey", age = "30"},
    [245] = {first = "Natalie", last = "Phillips", residence = "Ohio", age = "37"},
    [246] = {first = "Grayson", last = "Reed", residence = "Indiana", age = "33"},
    [247] = {first = "Hannah", last = "Price", residence = "Maine", age = "24"},
    [248] = {first = "Caleb", last = "Simmons", residence = "Kentucky", age = "29"},
    [249] = {first = "Elizabeth", last = "Barnes", residence = "WestVirginia", age = "39"},
    [250] = {first = "Levi", last = "Ross", residence = "Alaska", age = "28"},
    [251] = {first = "Chloe", last = "Butler", residence = "Arkansas", age = "36"},
    [252] = {first = "Andrew", last = "Fisher", residence = "Connecticut", age = "31"},
    [253] = {first = "Eleanor", last = "Griffin", residence = "Hawaii", age = "30"},
    [254] = {first = "Lincoln", last = "Hart", residence = "Nebraska", age = "35"},
    [255] = {first = "Hazel", last = "Hawkins", residence = "Idaho", age = "27"},
    [256] = {first = "Ezra", last = "Washington", residence = "Missouri", age = "32"},
    [257] = {first = "Penelope", last = "Morgan", residence = "NewHampshire", age = "26"},
    [258] = {first = "Daniel", last = "Hughes", residence = "Illinois", age = "29"},
    [259] = {first = "Aubrey", last = "Diaz", residence = "Virginia", age = "33"},
    [260] = {first = "Mateo", last = "Bell", residence = "Nevada", age = "31"},
    [261] = {first = "Samantha", last = "Hayes", residence = "Wisconsin", age = "26"},
    [262] = {first = "Adrian", last = "Kim", residence = "Oregon", age = "38"},
    [263] = {first = "Zoe", last = "Harrison", residence = "NorthDakota", age = "30"},
    [264] = {first = "Nolan", last = "Peterson", residence = "Kansas", age = "29"},
    [265] = {first = "Ariana", last = "Gardner", residence = "Iowa", age = "24"},
    [266] = {first = "Dominic", last = "Cole", residence = "SouthCarolina", age = "31"},
    [267] = {first = "Riley", last = "Campbell", residence = "Oklahoma", age = "28"},
    [268] = {first = "Brooklyn", last = "Sullivan", residence = "RhodeIsland", age = "29"},
    [269] = {first = "Elias", last = "Perry", residence = "Louisiana", age = "37"},
    [270] = {first = "Layla", last = "Powell", residence = "Utah", age = "26"},
    [271] = {first = "Max", last = "Rossi", residence = "Vermont", age = "25"},
    [272] = {first = "Bella", last = "Gutierrez", residence = "Michigan", age = "28"},
    [273] = {first = "Adam", last = "Ward", residence = "Mississippi", age = "31"},
    [274] = {first = "Stella", last = "Chapman", residence = "Connecticut", age = "27"},
    [275] = {first = "Ian", last = "Medina", residence = "Arizona", age = "33"},
    [276] = {first = "Violet", last = "Meyer", residence = "Montana", age = "29"},
    [277] = {first = "Evan", last = "Woods", residence = "NewYork", age = "36"},
    [278] = {first = "Lucy", last = "Ferguson", residence = "California", age = "27"},
    [279] = {first = "Axel", last = "Porter", residence = "Alabama", age = "31"},
    [280] = {first = "Brianna", last = "Hunt", residence = "WestVirginia", age = "30"},
    [281] = {first = "Miles", last = "Lawrence", residence = "Kansas", age = "25"},
    [282] = {first = "Nora", last = "Shaw", residence = "Maine", age = "34"},
    [283] = {first = "Hudson", last = "Sims", residence = "Florida", age = "28"},
    [284] = {first = "Caroline", last = "Ortega", residence = "NorthCarolina", age = "26"},
    [285] = {first = "Micah", last = "Jennings", residence = "Nebraska", age = "29"},
    [286] = {first = "Savannah", last = "Ross", residence = "Nevada", age = "31"},
    [287] = {first = "Jace", last = "Wheeler", residence = "Louisiana", age = "27"},
    [288] = {first = "Aaliyah", last = "Holt", residence = "Utah", age = "32"},
    [289] = {first = "Blake", last = "Douglas", residence = "Vermont", age = "24"},
    [290] = {first = "Everly", last = "Barton", residence = "Michigan", age = "30"},
    [291] = {first = "Kai", last = "Yu", residence = "Mississippi", age = "25"},
    [292] = {first = "Genesis", last = "Morrison", residence = "Connecticut", age = "28"},
    [293] = {first = "Tristan", last = "Newton", residence = "Arizona", age = "35"},
    [294] = {first = "Valentina", last = "Francis", residence = "Montana", age = "31"},
    [295] = {first = "Maddox", last = "Sherman", residence = "NewYork", age = "29"},
    [296] = {first = "Isla", last = "Silva", residence = "California", age = "34"},
    [297] = {first = "Emmett", last = "Hanson", residence = "Alabama", age = "27"},
    [298] = {first = "Delilah", last = "Patterson", residence = "WestVirginia", age = "30"},
    [299] = {first = "Cole", last = "Banks", residence = "Kansas", age = "26"},
    [300] = {first = "Kate", last = "Fitzgerald", residence = "Maine", age = "31"},
}

Config.MaleNoGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [16] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true}
Config.FemaleNoGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true}

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-- |   |   |   |   |   |   |   |   |   |   |    DO NOT TOUCH ANYTHING UNDER THIS LINE  |   |   |   |   |   |   |   |   |   |   |    |
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

Config.DoorStates = { -- Sync
    ["RockfordHills"] = {},
    ["Legion"] = {},
    ["Burton"] = {},
    ["Alta"] = {},
    ["GrandSenoraDesert"] = {},
    ["BanhamCanyon"] = {},
}

Config.DoorList = {
    ["RockfordHills"] = {
            -- Fleeca Reception
        {
            objYaw = 296.86,
            objCoords = vector3(-1214.90, -334.72, 38.05),
            objHash = -1201894283,
            locked = true,
        },
            -- Fleeca Back Door
        {
            objYaw = 296.86370849609,
            objCoords = vector3(-1214.62, -336.4432, 37.94231),
            objHash = -2075524880,
            locked = true,
        },
            -- Fleeca Vault Gate
        {
            objYaw = 206.86373901367,
            objCoords = vector3(-1207.354, -335.0772, 38.09115),
            objHash = -1591004109,
            locked = true,
        },
    },

    ["Legion"] = {
            -- Fleeca Reception
        {
            objYaw = 249.86,
            objCoords = vector3(145.41, -1041.81, 29.64),
            objHash = -1201894283,
            locked = true,
        },
            -- Fleeca Back Door
        {
            objYaw = 249.86,
            objCoords = vector3(144.04, -1044.24, 29.51),
            objHash = -2075524880,
            locked = true,
        },
            -- Fleeca Vault Gate
        {
            objYaw = 159.84617614746,
            objCoords = vector3(150.29, -1047.62, 29.66),
            objHash = -1591004109,
            locked = true,
        },
    },

    ["Burton"] = {
            -- Fleeca Reception
        {
            objYaw = 250.85,
            objCoords = vector3(-355.38, -51.06, 49.31),
            objHash = -1201894283,
            locked = true,
        },
            -- Fleeca Back Door
        {
            objYaw = 250.85984802246,
            objCoords = vector3(-356.4247, -52.46456, 49.19785),
            objHash = -2075524880,
            locked = true,
        },
            -- Fleeca Vault Gate
        {
            objYaw = 160.85981750488,
            objCoords = vector3(-350.3954, -56.74229, 49.34669),
            objHash = -1591004109,
            locked = true,
        },
    },

    ["Alta"] = {
            -- Fleeca Reception
        {
            objYaw = 249.86,
            objCoords = vector3(309.74, -280.17, 54.43),
            objHash = -1201894283,
            locked = true,
        },
            -- Fleeca Back Door
        {
            objYaw = 249.73,
            objCoords = vector3(308.37, -282.61, 54.31),
            objHash = -2075524880,
            locked = true,
        },

            -- Fleeca Vault Gate
        {
            objYaw = 159.84617614746,
            objCoords = vector3(314.62, -285.99, 54.46),
            objHash = -1591004109,
            locked = true,
        },
    },

    ["GrandSenoraDesert"] = {
            -- Fleeca Reception
        {
            objYaw = 89.99,
            objCoords = vector3(1178.86, 2709.36, 38.36),
            objHash = -1201894283,
            locked = true,
        },
            -- Fleeca Back Door
        {
            objYaw = 90.0,
            objCoords = vector3(1179.39, 2711.024, 38.24931),
            objHash = -2075524880,
            locked = true,
        },
            -- Fleeca Vault Gate
        {
            objYaw = 0.0,
            objCoords = vector3(1172.291, 2713.088, 38.39815),
            objHash = -1591004109,
            locked = true,
        },
    },

    ["BanhamCanyon"] = {
            -- Fleeca Reception
        {
            objYaw = 357.54202270508,
            objCoords = vector3(-2960.17, 479.01, 15.97),
            objHash = -455481252,
            locked = true,
        },
            -- Fleeca Back Door
        {
            objYaw = 357.54205322266,
            objCoords = vector3(-2958.541, 478.4196, 15.85836),
            objHash = -2075524880,
            locked = true,
        },
            -- Fleeca Vault Gate
        {
            objYaw = 267.54205322266,
            objCoords = vector3(-2956.174, 485.4231, 16.0072),
            objHash = -1591004109,
            locked = true,
        },
    },
}

Config.Steps = {
    ["RockfordHills"] = {},
    ["Legion"] = {},
    ["Burton"] = {},
    ["Alta"] = {},
    ["GrandSenoraDesert"] = {},
    ["BanhamCanyon"] = {}
}

Config.ExtraSteps = {
    ["RockfordHills"] = {},
    ["Legion"] = {},
    ["Burton"] = {},
    ["Alta"] = {},
    ["GrandSenoraDesert"] = {},
    ["BanhamCanyon"] = {}
}

Config.Tasks = {
    ["RockfordHills"] = {},
    ["Legion"] = {},
    ["Burton"] = {},
    ["Alta"] = {},
    ["GrandSenoraDesert"] = {},
    ["BanhamCanyon"] = {}
}