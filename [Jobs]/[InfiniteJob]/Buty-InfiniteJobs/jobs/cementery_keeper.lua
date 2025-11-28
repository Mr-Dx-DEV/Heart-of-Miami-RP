return {
    JobInfo = {
        Name = "cementery keeper", 
        JobID = {"cementery_keeper", 0},
        Img = "img/cementerykeeper.jpg",
        ExperienceRequired = 500,
        info = "Clean the dust and dirt from the tombs of the cemeteries, so the dead will rest in peace and you will get paid for it.",

        Tutorial = {
            [1] = "Head towards the dirty graves marked on the map to clean them.",
            [2] = "Go to the generators marked on the map and fix them.",
            [3] = "When you're done, go and get paid here.",
        }
    },

    JobConfig = {

        Tool = {
            prop = "prop_paint_brush04", 
            objcoord = {28422, 0.06, 0.08, 0.03, -30.0, 0.0, 160.0}, 
            objcoord2 = {28422,5, 0.07, 0.0, 0.0, 0.0, 120.0},
            animation_action = {"mini@triathlon", "rummage_bag",3000},  
            animation_take = nil,
            particles = ""
        },

        type = 1,

        deleteprop = false,

        {
            CreateGroup = vec4(-779.1712, 22.5391, 39.6542, 233.3801),

            CreateGroupPed_model = "cs_priest",

            Workclothes = vec4(-778.2192, 10.0062, 39.6542, 208.4168),

            Vehicle = {
                coord = vec4(-787.4523, 34.1106, 46.8389, 253.4203),
                spawnvehicle = vec4(-788.6306, 42.9103, 48.2082, 252.9549),
                model = "seminole2",
                doors = {5},
                coord_prop_tool = {
                    [1] = {-0.20, -1.8, 0.26, 0.90, 0.0, 90.0},
                    [2] = {-0.20, -1.5, 0.26, 0.90, 0.0, 90.0},
                    [3] = {0.20, -1.8, 0.26, 0.90, 0.0, 90.0},
                    [4] = {0.20, -1.5, 0.26, 0.90, 0.0, 90.0},
                }, 
            },

            skill = {
                use = true,
                difficultyLevels = { 'easy', 'easy', {areaSize = 60, speedMultiplier = 1.1}, 'easy' },
                controls = {'w', 'a', 's', 'd'},
                particles = "ent_anim_dusty_hands",
            },

            Route = {
                
                [1] = {   
                    
                    {
                        coord = vec4(-1772.745, -221.652, 53.468, 128.575),                                  
                        propname = "prop_gravestones_02a",       
                        GetItem = {use = true, name = "metal_splinter", quantity = 1},
                    },
                    {
                        coord = vector4(-1663.827, -144.353, 58.731, 296.502),                                             
                        propname = "prop_cs_diaphram",             
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1},
                    },
                    {
                        coord = vec4(-1641.2281, -177.4656, 56.3667, 303.7174),                                              
                        propname = "prop_snow_flower_02",       
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1},
                    },
                    {
                        coord = vec4(-1661.9680, -137.7726, 59.4135, 155.5536),                                          
                        propname = "prop_snow_flower_02",                
                        GetItem = {use = true, name = "metal_splinter", quantity = 1}, 
                    },
                    {
                        coord = vec4(-1670.4587, -171.1407, 57.8439, 52.8962),                                    
                        propname = "prop_snow_flower_02",       
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1},
                    },
                    {
                        coord = vec4(-1731.0659, -282.5065, 50.1457, 233.3487),                                       
                        propname = "prop_snow_flower_02",
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1},                       
                    },
                    {
                        coord = vec4(-1726.6134, -192.4680, 58.5119, 278.4868),                                        
                        propname = "prop_snow_flower_02",              
                        GetItem = {use = true, name = "metal_splinter", quantity = 1},                                                
                    },
                    {
                        coord = vec4(-1746.958, -281.387, 48.85, 104.694),                                            
                        propname = "prop_cs_diaphram",                   
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1},                                                 
                    },
                    {
                        coord = vec4(-1625.3639, -180.6660, 55.7752, 44.5116),                                        
                        propname = "prop_cs_diaphram",                   
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1},                          
                    },
                    {
                        coord = vec4(-1730.6299, -248.3379, 53.0128, 192.2065),                                              
                        propname = "prop_snow_flower_02",                    
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1}, 
                    },
                },

                [2] = {   
                    
                    {
                        coord = vec4(-292.6064, 2855.2854, 53.9310, 331.6218),                                  
                        propname = "prop_cs_diaphram",  
                        GetItem = {use = true, name = "metal_splinter", quantity = 1},
                    },
                    {
                        coord = vec4(-286.2830, 2838.6453, 54.9598, 325.5913),                                             
                        propname = "prop_cs_diaphram",             
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1},
                    },
                    {
                        coord = vec4(-306.1227, 2849.5986, 55.0130, 150.8889),                                              
                        propname = "prop_gravestones_08a",            
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1},
                    },
                    {
                        coord = vec4(-313.8794, 2841.9561, 56.7018, 33.7011),                                          
                        propname = "prop_gravestones_02a",
                        GetItem = {use = true, name = "metal_splinter", quantity = 1}, 
                    },
                    {
                        coord = vec4(-281.0386, 2845.5325, 53.9137, 55.7006),                                    
                        propname = "prop_snow_flower_02",        
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1},
                    },
                    {
                        coord = vec4(-310.518, 2845.493, 56.371, 230.932),                                       
                        propname = "prop_snow_flower_02",   
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1},                       
                    },
                    {
                        coord = vec4(-292.9839, 2842.3643, 55.2435, 278.1909),                                        
                        propname = "prop_snow_flower_02",                   
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1},                                                
                    },
                    {
                        coord = vec4(-281.0616, 2845.4302, 53.9247, 2.2009),                                            
                        propname = "prop_snow_flower_02",                   
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1},                                                 
                    },
                    {
                        coord = vec4(-273.4353, 2833.4200, 53.9042, 248.4222),                                              
                        propname = "prop_gravestones_02a",                    
                        GetItem = {use = true, name = "metal_splinter", quantity = 1}, 
                    },
                },


                [3] = {   
                    
                    {
                        coord = vec4(-1787.7240, -225.8244, 51.5078, 314.8498),                                  
                        propname = "prop_gravestones_02a",       
                        GetItem = {use = true, name = "metal_splinter", quantity = 1},
                    },
                    {
                        coord = vec4(-1660.3857, -141.1497, 58.9493, 128.9347),                                             
                        propname = "prop_cs_diaphram",             
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1},
                    },
                    {
                        coord = vec4(-1641.2281, -177.4656, 56.3667, 303.7174),                                              
                        propname = "prop_snow_flower_02",       
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1},
                    },
                    {
                        coord = vec4(-1661.9680, -137.7726, 59.4135, 155.5536),                                          
                        propname = "prop_snow_flower_02",                
                        GetItem = {use = true, name = "metal_splinter", quantity = 1}, 
                    },
                    {
                        coord = vec4(-1670.4587, -171.1407, 57.8439, 52.8962),                                    
                        propname = "prop_snow_flower_02",       
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1},
                    },
                    {
                        coord = vec4(-1731.0659, -282.5065, 50.1457, 233.3487),                                       
                        propname = "prop_snow_flower_02",
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1},                       
                    },
                    {
                        coord = vec4(-286.2830, 2838.6453, 54.9598, 325.5913),                                             
                        propname = "prop_cs_diaphram",             
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1},
                    },
                    {
                        coord = vec4(-306.1227, 2849.5986, 55.0130, 150.8889),                                              
                        propname = "prop_gravestones_08a",            
                        GetItem = {use = true, name = "metal_splinter", quantity = 1},
                    },
                    {
                        coord = vec4(-313.8794, 2841.9561, 56.7018, 33.7011),                                          
                        propname = "prop_gravestones_02a",
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1}, 
                    },
                    {
                        coord = vec4(-281.0386, 2845.5325, 53.9137, 55.7006),                                    
                        propname = "prop_snow_flower_02",        
                        GetItem = {use = false, name = "cementery_keeper", quantity = 1},
                    },
                },

            },

            Finish = {
                model = "cs_priest", 
                coord = vec4(-766.7198, 60.5889, 50.9971, 3.5693), 
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
