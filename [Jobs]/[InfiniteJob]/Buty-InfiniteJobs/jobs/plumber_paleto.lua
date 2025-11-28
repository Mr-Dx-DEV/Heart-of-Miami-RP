return {
    JobInfo = {
        Name = "plumber paleto", 
        JobID = {"plumber_paleto", 0},
        Img = "img/plumberpaleto.jpg",
        ExperienceRequired = 500,
        info = "Help needed to fix leaks, repair the pipes, and we will pay you!",

        Tutorial = {
            [1] = "First you must know that your tool is in the trunk, approach and take it.",
            [2] = "Go to the areas marked on the map and repair the leaking pipes.",
            [3] = "When you're done, go here to get paid.",
        }            
    },

    JobConfig = {

        Tool = {
            prop = "prop_tool_wrench", 
            objcoord = {57005,0.13, -0.06, -0.08, -50.0, -10.0, 0.0}, 
            objcoord2 = {57005,0.13, -0.06, -0.08, -50.0, -10.0, 0.0},
            animation_action = {"mini@repair", "fixing_a_ped",3000},       
            animation_take = nil,
            particles = ""
        },

        type = 1,

        deleteprop = false,

        {
            CreateGroup = vec4(-267.6998, 6141.5195, 30.5309, 141.7063),

            CreateGroupPed_model = "s_m_m_gentransport",

            Workclothes = vec4(-280.0360, 6153.3907, 30.5062, 317.6235),

            Vehicle = {
                coord = vec4(-272.0997, 6146.0652, 30.5222, 316.4257),
                spawnvehicle = vec4(-276.5033, 6146.7637, 31.3291, 224.0747),
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
                particles = "ent_sht_water_tower",
            }, 

            Route = {
                
                [1] = {   
                    
                    {
                        coord = vec4(74.3817, 6620.9360, 31.5218, 229.9612),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = true, name = "spring", quantity = 1},
                    },
                    
                    {
                        coord = vec4(98.8393, 6594.1318, 31.4799, 226.8653),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = true, name = "spring", quantity = 1},
                    },
                    
                    {
                        coord = vec4(147.8864, 6548.1816, 31.7508, 255.9127),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = true, name = "spring", quantity = 1},
                    },
                    
                    {
                        coord = vec4(188.0052, 6570.3135, 32.0654, 298.8869),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(215.2978, 6575.0552, 32.0138, 268.7689),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(120.9300, 6476.5806, 31.2923, 37.9261),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(66.7238, 6420.9170, 31.3371, 101.0870),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(45.5755, 6401.4731, 31.4093, 145.9717),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(58.5186, 6457.7783, 31.3231, 313.7677),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                            
                    {
                        coord = vec4(5.7845, 6406.0786, 31.2578, 312.0177),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-1.1322, 6354.6494, 31.3768, 129.5178),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-30.3253, 6303.1958, 31.3723, 309.7581),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                },           

                [2] = {   
                    
                    {
                        coord = vec4(-421.0837, 6203.6582, 31.5022, 0.9378),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = true, name = "spring", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-405.3132, 6226.2510, 31.2725, 354.7145),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = true, name = "spring", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-401.5830, 6261.9883, 30.1719, 347.3585),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = true, name = "spring", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-391.6955, 6299.6040, 29.5019, 82.3202),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-371.6009, 6291.6963, 29.4661, 215.8012),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-349.1593, 6307.8076, 29.9879, 300.0494),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-341.3452, 6339.1567, 30.0884, 344.0240),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-317.3593, 6337.2178, 30.3797, 304.5389),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-302.1575, 6375.3198, 30.4822, 128.0191),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                            
                    {
                        coord = vec4(-260.8311, 6380.9995, 30.7709, 292.8183),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-224.1419, 6422.6147, 31.3766, 15.1764),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-195.5834, 6430.0737, 31.4267, 113.5624),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                },  

                [3] = {   
                    
                    {
                        coord = vec4(-146.3747, 6503.7935, 29.5040, 321.1854),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = true, name = "spring", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-116.0719, 6561.2764, 29.4863, 137.6262),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = true, name = "spring", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-74.0313, 6597.2524, 29.5043, 324.9778),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = true, name = "spring", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-62.4913, 6585.2554, 29.5015, 129.3793),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-41.7164, 6622.8940, 30.1291, 24.1766),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(6.6292, 6631.4551, 31.3257, 291.9943),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(41.4831, 6650.6851, 31.5524, 69.6902),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(53.9283, 6603.5195, 31.6291, 345.2610),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2.0603, 6523.6162, 31.4942, 132.4943),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                            
                    {
                        coord = vec4(-28.3955, 6496.7026, 31.5120, 287.0285),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(11.0210, 6413.0347, 31.2618, 128.3646),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-113.9635, 6408.5991, 31.4034, 224.5422),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber_paleto", quantity = 1},
                    },
                },  
                
            },

            Finish = {
                model = "a_m_m_indian_01", 
                coord = vec4(-249.5294, 6158.4668, 30.4839, 343.0815), 
                Quantity = 10000, 
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