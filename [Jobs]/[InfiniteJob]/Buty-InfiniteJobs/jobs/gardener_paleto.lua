return {
    JobInfo = {
        Name = "gardener paleto", 
        JobID = {"gardener_paleto", 0},
        Img = "img/gardenerpaleto.jpg",
        ExperienceRequired = 500,
        info = "Help needed cleaning the paleto garden, mowing the grass and we'll pay you!",

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
            CreateGroup = vec4(-29.8310, 6458.2349, 30.4543, 217.9739),

            CreateGroupPed_model = "cs_omega",

            Workclothes = vec4(-34.5761, 6454.2578, 30.4757, 45.6276),

            Vehicle = {
                coord = vec4(-28.6253, 6459.2943, 30.4483, 46.4717),
                spawnvehicle = vec4(-24.4889, 6459.6812, 31.2470, 46.2030),
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
                        coord = vec4(156.4664, 6549.1973, 31.8592, 74.1912),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(146.2778, 6554.1177, 31.7231, 50.3584),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(140.0660, 6557.7954, 31.6621, 64.2881),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(132.7166, 6565.7461, 31.7368, 35.4327),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(124.2126, 6572.7202, 31.6441, 50.0639),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(116.0199, 6582.8335, 31.7380, 30.1399),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(103.8471, 6591.9932, 31.5530, 54.5862),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(89.6524, 6607.7959, 31.4752, 43.1666),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(74.2467, 6622.3330, 31.6384, 222.0620),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(49.6044, 6612.2173, 31.9918, 188.9720),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(40.5782, 6621.0093, 31.9927, 292.8831),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(6.4365, 6630.2974, 31.3368, 197.9769),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                }, 

                [2] = {
                    {
                        coord = vec4(36.4490, 6613.9834, 32.4619, 27.6411),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(27.0372, 6609.0981, 32.4705, 126.2649),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(16.7615, 6597.0596, 32.4689, 210.4459),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(22.5870, 6592.1851, 32.4652, 236.8669),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(27.7114, 6584.6206, 32.4019, 209.4184),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(37.0997, 6590.4478, 32.2547, 330.4452),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(39.2913, 6597.9053, 32.4299, 337.6054),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(11.9092, 6570.1343, 32.7252, 124.5632),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-0.8259, 6561.6001, 32.7301, 68.2226),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-9.8972, 6572.4175, 32.7392, 58.6380),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-4.3013, 6581.7080, 32.7343, 226.6004),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(3.8062, 6585.3281, 32.7162, 137.9505),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                }, 
                
                [3] = {
                    {
                        coord = vec4(1646.7633, 6385.4712, 29.1751, 255.1888),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1662.1610, 6380.7793, 29.8610, 253.1348),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1680.6827, 6375.5376, 30.5792, 254.2027),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1698.0374, 6368.7090, 32.4432, 281.6916),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1711.9331, 6368.9087, 32.9320, 90.8293),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1720.8191, 6362.9438, 33.6499, 246.5035),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1733.0192, 6364.0503, 34.5575, 213.2697),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1745.7172, 6361.2437, 35.6694, 244.8146),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1758.1107, 6353.8662, 35.9023, 251.0980),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1776.2150, 6355.0596, 36.7616, 264.5463),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1793.8391, 6353.0732, 37.4937, 301.3546),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1807.6182, 6354.4243, 38.8301, 153.8610),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                },      
            },

            Finish = {
                model = "s_m_m_cntrybar_01", 
                coord = vec4(-44.2007, 6447.8247, 30.4785, 138.7703), 
                Quantity = 6000, 
                paymentmethod = {
                    option = "cash", -- cash/bank/item
                    item_name = "" -- if you use <option = "item"> then put here the name of the item you will pay with.
                },
                exp = 50, 
                increase_per_level = 10
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