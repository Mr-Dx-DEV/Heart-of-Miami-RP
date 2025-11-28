Businesses["vanillaunicorn"] = {
    enabled = true,
    drawmarker = true,
    job = "vanillaunicorn",
    dutyzone = {
        zones = {
            vec2(100.76, -1325.33),
            vec2(151.14, -1296.55),
            vec2(143.18, -1279.89),
            vec2(137.50, -1272.70),
            vec2(127.27, -1273.83),
            vec2(112.88, -1276.86),
            vec2(96.21, -1280.27),
            vec2(82.95, -1285.95),
            vec2(76.14, -1291.25)
        },
        autoClock = { enter = true, exit = true },
        label = "Vanilla Unicorn",
    },
    blips = {
        enabled = true,
        label = "Vanilla Unicorn",
        sprite = 121,
        color = 48,
        scale = 0.7,
        coords = vec3(131.06, -1302.41, 29.24)
    },
    stash = {
        enabled = true,
        label = 'Vanilla Unicorn Stash',
        slots = '40',
        weight = '400000',
        coords = {
            vec3(100.77, -1305.65, 29.22),
            vec3(101.6, -1296.6, 35.59),
            vec3(98.29, -1295.75, 29.22),
            vec3(100.21, -1289.35, 29.22),
            vec3(111.58, -1280.57, 29.62)
        },
    },
    props = {
        enabled = false,
        prop = '',
        coords = {},
    },
    traysenabled = true,
    trays = {
        ["VanillaUnicornCounter"] = {
            label = "Vanilla Unicorn Counter",
            slots = '40',
            weight = '20000',
            coords = {
                vec3(113.8278, -1283.3927, 29.50)
            },
            size = vec3(0.7, 0.7, 0.7),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },

        ["VanillaUnicornTray"] = {
            label = "Vanilla Unicorn Tray 1",
            slots = '20',
            weight = '20000',
            coords = {
                vec3(104.0226, -1297.2192, 20.7147)
            },
            size = vec3(0.7, 0.7, 0.7),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },

        ["VanillaUnicornTray2"] = {
            label = "Vanilla Unicorn Tray 2",
            slots = '20',
            weight = '20000',
            coords = {
                vec3(101.773, -1293.2668, 20.7147)
            },
            size = vec3(0.7, 0.7, 0.7),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },

        ["VanillaUnicornTray3"] = {
            label = "Vanilla Unicorn Tray 3",
            slots = '20',
            weight = '20000',
            coords = {
                vec3(106.5485, -1301.5177, 20.7414)
            },
            size = vec3(0.7, 0.7, 0.7),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },

    },
    crafting = {
        enabled = true,
        ["Cocktails"] = {
            label = "Cocktails Station",
            craftinglabel = 'Pouring Cocktails',
            craftingtime = '2000',
            coords = {
                vec3(109.78, -1284.18, 29.62)
            },
            anim = {
                dict = "mp_ped_interaction",
                clip = "handshake_guy_a",
            },
            items = {
                [1] = {
                    item = "vanillaunicorn_sunsetmartini",
                    ingredients = {
                        ["cranberry"] = 1,
                        ["gin"] = 1,
                    }
                },
                [2] = {
                    item = "vanillaunicorn_docksidebreeze",
                    ingredients = {
                        ["rum"] = 1,
                        ["amaretto"] = 1,
                        ["vodka"] = 1,
                    }
                },
                [3] = {
                    item = "vanillaunicorn_77sour",
                    ingredients = {
                        ["midori"] = 1,
                        ["vodka"] = 1,
                    }
                },


                -- [4] = {
                --     item = "high_roller",
                --     ingredients = { ['rum'] = 1, ['gin'] = 1, ['orange'] = 1, ['curaco'] = 1, ['coca_leaf'] = 5 }
                -- },
                -- [5] = {
                --     item = "midnight_lust",
                --     ingredients = { ['orange'] = 1, ['chocolate'] = 1, ['cane_sugar'] = 1, ['dusche'] = 1, ['coca_leaf'] = 3 }
                -- },
                -- [6] = {
                --     item = "beachside",
                --     ingredients = { ['lime'] = 1, ['gin'] = 1, ['orange'] = 1, ['curaco'] = 1, ['coca_leaf'] = 2 }
                -- },


            },
        },


        ["Food"] = {
            label = "Food Station",
            craftinglabel = 'Cooking Food',
            craftingtime = '2000',
            coords = {
                vec3(112.42, -1282.68, 29.62)
            },
            anim = {
                dict = "mp_ped_interaction",
                clip = "handshake_guy_a",
            },
            items = {
                [1] = {
                    item = "vanillaunicorn_raveroll",
                    ingredients = {
                        ["cubasil"] = 1,
                        ["nachos"] = 1,
                        ["lettuce"] = 1,
                    }
                },
                [2] = {
                    item = "vanillaunicorn_docksidedelights",
                    ingredients = {
                        ["cheddar"] = 1,
                        ["chocolate"] = 1,
                        ["nachos"] = 1,
                    }
                },
                [3] = {
                    item = "vanillaunicorn_portsantosporterhouse",
                    ingredients = {
                        ["nachos"] = 1,
                        ["cubasil"] = 1,
                        ["cheddar"] = 1,
                    }
                },




            },
        }


    },
    ["shop"] = {
        enabled = true,
        name = "VanillaUnicorn_shop",
        label = "Vanilla Unicorn Shop",
        items = {

            { name = "orange",     price = 200 },
            { name = "lime",       price = 100 },

            { name = "curaco",     price = 100 },
            { name = "dusche",     price = 600 },
            { name = "cane_sugar", price = 150 },

            -- Added (Missing)
            { name = "chickenraw", price = 450 },
            { name = "coconut",    price = 400 },
            { name = "nshrimp",    price = 550 },

            -- Drink Stuff (Need your price!)
            { name = 'cranberry',  price = 200 },
            { name = 'gin',        price = 200 }, 
            { name = 'rum',        price = 200 }, 
            { name = 'amaretto',   price = 200 }, 
            { name = 'vodka',      price = 200 }, 
            { name = 'midori',     price = 200 }, 

            -- Food Stuff (Need your price!)
            { name = 'cubasil',    price = 200 }, 
            { name = 'nachos',     price = 200 }, 
            { name = 'lettuce',    price = 200 }, 
            { name = 'cheddar',    price = 200 }, 
            { name = 'chocolate',  price = 400 } 
        },
        coords = vec4(102.63, -1287.99, 29.22, 45.09),
        ped = {
            ped = 'a_m_y_smartcaspat_01',
            scenario = "WORLD_HUMAN_HANG_OUT_STREET_CLUBHOUSE",
        },
        target = {
            radius = 2.0,
            targetIcon = "fas fa-wine-bottle",
            targetLabel = "Ingredients Shop",
            canInteract = function()
                return true
            end,
        },
        rankSystemEnabled = false,
    }
}
