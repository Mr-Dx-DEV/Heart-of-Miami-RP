return {
    JobInfo = {
        Name = "gardener city", 
        JobID = {"gardener_city", 0},
        Img = "img/gardenercity.jpg",
        ExperienceRequired = 500,
        info = "Help needed cleaning the city garden, mowing the grass and we'll pay you!",

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
            CreateGroup = vec4(-1753.2039, -724.2020, 9.4052, 142.5494),

            CreateGroupPed_model = "cs_omega",

            Workclothes = vec4(-1747.3628, -726.1576, 9.4234, 44.8436),

            Vehicle = {
                coord = vec4(-1728.5122, -713.1675, 9.1175, 325.0412),
                spawnvehicle = vec4(-1732.3912, -722.1490, 10.3381, 253.9162),
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
                        coord = vec4(-1899.8516, 219.1252, 84.2944, 11.3411),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-1907.0699, 214.0363, 84.4713, 24.6204),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-1884.6643, 193.5022, 83.8522, 202.4646),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-1871.9962, 178.9313, 83.5989, 213.7365),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-1855.0537, 181.4440, 83.4769, 301.4704),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-1935.2023, 190.0641, 84.6292, 89.9626),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-1931.3705, 191.9652, 84.5827, 25.9791),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-1945.3912, 194.4730, 86.2955, 156.9881),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-1939.1249, 199.2025, 85.5980, 227.8750),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-1948.0763, 213.4554, 86.1211, 302.6478),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-1963.2484, 221.7159, 86.6948, 190.4724),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-1954.2424, 232.6933, 85.6138, 296.1490),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                }, 
                [2] = {
                    {
                        coord = vec4(1386.2991, -590.7735, 74.4707, 221.0031),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1395.3392, -591.2780, 74.2439, 101.9334),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1404.4586, -607.1745, 74.4863, 178.0848),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1384.2765, -565.6725, 74.4337, 14.6881),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1383.6508, -559.9418, 74.3879, 15.0156),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1387.6548, -573.3370, 74.5387, 299.5842),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1342.8672, -592.8061, 74.4590, 135.0107),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1339.6949, -591.4509, 74.3418, 163.0389),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1354.8644, -627.9151, 74.4205, 199.0419),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1328.9340, -585.2980, 73.4920, 140.4338),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1333.5547, -582.3271, 73.8226, 316.0820),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1320.5312, -579.9986, 73.4508, 132.1152),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },  
                },
                [3] = {
                    {
                        coord = vec4(-807.1607, -911.7874, 18.6279, 302.0620),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-775.2598, -928.5144, 18.4165, 35.4272),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-770.3914, -930.3947, 18.1525, 328.9702),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-781.2579, -957.2205, 15.9373, 158.4389),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-837.8011, -899.9691, 17.7907, 300.5827),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-838.0744, -865.2717, 19.7905, 318.8965),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-839.0405, -854.3622, 19.5003, 249.1606),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-826.3567, -855.9531, 19.9613, 178.9868),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-822.3044, -856.6589, 20.2538, 235.8323),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-818.5102, -845.0892, 20.3905, 39.6415),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-801.3861, -857.7013, 21.2910, 209.5622),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-788.3705, -858.2803, 21.7056, 290.5873),
                        propname = "prop_veg_crop_04_leaf",
                        GetItem = { use = false, name = "gardener", quantity = 1},
                    },
                }      
            },

            Finish = {
                model = "s_m_m_cntrybar_01", 
                coord = vec4(-1722.3198, -736.2484, 9.2014, 48.6792), 
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