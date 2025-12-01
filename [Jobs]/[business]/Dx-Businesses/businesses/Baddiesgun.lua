Businesses["baddiesgun"] = {
    enabled = true,
    drawmarker = false,
    job = "baddiesgun",
    dutyzone = {
        zones = {
           vec2(-334.16, 249.89),
            vec2(-412.56, 245.82),
            vec2(-412.21, 323.01),
            vec2(-342.55, 317.50)

        },
        autoClock = { enter = true, exit = true },
        label = "Baddies Gun",
    },
    blips = {
        enabled = true,
        label = "Baddies Gun",
        sprite = 567,
        color = 8,
        scale = 0.6,
        coords = vec3(-382.27, 292.63, 84.79)
    },
    stash = {
        enabled = false,
        label = 'Baddies Gun Stash',
        slots = '100',
        weight = '1000000',
        coords = {
            vec3(439.01, -769.79, 27.34)
        },
    },
    traysenabled = false,
    trays = {
        ["baddiesgun_Tray1"] = {
            label = "Baddies Gun Tray 1",
            slots = '20',
            weight = '20000',
            coords = {
                vec3(441.58, -768.53, 27.21)
            },
            size = vec3(1.1, 1.2, 0.5),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },
        -- ["baddiesgun_Tray2"] = {
        --     label = "Baddies Gun Tray 2",
        --     slots = '20',
        --     weight = '20000',
        --     coords = {
        --         vec3(940.81, -554.77, 58.78)
        --     },
        --     size = vec3(1.1, 1.1, 0.5),
        --     rotation = 5,
        --     icon = 'fa-solid fa-bowl-food',
        -- },
    },
    props = {
        enabled = false,
        prop = 'sf_prop_sf_weed_lrg_01a',
        coords = {
            vec4(942.36, -543.10, 58.66, 124.03),
            vec4(943.05, -544.53, 58.66, 121.59),
            vec4(943.83, -546.25, 58.66, 123.50),
        },
    },
    crafting = {
        enabled = false,
        -- ["strain1"] = {
        --     label = "Strain Bubba Kush",
        --     craftinglabel = 'Harvesting',
        --     craftingtime = '500',
        --     coords = { vec3(943.012, -542.638, 58.679) },
        --     anim = {
        --         dict = "mp_ped_interaction",
        --         clip = "handshake_guy_a",
        --     },
        --     items = {
        --         [1] = {
        --             item = "bubba_kush_crop",
        --             ingredients = {
        --                 ["trimmers"] = 0,
        --             }
        --         },
        --     }
        -- },
        -- ["strain3"] = {
        --     label = "Strain Pineapple Express",
        --     craftinglabel = 'Harvesting',
        --     craftingtime = '500',
        --     coords = { vec3(943.785, -544.175, 58.679) },
        --     anim = {
        --         dict = "mp_ped_interaction",
        --         clip = "handshake_guy_a",
        --     },
        --     items = {
        --         [1] = {
        --             item = "pineapple_express_crop",
        --             ingredients = {
        --                 ["trimmers"] = 0,
        --             }
        --         },
        --     }
        -- },
        -- ["strain4"] = {
        --     label = "Strain Northern Lights",
        --     craftinglabel = 'Harvesting',
        --     craftingtime = '500',
        --     coords = { vec3(944.556, -545.987, 58.677) },
        --     anim = {
        --         dict = "mp_ped_interaction",
        --         clip = "handshake_guy_a",
        --     },
        --     items = {
        --         [1] = {
        --             item = "northern_lights_crop",
        --             ingredients = {
        --                 ["trimmers"] = 0,
        --             }
        --         },
        --     }
        -- },
        ["edibles"] = {
            label = "Edible Station",
            craftinglabel = 'Harvesting',
            craftingtime = '2000',
            coords = { vec3(438.89, -767.46, 27.34) },
            anim = {
                dict = "mp_ped_interaction",
                clip = "handshake_guy_a",
            },
            items = {
                [1] = {
                    item = "health_potion",
                    ingredients = {
                        ['herb'] = 1,
                        ['holywater'] = 1,
                        ['honey'] = 1,
                        ['healing_salve'] = 1,
                        ['bone'] = 1,
                    }
                },

                [2] = {
                    item = "stress_potion",
                    ingredients = {
                        ['lavender'] = 1,
                        ['ginseng_root'] = 1,
                        ['distilled_water'] = 1,
                        ['peppermint_leaf'] = 1,
                        ['bone'] = 1,
                    }
                },

                [3] = {
                    item = "stamina_potion",
                    ingredients = {
                        ['ginseng_root'] = 1,
                        ['redbull_fruit'] = 1,
                        ['caffeine_powder'] = 1,
                        ['water_n'] = 1,
                        ['bone'] = 1,
                    }
                },
                [4] = {
                    item = "armor_potion",
                    ingredients = {
                        ['herb'] = 1,
                        ['redbull_fruit'] = 1,
                        ['caffeine_powder'] = 1,
                        ['water_n'] = 1,
                        ['bone'] = 1,
                    }
                },
            }

        },
        
    },

    ["shop"] = {
        enabled = false,
        name = "baddiesgun_shop",
        label = "Baddies Gun Ingredients Shop",
        items = {
            { name = "herb",             price = 3000 },
            { name = "holywater",        price = 2500 },
            { name = "honey",            price = 2500 },
            { name = "healing_salve",    price = 2000 },

            { name = "lavender",         price = 2500 },
            { name = "ginseng_root",     price = 2000 },
            { name = "distilled_water",  price = 1500 },
            { name = "peppermint_leaf",  price = 2000 },

            { name = "ginseng_root_low", price = 1500 },
            { name = "redbull_fruit",    price = 1500 },
            { name = "caffeine_powder",  price = 1000 },
            { name = "water_n",          price = 1000 },



        },
        coords = vec4(445.82, -769.75, 27.36, 275.90),
        ped = {
            ped = 'a_m_y_smartcaspat_01',
            scenario = "WORLD_HUMAN_HANG_OUT_STREET_CLUBHOUSE",
        },
        target = {
            radius = 1.5,
            targetIcon = "fas fa-wine-bottle",
            targetLabel = "Ingredients Shop",
            canInteract = function()
                return true
            end,
        }
    }
}
