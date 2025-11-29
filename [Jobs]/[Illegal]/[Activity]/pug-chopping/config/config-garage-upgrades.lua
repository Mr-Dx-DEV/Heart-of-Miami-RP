-- Crafting bench menu values
Config.CraftingItems = {
    ["harness"] = { -- Item to craft
        materials = {
            ["steel"] = 42, -- Item needed and amount needed ( you can add as many items as you like)
            ["plastic"] = 37, -- Item needed and amount needed ( you can add as many items as you like)
            ["rubber"] = 36, -- Item needed and amount needed ( you can add as many items as you like)
        }
    },

    -- You add add as many items as you want like these examples here:

    -- ["hotwirekit"] = { -- Item to craft
    --     materials = {
    --         ["iron"] = 25, -- Item needed and amount needed ( you can add as many items as you like)
    --         ["metalscrap"] = 15, -- Item needed and amount needed ( you can add as many items as you like)
    --         ["rubber"] = 18, -- Item needed and amount needed ( you can add as many items as you like)
    --     }
    -- },
    -- ["fake_plate"] = {
    --     materials = {
    --         ["plastic"] = 12,
    --         ["metalscrap"] = 145,
    --         ["rubber"] = 5,
    --         ["aluminum"] = 55,
    --     }
    -- },
    -- ["racing_usb"] = {
    --     materials = {
    --         ["copper"] = 5,
    --         ["plastic"] = 12,
    --         ["rubber"] = 7,
    --         ["aluminum"] = 5,
    --     },
    --     price = 2500,
    -- },
    -- ["nos"] = {
    --     materials = {
    --         ["copper"] = 45,
    --         ["plastic"] = 52,
    --         ["rubber"] = 47,
    --         ["aluminum"] = 35,
    --         ["steel"] = 72,
    --     },
    --     price = 25000,
    -- },
    -- ["racing_usbmaster"] = {
    --     materials = {
    --         ["copper"] = 35,
    --         ["plastic"] = 52,
    --         ["rubber"] = 47,
    --         ["aluminum"] = 35,
    --     },
    --     price = 15000,
    -- },
    -- ["ausb2"] = {
    --     materials = {
    --         ["copper"] = 5,
    --         ["plastic"] = 12,
    --         ["rubber"] = 7,
    --         ["aluminum"] = 5,
    --     },
    --     price = 3000,
    -- },
    -- ["boostinglaptop"] = {
    --     materials = {
    --         ["copper"] = 20,
    --         ["plastic"] = 15,
    --         ["rubber"] = 5,
    --         ["aluminum"] = 25,
    --     },
    --     price = 15000,
    -- },
}


