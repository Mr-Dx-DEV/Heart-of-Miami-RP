Locations = {
    -- { -- Sisyphus Theater
    --     job = "public", -- "public" makes it so anyone can add music.
    --     enableBooth = true,
    --     DefaultVolume = 0.15, radius = 200,
    --     coords = vec3(206.9, 1181.04, 226.51),
    --     soundLoc = vec3(212.32, 1155.87, 227.01), -- Add sound origin location if you don't want the music to play from the dj booth
    -- },
    { -- Sisyphus Theater
        job = "catcafe", -- "public" makes it so anyone can add music.
        enableBooth = true,
        DefaultVolume = 0.15, radius = 25,
        coords = vec3(-585.66, -1062.98, 22.5),
        soundLoc = vec3(-585.66, -1062.98, 22.5), -- Add sound origin location if you don't want the music to play from the dj booth
    },
    { -- vanilla unicorn
			job = "vanillaunicorn", -- "public" makes it so anyone can add music.
			enableBooth = true,
			DefaultVolume = 0.15,
			radius = 40,
			coords = vector3(119.0, -1299.51, 29.42),
			soundLoc = vector3(118.62, -1291.41, 26.6),
		},
    
    { 
        job = "seapearls", -- "public" makes it so anyone can add music.
        enableBooth = true,
        DefaultVolume = 0.15, radius = 60,
        coords = vec3(-1799.235, -1212.423, 13.607),
        soundLoc = vec3(-1799.235, -1212.423, 13.607), -- Add sound origin location if you don't want the music to play from the dj booth
    },
    { 
        job = "lustresort", -- "public" makes it so anyone can add music.
        enableBooth = true,
        DefaultVolume = 0.15, radius = 25,
        coords = vec3(-564.072, 200.579, 72.844),
        soundLoc = vec3(-564.072, 200.579, 72.844), -- Add sound origin location if you don't want the music to play from the dj booth
    },
    { 
        job = "joebar", -- "public" makes it so anyone can add music.
        enableBooth = true,
        DefaultVolume = 0.15, radius = 25,
        coords = vec3(296.761, -714.104, 29.625),
        soundLoc = vec3(296.761, -714.104, 29.625), -- Add sound origin location if you don't want the music to play from the dj booth
    },
    { 
        job = "saltlabcafe", -- "public" makes it so anyone can add music.
        enableBooth = true,
        DefaultVolume = 0.15, radius = 100,
        coords = vec3(-3108.861, 473.74, 2.491),
        soundLoc = vec3(-3114.796, 478.578, 2.491), -- Add sound origin location if you don't want the music to play from the dj booth
    },

    { -- GabzTuners Radio Prop
        job = "mechanic",
        enableBooth = true,
        DefaultVolume = 0.1, radius = 30,
        coords = vec3(127.04, -3030.65, 6.80),
        prop = { model = "prop_radio_01", coords = vec3(127.04, -3030.65, 6.80) },
                                -- Prop to spawn at location, if the location doesn't have one already
                                -- (can be changed to any prop, coords determine wether its placed correctly)
    },

    { -- Gabz Popsdiner Radio Prop
        job = "public",
        enableBooth = true,
        DefaultVolume = 0.1, radius = 30,
        coords = vec3(1595.53, 6453.02, 26.165),
        prop = { model = "prop_boombox_01", coords = vec3(1595.53, 6453.02, 26.165) },
    },
}