return {
    JobInfo = {
        Name = "barn", 
        JobID = {"barn", 0},
        Img = "img/barn.jpg",
        ExperienceRequired = 500,
        info = "Help needed to clean the barn, remove the hay and we will pay you!",

        Tutorial = {
            [1] = "First you must know that your tool is in the trunk, approach and take it.",
            [2] = "Go to the areas marked in the barn and clean up the hay.",
            [3] = "When you're done, go here to get paid.",
        }            
    },

    JobConfig = {

        Tool = {
            prop = "prop_tool_shovel", 
            objcoord = {28422,0.02, 0.06, 0.50, 0.0, 0.0, 0.0}, 
            objcoord2 = {28422,0.0, -0.03, 0.55, 0.0, 0.0, 200.0},
            animation_action = {"amb@world_human_janitor@male@idle_a","idle_a",3000},
            animation_take = {"missfbi4prepp1","idle"},
            particles = ""
        },

        type = 1,

        deleteprop = true,

        {
            CreateGroup = vec4(-98.9555, 2807.1650, 52.1532, 238.0642),

            CreateGroupPed_model = "s_m_m_gentransport",

            Workclothes = vec4(-111.5672, 2799.4912, 52.1322, 185.6332),

            Vehicle = {
                coord = vec4(-108.1783, 2792.6877, 52.2985, 92.7366),
                spawnvehicle = vec4(-104.8817, 2795.7136, 53.2922, 280.4364),
                doors = {5},
                model = "bison",
                coord_prop_tool = {
                    [1] = {-0.41, -2.2, 0.34, 0.90, -210.0, 90.0},
                    [2] = {-0.41, -1.7, 0.34, 0.90, -210.0, 90.0},
                    [3] = {0.50, -1.7, 0.34, 0.90, -160.0, 90.0},
                    [4] = {0.50, -2.2, 0.34, 0.90, -160.0, 90.0},
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
                        coord = vec4(1475.3251, 1124.4849, 114.3343, 276.7286),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1443.1227, 1100.9800, 114.3296, 87.9916),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = true, name = "metalscrap", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1427.2291, 1098.3181, 114.4215, 91.5751),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1436.8262, 1055.1659, 114.5225, 191.2384),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1446.3965, 1042.3898, 114.5035, 219.8463),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = true, name = "metalscrap", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1462.6582, 1040.0734, 114.2498, 3.2212),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = true, name = "metalscrap", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1479.7286, 1083.3048, 114.3344, 348.2844),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1481.6313, 1107.1827, 114.3345, 266.7351),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1468.7914, 1134.5547, 114.3227, 260.5440),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1468.7937, 1137.8347, 114.3227, 355.6624),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1459.9473, 1137.8455, 114.3224, 267.5063),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(1447.2969, 1097.4226, 114.5762, 357.4095),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                },   
                [2] = {
                    {
                        coord = vec4(2371.2261, 5047.8276, 46.3973, 115.8406),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = true, name = "metalscrap", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2390.2996, 5034.2256, 46.0788, 235.9603),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = true, name = "metalscrap", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2409.7083, 5027.8735, 46.0865, 215.0448),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = true, name = "metalscrap", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2419.7410, 5026.8462, 45.9932, 239.6506),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = true, name = "metalscrap", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2390.1509, 5048.4292, 46.3822, 66.7696),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = true, name = "metalscrap", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2363.5178, 5059.8716, 46.5495, 135.2796),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2348.6721, 5067.6035, 46.1309, 122.7623),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2345.1555, 5068.1553, 45.8864, 118.6240),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2404.8840, 5060.1475, 46.6952, 322.9990),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2381.4834, 5029.1758, 45.9770, 44.4573),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2403.1982, 5015.5229, 46.1076, 224.5992),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2381.3523, 5049.9819, 46.4417, 53.7880),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                }, 
                [3] = {
                    {
                        coord = vec4(2162.9229, 5003.7349, 41.4151, 312.7887),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = true, name = "metalscrap", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2162.5283, 4989.1680, 41.2987, 222.3783),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = true, name = "metalscrap", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2138.9741, 5006.6118, 41.2223, 42.3375),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = true, name = "metalscrap", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2147.4927, 4974.3481, 41.3347, 223.2810),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = true, name = "metalscrap", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2125.3103, 4993.2300, 41.3651, 38.3491),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = true, name = "metalscrap", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2117.2681, 4998.6025, 41.2225, 140.6093),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2137.9983, 5023.4678, 41.7280, 302.0257),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2168.2341, 4982.8462, 41.3716, 44.7720),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2182.0833, 4950.4043, 41.4086, 223.8736),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2153.9666, 4968.6309, 41.4531, 46.1661),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2172.7231, 4943.8057, 41.3899, 316.9552),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },
                    
                    {
                        coord = vec4(2163.6340, 4951.0928, 41.4513, 130.6518),
                        propname = "prop_offroad_bale01",
                        GetItem = { use = false, name = "barn", quantity = 1},
                    },   
                }   
            },

            Finish = {
                model = "a_m_m_indian_01", 
                coord = vec4(-118.2085, 2817.0056, 51.9943, 189.6898), 
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