-- Items you get when chopping a wheel.
-- when breaking down each of these parts it picks 1 to however many options you have here to 
-- choose to give to the player and then it chooses to give between amountmin and amountmax to the player
Config.VehicleParts = {
    ["chop_wheel"] = { -- When you break down a wheel
        [1] = { -- or this
            ["item"] = "plastic", -- item recieved
            ["amountmin"] = 5, -- minimum plastic
            ["amountmax"] = 15, -- maximum plastic
        },
        [2] = { -- or this
            ["item"] = "rubber", -- item recieved
            ["amountmin"] = 5, -- minimum rubber
            ["amountmax"] = 15, -- maximum rubber
        },
        [3] = {
            ["item"] = "aluminum",
            ["amountmin"] = 5, 
            ["amountmax"] = 15, 
        },
    },
    ["chop_door"] = { -- When you break down a door
        [1] = {
            ["item"] = "metalscrap",
            ["amountmin"] = 10,
            ["amountmax"] = 20,
        },
        [2] = {
            ["item"] = "broken_glass",
            ["amountmin"] = 5,
            ["amountmax"] = 15,
        },
        [3] = {
            ["item"] = "copper_wires",
            ["amountmin"] = 5,
            ["amountmax"] = 15,
        },
    },
    ["chop_hood"] = {
        [1] = {
            ["item"] = "metal_splinter",
            ["amountmin"] = 5,
            ["amountmax"] = 15,
        },
        [2] = {
            ["item"] = "steel",
            ["amountmin"] = 5,
            ["amountmax"] = 15,
        },
        [3] = {
            ["item"] = "mesh_fabric",
            ["amountmin"] = 5,
            ["amountmax"] = 15,
        },
    },
    ["chop_trunk"] = {
        [1] = {
            ["item"] = "aluminum_splinter",
            ["amountmin"] = 10,
            ["amountmax"] = 20,
        },
        [2] = {
            ["item"] = "carbon",
            ["amountmin"] = 10,
            ["amountmax"] = 20,
        },
        [3] = {
            ["item"] = "rubber",
            ["amountmin"] = 10,
            ["amountmax"] = 20,
        },
        [4] = {
            ["item"] = "mesh_fabric",
            ["amountmin"] = 10,
            ["amountmax"] = 20,
        },
        [5] = {
            ["item"] = "copper_wires",
            ["amountmin"] = 10,
            ["amountmax"] = 20,
        },
        [6] = {
            ["item"] = "metal_splinter",
            ["amountmin"] = 10,
            ["amountmax"] = 20,
        },
        [7] = {
            ["item"] = "plastic",
            ["amountmin"] = 10,
            ["amountmax"] = 20,
        },
        [8] = { 
            ["item"] = "aluminum", 
            ["amountmin"] = 10, 
            ["amountmax"] = 20, 
        },
    },
}

-- Printer options
Config.PrinterOptions = {
    [0] = {
        Item = 'bankcard', -- What you get from the printer
        Reqired = { -- Items required to print that item
            ["iron"] = 25, -- Item needed and amount needed ( you can add as many items as you like)
            ["metalscrap"] = 15, -- Item needed and amount needed ( you can add as many items as you like)
            ["rubber"] = 18, -- Item needed and amount needed ( you can add as many items as you like)
        },
        price = 500, -- cost of printing
    },
    -- You add add as many items as you want like this example here:

    -- [1] = {
    --     Item = 'security_card_02',
    --     Reqired = {
    --         ["plastic"] = 25, -- Item needed and amount needed ( you can add as many items as you like)
    --         ["rubber"] = 18, -- Item needed and amount needed ( you can add as many items as you like)
    --     },
    --     price = 1500,
    -- },
}

-- You can configure this to whatever games you want you would just need to make your own event. (These events can be edited at the bottom of client/open.lua)
Config.ArcadeGames = { -- Arcade games you can play
    [0] = {
        Game = 'Maze',
        GameEvent = 'Pug:client:MazeGame',
        price = 2500,
        CarsCount = 10,
    },
    [1] = {
        Game = 'Var',
        GameEvent = 'Pug:client:VarGame',
        price = 3500,
        CarsCount = 20,
    },
    [2] = {
        Game = 'Circle',
        GameEvent = 'Pug:client:CircleGame',
        price = 4500,
        CarsCount = 30,
    },
    [3] = {
        Game = 'Memory',
        GameEvent = 'Pug:client:ThermiteGame',
        price = 5500,
        CarsCount = 40,
    },
    [4] = {
        Game = 'Scrambler',
        GameEvent = 'Pug:client:ScramblerGame',
        price = 6500,
        CarsCount = 50,
    },
}

