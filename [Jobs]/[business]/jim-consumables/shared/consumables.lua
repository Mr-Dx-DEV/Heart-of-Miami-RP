Config = Config or {}

Config.Consumables = {

    --Effects can be applied here, like stamina on coffee for example
    -- vodka = { emote = "vodkab", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "alcohol", stats = { effect = "stress", time = 5000, amount = 2, thirst = math.random(10, 20), canOD = true } },
    -- beer = { emote = "beer", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true } },
    -- whiskey = { emote = "whiskey", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true } },

    twerks_candy = { emote = "egobar", canRun = true, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 15), } },
    snikkel_candy = { emote = "egobar", canRun = true, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 15), } },

    coffee = { emote = "coffee", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { time = 10000, thirst = math.random(10, 15), } },
    water_bottle = { emote = "drink", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = 20, } },
    tosti = { emote = "sandwich", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 15), } },

    kurkakola = { emote = "ecola", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(10, 20), } },

    --[[----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- Items that effect status changes, like bleeding can cause problems as they are all handled in their own scripts
    -- Testing these but they may be best left handled by default scripts

    ["bandage"] = { 		emote = "oxy", 		time = math.random(5000, 6000), stress = 0, heal = 10, armor = 0, type = "drug", stats = { effect = "heal", amount = 3, widepupils = false, canOD = false } }, },
    ]]

    ifaks = { emote = "ifaks", time = math.random(5000, 6000), stress = 0, heal = math.random(25, 40), armor = 0, type = "medical", requiredJobs = { "police", "ambulance", "sheriff", "bcso", "sasp", "sahp" }, stats = { effect = "heal", amount = 6, widepupils = false, canOD = false } },
    cig_marlboro = { emote = "smoke3", time = math.random(6000, 8000), stress = math.random(3, 5), heal = 0, armor = 0, type = "medical", stats = {} },
    joint = { emote = "smoke3", time = math.random(6000, 8000), stress = math.random(3, 5), heal = 0, armor = 0, type = "medical", stats = {} },



    -----  cat cafe
    cat_cake = { emote = "cat_cake", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = 50 }, },
    sandwich = { emote = "sandwich", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = 40 }, },
    creamy_pasta = { emote = "creamy_pasta", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = 30 }, },

    cat_cookie = { emote = "uwu_cookie", canRun = true, time = math.random(5000, 6000), stress = 25, heal = 0, armor = 10, type = "food", stats = { screen = "focus", time = 60000, widepupils = false, canOD = false }, },


    iced_mocha = { emote = "iced_mocha", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = 50 }, },
    chocolate_latte = { emote = "chocolate_latte", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = 40 }, },
    strawberry_shake = { emote = "strawberry_shake", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = 30 }, },

    cat_cappuccino = { emote = "uwu_coffee", canRun = true, time = math.random(5000, 6000), stress = 10, heal = 0, armor = 5, type = "drink", stats = { screen = "turbo", time = 60000, widepupils = false, canOD = false }, },
    cat_black_coffee = { emote = "uwu_coffee", canRun = true, time = math.random(5000, 6000), stress = 10, heal = 0, armor = 5, type = "drink", stats = { screen = "turbo", time = 60000, widepupils = false, canOD = false }, },



    -- ===== CatCafe UwU – jim-consumable mappings =====
    dx_uwuprops_cake_a       = { emote = "uwu_cake_a", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_uwuprops_cookie_a     = { emote = "uwu_cookie", canRun = true, time = math.random(4000, 5000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_uwuprops_donut_a      = { emote = "uwu_donut", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_uwuprops_wafer_a      = { emote = "uwu_wafer", canRun = true, time = math.random(3500, 4500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_uwuprops_lollipop_a   = { emote = "uwu_lollipop", canRun = true, time = math.random(3500, 4500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_uwuprops_popsicle_a   = { emote = "uwu_popsicle", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_uwuprops_icecream_a   = { emote = "uwu_icecream", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_uwuprops_icecone_a    = { emote = "uwu_cone_a", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_uwuprops_icecone_b    = { emote = "uwu_cone_b", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_uwuprops_icecone_c    = { emote = "uwu_cone_c", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_uwuprops_icecone_d    = { emote = "uwu_cone_d", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_uwuprops_cappuccino_a = { emote = "uwu_cappuccino", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    dx_uwuprops_coffee_a     = { emote = "uwu_coffee", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    dx_uwuprops_drink_a      = { emote = "uwu_iced_a", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    dx_uwuprops_drink_b      = { emote = "uwu_iced_b", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    dx_uwuprops_drink_c      = { emote = "uwu_iced_c", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    dx_uwuprops_drink_d      = { emote = "uwu_iced_d", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },




    ------  burgershot -----

    -- ===================== Grill / BS Set =====================
    dx_food_grill_zucchini_grill_a  = { emote = "grill_zucchini", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_tofu_grill_a      = { emote = "grill_tofu", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_steak_grill_d     = { emote = "grill_ossobuco", canRun = false, time = math.random(5500, 6500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_steak_grill_c     = { emote = "grill_tbone", canRun = false, time = math.random(5500, 6500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_steak_grill_b     = { emote = "grill_tomahawk", canRun = false, time = math.random(5500, 6500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_steak_grill_a     = { emote = "grill_steak", canRun = false, time = math.random(5500, 6500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_skewer_grill_a    = { emote = "grill_skewer", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_sausage_grill_a   = { emote = "grill_sausage", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_salmon_grill_a    = { emote = "grill_salmon", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_ribs_grill_b      = { emote = "grill_rib", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_potato_grill_a    = { emote = "grill_potato", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_pineapple_grill_a = { emote = "grill_pineapple", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_naan_grill_a      = { emote = "grill_naan", canRun = true, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_mushrooms_grill_a = { emote = "grill_mushrooms", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_halloumi_grill_a  = { emote = "grill_halloumi", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_fish_grill_a      = { emote = "grill_fish", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_corn_grill_a      = { emote = "grill_corn", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_chicken_grill_d   = { emote = "grill_chx_steak", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_chicken_grill_c   = { emote = "grill_chx_wing", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_chicken_grill_b   = { emote = "grill_chx_thigh", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_camembert_grill_a = { emote = "grill_camembert", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_burger_grill_d    = { emote = "grill_burger", canRun = false, time = math.random(5500, 6500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_baguette_grill_c  = { emote = "grill_baguette", canRun = false, time = math.random(5500, 6500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    dx_food_grill_bacon_grill_a     = { emote = "grill_bacon", canRun = true, time = math.random(3500, 4500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },



    moneyshot    = { emote = "grill_burger", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    torpedo      = { emote = "grill_burger", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    rexmeatfree  = { emote = "grill_burger", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    heartstopper = { emote = "grill_burger", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    rexbleeder   = { emote = "grill_burger", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },



    -- ============================ dx_juices → consumables.lua ============================

    -- Fruits (food)
    -- fruit_apple      = { emote = "fruit_apple", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    -- fruit_banana     = { emote = "fruit_banana", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    -- fruit_cherry     = { emote = "fruit_cherry", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    -- fruit_currant    = { emote = "fruit_currant", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    -- fruit_grapefruit = { emote = "fruit_grapefruit", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    -- fruit_kiwi       = { emote = "fruit_kiwi", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    -- fruit_orange     = { emote = "fruit_orange", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    -- fruit_peach      = { emote = "fruit_peach", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    -- fruit_pear       = { emote = "fruit_pear", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    -- fruit_pineapple  = { emote = "fruit_pineapple", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    -- fruit_plum       = { emote = "fruit_plum", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    -- fruit_strawberry = { emote = "fruit_strawberry", canRun = true, time = math.random(4500, 5500), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },

    -- Glasses (drink)
    glass_apple      = { emote = "glass_apple", canRun = false, time = math.random(6000, 8000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    glass_banana     = { emote = "glass_banana", canRun = false, time = math.random(6000, 8000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    glass_cherry     = { emote = "glass_cherry", canRun = false, time = math.random(6000, 8000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    glass_currant    = { emote = "glass_currant", canRun = false, time = math.random(6000, 8000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    glass_grapefruit = { emote = "glass_grapefruit", canRun = false, time = math.random(6000, 8000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    glass_kiwi       = { emote = "glass_kiwi", canRun = false, time = math.random(6000, 8000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    glass_orange     = { emote = "glass_orange", canRun = false, time = math.random(6000, 8000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    glass_peach      = { emote = "glass_peach", canRun = false, time = math.random(6000, 8000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    glass_pear       = { emote = "glass_pear", canRun = false, time = math.random(6000, 8000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    glass_pineapple  = { emote = "glass_pineapple", canRun = false, time = math.random(6000, 8000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    glass_plum       = { emote = "glass_plum", canRun = false, time = math.random(6000, 8000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    glass_strawberry = { emote = "glass_strawberry", canRun = false, time = math.random(6000, 8000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },

    -- Cartons (drink - bigger serving)
    box_apple        = { emote = "box_apple", canRun = false, time = math.random(10000, 14000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    box_banana       = { emote = "box_banana", canRun = false, time = math.random(10000, 14000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    box_cherry       = { emote = "box_cherry", canRun = false, time = math.random(10000, 14000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    box_currant      = { emote = "box_currant", canRun = false, time = math.random(10000, 14000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    box_grapefruit   = { emote = "box_grapefruit", canRun = false, time = math.random(10000, 14000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    box_kiwi         = { emote = "box_kiwi", canRun = false, time = math.random(10000, 14000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    box_orange       = { emote = "box_orange", canRun = false, time = math.random(10000, 14000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    box_peach        = { emote = "box_peach", canRun = false, time = math.random(10000, 14000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    box_pear         = { emote = "box_pear", canRun = false, time = math.random(10000, 14000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    box_pineapple    = { emote = "box_pineapple", canRun = false, time = math.random(10000, 14000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    box_plum         = { emote = "box_plum", canRun = false, time = math.random(10000, 14000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    box_strawberry   = { emote = "box_strawberry", canRun = false, time = math.random(10000, 14000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },





    ------------------------------------ dx_restaurantfood ------------------------------------

    res_food_a = { emote = "res_food_a", canRun = false, time = math.random(16000, 18000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    res_food_b = { emote = "res_food_b", canRun = false, time = math.random(16000, 18000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    res_food_c = { emote = "res_food_c", canRun = false, time = math.random(16000, 18000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    res_food_d = { emote = "res_food_d", canRun = false, time = math.random(16000, 18000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    res_food_e = { emote = "res_food_e", canRun = false, time = math.random(16000, 18000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    res_food_f = { emote = "res_food_f", canRun = false, time = math.random(16000, 18000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    res_food_g = { emote = "res_food_g", canRun = false, time = math.random(16000, 18000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    res_food_h = { emote = "res_food_h", canRun = false, time = math.random(16000, 18000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    res_food_i = { emote = "res_food_i", canRun = false, time = math.random(16000, 18000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    res_food_j = { emote = "res_food_j", canRun = false, time = math.random(16000, 18000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    res_food_k = { emote = "res_food_k", canRun = false, time = math.random(16000, 18000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    res_food_l = { emote = "res_food_l", canRun = false, time = math.random(16000, 18000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },










    -------------  WEED GUMMIES  --------------


    bubba_kush_gummy = { emote = "oxy", canRun = true, time = math.random(5000, 6000), stress = 25, heal = 0, armor = 10, type = "drug", stats = { screen = "focus", time = 60000, widepupils = false, canOD = false } },
    --leila_delight_gummy = { emote = "oxy", canRun = true, time = math.random(5000, 6000), stress = math.random(50, 60), heal = 0, armor = math.random(1, 10), type = "drug", stats = { screen = "focus", time = 60000, widepupils = false, canOD = false } },
    pineapple_express_gummy = { emote = "oxy", canRun = true, time = math.random(5000, 6000), stress = math.random(50, 60), heal = 0, armor = math.random(1, 10), type = "drug", stats = { screen = "focus", time = 60000, widepupils = false, canOD = false } },
    northern_lights_gummy = { emote = "oxy", canRun = true, time = math.random(5000, 6000), stress = math.random(50, 60), heal = 0, armor = math.random(1, 10), type = "drug", stats = { screen = "focus", time = 60000, widepupils = false, canOD = false } },
    --maui_waui_gummy = { emote = "oxy", canRun = true, time = math.random(5000, 6000), stress = math.random(50, 60), heal = 0, armor = math.random(1, 10), type = "drug", stats = { screen = "focus", time = 60000, widepupils = false, canOD = false } },
    -- coop_goop_gummy = { emote = "oxy", canRun = true, time = math.random(5000, 6000), stress = math.random(50, 60), heal = 0, armor = math.random(1, 10), type = "drug", stats = { screen = "focus", time = 60000, widepupils = false, canOD = false } },
    -- sienna_haze_gummy = { emote = "oxy", canRun = true, time = math.random(5000, 6000), stress = math.random(50, 60), heal = 0, armor = math.random(1, 10), type = "drug", stats = { screen = "focus", time = 60000, widepupils = false, canOD = false } },
    -- frankistank_gummy = { emote = "oxy", canRun = true, time = math.random(5000, 6000), stress = math.random(50, 60), heal = 0, armor = math.random(1, 10), type = "drug", stats = { screen = "focus", time = 60000, widepupils = false, canOD = false } },




    bubba_kush_joint = { emote = "joint", canRun = true, time = math.random(5000, 10000), stress = 10, heal = 0, armor = 5, type = "drug", stats = { screen = "turbo", time = 60000, widepupils = false, canOD = false } },
    --leila_delight_joint = { 	emote = "joint",	canRun = true, time = math.random(5000,10000), stress = math.random(40, 50), heal = 0, armor = math.random(1, 5), type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },
    pineapple_express_joint = { emote = "joint", canRun = true, time = math.random(5000, 10000), stress = 5, heal = 0, type = "drug", stats = { screen = "turbo", time = 60000, widepupils = false, canOD = false } },
    northern_lights_joint = { emote = "joint", canRun = true, time = math.random(5000, 10000), stress = math.random(40, 50), heal = 0, armor = math.random(1, 5), type = "drug", stats = { screen = "turbo", time = 60000, widepupils = false, canOD = false } },
    --maui_waui_joint = { 	emote = "joint",	canRun = true, time = math.random(5000,10000), stress = math.random(40, 50), heal = 0, armor = math.random(1, 5), type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },
    -- coop_goop_joint = { 	emote = "joint",	canRun = true, time = math.random(5000,10000), stress = math.random(40, 50), heal = 0, armor = math.random(1, 5), type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },
    -- sienna_haze_joint = { 	emote = "joint",	canRun = true, time = math.random(5000,10000), stress = math.random(40, 50), heal = 0, armor = math.random(1, 5), type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },
    -- frankistank_joint = { 	emote = "joint",	canRun = true, time = math.random(5000,10000), stress = math.random(40, 50), heal = 0, armor = math.random(1, 5), type = "drug", stats = { screen = "turbo",  time = 60000, widepupils = false, canOD = false } },














    cononutshrimp = { emote = "res_food_j", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(5, 12) } },
    chickenkabobs = { emote = "grill_skewer", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(5, 20) } },
    -- fishfritters = { emote = "grill_fish", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 25) } },
    -- hp_chickenwings = { emote = "grill_chx_wing", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 25) } },
    -- chicken_fried_steak = { emote = "res_food_f", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 25), } },


    lustresort = { emote = "champagne", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(50, 70), heal = 0, armor = math.random(1, 15), type = "alcohol", stats = { thirst = math.random(5, 10), screen = "focus", widepupils = true, canOD = true } },
    darkstormy = { emote = "beer", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(45, 50), heal = 0, armor = math.random(1, 15), type = "alcohol", stats = { thirst = math.random(5, 10), screen = "focus", widepupils = true, canOD = true } },
    grimsashes = { emote = "coffee", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(40, 45), heal = 0, armor = math.random(1, 10), type = "alcohol", stats = { thirst = math.random(5, 10), screen = "focus", widepupils = true, canOD = true } },
    bloodkisses = { emote = "wine", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(35, 40), heal = 0, armor = math.random(1, 5), type = "alcohol", stats = { thirst = math.random(5, 10), screen = "focus", widepupils = true, canOD = true } },
    hellbound = { emote = "whiskey", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(30, 35), heal = 0, armor = math.random(1, 5), type = "alcohol", stats = { thirst = math.random(5, 10), screen = "focus", widepupils = true, canOD = true } },



    ----- JOE bar
    joecononutshrimp = { emote = "res_food_j", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(5, 12) } },
    joechickenkabobs = { emote = "grill_skewer", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(5, 20) } },
    -- fishfritters = { emote = "grill_fish", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 25) } },
    -- hp_chickenwings = { emote = "grill_chx_wing", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 25) } },
    -- chicken_fried_steak = { emote = "res_food_f", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 25), } },


    joebar = { emote = "champagne", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(50, 70), heal = 0, armor = math.random(1, 15), type = "alcohol", stats = { thirst = math.random(5, 10), screen = "focus", widepupils = true, canOD = true } },
    joedarkstormy = { emote = "beer", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(45, 50), heal = 0, armor = math.random(1, 15), type = "alcohol", stats = { thirst = math.random(5, 10), screen = "focus", widepupils = true, canOD = true } },
    joegrimsashes = { emote = "coffee", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(40, 45), heal = 0, armor = math.random(1, 10), type = "alcohol", stats = { thirst = math.random(5, 10), screen = "focus", widepupils = true, canOD = true } },
    joebloodkisses = { emote = "wine", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(35, 40), heal = 0, armor = math.random(1, 5), type = "alcohol", stats = { thirst = math.random(5, 10), screen = "focus", widepupils = true, canOD = true } },
    joehellbound = { emote = "whiskey", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(30, 35), heal = 0, armor = math.random(1, 5), type = "alcohol", stats = { thirst = math.random(5, 10), screen = "focus", widepupils = true, canOD = true } },



    vanillaunicorn = { emote = "whiskey", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20, 40), screen = "focus", widepupils = true, canOD = true } },
    ---- vanillaunicorn

    vanillaunicorn_raveroll = { emote = "fruit_strawberry", canRun = false, time = math.random(5000, 6000), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    vanillaunicorn_docksidedelights = { emote = "uwu9", canRun = true, time = math.random(5000, 6000), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(35, 40), } },
    vanillaunicorn_portsantosporterhouse = { emote = "sandwich", canRun = true, time = math.random(5000, 6000), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(25, 30), } },


    --   vanillaunicorn_sunsetmartini = { emote = "bscoffee", canRun = true, time = math.random(5000, 6000), stress = 25, heal = 0, armor = 10, type = "alcohol", stats = { thirst = math.random(40, 50), screen = "focus", widepupils = true, canOD = true }},
    --   vanillaunicorn_docksidebreeze = { emote = "drink", canRun = true, time = math.random(5000, 6000), stress = 10, heal = 0, armor = 9, type = "alcohol", stats = { thirst = math.random(35, 40), screen = "focus", widepupils = true, canOD = true }},
    --   vanillaunicorn_77sour = { emote = "uwu12", canRun = true, time = math.random(5000, 6000), stress = 5, heal = 0, armor = 8, type = "alcohol", stats = { thirst = math.random(35, 40), screen = "focus", widepupils = true, canOD = true }},

    vanillaunicorn_sunsetmartini = { emote = "bscoffee", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    vanillaunicorn_docksidebreeze = { emote = "drink", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35, 45) } },
    vanillaunicorn_77sour = { emote = "uwu12", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(25, 35) } },



    ----- NEW BURGERSHOT ITEMS -----
    beef_burger = { emote = "beef_burger", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    chicken_burger = { emote = "chicken_burger", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(35, 45) } },
    cheese_fries = { emote = "cheese_fries", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(25, 35) } },
    cold_coffee = { emote = "cold_coffee", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50) } },
    vanilla_shake = { emote = "vanilla_shake", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35, 45) } },
    fountain_cake = { emote = "fountain_drink", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(25, 35) } },

    ----- NEW SEA PEARL ITEMS -----
    neptunes_platter = { emote = "neptunes_platter", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = 50 } },
    fish_and_chips = { emote = "fish_and_chips", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = 40 } },
    golden_calamari = { emote = "golden_calamari", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = 30 } },
    ocean_breeze = { emote = "ocean_breeze", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = 50 } },
    coral_twist = { emote = "coral_twist", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = 40 } },
    deep_sea_kola = { emote = "deep_sea_kola", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = 30 } },

    ----- NEW JOE BAR ITEMS -----
    whiskey_twist = { emote = "whiskey_twist", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = 25, heal = 0, armor = 10, type = "alcohol", stats = { thirst = math.random(5, 10), screen = "focus", widepupils = true, canOD = true } },
    vodka_cran = { emote = "vodka_cran", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = 10, heal = 0, armor = 5, type = "alcohol", stats = { thirst = math.random(5, 10), screen = "focus", widepupils = true, canOD = true } },
    tequila_sunrise = { emote = "tequila_sunrise", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = 5, heal = 0, type = "alcohol", stats = { thirst = math.random(5, 10), screen = "focus", widepupils = true, canOD = true } },

    ----- NEW LUST RESORT ITEMS -----
    lust_platter = { emote = "lust_platter", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50) } },
    glazed_chicken = { emote = "glazed_chicken", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(35, 45) } },
    calamari_rings = { emote = "calamari_rings", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(25, 35) } },

    high_roller = { emote = "high_roller", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = 25, heal = 0, armor = 20, type = "alcohol", stats = { thirst = math.random(5, 10), screen = "focus", widepupils = true, canOD = true } },
    midnight_lust = { emote = "midnight_lust", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = 10, heal = 0, armor = 10, type = "alcohol", stats = { thirst = math.random(5, 10), screen = "focus", widepupils = true, canOD = true } },
    beachside = { emote = "beachside", canRun = false, disableWalk = false, time = math.random(5000, 6000), stress = 5, heal = 0, type = "alcohol", stats = { thirst = math.random(5, 10), screen = "focus", widepupils = true, canOD = true } },


    ----- SALT LAB CAFE ITEMS -----
    iced_mango_smoothie = { emote = "iced_mango_smoothie", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(45, 55) } },
    tropical_smoothie = { emote = "tropical_smoothie", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(35, 40) } },
    blue_mojito = { emote = "blue_mojito", canRun = false, time = math.random(5000, 6000), stress = math.random(5, 10), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(30, 35) } },

    chicken_sandwich = { emote = "chicken_sandwich", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(45, 55) } },
    veggie_wrap = { emote = "veggie_wrap", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(35, 40) } },
    brownie = { emote = "brownie", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(30, 35) } },


    --Testing effects & armor with small functionality to drugs - This may be another one left to default scripts
    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    --[[ --Testing effects & armor with small functionality to drugs - This may be another one left to default scripts


    cokebaggy = { 		emote = "coke",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 0, type = "drug", stats = { screen = "focus", effect = "stamina", widepupils = false, canOD = true } },
    --crackbaggy = { 		emote = "coke",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 0, type = "drug", stats = { effect = "heal", widepupils = false, canOD = true } },
    xtcbaggy = { 		emote = "oxy",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 10, type = "drug", stats = { effect = "strength", widepupils = true, canOD = true } },
    oxy = { 			emote = "oxy",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 0, type = "drug", stats = { effect = "heal", widepupils = false, canOD = false } },
    meth = { 			emote = "coke",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 10, type = "drug", stats = { effect = "stamina", widepupils = false, canOD = true } },
    ]] ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    --Example item
    --    heartstopper = {
    --        emote = "burger", 							-- Select an emote from below, it has to be in here
    --        time = math.random(5000, 6000),				-- Amount of time it takes to consume the item
    --        stress = math.random(1,2),					-- Amount of stress relief, can be 0
    --        heal = 0, 									-- Set amount to heal by after consuming
    --        armor = 5,									-- Amount of armor to add
    --        type = "food",								-- Type: "alcohol" / "drink" / "food"
    --        canRun = true,                                -- If true player can run while using the item, if not it will cancel the event
    --
    --        stats = {
    --            screen = "thermal",						-- The screen effect to be played when after consuming the item "rampage" "turbo" "focus" "weed" "trevor" "nightvision" "thermal"
    --            effect = "heal", 						    -- The status effect given by the item, "heal" / "stamina"
    --                                                      -- This supports ps-buffs effects "armor" "stress" "swimming" "hacking" "intelligence" "luck" "strength"
    --            time = 10000,							    -- How long the effect should last (if not added it will default to 10000)
    --            amount = 6,								-- How much the value is changed by per second
    --            hunger = math.random(10, 20),			    -- The hunger/thirst stats of the item, if not found in the items.lua
    --            thirst = math.random(10, 20),			    -- The hunger/thirst stats of the item, if not found in the items.lua
    --            canOD = true,                             -- This creates an OD Effect, killing the user if they have too much
    --        },
    --        --Reward Items Variables
    --                                                      -- These can be the only thing in a consumable table and the item will still work
    --        amounttogive = 3,							    -- Used for "RewardItems", tells the script how many to give
    --        rewards = {
    --            [1] = {
    --                item = "plastic", 					-- prize item name
    --                max = 10,							    -- max amount to give (this is put into math.random(1, max) )
    --                rarity = 1,							-- the rarity system, 1 being rarest, 4 being most common
    --            },
    --        },
    --    },

    -- Example Box Item
    --    ["9_box"] = {                                     -- Name of the box item in the shared
    --        emote = "uncuff",                             -- The emote than should run when "unboxing"
    --        canRun = true,                                -- If true player can run while using the item, if not it will cancel the event
    --        time = 3500,                                  -- How long it takes to use the item
    --        type = "pack",                                -- Designate it as a "pack" to the script knows what to do
    --        pack = {
    --            item = "9_ammo",                          -- The item to give from the box when complete
    --            amount = 20                               -- How many of the item to give
    --        },
    --    },

    -- Example Cigar Item wiht requirements
    --    ["cigar"] = {                                     -- Name of the item in your shared items
    --        emote = "smokecigar",                         -- The emote than should run when "smoking"
    --        canRun = true,                                -- If true player can run while using the item, if not it will cancel the event
    --        time = math.random(5000, 6000),               -- How long it takes to use the item
    --        type = "smoke",                               -- Designate it as a "smoke" to the script knows what to do
    --        requiredItem = "lighter",                     -- Set a required item making it unsable if they don't have it
    --        stats = {
    --            effect = "stress",
    --            time = 5000,
    --            amount = math.random(10, 15),
    --            canOD = false
    --        }
    --    },
}
