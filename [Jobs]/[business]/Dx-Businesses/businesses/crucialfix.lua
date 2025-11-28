Businesses["crucialfix"] = {
    enabled = true,
    drawmarker = true,
    job = "crucialfix",
    dutyzone = {
        zones = {
            vec2(945.78, -521.01),
            vec2(972.80, -567.90),
            vec2(934.23, -593.24),
            vec2(904.38, -537.11)
        },
        autoClock = { enter = true, exit = true },
        label = "Crucial Fix",
    },
    blips = {
        enabled = true,
        label = "Crucial Fix",
        sprite = 89,
        color = 48,
        scale = 0.6,
        coords = vec3(936.46, -558.37, 58.58)
    },
    stash = {
        enabled = true,
        label = 'Crucial Fix Stash',
        slots = '100',
        weight = '1000000',
        coords = {
            vec3(937.34, -555.02, 58.58)
        },
    },
    traysenabled = true,
    trays = {
        ["crucialfix_Tray1"] = {
            label = "Crucial Fix Tray 1",
            slots = '20',
            weight = '20000',
            coords = {
                vec3(939.33, -555.60, 58.73)
            },
            size = vec3(1.1, 1.2, 0.5),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },
        ["crucialfix_Tray2"] = {
            label = "Crucial Fix Tray 2",
            slots = '20',
            weight = '20000',
            coords = {
                vec3(940.81, -554.77, 58.78)
            },
            size = vec3(1.1, 1.1, 0.5),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },
    },
    props = {
        enabled = true,
        prop = 'sf_prop_sf_weed_lrg_01a',
        coords = {
            vec4(942.36, -543.10, 58.66, 124.03),
            vec4(943.05, -544.53, 58.66, 121.59),
            vec4(943.83, -546.25, 58.66, 123.50),
        },
    },
    crafting = {
        enabled = true,
        ["strain1"] = {
            label = "Strain Bubba Kush",
            craftinglabel = 'Harvesting',
            craftingtime = '500',
            coords = { vec3(943.012, -542.638, 58.679) },
            anim = {
                dict = "mp_ped_interaction",
                clip = "handshake_guy_a",
            },
            items = {
                [1] = {
                    item = "bubba_kush_crop",
                    ingredients = {
                        ["trimmers"] = 0,
                    }
                },
            }
        },
        ["strain3"] = {
            label = "Strain Pineapple Express",
            craftinglabel = 'Harvesting',
            craftingtime = '500',
            coords = { vec3(943.785, -544.175, 58.679) },
            anim = {
                dict = "mp_ped_interaction",
                clip = "handshake_guy_a",
            },
            items = {
                [1] = {
                    item = "pineapple_express_crop",
                    ingredients = {
                        ["trimmers"] = 0,
                    }
                },
            }
        },
        ["strain4"] = {
            label = "Strain Northern Lights",
            craftinglabel = 'Harvesting',
            craftingtime = '500',
            coords = { vec3(944.556, -545.987, 58.677) },
            anim = {
                dict = "mp_ped_interaction",
                clip = "handshake_guy_a",
            },
            items = {
                [1] = {
                    item = "northern_lights_crop",
                    ingredients = {
                        ["trimmers"] = 0,
                    }
                },
            }
        },
        ["edibles"] = {
            label = "Edible Station",
            craftinglabel = 'Harvesting',
            craftingtime = '2000',
            coords = { vec3(940.44, -553.54, 58.58) },
            anim = {
                dict = "mp_ped_interaction",
                clip = "handshake_guy_a",
            },
            items = {
                [1] = {
                    item = "bubba_kush_gummy",
                    ingredients = {
                        ['gelatine'] = 1,
                        ['sugar'] = 1,
                        ["northern_lights_bud"] = 5,
                        ["kq_weed_bud_og_kush"] = 1,
                        ['gummymould'] = 1
                    }
                },

            }
        },
        ["joints"] = {
            label = "Joints Station",
            craftinglabel = 'Harvesting',
            craftingtime = '2000',
            coords = { vec3(938.98, -554.12, 58.58) },
            anim = {
                dict = "mp_ped_interaction",
                clip = "handshake_guy_a",
            },
            items = {
                [1] = {
                    item = "bubba_kush_joint",
                    ingredients = {
                        ["rollingpapers"] = 1,
                        ["bubba_kush_bud"] = 3,
                        ["kq_weed_bud_og_kush"] = 1,
                    }
                },
                [2] = {
                    item = "pineapple_express_joint",
                    ingredients = {
                        ["rollingpapers"] = 1,
                        ["pineapple_express_bud"] = 2,
                        ["kq_weed_bud_og_kush"] = 1,
                    }
                },

            }
        },
        ["trimming"] = {
            label = "Trimming Station",
            craftinglabel = 'Harvesting',
            craftingtime = '2000',
            coords = { vec3(934.89, -546.00, 58.58) },
            anim = {
                dict = "mp_ped_interaction",
                clip = "handshake_guy_a",
            },
            items = {
                [1] = {
                    item = "bubba_kush_bud",
                    ingredients = {
                        ["trimmers"] = 0,
                        ["bubba_kush_crop"] = 1,
                    }
                },
                -- [2] = {
                --     item = "leila_delight_bud",
                --     ingredients = {
                --         ["trimmers"] = 0,
                --         ["leila_delight_crop"] = 1,
                --     }
                -- },
                [2] = {
                    item = "pineapple_express_bud",
                    ingredients = {
                        ["trimmers"] = 0,
                        ["pineapple_express_crop"] = 1,
                    }
                },
                [3] = {
                    item = "northern_lights_bud",
                    ingredients = {
                        ["trimmers"] = 0,
                        ["northern_lights_crop"] = 1,
                    }
                },
            }
        },
    },

    ["shop"] = {
        enabled = true,
        name = "crucialfix_shop",
        label = "Crucial Fix Ingredients Shop",
        items = {
            { name = "gelatine",                 price = 600 }, -- Gelatine - $600
            { name = "sugar",                    price = 300 }, -- Sugar - $300
            { name = "trimmers",                 price = 250 }, -- Not in list (kept original)
            { name = "rollingpapers",            price = 1000 }, -- Rolling Papers - $1000
            { name = "gummymould",               price = 600 }, -- Gummymould - $600
            { name = "kq_weed_pot",              price = 250 }, -- Not in list
            { name = "kq_weed_seed_og_kush",     price = 250 }, -- Not in list
            { name = "kq_weed_fertilizer_speed", price = 250 }, -- Not in list
        },
        coords = vec4(937.609, -545.785, 58.577, 117.098),
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