-- Garage upgrade options 
Config.UpgradesMenu = {

    [0] = {
        label = 'Welding Bench',
        itemupgrade = 'weldingbench',
        CamPos = vector3(995.72, -2989.5, -39.20),
        CamRot = vector3(0.0, 0.0, 0.000000),
        price = 300000,
        CarsCount = 50,-- how many cars in total obtained
        Carsowned = 10,-- how many cars in the garage right now
        AddUpgradeEvent = "Pug:client:AddWeldingBench",
    },
 
    [1] = {
        label = 'Storage Locker',
        itemupgrade = 'storagelocker',
        CamPos = vector3(969.94, -2999.66, -39.20),
        CamRot = vector3(0.0, 0.0, 90.000000),
        price = 150000,
        CarsCount = 70,-- how many cars in total obtained
        Carsowned = 15,-- how many cars in the garage right now
        AddUpgradeEvent = "Pug:client:AddStorageTarget",
    },
    
    [2] = {
        label = 'Arcade Mechine',
        itemupgrade = 'arcademechine',
        CamPos = vector3(960.02, -3001.11, -39.64),
        CamRot = vector3(0.0, 0.0, 0.000000),
        price = 15000,
        CarsCount = 100,-- how many cars in total obtained
        Carsowned = 20,-- how many cars in the garage right now
        AddUpgradeEvent = "Pug:client:AddArcadeMechine",
    },

       --[[ [0] = {
        label = 'Clothing Change', -- preivew lable 
        itemupgrade = 'clothingchange', -- upgrade identifier name (very important)
        CamPos = vector3(959.53, -3005.18, -39.55), -- Camera position for previewing this upgrade
        CamRot = vector3(0.0, 0.0, 90.000000), -- Camera rotation for previewing this upgrade. Basically what direction the camera looks at.
        price = 50000, -- Hpw much the garage upgrade options 
        CarsCount = 25, -- how many cars in total obtained
        Carsowned = 3,-- how many cars in the garage right now
        AddUpgradeEvent = "Pug:client:AddClothesTarget", -- You need to make a new event like this if you want to make more upgrades. The event examples are all in open.lua
    }, ]]
    --[[ [2] = {
        label = 'Crafting Bench',
        itemupgrade = 'craftingbench',
        CamPos = vector3(967.51, -2992.84, -39.0),
        CamRot = vector3(-15.0, 0.0, 90.000000),
        price = 30000,
        CarsCount = 125,-- how many cars in total obtained
        Carsowned = 18,-- how many cars in the garage right now
        AddUpgradeEvent = "Pug:client:AddCraftingBenchTarget",
    }, ]]
    --[[ [5] = {
        label = 'Printer Machine',
        itemupgrade = 'printermachine',
        CamPos = vector3(965.29, -3003.42, -39.25),
        CamRot = vector3(-15.0, 0.0, -90.000000),
        price = 30000,
        CarsCount = 75,-- how many cars in total obtained
        Carsowned = 40,-- how many cars in the garage right now
        AddUpgradeEvent = "Pug:client:AddPrinterMachine",
    }, ]]
    -- This was made durring testing but since everyone is in the same instance this scuffs out but still works if only one garage at a time is using it.
    -- [4] = {
    --     label = 'Black Jack Table',
    --     itemupgrade = 'blackjacktable',
    --     CamPos = vector3(969.22, -3022.43, -39.25),
    --     CamRot = vector3(-15.0, 0.0, 90.000000),
    --     price = 1,
    --     CarsCount = 0,
    --     AddUpgradeEvent = "Pug:client:AddBlackJack",
    -- },
    -- [5] = {
    --     label = 'Pool Table',
    --     itemupgrade = 'pooltable',
    --     CamPos = vector3(962.06, -3027.41, -39.25),
    --     CamRot = vector3(-15.0, 0.0, 15.000000),
    --     price = 1,
    --     CarsCount = 0,
    --     AddUpgradeEvent = "Pug:client:AddPoolTable",
    -- },
    -- [6] = {
    --     label = 'Roulette Table',
    --     itemupgrade = 'roulettetable',
    --     CamPos = vector3(968.39, -3025.19, -39.25),
    --     CamRot = vector3(-15.0, 0.0, 90.000000),
    --     price = 1,
    --     CarsCount = 0,
    --     AddUpgradeEvent = "Pug:client:AddRouleteTable",
    -- },
}