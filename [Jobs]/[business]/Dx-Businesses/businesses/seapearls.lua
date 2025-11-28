Businesses["seapearls"] = {
    enabled = true,
    drawmarker = true,
    job = "seapearls",
    dutyzone = {
        zones = {
            vec2(-1647.692, -1189.593),
            vec2(-1805.334, -1049.438),
            vec2(-2011.808, -1160.416),
            vec2(-1833.935, -1430.757)
        },
        autoClock = { enter = true, exit = true },
        label = "Sea Pearls",
    },
    blips = {
        enabled = true,
        label = "Sea Perls",
        sprite = 120,
        color = 48,
        scale = 0.6,
        coords = vec3(-1822.367, -1216.104, 13.017)
    },
    stash = {
        enabled = true,
        label = 'Sea Pearls Fridge',
        slots = 40,
        weight = 400000,
        coords = {
            vec3(-1860.517, -1210.488, 15.494)
            -- vec3(-1832.055, -1233.402, 13.15)
        },
    },
    props = {
        enabled = false,
        prop = '',
        coords = {},
    },
    traysenabled = true,
    trays = {
        ["seapearlsTray1"] = {
            label = "Sea Pearls Tray 1",
            slots = '20',
            weight = '20000',
            coords = { vec3(-1861.6707, -1201.98, 15.7915) },
            size = vec3(1.1, 1.9, 0.7),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },
        -- ["seapearlsTray2"] = {
        --     label = "Sea Pearls Tray 2",
        --     slots = '20',
        --     weight = '20000',
        --     coords = { vec3(-599.61, -722.40, 211.90) },
        --     size = vec3(0.5, 0.9, 0.7),
        --     rotation = 5,
        --     icon = 'fa-solid fa-bowl-food',
        -- },
        ["seapearlsTray3"] = {
            label = "Sea Pearls Tray 3",
            slots = '20',
            weight = '20000',
            coords = { vec3(-1831.9445, -1229.1285, 13.2006) },
            size = vec3(0.8, 0.9, 0.7),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },
    },
    crafting = {
        ["grill"] = {
            label = "Grill Station",
            craftinglabel = 'Grilling Foods',
            craftingtime = '2000',
            coords = { vec3(-1862.4332, -1202.394, 15.5205), vec3(-1835.545, -1227.1, 13.117) }, -- move if needed
            anim = { dict = "mp_ped_interaction", clip = "handshake_guy_a" },
            items = {
                [1] = { item = "neptunes_platter", ingredients = { ['king_prawn'] = 1, ['garlic'] = 1, ['lobster'] = 1, ['butter'] = 1 } },
                [2] = { item = "fish_and_chips", ingredients = { ['fish_fillet'] = 1, ['potato'] = 1, ['oil'] = 1, ['lemon'] = 1 } },
                [3] = { item = "golden_calamari", ingredients = { ['calamari'] = 1, ['flour'] = 1, ['oil'] = 1 } },
            },
        },
        ["drinks"] = {
            label = "Pour Drinks",
            craftinglabel = 'Brewing Drinks',
            craftingtime = '2000',
            coords = { vec3(-1859.844, -1205.349, 15.486), vec3(-1833.559, -1228.542, 13.124) },
            anim = { dict = "mp_ped_interaction", clip = "handshake_guy_a" },
            items = {
                [1] = { item = "ocean_breeze", ingredients = { ['blue_curacao'] = 1, ['pineapple'] = 1, ['sparkling_water'] = 1, ['ice'] = 1 } },
                [2] = { item = "coral_twist", ingredients = { ['soda'] = 1, ['cranberry'] = 1, ['ice'] = 1, ['orange'] = 1 } },
                [3] = { item = "deep_sea_kola", ingredients = { ['coca_powder'] = 1, ['sugar'] = 1, ['purified_water'] = 1, ['ice'] = 1 } },
            },
        },

    },
    ["shop"] = {
        enabled = true,
        name = "seapearls_shop",
        label = "seapearls Ingredients Shop",
        items = {
            { name = 'lobster',         price = 500 }, -- Lobster - $500
            { name = 'butter',          price = 250 }, -- Butter - $250

            { name = 'coca_powder',     price = 400 }, -- Coca Powder - $400
            { name = 'garlic',          price = 250 }, -- Garlic - $250
            { name = 'king_prawn',      price = 500 }, -- King Prawn - $500
            { name = 'orange',          price = 300 }, -- Orange - $300
            { name = 'pineapple',       price = 400 }, -- Pineapple - $400

            { name = 'spices',          price = 100 }, -- Spices - $100
            { name = 'fish_fillet',     price = 500 }, -- Fish Fillet - $500
            { name = 'potato',          price = 300 }, -- Potato - $300
            { name = 'oil',             price = 200 }, -- Oil - $200
            { name = 'lemon',           price = 200 }, -- Lemon - $200
            { name = 'calamari',        price = 300 }, -- Calamari - $300
            { name = 'flour',           price = 400 }, -- Flour - $400
            { name = 'blue_curacao',    price = 400 }, -- Blue Curacao - $400
            { name = 'sparkling_water', price = 600 }, -- Sparkling Water - $600
            { name = 'lime',            price = 250 }, -- NOT IN LIST (kept original)
            { name = 'soda',            price = 500 }, -- Soda - $500
            { name = 'cranberry',       price = 300 }, -- Cranberry - $300
            { name = 'ice',             price = 100 }, -- Ice - $100
            { name = 'sugar',           price = 300 }, -- Sugar - $300
            { name = 'purified_water',  price = 200 }, -- Purified Water - $200
        },
        coords = vec4(-1826.171, -1235.746, 13.017, 29.28),
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
