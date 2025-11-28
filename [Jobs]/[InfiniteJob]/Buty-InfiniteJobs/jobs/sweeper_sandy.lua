return {
    JobInfo = {
        Name = "sweeper sandy", 
        JobID = {"sweeper_sandy", 0},
        Img = "img/sweepersandy.jpg",
        ExperienceRequired = 500,
        info = "Help needed to clear sandy streets, sweep marked areas and we'll pay you!",

        Tutorial = {
            [1] = "First you must know that your tool is in the trunk, approach and take it.",
            [2] = "Go to the areas marked on the map and sweep them clean.",
            [3] = "When you're done, go here to get paid.",
        }

    },

    JobConfig = {

        Tool = {
            prop = "prop_tool_broom", 
            objcoord = {28422,0.02, 0.08, 0.20, 0.0, 0.0, 0.0}, 
            objcoord2 = {28422,0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
            animation_action = {"amb@world_human_janitor@male@idle_a","idle_a",8000},
            animation_take = {"missfbi4prepp1","idle"},
            particles = ""
        },

        type = 1,

        deleteprop = true,

        {
            CreateGroup = vec4(1704.6254, 3779.5137, 33.7558, 200.8623),

            CreateGroupPed_model = "s_m_m_gentransport",

            Workclothes = vec4(1693.6075, 3778.6870, 33.7743, 303.8614), 

            Vehicle = {
                coord = vec4(1690.6886, 3769.6787, 33.6797, 136.4565),
                spawnvehicle = vec4(1703.9270, 3764.3599, 33.8877, 315.6437),
                doors = {5},
                model = "bison",
                coord_prop_tool = {
                    [1] = {-0.78, -2.2, 0.94, 0.90, -210.0, 90.0},
                    [2] = {-0.78, -1.7, 0.94, 0.90, -210.0, 90.0},
                    [3] = {0.78, -1.7, 0.97, 0.90, -160.0, 90.0},
                    [4] = {0.78, -2.2, 0.97, 0.90, -160.0, 90.0},
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
                        coord = vec4(1790.8378, 3631.5757, 34.3336, 264.8159),
                        propname = "prop_rub_litter_03",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },   
                    {
                        coord = vec4(1743.0537, 3592.3535, 35.0833, 119.8868),
                        propname = "prop_rub_litter_03",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },   
                    {
                        coord = vec4(1664.8304, 3552.8608, 35.4386, 230.8627),
                        propname = "prop_big_shit_02",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },     
                    {
                        coord = vec4(1690.1151, 3532.5859, 35.8853, 258.9909),
                        propname = "prop_rub_litter_03",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },     
                    {
                        coord = vec4(1934.7629, 3715.2222, 32.3684, 300.8826),
                        propname = "prop_rub_litter_07",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },     
                    {
                        coord = vec4(1959.3990, 3715.6702, 32.2052, 29.3449),
                        propname = "prop_big_shit_02",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },     
                    {
                        coord = vec4(1980.4852, 3742.8184, 32.3462, 359.2777),
                        propname = "prop_rub_litter_07",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },     
                    {
                        coord = vec4(2036.3208, 3777.1377, 32.2957, 321.9462),
                        propname = "prop_rub_litter_03",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },     
                    {
                        coord = vec4(2003.4531, 3805.9590, 32.2420, 87.5981),
                        propname = "prop_rub_litter_07",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },     
                    {
                        coord = vec4(1933.0056, 3746.5354, 32.3043, 298.0360),
                        propname = "prop_rub_litter_01",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },    
                    {
                        coord = vec4(1800.9600, 3670.5896, 34.1739, 206.2677),
                        propname = "prop_big_shit_02",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },   
                    {
                        coord = vec4(1698.5879, 3559.1575, 35.5781, 216.9669),
                        propname = "prop_rub_litter_07",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                }, 
                
                [2] = {
                    {
                        coord = vec4(1639.4528, 3771.3113, 34.8423, 311.2644),
                        propname = "prop_rub_litter_03",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1694.9216, 3838.3586, 34.8701, 129.8168),
                        propname = "prop_big_shit_02",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1766.2906, 3926.5667, 34.7625, 277.6042),
                        propname = "prop_rub_litter_07",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1862.6904, 3887.6819, 32.9875, 155.4879),
                        propname = "prop_rub_litter_01",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1930.9746, 3860.2417, 32.3689, 272.5313),
                        propname = "prop_big_shit_02",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2018.9865, 3827.8447, 32.6917, 267.4562),
                        propname = "prop_rub_litter_07",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2006.7802, 3757.6890, 32.1809, 149.3763),
                        propname = "prop_rub_litter_01",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1956.9745, 3715.3882, 32.3086, 123.8548),
                        propname = "prop_rub_litter_03",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1853.4573, 3718.5356, 33.0654, 120.2730),
                        propname = "prop_big_shit_02",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1769.4838, 3701.5020, 34.1430, 73.0941),
                        propname = "prop_big_shit_02",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1588.6005, 3653.6724, 34.3818, 43.6688),
                        propname = "prop_big_shit_02",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1515.9852, 3745.5144, 34.4341, 283.7019),
                        propname = "prop_rub_litter_01",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                },

                [3] = {
                    {
                        coord = vec4(1731.7244, 3965.9089, 31.7463, 121.7653),
                        propname = "prop_rub_litter_03",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1654.3857, 3902.6370, 31.3589, 108.0951),
                        propname = "prop_big_shit_02",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1527.7219, 3909.0725, 30.9508, 254.4133),
                        propname = "prop_rub_litter_01",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1588.7083, 3851.1760, 31.1856, 135.5693),
                        propname = "prop_rub_litter_03",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1480.5148, 3779.7192, 31.7538, 116.7019),
                        propname = "prop_rub_litter_07",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1429.3771, 3820.6069, 31.3332, 136.5900),
                        propname = "prop_rub_litter_01",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1342.1409, 3719.8796, 31.5963, 137.4263),
                        propname = "prop_big_shit_02",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1204.7288, 3659.6196, 31.3551, 98.2796),
                        propname = "prop_rub_litter_03",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1009.2679, 3656.2451, 31.4232, 77.7128),
                        propname = "prop_rub_litter_07",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(951.3431, 3679.3035, 31.1316, 34.5336),
                        propname = "prop_rub_litter_01",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(827.2385, 3673.4453, 31.6818, 136.1414),
                        propname = "prop_rub_litter_03",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                    
                    {
                        coord = vec4(734.1187, 3647.4402, 31.5610, 328.3261),
                        propname = "prop_big_shit_02",
                        GetItem = { use = false, name = "sweeper", quantity = 1},
                    },
                }
            },

            Finish = {
                model = "a_m_m_indian_01", 
                coord = vec4(1368.0311, 3613.1226, 34.0188, 290.8116), 
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