return {
    JobInfo = {
        Name = "painter city", 
        JobID = {"painter_city", 0},
        Img = "img/paintercity.jpg",
        ExperienceRequired = 500,
        info = "Take care of painting houses and buildings for customers and as soon as you finish, come back here to get paid.",

        Tutorial = {
            [1] = "First you must know that your paint roller is in the trunk, approach and take it.",
            [2] = "Go to the buildings marked on the map and approach the walls to paint them.",
            [3] = "When you're done, go and get paid here.",
        }
    },

    JobConfig = {

        Tool = {
            prop = "prop_paint_roller", 
            objcoord = {18905, 0.30, 0.1, 0.0, 0.0, 170.0, -20.0}, 
            objcoord2 = {18905,0.30, 0.1, 0.0, 0.0, 170.0, -20.0},
            animation_action = {"car_2_mcs_1-0", "s_m_y_airworker-0",3000},  
            animation_take = nil,
            particles = ""
        },

        type = 1,

        deleteprop = false,

        {
            CreateGroup = vec4(890.3691, -1028.1973, 34.1136, 3.8060),

            CreateGroupPed_model = "s_m_m_gentransport",

            Workclothes = vec4(888.5004, -1014.2785, 34.1018, 47.5164),

            Vehicle = {
                coord = vec4(900.8406, -1012.8901, 34.1042, 6.7479),
                spawnvehicle = vec4(901.0092, -1032.2794, 34.9878, 358.5442),
                model = "paradise",
                doors = {2,3},
                coord_prop_tool = {
                    [1] = {-0.24, 0.0, -0.40, 0.0, 0.0, 0.0},
                    [2] = {0.0, 0.0, -0.40, 0.0, 0.0, 0.0},
                    [3] = {0.24, 0.0, -0.40, 0.0, 0.0, 0.0},
                    [4] = {0.44, 0.0, -0.40, 0.0, 0.0, 0.0},
                }, 
            },

            skill = {
                use = true,
                difficultyLevels = { 'easy', 'easy', {areaSize = 60, speedMultiplier = 1.1}, 'easy' },
                controls = {'w', 'a', 's', 'd'},
                particles = "liquid_splash_paint",
            },

            Route = {
                
                [1] = {   
                    
                    {
                        coord = vec4(-1282.2997, 659.7180, 144.8532, 106.3012),                                  
                        propname = "prop_cs_diaphram",                 
                        GetItem = { use = true, name = "rubber", quantity = 1},
                    },
                    {
                        coord = vec4(-1284.6769, 667.9263, 144.8434, 111.1601),                                             
                        propname = "prop_cs_diaphram",                   
                        GetItem = { use = true, name = "rubber", quantity = 1},
                    },
                    {
                        coord = vec4(-1288.6111, 679.0848, 142.6297, 22.0806),                                              
                        propname = "prop_cs_diaphram",                    
                        GetItem = { use = true, name = "rubber", quantity = 1},
                    },
                    {
                        coord = vec4(-1292.5526, 678.0309, 140.2920, 13.7920),                                          
                        propname = "prop_cs_diaphram",                    
                        GetItem = {use = false, name = "painter", quantity = 1}, 
                    },
                    {
                        coord = vec4(-1297.6880, 676.6600, 138.3264, 9.8041),                                    
                        propname = "prop_cs_diaphram",                   
                        GetItem = {use = false, name = "painter", quantity = 1},
                    },
                    {
                        coord = vec4(-1292.4476, 670.9053, 138.3046, 197.1631),                                       
                        propname = "prop_cs_diaphram",                    
                        GetItem = {use = false, name = "painter", quantity = 1},                       
                    },
                    {
                        coord = vec4(-1300.7056, 668.5339, 138.3097, 200.7300),                                        
                        propname = "prop_cs_diaphram",                   
                        GetItem = {use = false, name = "painter", quantity = 1},                                                
                    },
                    {
                        coord = vec4(-1307.4250, 662.4927, 138.4100, 291.1320),                                            
                        propname = "prop_cs_diaphram",                   
                        GetItem = {use = false, name = "painter", quantity = 1},                                                 
                    },
                    {
                        coord = vec4(-1307.4789, 657.2189, 138.4157, 288.8112),                                        
                        propname = "prop_cs_diaphram",                   
                        GetItem = {use = false, name = "painter", quantity = 1},                          
                    },
                    {
                        coord = vec4(-1305.7830, 649.1714, 138.4157, 289.9614),                                              
                        propname = "prop_cs_diaphram",                    
                        GetItem = {use = false, name = "painter", quantity = 1}, 
                    },
                    {
                        coord = vec4(-1317.3206, 645.2738, 138.4157, 86.3218),                                              
                        propname = "prop_cs_diaphram",                    
                        GetItem = {use = false, name = "painter", quantity = 1}, 
                    },
                    {
                        coord = vec4(-1297.9584, 647.3885, 139.7410, 20.6399),                                              
                        propname = "prop_cs_diaphram",                    
                        GetItem = {use = false, name = "painter", quantity = 1}, 
                    },
                },

                [2] = {   
                    
                    {
                        coord = vec4(-842.0051, 456.6678, 88.0379, 276.0667),                                  
                        propname = "prop_cs_diaphram",                 
                        GetItem = { use = true, name = "rubber", quantity = 1},
                    },
                    {
                        coord = vec4(-842.9521, 464.6946, 88.0324, 277.0003),                                             
                        propname = "prop_cs_diaphram",                   
                        GetItem = { use = true, name = "rubber", quantity = 1},
                    },
                    {
                        coord = vec4(-842.9673, 469.3719, 87.5965, 283.4868),                                              
                        propname = "prop_cs_diaphram",                    
                        GetItem = { use = true, name = "rubber", quantity = 1},
                    },
                    {
                        coord = vec4(-844.8730, 472.0752, 87.5918, 101.0331),                                          
                        propname = "prop_cs_diaphram",                    
                        GetItem = {use = false, name = "painter", quantity = 1}, 
                    },
                    {
                        coord = vec4(-841.5172, 470.9640, 87.5918, 190.9501),                                    
                        propname = "prop_cs_diaphram",                   
                        GetItem = {use = false, name = "painter", quantity = 1},
                    },
                    {
                        coord = vec4(-827.4647, 456.8412, 90.7721, 98.4195),                                       
                        propname = "prop_cs_diaphram",                    
                        GetItem = {use = false, name = "painter", quantity = 1},                       
                    },
                    {
                        coord = vec4(-842.2645, 479.7354, 87.5928, 195.9334),                                        
                        propname = "prop_cs_diaphram",                   
                        GetItem = {use = false, name = "painter", quantity = 1},                                                
                    },
                    {
                        coord = vec4(-838.2349, 483.7931, 88.1678, 187.7120),                                            
                        propname = "prop_cs_diaphram",                   
                        GetItem = {use = false, name = "painter", quantity = 1},                                                 
                    },
                    {
                        coord = vec4(-830.3674, 482.1469, 90.1656, 92.6862),                                        
                        propname = "prop_cs_diaphram",                   
                        GetItem = {use = false, name = "painter", quantity = 1},                          
                    },
                    {
                        coord = vec4(-820.5329, 477.3642, 90.1653, 191.9463),                                              
                        propname = "prop_cs_diaphram",                    
                        GetItem = {use = false, name = "painter", quantity = 1}, 
                    },
                    {
                        coord = vec4(-810.5246, 475.7134, 90.1651, 147.7449),                                  
                        propname = "prop_cs_diaphram",                 
                        GetItem = {use = false, name = "painter", quantity = 1},
                    },
                    {
                        coord = vec4(-811.4433, 467.1311, 90.1647, 74.6072),                                             
                        propname = "prop_cs_diaphram",                   
                        GetItem = {use = false, name = "painter", quantity = 1},
                    },
                    {
                        coord = vec4(-829.2883, 452.4089, 88.8096, 16.5263),                                             
                        propname = "prop_cs_diaphram",                   
                        GetItem = {use = false, name = "painter", quantity = 1},
                    },
                },

                [3] = {   
                    
                    {
                        coord = vec4(-1531.0094, 26.4692, 56.8207, 169.9700),                                  
                        propname = "prop_cs_diaphram",                 
                        GetItem = { use = true, name = "rubber", quantity = 1},
                    },
                    {
                        coord = vec4(-1535.9648, 27.3411, 56.8207, 169.3394),                                             
                        propname = "prop_cs_diaphram",                   
                        GetItem = { use = true, name = "rubber", quantity = 1},
                    },
                    {
                        coord = vec4(-1538.7748, 22.8624, 56.9560, 266.9203),                                  
                        propname = "prop_cs_diaphram",                 
                        GetItem = { use = true, name = "rubber", quantity = 1},
                    },
                    {
                        coord = vec4(-1540.9456, 10.2789, 56.0418, 260.0349),                                             
                        propname = "prop_cs_diaphram",                   
                        GetItem = {use = false, name = "painter", quantity = 1},
                    },
                    {
                        coord = vec4(-1532.7349, 5.6645, 57.2183, 85.4158),                                              
                        propname = "prop_cs_diaphram",                    
                        GetItem = {use = false, name = "painter", quantity = 1},
                    },
                    {
                        coord = vec4(-1523.5802, 3.6578, 57.2182, 263.4791),                                          
                        propname = "prop_cs_diaphram",                    
                        GetItem = {use = false, name = "painter", quantity = 1}, 
                    },
                    {
                        coord = vec4(-1507.5090, 7.1466, 56.0660, 355.2200),                                    
                        propname = "prop_cs_diaphram",                   
                        GetItem = {use = false, name = "painter", quantity = 1},
                    },
                    {
                        coord = vec4(-1501.6195, 9.9988, 56.6952, 83.6341),                                       
                        propname = "prop_cs_diaphram",                    
                        GetItem = {use = false, name = "painter", quantity = 1},                       
                    },
                    {
                        coord = vec4(-1502.2290, -0.6929, 56.4919, 216.0767),                                        
                        propname = "prop_cs_diaphram",                   
                        GetItem = {use = false, name = "painter", quantity = 1},                                                
                    },
                    {
                        coord = vec4(-1508.8154, -4.8895, 56.4724, 215.4346),                                            
                        propname = "prop_cs_diaphram",                   
                        GetItem = {use = false, name = "painter", quantity = 1},                                                 
                    },
                    {
                        coord = vec4(-1522.9088, -14.5895, 57.3449, 219.1924),                                        
                        propname = "prop_cs_diaphram",                   
                        GetItem = {use = false, name = "painter", quantity = 1},                          
                    },
                    {
                        coord = vec4(-1499.2179, 0.1389, 56.2607, 29.4192),                                              
                        propname = "prop_cs_diaphram",                    
                        GetItem = {use = false, name = "painter", quantity = 1}, 
                    },
                    {
                        coord = vec4(-1510.4775, -6.9596, 56.7921, 35.7655),                                              
                        propname = "prop_cs_diaphram",                    
                        GetItem = {use = false, name = "painter", quantity = 1}, 
                    },
                    {
                        coord = vec4(-1526.1554, -18.0285, 57.4147, 38.2232),                                              
                        propname = "prop_cs_diaphram",                    
                        GetItem = {use = false, name = "painter", quantity = 1}, 
                    },
                },

            },

            Finish = {
                model = "s_m_m_ccrew_01", 
                coord = vec4(889.0426, -1046.6737, 34.1709, 278.6181), 
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
