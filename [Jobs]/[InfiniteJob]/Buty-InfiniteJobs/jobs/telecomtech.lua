return {
    JobInfo = {
        Name = "telecom tech", 
        JobID = {"telecom_tech", 0},
        Img = "img/telecomtech.jpg",
        ExperienceRequired = 500,
        info = "Repair antennas at our customers' homes and, as soon as you're done, come back here to get paid.",

        Tutorial = {
            [1] = "First you must know that your tool is in the trunk, approach and take it.",
            [2] = "Go to the buildings marked on the map and go up to the roofs to repair the antennas.",
            [3] = "When you're done, go and get paid here.",
        }
    },

    JobConfig = {

        Tool = {
            prop = "prop_tool_screwdvr03", 
            objcoord = {18905, 0.13, 0.09, -0.04, 50.0, 0.0, 0.0}, 
            objcoord2 = {18905,0.13, 0.08, -0.02, 130.0, 100.0, -30.0},
            animation_action = {"missmechanic","work2_base",3000},  
            animation_take = nil,
            particles = ""
        },

        type = 1,

        deleteprop = false,

        {
            CreateGroup = vec4(967.1646, -1857.6312, 30.1970, 80.9952),

            CreateGroupPed_model = "s_m_m_lathandy_01",

            Workclothes = vec4(964.6398, -1859.0194, 30.1968, 176.1882),

            Vehicle = {
                coord = vec4(959.1598, -1858.4530, 30.2136, 84.3601),
                spawnvehicle = vec4(963.1334, -1856.1049, 30.8275, 86.1119),
                model = "moonbeam",
                doors = {5},
                coord_prop_tool = {
                    [1] = {-0.24, -1.60, 0.10, 0.0, 90.0, 0.0},
                    [2] = {-0.24, -1.80, 0.10, 0.0, 90.0, 0.0},
                    [3] = {0.24, -1.60, 0.10, 0.0, 90.0, 0.0},
                    [4] = {0.24, -1.80, 0.10, 0.0, 90.0, 0.0},
                }, 
            },

            skill = {
                use = true,
                difficultyLevels = { 'easy', 'easy', {areaSize = 60, speedMultiplier = 1.1}, 'easy' },
                controls = {'w', 'a', 's', 'd'},
                particles = "ent_dst_electrical",
            },

            Route = {
                
                [1] = {   
                    
                    {
                        coord = vec4(256.9564, -1012.0520, 61.6112, 248.7249),                                  
                        propname = "prop_satdish_3_b",                 
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},
                    },
                    {
                        coord = vec4(265.9566, -994.7877, 60.5013, 218.9939),                                             
                        propname = "prop_satdish_2_b",                   
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},
                    },
                    {
                        coord = vec4(302.4956, -984.0408, 44.9876, 241.1789),                                              
                        propname = "prop_satdish_s_04b",                    
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},
                    },
                    {
                        coord = vec4(255.7524, -1015.8362, 61.6090, 238.6721),                                          
                        propname = "prop_satdish_l_02",                    
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1}, 
                    },
                    {
                        coord = vec4(274.1672, -1005.9117, 61.6121, 264.0198),                                    
                        propname = "prop_satdish_2_b",                   
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},
                    },
                    {
                        coord = vec4(273.1028, -1008.9964, 61.6281, 253.4921),                                       
                        propname = "prop_satdish_l_02",                    
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},                       
                    },
                    {
                        coord = vec4(266.2211, -992.3940, 57.2215, 162.9573),                                        
                        propname = "prop_satdish_3_b",                   
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},                                                
                    },
                    {
                        coord = vec4(274.1039, -998.3326, 57.2100, 251.5623),                                            
                        propname = "prop_satdish_s_04b",                   
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},                                                 
                    },
                    {
                        coord = vec4(267.7408, -985.3775, 44.9876, 249.4545),                                        
                        propname = "prop_satdish_3_b",                   
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},                          
                    },
                    {
                        coord = vec4(284.8482, -983.1355, 48.6536, 279.7112),                                              
                        propname = "prop_satdish_s_04b",                    
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1}, 
                    },

                    
                },


                [2] = {   
                    
                    {
                        coord = vec4(-201.0791, -327.7851, 66.0498, 75.2440),                                  
                        propname = "prop_satdish_3_b",                 
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},
                    },
                    {
                        coord = vec4(-203.0459, -325.7800, 66.0498, 197.7477),                                             
                        propname = "prop_satdish_2_b",                   
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},
                    },
                    {
                        coord = vec4(-203.7418, -328.3547, 66.0498, 312.7909),                                              
                        propname = "prop_satdish_s_04b",                    
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},
                    },
                    {
                        coord = vec4(-225.9717, -304.7993, 74.4835, 17.0014),                                          
                        propname = "prop_satdish_l_02",                    
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1}, 
                    },
                    {
                        coord = vec4(-146.6190, -121.8456, 97.1529, 190.0555),                                    
                        propname = "prop_satdish_2_b",                   
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},
                    },
                    {
                        coord = vec4(-188.5063, -274.4369, 81.6359, 25.5910),                                       
                        propname = "prop_satdish_l_02",                    
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},                       
                    },
                    {
                        coord = vec4(-150.3035, -121.5214, 97.1529, 285.2159),                                        
                        propname = "prop_satdish_3_b",                   
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},                                                
                    },
                    {
                        coord = vec4(-219.3914, -91.2525, 85.2247, 166.4564),                                            
                        propname = "prop_satdish_s_04b",                   
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},                                                 
                    },
                    {
                        coord = vec4(-241.9118, -112.1947, 85.2247, 253.3496),                                        
                        propname = "prop_satdish_3_b",                   
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},                          
                    },
                    {
                        coord = vec4(-240.6017, -108.1083, 85.2247, 267.9169),                                              
                        propname = "prop_satdish_s_04b",                    
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1}, 
                    },

                    
                },

                [3] = {   
                    
                    {
                        coord = vec4(-778.7701, 647.2275, 151.0765, 352.1765),                                  
                        propname = "prop_satdish_3_b",                 
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},
                    },
                    {
                        coord = vec4(-737.9634, 488.7725, 115.2734, 67.9181),                                             
                        propname = "prop_satdish_2_b",                   
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},
                    },
                    {
                        coord = vec4(-613.4348, 486.6295, 117.8786, 33.6446),                                              
                        propname = "prop_satdish_s_04b",                    
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},
                    },
                    {
                        coord = vec4(-738.9684, 486.3754, 115.2733, 63.7438),                                          
                        propname = "prop_satdish_l_02",                    
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1}, 
                    },
                    {
                        coord = vec4(-613.0443, 484.2452, 117.8891, 42.2265),                                    
                        propname = "prop_satdish_2_b",                   
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},
                    },
                    {
                        coord = vec4(-533.8691, 465.5997, 112.2294, 45.2257),                                   
                        propname = "prop_satdish_2_b",                    
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},                       
                    },
                    {
                        coord = vec4(-612.4821, 481.4653, 117.8713, 52.7471),                                        
                        propname = "prop_satdish_3_b",                   
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},                                                
                    },
                    {
                        coord = vec4(-930.5140, 552.4284, 106.5659, 20.8163),                                            
                        propname = "prop_satdish_s_04b",                   
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},                                                 
                    },
                    {
                        coord = vec4(-882.1548, 514.9816, 97.0190, 50.4113),                                        
                        propname = "prop_satdish_3_b",                   
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1},                          
                    },
                    {
                        coord = vec4(-884.9366, 518.0844, 96.1176, 151.9832),                                              
                        propname = "prop_satdish_s_04b",                    
                        GetItem = {use = false, name = "telecommunications-technician", quantity = 1}, 
                    },               
                },
            },

            Finish = {
                model = "s_m_m_gentransport", 
                coord = vec4(957.9446, -1858.4545, 30.2247, 60.5530), 
                Quantity = 6000,  
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
