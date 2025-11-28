Businesses["joebar"] = {
    enabled = true,
    drawmarker = true,
    job = "joebar",
    dutyzone = {
        zones = {
            vec2(324.894, -709.511),
            vec2(313.929, -743.589),
            vec2(260.828, -723.27),
            vec2(274.22, -692.297)


        },
        autoClock = { enter = true, exit = true },
        label = "Joe Bar",
    },
    blips = {
        enabled = true,
        label = "Joe Bar",
        sprite = 59,
        color = 48,
        scale = 0.6,
        coords = vec3(301.32, -717.583, 29.29)
    },
    stash = {
        enabled = true,
        label = 'Joe Bar Stash',
        slots = '40',
        weight = '400000',
        coords = {
            vec3(306.201, -715.786, 29.29)
        },
    },
    props = {
        enabled = false,
        prop = '',
        coords = {},
    },
    traysenabled = true,
    trays = {
        ["joebarTray1"] = {
            label = "Joe Bar Tray 1",
            slots = '20',
            weight = '20000',
            coords = {
                vec3(303.207, -716.032, 29.537)
            },
            size = vec3(1.2, 1.7, 0.7),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },

        ["joebarTray2"] = {
            label = "Joe Bar Tray 2",
            slots = '20',
            weight = '20000',
            coords = {
                vec3(300.002, -714.666, 29.539)
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
                vec3(302.602, -713.756, 29.29)
            },
            anim = {
                dict = "mp_ped_interaction",
                clip = "handshake_guy_a",
            },
            items = {
                [1] = {
                    item = "whiskey_twist",
                    ingredients = { ['whiskey'] = 1, ['angostura_bitters'] = 1, ['orange'] = 1, ['ice'] = 1, ['coca_leaf'] = 5 }
                },
                [2] = {
                    item = "vodka_cran",
                    ingredients = { ['cranberry'] = 1, ['triple_sec'] = 1, ['vodka'] = 1, ['ice'] = 1 }
                },
                [3] = {
                    item = "tequila_sunrise",
                    ingredients = { ['tequila'] = 1, ['orange'] = 1, ['grenadine'] = 1, ['coca_leaf'] = 2 }
                },
            },
        },
    },
    ["shop"] = {
        enabled = true,
        name = "joebar_shop",
        label = "Joe Bar Shop",
        items = {
            { name = "whiskey",           price = 700 }, -- Whiskey - $700
            { name = "angostura_bitters", price = 200 }, -- Angostura Bitters - $200
            { name = "orange",            price = 300 }, -- Orange - $300
            { name = "ice",               price = 250 }, -- Not in list (kept original)
            { name = "cranberry",         price = 300 }, -- Cranberry - $300
            { name = "triple_sec",        price = 200 }, -- Triple Sec - $200
            { name = "vodka",             price = 500 }, -- Vodka - $500
            { name = "tequila",           price = 600 }, -- Tequila - $600
            { name = "grenadine",         price = 250 }, -- Not in list
        },
        coords = vec4(295.285, -719.626, 29.29, 342.999),
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