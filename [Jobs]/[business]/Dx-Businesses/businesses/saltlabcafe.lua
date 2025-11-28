Businesses["saltlabcafe"] = {
    enabled = true,
    drawmarker = true,
    job = "saltlabcafe",
    dutyzone = {
        zones = {
            vec2(-3026.323, 458.985),
            vec2(-3057.103, 390.0),
            vec2(-3150.626, 414.922),
            vec2(-3118.259, 534.091)
        },
        autoClock = { enter = true, exit = true },
        label = "SaltLab Cafe",
    },
    blips = {
        enabled = true,
        label = "Saltlab Cafe Restaurant",
        sprite = 827,
        color = 63,
        scale = 0.6,
        coords = vec3(-3078.347, 433.74, 13.143)
    },
    stash = {
        enabled = true,
        label = 'Saltlab Cafe Fridge',
        slots = '40',
        weight = '400000',
        coords = {
            vec3(-3074.545, 444.597, 11.799)
        },
    },
    props = {
        enabled = false,
        prop = '',
        coords = {},
    },
    traysenabled = true,
    trays = {
        ["saltlabcafeTray1"] = {
            label = "Saltlab Cafe Tray 1",
            slots = '20',
            weight = '20000',
            coords = { vec3(-3074.72, 446.591, 12.095) },
            size = vec3(1.8, 0.8, 1.5),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },
        ["saltlabcafeTray2"] = {
            label = "Saltlab Cafe Tray 2",
            slots = '20',
            weight = '20000',
            coords = { vec3(-3073.334, 445.986, 11.998) },
            size = vec3(1.5, 1.8, 0.5),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },
        ["saltlabcafeTray3"] = {
            label = "Saltlab Cafe Tray 3",
            slots = '20',
            weight = '20000',
            coords = { vec3(-3071.433, 445.133, 12.131) },
            size = vec3(1, 1.5, 0.7),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },
    },
    crafting = {
        enabled = true,
        ["food"] = {
            label = "Food Station",
            craftinglabel = "Cooking Food",
            craftingtime = "2000",
            coords = { 
                vec3(-3076.698, 445.617, 11.799) 
            },
            anim = { 
                dict = "mp_ped_interaction", 
                clip = "handshake_guy_a" 
            },
            items = {
                [1] = {
                    item = "chicken_sandwich",
                    ingredients = {
                        ['bread'] = 1,
                        ['chicken'] = 1,
                        ['lettuce'] = 1,
                        ['tomato'] = 1,
                        ['mayo'] = 1
                    }
                },

                [2] = {
                    item = "veggie_wrap",
                    ingredients = {
                        ['tortilla_wrap'] = 1,
                        ['lettuce'] = 1,
                        ['cucumber'] = 1,
                        ['tomato'] = 1,
                        ['mayo'] = 1
                    }
                },

                [3] = {
                    item = "brownie",
                    ingredients = {
                        ['coca_powder'] = 1,
                        ['dark_chocolate'] = 1,
                        ['sugar'] = 1,
                        ['eggs'] = 1
                    }
                },
            },
        },

        ["coffee"] = {
            label = "Pour Coffee",
            craftinglabel = "Brewing Coffee",
            craftingtime = "2000",
            coords = { 
                vec3(-3072.826, 443.843, 11.799) 
            },
            anim = { 
                dict = "mp_ped_interaction", 
                clip = "handshake_guy_a" 
            },
            items = {
                [1] = {
                    item = "iced_mango_smoothie",
                    ingredients = {
                        ['mango'] = 1,
                        ['sugar'] = 1,
                        ['purified_water'] = 1,
                        ['ice'] = 1
                    }
                },

                [2] = {
                    item = "tropical_smoothie",
                    ingredients = {
                        ['banana'] = 1,
                        ['pineapple'] = 1,
                        ['mango'] = 1,
                        ['yogurt'] = 1,
                        ['purified_water'] = 1
                    }
                },

                [3] = {
                    item = "blue_mojito",
                    ingredients = {
                        ['soda'] = 1,
                        ['ice'] = 1,
                        ['sugar'] = 1,
                        ['lime'] = 1
                    }
                },

            },
        }

    },
    ["shop"] = {
        enabled = true,
        name = "saltlabcafe_shop",
        label = "Saltlab Cafe Ingredients Shop",
        items = {
            { name = 'bread',          price = 300 },
            { name = 'chicken',        price = 450 },
            { name = 'lettuce',        price = 150 },
            { name = 'tomato',         price = 150 },
            { name = 'mayo',           price = 200 },

            { name = 'tortilla_wrap',  price = 250 },
            { name = 'cucumber',       price = 150 },

            { name = 'coca_powder',    price = 300 },
            { name = 'dark_chocolate', price = 350 },
            { name = 'sugar',          price = 150 },
            { name = 'eggs',           price = 200 },

            { name = 'mango',          price = 200 },
            { name = 'purified_water', price = 100 },
            { name = 'ice',            price = 100 },

            { name = 'banana',         price = 150 },
            { name = 'pineapple',      price = 250 },
            { name = 'yogurt',         price = 250 },

            { name = 'soda',           price = 200 },
            { name = 'lime',           price = 150 },
        },

        coords = vec4(-3071.511, 442.828, 11.799, 334.293),
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
