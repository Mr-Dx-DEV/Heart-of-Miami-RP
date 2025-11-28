return {
    JobInfo = {
        Name = "road maintenance", 
        JobID = {"road_maintenance", 0},
        Img = "img/roadmaintenance.jpg",
        ExperienceRequired = 500,
        info = "Be sure to check the condition of the roads and road signs, if you do it right you will get paid for it.",

        Tutorial = {
            [1] = "First you must know that your tool is in the trunk, approach and take it.",
            [2] = "Go to the road indicated on the map and repair the signs.",
            [3] = "When you're done, go and get paid here.",
        }
    },

    JobConfig = {

        Tool = {
            prop = "prop_tool_drill", 
            objcoord = {28422, 0.08, 0.07, 0.0, -120.0, 170.0, -10.0}, 
            objcoord2 = {28422,0.04, 0.03, 0.0, -90.0, 170.0, -10.0},
            animation_action = {"weapons@first_person@aim_lt@generic@pistol@shared@core", "fire_high",3000},  
            animation_take = nil,
            particles = ""
        },

        type = 1,

        deleteprop = true,

        {
            CreateGroup = vec4(941.35, -2219.83, 30.49, 186.35),

            CreateGroupPed_model = "s_m_y_construct_02",

            Workclothes = vec4(966.929, -2250.125, 30.555, 354.725),

            Vehicle = {
                coord = vec4(955.91, -2225.66, 30.45, 82.04),
                spawnvehicle = vec4(949.01, -2230.87, 30.48, 87.42),
                model = "boxville",
                doors = {2,3},
                coord_prop_tool = {
                    [1] = {-0.20, -0.3, -0.10, 0.90, 0.0, 90.0},
                    [2] = {0.20, -0.3, -0.10, 0.90, 0.0, 90.0},
                    [3] = {-0.20, -0.8, -0.10, 0.90, 0.0, 90.0},
                    [4] = {0.20, -0.8, -0.10, 0.90, 0.0, 90.0},
                }, 
            },

            skill = {
                use = true,
                difficultyLevels = { 'easy', 'easy', {areaSize = 60, speedMultiplier = 1.1}, 'easy' },
                controls = {'w', 'a', 's', 'd'},
                particles = "bul_stungun_metal",
            },

            Route = {
                
                [1] = {   
                    
                    {
                        coord = vec4(824.1779, -326.7037, 56.0518, 178.1203),                                  
                        propname = "prop_sign_road_01a",                
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(832.3615, -322.8547, 57.3702, 7.8419),                                  
                        propname = "prop_sign_road_03b",               
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(749.3163, -330.0708, 48.4632, 52.0418),                                  
                        propname = "stt_prop_sign_circuit_12",              
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(733.8346, -289.2824, 58.0567, 300.5325),                                  
                        propname = "stt_prop_sign_circuit_12",               
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(789.3285, -316.1971, 59.8152, 246.9776),                                  
                        propname = "stt_prop_sign_circuit_12",                
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(829.1532, -208.4178, 72.7994, 150.4841),                                  
                        propname = "prop_sign_road_03s",             
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(866.9006, -232.4593, 69.9709, 150.1997),                                  
                        propname = "prop_sign_road_03s",                
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(907.3301, -258.7815, 69.1244, 150.4281),                                  
                        propname = "prop_sign_road_03s",               
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(929.1828, -274.8684, 67.5221, 150.2520),                                  
                        propname = "prop_sign_road_03s",                    
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(758.2996, -144.4906, 74.4241, 331.8108),                                  
                        propname = "prop_sign_road_04i",             
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(785.4303, -72.4398, 80.4611, 151.4325),                                  
                        propname = "prop_sign_road_04i",             
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                },

                [2] = {   
                    
                    {
                        coord = vec4(61.1628, 1046.8484, 218.3450, 344.1012),                                  
                        propname = "prop_sign_road_05n",         
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(39.3781, 1050.0533, 218.7008, 117.2857),                                  
                        propname = "prop_sign_road_01a",      
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(-191.5253, 1295.3291, 303.8595, 223.1044),                                  
                        propname = "prop_sign_road_05n",              
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(-192.8166, 1308.1478, 303.8558, 41.5647),                                  
                        propname = "prop_sign_road_01a",                 
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(59.2662, 1060.8252, 220.2944, 355.1348),                                  
                        propname = "prop_sign_road_06a",         
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(-178.8483, 1282.2642, 303.0208, 222.3898),                                  
                        propname = "prop_sign_road_06a",                    
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(17.5766, 2060.4626, 161.1875, 195.9524),                                  
                        propname = "prop_sign_road_01a",            
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(87.0412, 2079.8931, 147.8453, 349.6189),                                  
                        propname = "prop_sign_road_01a",                           
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(-82.3002, 2013.3262, 180.2561, 138.5058),                                  
                        propname = "prop_sign_road_02a",           
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(107.9319, 2302.4448, 99.5089, 111.2826),                                  
                        propname = "prop_sign_road_03e",              
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(80.8053, 2287.0066, 102.5909, 267.2695),                                  
                        propname = "prop_sign_road_03e",                  
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(114.7048, 2282.2288, 97.2188, 68.3544),                                  
                        propname = "prop_sign_road_03e",            
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                },

                [3] = {   
                    
                    {
                        coord = vec4(-1466.1195, -778.6740, 23.8759, 141.2663),                                  
                        propname = "prop_sign_road_06d",              
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(-1595.1300, -953.8218, 13.0174, 316.9668),                                  
                        propname = "prop_sign_road_06d",               
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(-1608.2137, -1045.5726, 13.0909, 139.4492),                                  
                        propname = "prop_sign_road_04i",                     
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(-1643.6142, -991.6114, 13.0174, 140.2987),                                  
                        propname = "prop_sign_road_04i",              
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(-1633.4474, -1001.4185, 13.0174, 313.6209),                                  
                        propname = "prop_sign_road_01a",               
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(-1668.3741, -962.2459, 7.6968, 170.4000),                                  
                        propname = "prop_sign_road_04i",                
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(-1288.8192, -1288.9916, 3.3192, 19.9276),                                  
                        propname = "prop_sign_road_01a",               
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(-1072.7664, -1384.7906, 5.0801, 80.3730),                                  
                        propname = "prop_sign_road_01a",          
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(-982.6376, -1462.8311, 5.1398, 30.2597),                                  
                        propname = "prop_sign_road_02a",    
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                    {
                        coord = vec4(-1009.4533, -1433.7289, 5.0572, 282.9283),                                  
                        propname = "prop_sign_road_02a",                      
                        GetItem = {use = false, name = "road_maintenance", quantity = 1},
                    },
                },

            },

            Finish = {
                model = "csb_trafficwarden", 
                coord = vec4(929.3372, -2303.0618, 29.5096, 77.2825), 
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
