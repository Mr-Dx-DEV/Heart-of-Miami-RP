Businesses["nazar"] = {
    enabled = true,
    drawmarker = true,
    job = "nazar",
    dutyzone = {
        zones = {
            vec2(462.35, -753.30),
            vec2(462.32, -794.67),
            vec2(413.95, -794.87),
            vec2(414.39, -754.17)

        },
        autoClock = { enter = true, exit = true },
        label = "Nazar",
    },
    blips = {
        enabled = true,
        label = "Nazar",
        sprite = 89,
        color = 48,
        scale = 0.6,
        coords = vec3(451.30, -768.34, 28.22)
    },
    stash = {
        enabled = true,
        label = 'Nazar Stash',
        slots = '100',
        weight = '1000000',
        coords = {
            vec3(439.01, -769.79, 27.34)
        },
    },
    traysenabled = true,
    trays = {
        ["nazar_Tray1"] = {
            label = "Nazar Tray 1",
            slots = '20',
            weight = '20000',
            coords = {
                vec3(441.58, -768.53, 27.21)
            },
            size = vec3(1.1, 1.2, 0.5),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },
        -- ["nazar_Tray2"] = {
        --     label = "Nazar Tray 2",
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
        enabled = true,
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
        -- ["joints"] = {
        --     label = "Joints Station",
        --     craftinglabel = 'Harvesting',
        --     craftingtime = '2000',
        --     coords = { vec3(938.98, -554.12, 58.58) },
        --     anim = {
        --         dict = "mp_ped_interaction",
        --         clip = "handshake_guy_a",
        --     },
        --     items = {
        --         [1] = {
        --             item = "bubba_kush_joint",
        --             ingredients = {
        --                 ["rollingpapers"] = 1,
        --                 ["bubba_kush_bud"] = 3,
        --                 ["kq_weed_bud_og_kush"] = 1,
        --             }
        --         },
        --         [2] = {
        --             item = "pineapple_express_joint",
        --             ingredients = {
        --                 ["rollingpapers"] = 1,
        --                 ["pineapple_express_bud"] = 2,
        --                 ["kq_weed_bud_og_kush"] = 1,
        --             }
        --         },

        --     }
        -- },
        -- ["trimming"] = {
        --     label = "Trimming Station",
        --     craftinglabel = 'Harvesting',
        --     craftingtime = '2000',
        --     coords = { vec3(934.89, -546.00, 58.58) },
        --     anim = {
        --         dict = "mp_ped_interaction",
        --         clip = "handshake_guy_a",
        --     },
        --     items = {
        --         [1] = {
        --             item = "bubba_kush_bud",
        --             ingredients = {
        --                 ["trimmers"] = 0,
        --                 ["bubba_kush_crop"] = 1,
        --             }
        --         },
        --         -- [2] = {
        --         --     item = "leila_delight_bud",
        --         --     ingredients = {
        --         --         ["trimmers"] = 0,
        --         --         ["leila_delight_crop"] = 1,
        --         --     }
        --         -- },
        --         [2] = {
        --             item = "pineapple_express_bud",
        --             ingredients = {
        --                 ["trimmers"] = 0,
        --                 ["pineapple_express_crop"] = 1,
        --             }
        --         },
        --         [3] = {
        --             item = "northern_lights_bud",
        --             ingredients = {
        --                 ["trimmers"] = 0,
        --                 ["northern_lights_crop"] = 1,
        --             }
        --         },
        --     }
        -- },
    },

    ["shop"] = {
        enabled = true,
        name = "nazar_shop",
        label = "Nazar Ingredients Shop",
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
