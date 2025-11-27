Config = {}

-------------------------------------------------------


Config.pedmodel = 'a_m_m_prolhost_01' -- ped model hash

Config.scenario = 'WORLD_HUMAN_CLIPBOARD' -- scenario for ped to play, false to disable

Config.locations = {
    ['paleto'] = {
        ped = true, -- if false uses boxzone (below)

        coords = vector4(-214.48, 6355.65, 31.49, 136.78),
        
        -------- boxzone (only used if ped is false) --------

        length = 1.0,  
        width = 1.0,   
        minZ = 30.81,  
        maxZ = 30.81,  
        debug = false, 

        -----------------------------------------------------
        vehicles = {
            ['faggio2']        = {     -- vehicle model name
                price = 499,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/w4aVvxe5Gx1fmKRNTBqw3/faggio2.png',      -- image for menu, false for no image
            },
            ['asea']        = {     -- vehicle model name
                price = 1500,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/w4aVvxe5Gx1fmKRNTBqw3/asea.png',      -- image for menu, false for no image
            },
            ['bison']       = {
                price = 1000, 
                image = 'https://r2.fivemanage.com/w4aVvxe5Gx1fmKRNTBqw3/bison.png',
            },
            ['patriot']     = {
                price = 2000, 
                image = 'https://r2.fivemanage.com/w4aVvxe5Gx1fmKRNTBqw3/patriot.png',
            },

        },

        vehiclespawncoords = vector4(-217.8561, 6348.7910, 31.6978, 222.4448), -- where vehicle spawns when rented

    },


    ['airport'] = {
        ped = true, -- if false uses boxzone (below)

        coords = vector4(-1039.075, -2730.957, 20.214, 242.66),
        
        -------- boxzone (only used if ped is false) --------

        length = 1.0,  
        width = 1.0,   
        minZ = 30.81,  
        maxZ = 30.81,  
        debug = false, 

        -----------------------------------------------------
        vehicles = {
            ['faggio2']        = {     -- vehicle model name
                price = 499,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/w4aVvxe5Gx1fmKRNTBqw3/faggio2.png',      -- image for menu, false for no image
            },
            ['asea']        = {     -- vehicle model name
                price = 1500,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/w4aVvxe5Gx1fmKRNTBqw3/asea.png',      -- image for menu, false for no image
            },
            ['bison']       = {
                price = 1000, 
                image = 'https://r2.fivemanage.com/w4aVvxe5Gx1fmKRNTBqw3/bison.png',
            },
            ['patriot']     = {
                price = 2000, 
                image = 'https://r2.fivemanage.com/w4aVvxe5Gx1fmKRNTBqw3/patriot.png',
            },

        },

        vehiclespawncoords = vector4(-1051.698, -2712.771, 13.671, 239.168), -- where vehicle spawns when rented

    },


    ['altstreet'] = {
        ped = true, -- if false uses boxzone (below)

        coords = vector4(-254.016, -970.496, 31.22, 160.051),
        
        -------- boxzone (only used if ped is false) --------

        length = 1.0,  
        width = 1.0,   
        minZ = 50.73,  
        maxZ = 54.73,  
        debug = false, 

        -----------------------------------------------------
        vehicles = {
            ['faggio2']        = {     -- vehicle model name
                price = 499,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/w4aVvxe5Gx1fmKRNTBqw3/faggio2.png',      -- image for menu, false for no image
            },
            ['asea']        = {     -- vehicle model name
                price = 1500,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/w4aVvxe5Gx1fmKRNTBqw3/asea.png',      -- image for menu, false for no image
            },
            ['bison']       = {
                price = 1000, 
                image = 'https://r2.fivemanage.com/w4aVvxe5Gx1fmKRNTBqw3/bison.png',
            },
            ['patriot']     = {
                price = 2000, 
                image = 'https://r2.fivemanage.com/w4aVvxe5Gx1fmKRNTBqw3/patriot.png',
            },

        },

        vehiclespawncoords = vector4(-263.457, -1002.265, 27.372, 250.371), -- where vehicle spawns when rented
    },

    ['BoatLightHouse'] = {
        ped = true, -- if false uses boxzone (below)

        coords = vector4(3373.47, 5183.509, 1.46, 82.218),
        
        -------- boxzone (only used if ped is false) --------

        length = 1.0,  
        width = 1.0,   
        minZ = 0.73,  
        maxZ = 1.73,  
        debug = false, 

        -----------------------------------------------------
        vehicles = {
            ['dinghy']        = {     -- vehicle model name
                price = 1000,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/CXgumx5UQ98Ry3URmk5Im/dinghy.webp',      -- image for menu, false for no image
            },
        },

        vehiclespawncoords = vector4(3375.479, 5178.606, -0.474, 266.393), -- where vehicle spawns when rented
    },

    ['BoatFary'] = {
        ped = true, -- if false uses boxzone (below)

        coords = vector4(-1799.491, -1224.518, 1.591, 144.622),
        
        -------- boxzone (only used if ped is false) --------

        length = 1.0,  
        width = 1.0,   
        minZ = 0.73,  
        maxZ = 1.73,  
        debug = false, 

        -----------------------------------------------------
        vehicles = {
            ['dinghy']        = {     -- vehicle model name
                price = 1500,        -- ['vehicle'] = price
                image = 'https://r2.fivemanage.com/CXgumx5UQ98Ry3URmk5Im/dinghy.webp',      -- image for menu, false for no image
            },
        },

        vehiclespawncoords = vector4(-1794.439, -1234.204, -0.441, 143.813), -- where vehicle spawns when rented
    },

}

