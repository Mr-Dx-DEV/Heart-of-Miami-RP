return {
    JobInfo = {
        Name = "gardener sandy", 
        JobID = {"gardener_sandy", 0},
        Img = "img/gardenersandy.jpg",
        ExperienceRequired = 500,
        info = "Help needed cleaning the sandy garden, mowing the grass and we'll pay you!",

        Tutorial = {
            [1] = "First you must know that your tool is in the trunk, approach and take it.",
            [2] = "Go to the areas marked on the map and cut the grass.",
            [3] = "When you're done, go here to get paid.",
        }            
    },

    JobConfig = {

        Tool = {
            prop = "prop_cs_trowel", 
            objcoord = {28422,0.08, 0.05, 0.0, 120.0, -10.0, -50.0}, 
            objcoord2 = {28422,0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            animation_action = {"amb@world_human_gardener_plant@female@base", "base_female",3000},
            animation_take = nil,
            particles = "ent_anim_snot_blow",
        },

        type = 1,

        deleteprop = true,

        {
            CreateGroup = vec4(1710.3260, 4728.5034, 41.1460, 112.4392),

            CreateGroupPed_model = "cs_omega",

            Workclothes = vec4(1706.8735, 4737.4458, 41.1455, 288.7844),

            Vehicle = {
                coord = vec4(1724.1747, 4714.1909, 41.1470, 17.0420),
                spawnvehicle = vec4(1728.1367, 4706.0254, 42.4803, 126.8267),
                doors = {2,3},
                model = "burrito",
                coord_prop_tool = {
                    [1] = { -0.6, -0.26, -0.1, 0.0, 0.0, 0.0},
                    [2] = {-0.2, -0.26, -0.1, 0.0, 0.0, 0.0},
                    [3] = {0.3, -0.26, -0.1, 0.0, 0.0, 0.0},
                    [4] = {0.1, -0.26, -0.1, 0.0, 0.0, 0.0},
                }, 
            },

            skill = {
                use = true,
                difficultyLevels = { 'easy', 'easy', {areaSize = 60, speedMultiplier = 1.1}, 'easy' },
                controls = {'w', 'a', 's', 'd'},
                particles = "",
            },  

            Route = {
                
                [1] = {
                    {
                        coord = vec4(-295.6952, 2793.9434, 60.0529, 171.9103),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-294.2904, 2802.4199, 59.2081, 348.8968),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-289.5376, 2811.1511, 58.7114, 323.1609),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-283.6580, 2808.7327, 57.8748, 211.9474),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-280.5158, 2813.9846, 57.0669, 327.3136),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-302.8294, 2827.3503, 58.7603, 69.5926),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-312.4580, 2830.6521, 58.3137, 110.5849),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-318.4958, 2834.3528, 57.7444, 83.0167),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-324.4272, 2831.4814, 57.7476, 127.5205),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-332.7497, 2820.7844, 58.0439, 144.6041),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-335.0443, 2813.1846, 57.8771, 151.6850),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-338.9964, 2804.0222, 58.1333, 163.5430),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                }, 
                [2] = {
                    {
                        coord = vec4(782.3058, 2161.0227, 52.2955, 157.0999),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(788.0505, 2155.5178, 52.2775, 237.2154),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(796.1741, 2151.2104, 52.2776, 243.4845),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(809.8106, 2151.0198, 52.2776, 297.4421),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(812.9160, 2159.0059, 52.2793, 342.8495),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(813.5476, 2166.0295, 52.2789, 359.8399),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(814.4673, 2173.6711, 52.2867, 355.9552),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(807.6230, 2177.2383, 52.3425, 61.2640),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(786.7343, 2192.0173, 51.9281, 73.7963),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(780.6316, 2187.5652, 52.1667, 147.8946),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(769.4522, 2189.8721, 52.5956, 101.3541),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(767.4141, 2172.3030, 52.4965, 226.5331),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },  
                },
                [3] = {
                    {
                        coord = vec4(3316.8486, 5168.9819, 18.4173, 139.2290),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(3316.2571, 5164.7417, 18.4152, 163.3208),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(3313.2144, 5163.4805, 18.4154, 118.5970),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(3310.2544, 5161.7466, 18.4154, 123.6282),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(3305.7170, 5161.2324, 18.4153, 67.1541),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(3301.5200, 5164.3271, 18.4154, 52.4674),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(3294.1843, 5169.8726, 18.4154, 53.1107),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(3289.1306, 5173.7358, 18.4154, 54.1659),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(3292.6133, 5179.6328, 18.4156, 323.8251),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(3296.8213, 5185.4111, 18.4154, 327.9063),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(3319.2124, 5189.4302, 18.4152, 233.6921),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(3314.1353, 5193.2324, 18.4153, 261.8581),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                }      
            },

            Finish = {
                model = "s_m_m_cntrybar_01", 
                coord = vec4(1722.2836, 4734.7261, 41.1368, 283.1479), 
                Quantity = 10000, 
                paymentmethod = {
                    option = "cash", -- cash/bank/item
                    item_name = "" -- if you use <option = "item"> then put here the name of the item you will pay with.
                },
                exp = 50, 
                increase_per_level = 100
            },
        },
    },

    Clothes = {
        male = {
            tshirt_1 = 15, tshirt_2 = 0,
            torso_1 = 206, torso_2 = 0,
            decals_1 = 0, decals_2 = 0,
            arms = 11,
            pants_1 = 241, pants_2 = 1,
            shoes_1 = 142, shoes_2 = 0,
            chain_1 = -1, chain_2 = 0,
            helmet_1 = -1, helmet_2 = 0,
            ears_1 = -1, ears_2 = 0,
            bproof_1 = 0, bproof_2 = 0
        },
        female = {
            tshirt_1 = 146,  tshirt_2 = 0,
            torso_1 = 197,   torso_2 = 0,
            decals_1 = 0,   decals_2 = 0,
            arms = 9,
            pants_1 = 239,   pants_2 = 3,
            shoes_1 = 177,   shoes_2 = 1,
            chain_1 = -1,    chain_2 = 0,
            helmet_1 = -1,  helmet_2 = 0,
            bproof_1 = 0,  bproof_2 = 0,
        }
    }
}