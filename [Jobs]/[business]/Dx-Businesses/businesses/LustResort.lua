Businesses["lustresort"] = {
    enabled = true,
    drawmarker = true,
    job = "lustresort",
    dutyzone = {
        zones = {
            vec2(-543.87, 246.24),
            vec2(-541.80, 163.12),
            vec2(-654.87, 165.04),
            vec2(-654.16, 272.55)


        },
        autoClock = { enter = true, exit = true },
        label = "Lust Resort",
    },
    blips = {
        enabled = true,
        label = "Lust Resort",
        sprite = 77,
        color = 48,
        scale = 0.6,
        coords = vec3(-576.79, 234.23, 83.10)
    },
    stash = {
        enabled = true,
        label = 'Lust Resort Stash',
        slots = '40',
        weight = '400000',
        coords = {
            vec3(-555.52, 204.42, 69.12)
        },
    },
    props = {
        enabled = false,
        prop = '',
        coords = {},
    },
    traysenabled = true,
    trays = {
        ["LustResortTray1"] = {
            label = "Lust Resort Tray 1",
            slots = '20',
            weight = '20000',
            coords = {
                vec3(-559.03, 204.04, 69.16)
            },
            size = vec3(1.2, 1.7, 0.7),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },

        ["LustResortTray2"] = {
            label = "Lust Resort Tray 2",
            slots = '20',
            weight = '20000',
            coords = {
                vec3(-556.61, 206.11, 69.29)
            },
            size = vec3(1.2, 0.7, 0.7),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },

    },
    crafting = {
        ["Cocktails"] = {
            label = "Cocktails Station",
            craftinglabel = 'Pouring Cocktails',
            craftingtime = '2000',
            coords = {
                vec3(-555.51, 203.01, 69.13)
            },
            anim = {
                dict = "mp_ped_interaction",
                clip = "handshake_guy_a",
            },
            items = {
                [1] = {
                    item = "high_roller",
                    ingredients = { ['rum'] = 1, ['gin'] = 1, ['orange'] = 1, ['curaco'] = 1, ['coca_leaf'] = 5 }
                },
                [2] = {
                    item = "midnight_lust",
                    ingredients = { ['orange'] = 1, ['chocolate'] = 1, ['cane_sugar'] = 1, ['dusche'] = 1, ['coca_leaf'] = 3 }
                },
                [3] = {
                    item = "beachside",
                    ingredients = { ['lime'] = 1, ['gin'] = 1, ['orange'] = 1, ['curaco'] = 1, ['coca_leaf'] = 2 }
                },
            },
        },

        ["Food"] = {
            label = "Food Station",
            craftinglabel = 'Cooking Food',
            craftingtime = '2000',
            coords = {
                vec3(-555.70, 199.39, 69.12)
            },
            anim = {
                dict = "mp_ped_interaction",
                clip = "handshake_guy_a",
            },
            items = {
                [1] = {
                    item = "lust_platter",
                    ingredients = { ['chickenraw'] = 1, ['nutmeg'] = 1, ['coconut'] = 1, ['lime'] = 1 }
                },
                [2] = {
                    item = "glazed_chicken",
                    ingredients = { ['chickenraw'] = 1, ['coconut'] = 1, ['cane_sugar'] = 1, ['orange'] = 1 }
                },
                [3] = {
                    item = "calamari_rings",
                    ingredients = { ['nutmeg'] = 1, ['lime'] = 1, ['cane_sugar'] = 1, ['chocolate'] = 1 }
                },
            },
        },
    },
    ["shop"] = {
        enabled = true,
        name = "LustResort_shop",
        label = "Lust Resort Shop",
        items = {
            { name = "rum",        price = 200 }, -- rum - $200
            { name = "gin",        price = 200 }, -- gin - $200
            { name = "orange",     price = 200 }, -- orange - $200
            { name = "lime",       price = 100 }, -- lime - $100
            { name = "chocolate",  price = 400 }, -- chocolate - $400
            { name = "cane_sugar", price = 150 }, -- cane_sugar - $150
            { name = "shrimp",     price = 250 }, -- NOT IN LIST (your list says nshrimp, different name)
            { name = "nutmeg",     price = 250 }, -- not in list
            { name = "coconut",    price = 400 }, -- coconut - $400
            { name = "chickenraw", price = 450 }, -- chickenraw - $450

            { name = "curaco",     price = 100 },
            { name = "dusche",     price = 600 },
            { name = "nshrimp",    price = 550 },

        },

        coords = vec4(-555.155, 205.464, 69.131, 81.827),
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
        }
    }
}
