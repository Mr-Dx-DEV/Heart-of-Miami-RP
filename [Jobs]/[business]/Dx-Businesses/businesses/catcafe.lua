Businesses["catcafe"] = {
    enabled = true,
    drawmarker = true,
    job = "catcafe",
    dutyzone = {
        zones = {
            vec2(-591.15808105469, -1087.8620605469),
            vec2(-563.33447265625, -1087.8508300781),
            vec2(-563.26678466797, -1045.1898193359),
            vec2(-618.20904541016, -1044.2902832031),
            vec2(-617.80517578125, -1079.7291259766),
            vec2(-599.44097900391, -1079.6105957031)
        },
        autoClock = { enter = true, exit = true },
        label = "catcafe",
    },
    blips = {
        enabled = true,
        label = "CatCafe Restaurant",
        sprite = 89,
        color = 48,
        scale = 0.6,
        coords = vec3(-581.06, -1066.22, 22.34)
    },
    stash = {
        enabled = true,
        label = 'CatCafe Fridge',
        slots = '40',
        weight = '400000',
        coords = {
            vec3(-586.5927, -1059.6642, 22.2426)
        },
    },
    props = {
        enabled = true,
        prop = 'sf_prop_sf_weed_lrg_01a',
        coords = {
            vec4(-603.143, -1066.305, 22.604, 95.584),
            vec4(-605.913, -1066.265, 22.604, 95.766),
            vec4(-606.695, -1069.646, 22.604, 172.614),
        },
    },
    traysenabled = true,
    trays = {
        ["CatCafeTray1"] = {
            label = "CatCafe Tray 1",
            slots = '20',
            weight = '20000',
            coords = { vec3(-584.0424, -1059.2629, 22.4176) },
            size = vec3(0.5, 0.5, 0.5),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },
        ["CatCafeTray2"] = {
            label = "CatCafe Tray 2",
            slots = '20',
            weight = '20000',
            coords = { vec3(-584.0706, -1062.0321, 22.4176) },
            size = vec3(0.5, 0.5, 0.5),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },
        ["CatCafeTray3"] = {
            label = "CatCafe Tray 3",
            slots = '20',
            weight = '20000',
            coords = { vec3(-587.4568, -1059.6674, 22.2113) },
            size = vec3(1, 1.5, 0.7),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },
    },
    crafting = {
        enabled = true,
        ["strain1"] = {
            label = "Strain Bubba Kush",
            craftinglabel = 'Harvesting',
            craftingtime = '500',
            coords = { vec3(-603.143, -1066.305, 22.604) },
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
            coords = { vec3(-605.913, -1066.265, 22.604) },
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
            coords = { vec3(-606.695, -1069.646, 22.604) },
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
        ["trimming"] = {
            label = "Trimming Station",
            craftinglabel = 'Harvesting',
            craftingtime = '2000',
            coords = { vec3(-590.405, -1062.985, 22.356) },
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




        ["food"] = {
            label = "Food Station",
            craftinglabel = "Cooking Food",
            craftingtime = "2000",
            coords = {
                vec3(-590.109, -1059.128, 22.344)
            },
            anim = {
                dict = "mp_ped_interaction",
                clip = "handshake_guy_a"
            },
            items = {
                [1] = {
                    item = "cat_cake",
                    ingredients = {
                        ['flour'] = 2,
                        ['sugar'] = 1,
                        ['milk'] = 1,
                        ['fruit_cherry'] = 1
                    }
                },

                [2] = {
                    item = "sandwich",
                    ingredients = {
                        ['bread'] = 1,
                        ['chicken'] = 1,
                        ['lettuce'] = 1,
                        ['onion'] = 1
                    }
                },

                [3] = {
                    item = "creamy_pasta",
                    ingredients = {
                        ['pasta'] = 1,
                        ['milk'] = 1,
                        ['cheese'] = 1,
                        ['pasta_leaf'] = 1
                    }
                },






                [4] = {
                    item = "cat_cookie",
                    ingredients = {
                        ['gelatine'] = 1,
                        ['northern_lights_bud'] = 5,
                        ["kq_weed_bud_og_kush"] = 1
                    }
                },
            },
        },

        ["coffee"] = {
            label = "Pour Coffee",
            craftinglabel = "Brewing Coffee",
            craftingtime = "2000",
            coords = {
                vec3(-586.23, -1061.89, 22.34)
            },
            anim = {
                dict = "mp_ped_interaction",
                clip = "handshake_guy_a"
            },
            items = {

                [1] = {
                    item = "iced_mocha",
                    ingredients = {
                        ['coffee_beans'] = 1,
                        ['milk'] = 1,
                        ['sugar'] = 1,
                        ['ice'] = 1
                    }
                },

                [2] = {
                    item = "chocolate_latte",
                    ingredients = {
                        ['coffee_beans'] = 1,
                        ['milk'] = 1,
                        ['chocolate'] = 1,
                        ['ice'] = 1
                    }
                },

                [3] = {
                    item = "strawberry_shake",
                    ingredients = {
                        ['strawberry'] = 2,
                        ['milk'] = 1,
                        ['sugar'] = 1,
                        ['ice'] = 1
                    }
                },

                [4] = {
                    item = "cat_cappuccino",
                    ingredients = {
                        ["bubba_kush_bud"] = 3,
                        ["kq_weed_bud_og_kush"] = 1,
                    }
                },
                [5] = {
                    item = "cat_black_coffee",
                    ingredients = {
                        ["pineapple_express_bud"] = 2,
                        ["kq_weed_bud_og_kush"] = 12,
                    }
                },

            },
        }

    },
    ["shop"] = {
        enabled = true,
        name = "cat_cafe_shop",
        label = "CatCafe Ingredients Shop",
        items = {
            { name = 'bread',                    price = 300 },
            { name = 'cheese',                   price = 250 },
            { name = 'fruit_cherry',             price = 100 },
            { name = 'chicken',                  price = 300 },
            { name = 'chocolate',                price = 100 },
            { name = 'coffee_beans',             price = 800 },
            { name = 'flour',                    price = 400 },
            { name = 'ice',                      price = 100 },
            { name = 'lettuce',                  price = 300 },
            { name = 'milk',                     price = 200 },
            { name = 'onion',                    price = 300 },
            { name = 'pasta',                    price = 400 },
            { name = 'pasta_leaf',               price = 150 },
            { name = 'strawberry',               price = 150 },
            { name = 'sugar',                    price = 300 },


            { name = "trimmers",                 price = 250 },
            { name = "gelatine",                 price = 600 }, -- Gelatine - $600
            { name = "kq_weed_pot",              price = 250 }, -- Not in list
            { name = "kq_weed_seed_og_kush",     price = 250 }, -- Not in list
            { name = "kq_weed_fertilizer_speed", price = 250 }, -- Not in list

        },
        coords = vec4(-594.113, -1068.256, 22.344, 2.454),
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
