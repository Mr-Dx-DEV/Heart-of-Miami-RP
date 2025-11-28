return {
    JobInfo = {
        Name = "farmer", 
        JobID = {"farmer", 0},
        Img = "img/farmer.jpg",
        ExperienceRequired = 500,
        info = "Give us a hand on our farm, collecting fodder. You will be paid as soon as you finish.",

        Tutorial = {
            [1] = "First you must know that your tool is in the trunk, approach and take it.", 
            [2] = "Head towards the fodder fields marked on the map and harvest them.",
            [3] = "Then, unload the fodder bags from your trunk onto the conveyor belt.", 
            [4] = "When you're done, go here to get paid.",
        }             
    },

    JobConfig = {

        Tool = {
            prop = "prop_cs_trowel", 
            objcoord = {28422,0.08, 0.05, 0.0, 120.0, -10.0, -50.0}, 
            objcoordbelt = {11816, 0.1, 0.02, -0.24, 80.0, 200.0, 80.0},
            animation_action = {"amb@world_human_gardener_plant@female@base", "base_female",3000},
            animation_take = nil,
            particles = "ent_anim_snot_blow",
        },
     
        type = 2,

        {
            CreateGroup = vec4(1916.9713, 4936.0742, 47.5952, 337.4308),

            CreateGroupPed_model = "a_m_m_farmer_01",

            Workclothes = vec4(1912.2039, 4929.1460, 47.9546, 250.2965),

            Vehicle = {
                coord = vec4(1894.7905, 4916.4832, 47.8514, 334.6533),
                spawnvehicle = vec4(1901.1355, 4916.5962, 48.3174, 157.7289),
                model = "bison",
                doors = {5},
                coord_prop_tool = {
                    [1] = {-0.65, -0.83, 0.55, 140.0, 120.0, 120.0},
                    [2] = {-0.65, -1.31, 0.55,  140.0, 120.0, 120.0},
                    [3] = {0.6, -0.85, 0.6,  10.0, 100.0, -90.0},
                    [4] = {0.65, -1.35, 0.6,  10.0, 100.0, -90.0},
                },
                coord_prop_vehicle = {
                    [1] = {-0.18, -1.0, 0.45, 0.90, 0.0, 0.0},
                    [2] = {0.18, -1.0, 0.45, 0.90, 0.0, 0.0}, 
                    [3] = {-0.18, -1.4, 0.45, 0.90, 0.0, 0.0},
                    [4] = {0.18, -1.4, 0.45, 0.90, 0.0, 0.0},
                    [5] = {-0.18, -1.8, 0.45, 0.90, 0.0, 0.0}, 
                    [6] = {0.18, -1.8, 0.45, 0.90, 0.0, 0.0}, 
                    [7] = {-0.18, -1.0, 0.8, 0.90, 0.0, 0.0},
                    [8] = {0.18, -1.0, 0.8, 0.90, 0.0, 0.0}, 
                    [9] = {-0.18, -1.4, 0.8, 0.90, 0.0, 0.0}, 
                    [10] = {0.18, -1.4, 0.8, 0.90, 0.0, 0.0}, 
                    [11] = {-0.18, -1.8, 0.8, 0.90, 0.0, 0.0}, 
                    [12] = {0.18, -1.8, 0.8, 0.90, 0.0, 0.0}, 
                    [13] = {-0.18, -2.2, 0.45, 0.90, 0.0, 0.0}, 
                    [14] = {0.18, -2.2, 0.45, 0.90, 0.0, 0.0}, 
                    [15] = {-0.18, -2.2, 0.75, 0.90, 0.0, 0.0}, 
                    [16] = {0.18, -2.2, 0.75, 0.90, 0.0, 0.0}, 
                }
            },
            
            CollectedProp = {
                name = "prop_feed_sack_01", 
                animAttachHands = {"anim@heists@box_carry@", "idle"},
                attachcoordHands = {28422, 0.0, 0.0, -0.30, 10.0, 0.0, 0.0}, 
                attachcoordProcess = {0.0, -1.8, 1.10, 0.0, 0.0, 0.0}
            },

            Route = {
                
                [1] = {                         
                    {
                        coord = vec4(2156.7976, 5209.1318, 59.1327, 224.6736),                                                       
                        propname = "prop_cat_tail_01",                                           
                        GetItem = { use = true, name = "aluminum_splinter", quantity = 1},                           
                    },
                    {
                        coord = vec4(2164.5872, 5200.0073, 58.8820, 221.6328),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                           
                    },
                    {
                        coord = vec4(2171.9529, 5191.6963, 58.4978, 222.3797),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = true, name = "aluminum_splinter", quantity = 1},                              
                    },    
                    {
                        coord = vec4(2180.8303, 5181.5864, 57.6647, 222.3417),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    },               
                    {
                        coord = vec4(2193.3083, 5167.7324, 56.4173, 222.2928),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    }, 
                    {
                        coord = vec4(2203.8691, 5168.6182, 57.2038, 218.7899),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = true, name = "aluminum_splinter", quantity = 1},                              
                    }, 
                    {
                        coord = vec4(2196.2910, 5177.7397, 57.8323, 43.5960),                                                       
                        propname = "prop_cat_tail_01",                                           
                        GetItem = { use = false, name = "stone", quantity = 1},                           
                    },
                    {
                        coord = vec4(2185.6968, 5190.0469, 58.7688, 41.3156),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                           
                    },
                    {
                        coord = vec4(2172.8730, 5204.6221, 59.6738, 41.4539),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    },    
                    {
                        coord = vec4(2189.0474, 5196.6709, 59.5759, 222.0139),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    },               
                    {
                        coord = vec4(2199.5969, 5185.1187, 58.7186, 222.4395),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    }, 
                    {
                        coord = vec4(2210.0525, 5174.3491, 57.9874, 224.6130),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    },
                },       
                
                [2] = {                         
                    {
                        coord = vec4(2463.8252, 4842.8169, 36.0789, 311.1891),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = true, name = "aluminum_splinter", quantity = 1},                              
                    },               
                    {
                        coord = vec4(2473.2725, 4851.4688, 36.3867, 312.5622),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    }, 
                    {
                        coord = vec4(2485.7256, 4864.0684, 37.2282, 311.6639),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = true, name = "aluminum_splinter", quantity = 1},                              
                    },  
                    {
                        coord = vec4(2499.4880, 4876.8428, 38.8240, 313.4602),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    },               
                    {
                        coord = vec4(2510.6702, 4867.5073, 37.9614, 128.3978),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    }, 
                    {
                        coord = vec4(2498.9480, 4857.4189, 36.3975, 140.2788),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    },
                    {
                        coord = vec4(2488.1460, 4846.7114, 35.5024, 134.6854),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = true, name = "aluminum_splinter", quantity = 1},                              
                    },               
                    {
                        coord = vec4(2474.4790, 4833.7017, 35.2337, 133.5534),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    }, 
                    {
                        coord = vec4(2488.1921, 4829.7148, 34.7737, 312.8069),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    },   
                    {
                        coord = vec4(2497.2815, 4838.6689, 35.2312, 315.1885),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    },               
                    {
                        coord = vec4(2507.8843, 4849.2681, 36.1424, 314.9154),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    }, 
                    {
                        coord = vec4(2519.2417, 4859.9453, 37.5750, 313.5689),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    },
                }, 

                [3] = {                         
                    {
                        coord = vec4(2656.7700, 4736.9868, 34.9559, 41.4687),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = true, name = "aluminum_splinter", quantity = 1},                              
                    },               
                    {
                        coord = vec4(2648.4668, 4744.9902, 34.6458, 39.2805),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    }, 
                    {
                        coord = vec4(2637.1831, 4756.2241, 33.9851, 50.9348),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    },  
                    {
                        coord = vec4(2632.6880, 4750.3008, 34.0856, 224.7720),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = true, name = "aluminum_splinter", quantity = 1},                              
                    },               
                    {
                        coord = vec4(2639.6797, 4743.4697, 34.7074, 226.9015),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    }, 
                    {
                        coord = vec4(2646.8152, 4736.2886, 34.8033, 225.2477),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    },
                    {
                        coord = vec4(2656.0449, 4727.0674, 35.2627, 225.6218),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    },               
                    {
                        coord = vec4(2662.0310, 4711.4463, 36.9518, 40.0029),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = true, name = "aluminum_splinter", quantity = 1},                              
                    }, 
                    {
                        coord = vec4(2654.6582, 4719.3188, 35.3508, 44.1387),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    },   
                    {
                        coord = vec4(2644.8555, 4729.1851, 34.6705, 44.6312),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    },               
                    {
                        coord = vec4(2637.0535, 4736.8159, 34.5493, 46.2863),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    }, 
                    {
                        coord = vec4(2627.3647, 4746.4468, 34.1114, 224.3569),                                                       
                        propname = "prop_cat_tail_01",                      
                        GetItem = { use = false, name = "stone", quantity = 1},                              
                    },
                }, 
            },

            ProcessCoord = vec4(1726.1821, 4712.7007, 42.0716, 15.2484),

            Finish = {
                model = "a_m_m_farmer_01", 
                coord = vec4(1722.1206, 4735.7759, 41.1260, 250.9019), 
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