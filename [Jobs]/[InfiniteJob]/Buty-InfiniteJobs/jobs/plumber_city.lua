return {
    JobInfo = {
        Name = "plumber city", 
        JobID = {"plumber_city", 0},
        Img = "img/plumber.jpg",
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
            CreateGroup = vec4(807.0057, -809.9273, 25.2029, 92.6404),

            CreateGroupPed_model = "s_m_m_gentransport",

            Workclothes = vec4(806.5346, -815.2767, 25.2145, 263.6768),

            Vehicle = {
                coord = vec4(795.9973, -808.2040, 25.1872, 96.2892),
                spawnvehicle = vec4(800.6718, -809.0526, 26.1811, 180.7900),
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
                        coord = vec4(-290.7464, -1356.5063, 31.3116, 90.9419),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = true, name = "spring", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-290.8261, -1398.2926, 31.3060, 87.3397),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = true, name = "spring", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-242.3125, -1446.1392, 31.4425, 151.0611),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = true, name = "spring", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-190.3764, -1489.1803, 32.0145, 134.7196),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-115.6888, -1508.8844, 33.8022, 342.4026),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-71.0429, -1480.7452, 32.1211, 219.9751),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-15.7762, -1468.6583, 30.5955, 178.7802),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(3.4223, -1455.3000, 30.3970, 348.1012),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(124.4247, -1545.2853, 29.3401, 299.8591),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                            
                    {
                        coord = vec4(78.0220, -1526.6470, 29.3418, 132.0678),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(92.7198, -1490.0385, 29.2944, 224.1456),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(81.7016, -1458.1846, 29.2862, 49.4586),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                },           
                [2] = {
                    {
                        coord = vec4(-850.2252, -2272.3057, 7.7668, 141.9317),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = true, name = "spring", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-889.5668, -2232.7827, 5.8297, 134.5206),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = true, name = "spring", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-931.7272, -2191.0154, 8.9025, 138.2464),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = true, name = "spring", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-863.6251, -2258.4519, 6.8926, 138.1606),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-750.7811, -2371.5593, 14.8244, 147.7045),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-758.2676, -2456.9795, 14.4015, 246.3138),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-774.8276, -2488.4243, 14.1057, 244.2748),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-820.2423, -2515.8103, 13.7566, 71.8641),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-817.4408, -2567.0559, 13.7566, 246.2534),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-864.1523, -2595.7124, 13.7566, 63.3242),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-882.0468, -2627.3472, 13.7566, 69.1542),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(-913.9175, -2727.0232, 13.7599, 225.8109),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                },
                [3] = {
                    {
                        coord = vec4(126.4602, -1546.5808, 29.3374, 324.9608),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = true, name = "spring", quantity = 1},
                    },
                    
                    {
                        coord = vec4(86.5252, -1537.4957, 29.3418, 140.8108),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = true, name = "spring", quantity = 1},
                    },
                    
                    {
                        coord = vec4(81.4091, -1458.0718, 29.2911, 56.2967),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = true, name = "spring", quantity = 1},
                    },
                    
                    {
                        coord = vec4(120.2361, -1456.8823, 29.2944, 227.9316),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(188.2720, -1396.3314, 29.2916, 320.3415),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(260.0658, -1411.7119, 29.4515, 55.7835),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(261.9393, -1484.2126, 29.2917, 131.8936),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(276.9147, -1496.8669, 29.2916, 146.8070),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(305.8143, -1536.3245, 29.2880, 196.5841),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(192.1228, -1574.4038, 29.2916, 25.0779),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(132.4828, -1636.0475, 29.2916, 207.3849),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                    
                    {
                        coord = vec4(93.0357, -1658.7686, 29.2946, 217.4613),
                        propname = "prop_fire_hydrant_1",
                        GetItem = { use = false, name = "plumber", quantity = 1},
                    },
                },
                
            },

            Finish = {
                model = "a_m_m_indian_01", 
                coord = vec4(796.8583, -786.7943, 25.2995, 102.0856), 
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