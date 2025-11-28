Businesses["burgershot"] = {
    enabled = true,
    drawmarker = true,
    job = "burgershot",
    dutyzone = {
        zones = {
            vec2(-1135.64, -894.27),
            vec2(-1166.86, -852.82),
            vec2(-1228.90, -888.18),
            vec2(-1204.84, -931.12)
        },
        autoClock = { enter = true, exit = true },
        label = "BurgerShot",
    },
    blips = {
        enabled = true,
        label = "BurgerShot Restaurant",
        sprite = 106,
        color = 48,
        scale = 0.6,
        coords = vec3(-1177.15, -886.81, 13.86)
    },
    stash = {
        enabled = true,
        label = 'BurgerShot Fridge',
        slots = '40',
        weight = '400000',
        coords = {
            vec3(-1193.83, -899.94, 13.89)
        },
    },
    props = {
        enabled = false,
        prop = '',
        coords = {},
    },
    traysenabled = true,
    trays = {
        ["burgershotTray1"] = {
            label = "BurgerShot Tray 1",
            slots = '20',
            weight = '20000',
            coords = { vec3(-1192.72, -893.88, 14.15) },
            size = vec3(0.8, 0.5, 0.5),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },
        ["burgershotTray2"] = {
            label = "BurgerShot Tray 2",
            slots = '20',
            weight = '20000',
            coords = { vec3(-1194.31, -893.35, 14.09) },
            size = vec3(1.3, 0.5, 0.5),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },
        ["burgershotTray3"] = {
            label = "BurgerShot Tray 3",
            slots = '20',
            weight = '20000',
            coords = { vec3(-1196.49, -892.63, 13.98) },
            size = vec3(1.3, 0.5, 0.7),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },
        ["burgershotTray4"] = {
            label = "BurgerShot Tray 4",
            slots = '20',
            weight = '20000',
            coords = { vec3(-1190.78, -894.38, 14.03) },
            size = vec3(0.8, 0.5, 0.7),
            rotation = 5,
            icon = 'fa-solid fa-bowl-food',
        },


    },
    crafting = {
        enabled = true,
        ["grill"] = {
            label = "Grill Station",
            craftinglabel = 'Grilling Foods',
            craftingtime = '2000',
            coords = { 
                vec3(-1196.70, -899.11, 13.89) 
            }, -- move if needed
            anim = { dict = "mp_ped_interaction", clip = "handshake_guy_a" },
            items = {
                [1] = { item = "beef_burger", ingredients = { ['meat'] = 1, ['lettuce'] = 1, ['sliced_onions'] = 1, ['sliced_cheese'] = 1, ['burger_bun'] = 1 } },
                [2] = { item = "chicken_burger", ingredients = { ['chicken'] = 1, ['lettuce'] = 1, ['burger_bun'] = 1, ['sliced_onions'] = 1 } },
                [3] = { item = "cheese_fries", ingredients = { ['potato'] = 1, ['oil'] = 1, ['cheese'] = 1, ['cheddar_cheese'] = 1 } },
            },
        },
        ["drinks"] = {
            label = "Pour Drinks",
            craftinglabel = 'Brewing Drinks',
            craftingtime = '2000',
            coords = { 
                vec3(-1199.52, -896.85, 13.89) 
            },
            anim = { dict = "mp_ped_interaction", clip = "handshake_guy_a" },
            items = {
                [1] = {
                    item = "cold_coffee",
                    ingredients = { ['ice'] = 1, ['milk'] = 1, ['coffee_beans'] = 1 }
                },
                [2] = {
                    item = "vanilla_shake",
                    ingredients = { ['milk'] = 1, ['ice_cream'] = 1, ['sugar'] = 1, ['ice'] = 1 }
                },
                [3] = {
                    item = "fountain_cake",
                    ingredients = { ['coca_powder'] = 1, ['ice'] = 1 }
                },
            },
        }
    },
    ["shop"] = {
        enabled = true,
        name = "burgershot_shop",
        label = "BurgerShot Ingredients Shop",
        items = {
            { name = 'meat',           price = 400 }, -- Meat - $400
            { name = 'lettuce',        price = 300 }, -- Lettuce - $300
            { name = 'sliced_onions',  price = 200 }, -- Sliced Onions - $200
            { name = 'sliced_cheese',  price = 250 }, -- NOT IN LIST (kept original)
            { name = 'burger_bun',     price = 300 }, -- Burger Bun - $300
            { name = 'chicken',        price = 400 }, -- Chicken - $400
            { name = 'potato',         price = 300 }, -- Potato - $300
            { name = 'oil',            price = 200 }, -- Oil - $200
            { name = 'cheese',         price = 250 }, -- NOT IN LIST (kept original)
            { name = 'cheddar_cheese', price = 300 }, -- Cheddar Cheese - $300
            { name = 'ice',            price = 100 }, -- Ice - $100 (latest list)
            { name = 'milk',           price = 300 }, -- Milk - $300
            { name = 'coffee_beans',   price = 800 }, -- Coffee Beans - $800 (latest list)
            { name = 'ice_cream',      price = 500 }, -- Ice Cream - $500
            { name = 'sugar',          price = 300 }, -- Sugar - $300 (latest list)
            { name = 'coca_powder',    price = 400 }, -- Coca Powder - $400
        },

        coords = vec4(-1196.332, -901.363, 13.886, 166.382),
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
    },
    -- -- 🌟 Customer Rating System
    -- ratingStation = {
    --     enabled = false,
    --     coords = vec4(-1182.89, -885.36, 13.79, 300.0),
    --     ped = 'a_f_y_business_01',
    -- },
    -- -- 📋 Customer Ordering Menu
    -- orderingMenu = {
    --     enabled = false,
    --     coords = vec4(-1184.31, -884.29, 13.79, 305.0),
    --     ped = 's_f_y_airhostess_01',
    --     menu = {
    --         {
    --             categoryName = "Burgers",
    --             icon = "hamburger",
    --             items = {
    --                 { item = "beef_burger", price = 150, description = "Classic beef burger with cheese" },
    --                 { item = "chicken_burger", price = 140, description = "Grilled chicken burger" },
    --             }
    --         },
    --         {
    --             categoryName = "Sides",
    --             icon = "utensils",
    --             items = {
    --                 { item = "cheese_fries", price = 100, description = "Crispy fries with melted cheese" },
    --             }
    --         },
    --         {
    --             categoryName = "Drinks",
    --             icon = "glass",
    --             items = {
    --                 { item = "cold_coffee", price = 80, description = "Iced coffee drink" },
    --                 { item = "vanilla_shake", price = 90, description = "Creamy vanilla milkshake" },
    --                 { item = "fountain_cake", price = 70, description = "Fountain soda" },
    --             }
    --         }
    --     }
    -- },
    -- -- 💻 Business Management Laptop
    -- managementLaptop = {
    --     enabled = false,
    --     coords = {
    --         vec3(-1201.608, -894.199, 13.928), -- Office laptop location
    --     }
    -- }
}
