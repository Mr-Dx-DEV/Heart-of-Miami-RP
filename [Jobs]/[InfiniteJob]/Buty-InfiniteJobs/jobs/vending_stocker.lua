return {
    JobInfo = {
        Name = "vending stocker", 
        JobID = {"vending_stocker", 0},
        Img = "img/vendingstocker.jpg",
        ExperienceRequired = 500,
        info = "Refill our vending machines that we have all over the city and when you finish you will receive your payment.",

        Tutorial = {
            [1] = "First you must know that the supplies are in the trunk, approach and take them.",
            [2] = "Go to the vending machines marked on the map to replenish them.",
            [3] = "When you're done, go and get paid here.",
        }
    },

    JobConfig = {

        Tool = {
            prop = "prop_cs_cardbox_01", 
            objcoord = {28422, 0.0, -0.06, 0.0, 0.0, 0.0, 0.0}, 
            objcoord2 = {28422,0.0, -0.06, 0.0, 0.0, 0.0, 0.0},
            animation_action = {"anim@heists@load_box","load_box_2",3000},
            animation_take = {"anim@heists@box_carry@", "idle"},
            particles = ""
        },

        type = 1,

        deleteprop = false,

        {
            CreateGroup = vec4(980.8451, -1705.9257, 30.1178, 88.8772),

            CreateGroupPed_model = "a_m_m_bevhills_01",

            Workclothes = vec4(973.4361, -1700.6365, 28.6344, 176.3937),

            Vehicle = {
                coord = vec4(978.4783, -1708.5001, 29.0938, 265.4200),
                spawnvehicle = vec4(974.8908, -1718.7379, 30.3745, 264.2272),
                model = "burrito3",
                doors = {2,3},
                coord_prop_tool = {
                    [1] = {-0.60, -0.5, -0.10, 0.90, -90.0, 90.0},
                    [2] = {-0.20, -0.5, -0.10, 0.90, -90.0, 90.0},
                    [3] = {0.20, -0.5, -0.10, 0.90, -90.0, 90.0},
                    [4] = {0.60, -0.5, -0.10, 0.90, -90.0, 90.0},
                }, 
            },

            skill = {
                use = true,
                difficultyLevels = { 'easy', 'easy', {areaSize = 60, speedMultiplier = 1.1}, 'easy' },
                controls = {'w', 'a', 's', 'd'},
                particles = nil,
            },

            Route = {
                
                [1] = {   
                    
                    {
                        coord = vec4(448.9656, -657.5845, 28.4616, 85.0479),                                  
                        propname = "prop_vend_snak_01",                 
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},
                    },
                    {
                        coord = vec4(452.9021, -611.2487, 28.5366, 86.4058),                                             
                        propname = "prop_vend_water_01",                   
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},
                    },
                    -- {
                    --     coord = vec4(434.7617, -976.9792, 30.7139, 179.6240),
                    --     propname = "prop_vend_water_01",
                    --     GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},
                    -- },
                    {
                        coord = vec4(439.8111, -601.4786, 28.7146, 265.0195),                                          
                        propname = "prop_vend_soda_01",                    
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1}, 
                    },
                    {
                        coord = vec4(451.2869, -631.9232, 28.5296, 85.2937),                                    
                        propname = "prop_vend_snak_01_tu",                   
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},
                    },
                    {
                        coord = vec4(211.3375, -666.2010, 43.1409, 269.4329),                                       
                        propname = "prop_vend_soda_02",                    
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},                       
                    },
                    {
                        coord = vec4(-333.6023, -785.0189, 33.9645, 223.0517),                                        
                        propname = "prop_vend_soda_01",                   
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},                                                
                    },
                    {
                        coord = vec4(211.3032, -664.6574, 43.1409, 269.0643),                                            
                        propname = "prop_vend_snak_01",                   
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},                                                 
                    },
                    {
                        coord = vec4(-331.9019, -783.3688, 33.9645, 221.9797),                                        
                        propname = "prop_vend_snak_01_tu",                   
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},                          
                    },
                    {
                        coord = vec4(-344.5380, -823.9091, 31.5465, 280.0345),                                              
                        propname = "prop_vend_water_01",                    
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1}, 
                    },
                },

                [2] = {   
                    
                    {
                        coord = vec4(-2281.3739, 361.1799, 174.6018, 293.8608),                                  
                        propname = "prop_vend_snak_01",                 
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},
                    },
                    {
                        coord = vec4(-2257.1598, 324.9814, 184.6015, 295.3251),                                             
                        propname = "prop_vend_water_01",                   
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},
                    },
                    {
                        coord = vec4(-2197.6311, 245.1218, 174.6067, 203.3251),                                              
                        propname = "prop_vend_soda_02",                    
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},
                    },
                    {
                        coord = vec4(-2195.0591, 246.2517, 174.6070, 202.1126),                                          
                        propname = "prop_vend_soda_01",                    
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1}, 
                    },
                    {
                        coord = vec4(-2196.3208, 245.5525, 174.6067, 205.6320),                                    
                        propname = "prop_vend_snak_01_tu",                   
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},
                    },
                    -- {
                    --     coord = vec4(-422.3272, 1067.0524, 323.8458, 345.7903),                                       
                    --     propname = "prop_vend_soda_02",                    
                    --     GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},                       
                    -- },
                    -- {
                    --     coord = vec4(-458.6355, 1088.4968, 325.7572, 253.5083),                                        
                    --     propname = "prop_vend_soda_01",                   
                    --     GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},                                                
                    -- },
                    {
                        coord = vec4(311.4448, -228.6278, 54.2211, 68.8591),                                            
                        propname = "prop_vend_soda_01",                   
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},                                                 
                    },
                    {
                        coord = vec4(316.7512, -277.0502, 54.1649, 340.9983),                                              
                        propname = "prop_vend_water_01",                    
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1}, 
                    },
                },

                [3] = {   
                    
                    {
                        coord = vec4(-1148.2870, -1610.0868, 4.4035, 303.5552),                                  
                        propname = "prop_vend_snak_01",                 
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},
                    },
                    {
                        coord = vec4(-1229.9832, -1446.3757, 4.3127, 35.6337),                                             
                        propname = "prop_vend_water_01",                   
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},
                    },
                    {
                        coord = vec4(-1191.9075, -1546.2054, 4.3719, 304.5440),                                              
                        propname = "prop_vend_soda_02",                    
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},
                    },
                    {
                        coord = vec4(-1337.2688, -1273.7321, 4.8952, 290.1776),                                          
                        propname = "prop_vend_soda_01",                    
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1}, 
                    },
                    {
                        coord = vec4(-1267.9468, -1428.4280, 4.3507, 309.1664),                                    
                        propname = "prop_vend_snak_01_tu",                   
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},
                    },
                    {
                        coord = vec4(-1661.6099, -1000.2801, 7.3683, 320.1139),                                       
                        propname = "prop_vend_soda_02",                    
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},                       
                    },
                    {
                        coord = vec4(-1637.6480, -1066.3257, 13.1524, 52.4917),                                        
                        propname = "prop_vend_soda_01",                   
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},                                                
                    },
                    {
                        coord = vec4(-1652.5508, -1092.9197, 13.1313, 45.5780),                                            
                        propname = "prop_vend_snak_01",                   
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},                                                 
                    },
                    {
                        coord = vec4(-1694.6560, -1107.2933, 13.1526, 146.6386),                                        
                        propname = "prop_vend_snak_01_tu",                   
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1},                          
                    },
                    {
                        coord = vec4(-1694.9212, -1123.8623, 13.1523, 60.5741),                                              
                        propname = "prop_vend_water_01",                    
                        GetItem = {use = false, name = "vending-machine-stocker", quantity = 1}, 
                    },
                },

            },

            Finish = {
                model = "a_m_m_indian_01", 
                coord = vec4(971.6261, -1715.1094, 29.3402, 92.7841), 
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
