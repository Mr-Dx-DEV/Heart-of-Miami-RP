Config = Config or {}

Config.Emotes = {
     --Jim-VanillaUnicorn
    whiskeyb = { "mp_player_intdrink", "loop_bottle", "(Don't Use) Whiskey Bottle", AnimationOptions = { Prop = "prop_cs_whiskey_bottle", PropBone = 60309, PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0 }, EmoteMoving = true, EmoteLoop = true } },
    rumb = { "mp_player_intdrink", "loop_bottle", "(Don't Use) Rum Bottle", AnimationOptions = { Prop = "prop_rum_bottle", PropBone = 18905, PropPlacement = { 0.03, -0.18, 0.10, 240.0, -60.0 }, EmoteMoving = true, EmoteLoop = true } },
    icream = { " mp_player_intdrink", "loop_bottle", "Irish Cream Bottle", AnimationOptions = { Prop = "prop_bottle_brandy", PropBone = 18905, PropPlacement = { 0.00, -0.26, 0.10, 240.0, -60.0 }, EmoteMoving = true, EmoteLoop = true } },
    ginb = { "mp_player_intdrink", "loop_bottle", "(Don't Use) Gin Bottle", AnimationOptions = { Prop = "prop_tequila_bottle", PropBone = 18905, PropPlacement = { 0.00, -0.26, 0.10, 240.0, -60.0 }, EmoteMoving = true, EmoteLoop = true } },
   
    beer1 = { "mp_player_intdrink", "loop_bottle", "Dusche", AnimationOptions = { Prop = "prop_beerdusche", PropBone = 18905, PropPlacement = { 0.04, -0.14, 0.10, 240.0, -60.0 }, EmoteMoving = true, EmoteLoop = true, } },
    beer2 = { "mp_player_intdrink", "loop_bottle", "Logger", AnimationOptions = { Prop = "prop_beer_logopen", PropBone = 18905, PropPlacement = { 0.03, -0.18, 0.10, 240.0, -60.0 }, EmoteMoving = true, EmoteLoop = true, } },
    beer3 = { "mp_player_intdrink", "loop_bottle", "AM Beer", AnimationOptions = { Prop = "prop_beer_amopen", PropBone = 18905, PropPlacement = { 0.03, -0.18, 0.10, 240.0, -60.0 }, EmoteMoving = true, EmoteLoop = true, } },
    beer4 = { "mp_player_intdrink", "loop_bottle", "Pisswasser1", AnimationOptions = { Prop = "prop_beer_pissh", PropBone = 18905, PropPlacement = { 0.03, -0.18, 0.10, 240.0, -60.0 }, EmoteMoving = true, EmoteLoop = true, } },
    beer5 = { "mp_player_intdrink", "loop_bottle", "Pisswasser2", AnimationOptions = { Prop = "prop_amb_beer_bottle", PropBone = 18905, PropPlacement = { 0.12, 0.008, 0.03, 240.0, -60.0 }, EmoteMoving = true, EmoteLoop = true, } },
    beer6 = { "mp_player_intdrink", "loop_bottle", "Pisswasser3", AnimationOptions = { Prop = "prop_cs_beer_bot_02", PropBone = 18905, PropPlacement = { 0.12, 0.008, 0.03, 240.0, -60.0 }, EmoteMoving = true, EmoteLoop = true, } },
    




    drink = { "mp_player_intdrink", "loop_bottle", "Drink",                                     AnimationOptions = { Prop = "prop_ld_flow_bottle",      PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
    milk = {"mp_player_intdrink", "loop_bottle", "Glass of milk",                               AnimationOptions = { Prop = 'bzzz_farmprops_milk_a',    PropBone = 18905, PropPlacement = {-0.02, -0.04, 0.1, 34.0, 140.0, 224.0}, EmoteLoop = true, EmoteMoving = true, }},
    coffee = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee",                AnimationOptions = { Prop = 'p_amb_coffeecup_01',       PropBone = 28422, PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0}, EmoteLoop = true, EmoteMoving = true }},
    burger = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Burger",	                AnimationOptions = { Prop = 'prop_cs_burger_01',        PropBone = 18905, PropPlacement = {0.13,0.05,0.02,-50.0,16.0,60.0}, EmoteMoving = true }},
    beer = {"amb@world_human_drinking@beer@male@idle_a", "idle_c", "Beer",                      AnimationOptions = { Prop = 'prop_amb_beer_bottle',     PropBone = 28422, PropPlacement = {0.0,0.0,0.06,0.0,15.0,0.0}, EmoteLoop = true, EmoteMoving = true }},
    egobar = {"mp_player_inteat@burger", "mp_player_int_eat_burger","Ego Bar",                  AnimationOptions = { Prop = 'prop_choc_ego',            PropBone = 60309, PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0}, EmoteMoving = true }},
    sandwich = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Sandwich",              AnimationOptions = { Prop = 'prop_sandwich_01',         PropBone = 18905, PropPlacement = {0.13,0.05,0.02,-50.0,16.0,60.0}, EmoteMoving = true }},
    apple = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Apple",                    AnimationOptions = { Prop = 'idrp_apple_solo',          PropBone = 18905, PropPlacement = {0.13,0.05,0.02,-50.0,16.0,60.0}, EmoteMoving = true }},
    avacado = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Avacado",                AnimationOptions = { Prop = 'idrp_avo_solo',            PropBone = 18905, PropPlacement = {0.13,0.05,0.02,-50.0,16.0,60.0}, EmoteMoving = true }},
    banana = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Banana",                  AnimationOptions = { Prop = 'idrp_bana_solo',           PropBone = 18905, PropPlacement = {0.13,0.05,0.02,-50.0,16.0,60.0}, EmoteMoving = true }},
    carrot = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Carrot",                  AnimationOptions = { Prop = 'idrp_carrot_single',       PropBone = 18905, PropPlacement = {0.13,0.05,0.02,-50.0,16.0,60.0}, EmoteMoving = true }},
    orange = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Orange",                  AnimationOptions = { Prop = 'idrp_bana_solo',           PropBone = 18905, PropPlacement = {0.13,0.05,0.02,-50.0,16.0,60.0}, EmoteMoving = true }},
    smoke3 = { "amb@world_human_aa_smoke@male@idle_a", "idle_b", "Smoke 3",                     AnimationOptions = { Prop = 'prop_cs_ciggy_01',         PropBone = 28422, PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0}, EmoteLoop = true, EmoteMoving = true }},
    whiskey = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Whiskey",             AnimationOptions = { Prop = 'prop_drink_whisky',        PropBone = 28422, PropPlacement = {0.01,-0.01,-0.06,0.0,0.0,0.0}, EmoteLoop = true, EmoteMoving = true } },
    vodkab = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Vodka Bottle",                  AnimationOptions = { Prop = 'prop_vodka_bottle',        PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true }},
    cherenkov1 = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Vodka Bottle",              AnimationOptions = { Prop = 'prop_cherenkov_01',        PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true }},
    cherenkov2 = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Vodka Bottle",              AnimationOptions = { Prop = 'prop_cherenkov_04',        PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true }},
    cherenkov3 = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Vodka Bottle",              AnimationOptions = { Prop = 'prop_cherenkov_03',        PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true }},
    cherenkov4 = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Vodka Bottle",              AnimationOptions = { Prop = 'prop_cherenkov_02',        PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true }},
    bleuturd = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Vodka Bottle",                AnimationOptions = { Prop = 'prop_champ_01b',           PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true }},
    bourgeoix = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Vodka Bottle",               AnimationOptions = { Prop = 'prop_bottle_cognac',       PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true }},
    cardiaque = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Vodka Bottle",               AnimationOptions = { Prop = 'prop_bottle_brandy',       PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true }},
    raggae = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Vodka Bottle",                  AnimationOptions = { Prop = 'prop_rum_bottle',          PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true }},
    ecola = {"mp_player_intdrink", "loop_bottle", "E-cola",                                     AnimationOptions = { Prop = "prop_ecola_can",           PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
    crisps = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Chrisps",               AnimationOptions = { Prop = 'v_ret_ml_chips2',          PropBone = 28422, PropPlacement = {0.01, -0.05, -0.1, 0.0, 0.0, 90.0}, EmoteLoop = true, EmoteMoving = true, }},
    sprunk = {"mp_player_intdrink", "loop_bottle", "Sprunk",                                    AnimationOptions = { Prop = "v_res_tt_can03",           PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
    wine = { "anim@heists@humane_labs@finale@keycards",	"ped_a_enter_loop",	"Wine",             AnimationOptions = { Prop = 'prop_drink_redwine',       PropBone = 18905, PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0}, EmoteMoving = true, EmoteLoop = true }},
    champagne = { "anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Champagne",   AnimationOptions = { Prop = 'prop_drink_champ',         PropBone = 18905, PropPlacement = { 0.10, -0.03, 0.03, -100.0, 0.0, -10.0 }, EmoteMoving = true, EmoteLoop = true }},
    croissant = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Croissant",           AnimationOptions = { Prop = 'bzzz_foodpack_croissant001', PropBone = 60309, PropPlacement = { 0.00, 0.0, -0.01, 0.0, 0.0, 90.0 }, EmoteMoving = true }},
    cup = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Cup",                     AnimationOptions = { Prop = 'prop_plastic_cup_02',      PropBone = 28422, PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 }, EmoteLoop = true, EmoteMoving = true }},
    desert = { "mp_player_inteat@burger", "mp_player_int_eat_burger","Eat dessert",             AnimationOptions = { Prop = 'bzzz_food_dessert_a',      PropBone = 18905, PropPlacement = { 0.15, 0.03, 0.03, -42.0, -36.0, 0.0 }, EmoteMoving = true}},
    dinner = { "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "Dinner", AnimationOptions = { Prop = "prop_cs_plate_01", PropBone = 60309, PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0 }, SecondProp = 'h4_prop_h4_caviar_spoon_01a', SecondPropBone = 28422, SecondPropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 }, EmoteLoop = true, EmoteMoving = true }},
    flute = { "anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Flute",           AnimationOptions = { Prop = 'prop_champ_flute',         PropBone = 18905, PropPlacement = { 0.10, -0.03, 0.03, -100.0, 0.0, -10.0 }, EmoteMoving = true, EmoteLoop = true }},
    frappe = { "amb@code_human_wander_drinking@male@base", "static", "Frappe",                  AnimationOptions = { Prop = 'brum_heartfrappe',         PropBone = 28422, PropPlacement = { 0.0, -0.0150, -0.0100, 0.0, -3.9999, 0.0 }, EmoteLoop = true, EmoteMoving = true }},
    frappe2 = { "amb@code_human_wander_drinking@female@base", "static", "Frappe 2",             AnimationOptions = { Prop = 'beanmachine_cup',          PropBone = 28422, PropPlacement = { 0.0110, 0.0, 0.0300, 0.0, 0.0, -140.0 }, EmoteLoop = true, EmoteMoving = true }},
    frappe3 = { "amb@code_human_wander_drinking@female@base", "static", "Frappe 3",             AnimationOptions = { Prop = 'beanmachine_cup2',         PropBone = 28422, PropPlacement = { 0.0, 0.0, -0.0600, 0.0, 0.0, -178.0 }, EmoteLoop = true, EmoteMoving = true }},
    frappe4 = { "amb@code_human_wander_drinking@female@base", "static", "Frappe 4",             AnimationOptions = { Prop = 'beanmachine_cup3',         PropBone = 28422, PropPlacement = { 0.0, 0.0, -0.0600, 0.0, 0.0, -178.0 }, EmoteLoop = true, EmoteMoving = true }},
    hotdog = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Hotdog",                 AnimationOptions = { Prop = 'prop_cs_hotdog_02',        PropBone = 60309, PropPlacement = { -0.0300, 0.0100, -0.0100, 95.1071, 94.7001, -66.9179 }, EmoteMoving = true }},
    icecreama = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Ice cream Cherry",    AnimationOptions = { Prop = 'bzzz_icecream_cherry',     PropBone = 18905, PropPlacement = { 0.14, 0.03, 0.01, 85.0, 70.0, -203.0 }, EmoteMoving = true }},
    icecreamb = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Ice cream Chocolate", AnimationOptions = { Prop = 'bzzz_icecream_chocolate',  PropBone = 18905, PropPlacement = { 0.14, 0.03, 0.01, 85.0, 70.0, -203.0 }, EmoteMoving = true }},
    icecreamc = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Ice cream Lemon",     AnimationOptions = { Prop = 'bzzz_icecream_lemon',      PropBone = 18905, PropPlacement = { 0.14, 0.03, 0.01, 85.0, 70.0, -203.0 }, EmoteMoving = true }},
    icecreamd = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Ice cream Pistachio", AnimationOptions = { Prop = 'bzzz_icecream_pistachio',  PropBone = 18905, PropPlacement = { 0.14, 0.03, 0.01, 85.0, 70.0, -203.0 }, EmoteMoving = true }},
    icecreame = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Ice cream Raspberry", AnimationOptions = { Prop = 'bzzz_icecream_raspberry',  PropBone = 18905, PropPlacement = { 0.14, 0.03, 0.01, 85.0, 70.0, -203.0 }, EmoteMoving = true }},
    icecreamf = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Ice cream Stracciatella", AnimationOptions = { Prop = 'bzzz_icecream_stracciatella', PropBone = 18905, PropPlacement = { 0.14, 0.03, 0.01, 85.0, 70.0, -203.0 }, EmoteMoving = true }},
    icecreamg = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Ice cream Strawberry", AnimationOptions = { Prop = 'bzzz_icecream_strawberry', PropBone = 18905, PropPlacement = { 0.14, 0.03, 0.01, 85.0, 70.0, -203.0 }, EmoteMoving = true }},
    icecreamh = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Ice cream Walnut",    AnimationOptions = { Prop = 'bzzz_icecream_walnut',     PropBone = 18905, PropPlacement = { 0.14, 0.03, 0.01, 85.0, 70.0, -203.0 }, EmoteMoving = true }},
    macaroon = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Macaroon",             AnimationOptions = { Prop = 'bzzz_food_xmas_macaroon_a', PropBone = 18905, PropPlacement = { 0.15, 0.07, 0.00, 38.0, 7.0, 7.0 }, EmoteMoving = true }},
    sipshake = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Milkshake - Bubblegum",      AnimationOptions = { Prop = 'brum_cherryshake_raspberry', PropBone = 28422, PropPlacement = { 0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318 }, EmoteLoop = true, EmoteMoving = true }},
    sipshakeb = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Milkshake - Cherry",        AnimationOptions = { Prop = 'brum_cherryshake_cherry',  PropBone = 28422, PropPlacement = { 0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318 }, EmoteLoop = true, EmoteMoving = true }},
    sipshakec = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Milkshake - Chocolate",     AnimationOptions = { Prop = 'brum_cherryshake_chocolate', PropBone = 28422, PropPlacement = { 0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318 }, EmoteLoop = true, EmoteMoving = true }},
    sipshaked = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Milkshake - Coffee",        AnimationOptions = { Prop = 'brum_cherryshake_coffee',  PropBone = 28422, PropPlacement = { 0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318 }, EmoteLoop = true, EmoteMoving = true }},
    sipshakee = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Milkshake - Double Chocolate", AnimationOptions = { Prop = 'brum_cherryshake_doublechocolate', PropBone = 28422, PropPlacement = { 0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318 }, EmoteLoop = true, EmoteMoving = true }},
    sipshakef = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Milkshake - Frappe",        AnimationOptions = { Prop = 'brum_cherryshake_frappe', PropBone = 28422, PropPlacement = { 0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318 }, EmoteLoop = true, EmoteMoving = true }},
    sipshakeg = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Milkshake - Lemon",         AnimationOptions = { Prop = 'brum_cherryshake_lemon', PropBone = 28422, PropPlacement = { 0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318 }, EmoteLoop = true, EmoteMoving = true }},
    sipshakeh = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Milkshake - Mint",          AnimationOptions = { Prop = 'brum_cherryshake_mint', PropBone = 28422, PropPlacement = { 0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318 }, EmoteLoop = true, EmoteMoving = true }},
    sipshakei = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Milkshake - Strawberry",    AnimationOptions = { Prop = 'brum_cherryshake_strawberry', PropBone = 28422, PropPlacement = { 0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318 }, EmoteLoop = true, EmoteMoving = true }},
    sipshakej = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Milkshake - Raspberry",     AnimationOptions = { Prop = 'brum_cherryshake_raspberry', PropBone = 28422, PropPlacement = { 0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318 }, EmoteLoop = true, EmoteMoving = true }},
    sipshakek = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Milkshake - Salted",        AnimationOptions = { Prop = 'brum_cherryshake_salted', PropBone = 28422, PropPlacement = { 0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318 }, EmoteLoop = true, EmoteMoving = true }},
    sipshakel = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Milkshake - Vanilla",       AnimationOptions = { Prop = 'brum_cherryshake_vanilla', PropBone = 28422, PropPlacement = { 0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318 }, EmoteLoop = true, EmoteMoving = true }},
    pizzaslice = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Pizza Slice - Jalapeño And Peperoni", AnimationOptions = { Prop = 'knjgh_pizzaslice1', PropBone = 60309, PropPlacement = { 0.0500, -0.0200, -0.0200, 73.6928, -66.7427, 68.3677 }, EmoteMoving = true }},
    pizzas = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Pizza Slice - Jalapeño And Peperoni", AnimationOptions = { Prop = 'knjgh_pizzaslice1', PropBone = 60309, PropPlacement = { 0.0500, -0.0200, -0.0200, 73.6928, -66.7427, 68.3677 }, EmoteMoving = true }},
    pizzas2 = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Pizza Slice - Tomato And Pesto", AnimationOptions = { Prop = 'knjgh_pizzaslice2', PropBone = 60309, PropPlacement = { 0.0500, -0.0200, -0.0200, 73.6928, -66.7427, 68.3677 }, EmoteMoving = true }},
    pizzas3 = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Pizza Slice - Mushroom", AnimationOptions = { Prop = 'knjgh_pizzaslice3', PropBone = 60309, PropPlacement = { 0.0500, -0.0200, -0.0200, 73.6928, -66.7427, 68.3677 }, EmoteMoving = true }},
    pizzas4 = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Pizza Slice - Margherita", AnimationOptions = { Prop = 'knjgh_pizzaslice4', PropBone = 60309, PropPlacement = { 0.0500, -0.0200, -0.0200, 73.6928, -66.7427, 68.3677 }, EmoteMoving = true }},
    pizzas5 = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Pizza Slice - Double Peperoni", AnimationOptions = { Prop = 'knjgh_pizzaslice5', PropBone = 60309, PropPlacement = { 0.0500, -0.0200, -0.0200, 73.6928, -66.7427, 68.3677 }, EmoteMoving = true }},
    popcorn = { "amb@code_human_wander_drinking@female@base", "static", "Popcorn",              AnimationOptions = { Prop = 'prop_taymckenzienz_popcorn', PropBone = 28422, PropPlacement = { -0.0200, -0.0100, -0.0700, -179.3626, 176.9331, 11.9833 }, EmoteLoop = true, EmoteMoving = true }},
    sipsoda = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Soda Cup - Sprunk",           AnimationOptions = { Prop = 'prop_rpemotes_soda01', PropBone = 28422, PropPlacement = { 0.0470, 0.0040, -0.0600, -88.0263, -25.0367, -27.3898 }, EmoteLoop = true, EmoteMoving = true }},
    sipsodab = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Soda Cup - Sprunk Light",    AnimationOptions = { Prop = 'prop_rpemotes_soda02', PropBone = 28422, PropPlacement = { 0.0470, 0.0040, -0.0600, -88.0263, -25.0367, -27.3898 }, EmoteLoop = true, EmoteMoving = true }},
    sipsodac = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Soda Cup - eCola",           AnimationOptions = { Prop = 'prop_rpemotes_soda03', PropBone = 28422, PropPlacement = { 0.0470, 0.0040, -0.0600, -88.0263, -25.0367, -27.3898 }, EmoteLoop = true, EmoteMoving = true }},
    sipsodad = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Soda Cup - eCola Light",     AnimationOptions = { Prop = 'prop_rpemotes_soda04', PropBone = 28422, PropPlacement = { 0.0470, 0.0040, -0.0600, -88.0263, -25.0367, -27.3898 }, EmoteLoop = true, EmoteMoving = true }},
    taco = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Taco",                     AnimationOptions = { Prop = 'prop_taco_01', PropBone = 60309, PropPlacement = { -0.0170, 0.0070, -0.0210, 107.9846, -105.0251, 55.7779 }, EmoteMoving = true }},
    xmascc = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Xmas Cupcake",           AnimationOptions = { Prop = 'pata_christmasfood6', PropBone = 60309, PropPlacement = { 0.0100, 0.0200, -0.0100, -170.1788, 87.6716, 30.0540 }, EmoteMoving = true }},
    xmascc2 = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Xmas Cupcake 2",        AnimationOptions = { Prop = 'pata_christmasfood8', PropBone = 60309, PropPlacement = { 0.0200, 0.0, -0.0100, 9.3608, -90.1809, 66.3689 }, EmoteMoving = true }},
    xmasic = { "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "Xmas Ice Cream", AnimationOptions = { Prop = "pata_christmasfood7", PropBone = 60309, PropPlacement = { -0.0460, 0.0000, -0.0300, 0.0, 0.0, -50.0000 }, SecondProp = 'h4_prop_h4_coke_spoon_01', SecondPropBone = 28422, SecondPropPlacement = { 0.0, 0.0, 0.0, 0.0, 20.0, 0.0 }, EmoteLoop = true, EmoteMoving = true }},
    xmaswine = { "mp_player_intdrink", "loop_bottle", "Xmas Mulled Wine",                       AnimationOptions = { Prop = 'bzzz_food_xmas_mulled_wine_a', PropBone = 18905, PropPlacement = { 0.13, 0.03, 0.05, -110.0, -47.0, 7.0 }, EmoteMoving = true }},
    cocoa = { "amb@world_human_aa_coffee@base", "base", "Xmas Cocoa",                           AnimationOptions = { Prop = 'pata_christmasfood1', PropBone = 28422, PropPlacement = { 0.0100, -0.1100, -0.1300, 0.0, 0.0, 0.0 }, EmoteLoop = true, EmoteMoving = true }},
    coke = { "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", "Coke",               AnimationOptions = { EmoteLoop = true, EmoteMoving = true }},
    oxy = { "mp_suicide", "pill", "Oxy",                                                        AnimationOptions = { EmoteLoop = true, EmoteMoving = true }},
    cigar = { "amb@world_human_smoking@male@male_a@enter", "enter", "Cigar",                    AnimationOptions = { Prop = 'prop_cigar_02', PropBone = 47419, PropPlacement = { 0.010, 0.0, 0.0, 50.0, 0.0, -80.0 }, EmoteMoving = true, EmoteDuration = 2600 }},
    cigar2 = { "amb@world_human_smoking@male@male_a@enter", "enter", "Cigar 2",                 AnimationOptions = { Prop = 'prop_cigar_01', PropBone = 47419, PropPlacement = { 0.010, 0.0, 0.0, 50.0, 0.0, -80.0 }, EmoteMoving = true, EmoteDuration = 2600 }},
    joint = { "amb@world_human_smoking@male@male_a@enter", "enter", "Joint",                    AnimationOptions = { Prop = 'p_cs_joint_02', PropBone = 47419, PropPlacement = { 0.015, -0.009, 0.003, 55.0, 0.0, 110.0 }, EmoteMoving = true, EmoteDuration = 2600 }},
    cig = { "amb@world_human_smoking@male@male_a@enter", "enter", "Cig",                        AnimationOptions = { Prop = 'prop_amb_ciggy_01', PropBone = 47419, PropPlacement = { 0.015, -0.009, 0.003, 55.0, 0.0, 110.0 }, EmoteMoving = true, EmoteDuration = 2600 }},
    smoke2 = { "amb@world_human_aa_smoke@male@idle_a", "idle_c", "Smoke 2",                     AnimationOptions = { Prop = 'prop_cs_ciggy_01', PropBone = 28422, PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 }, EmoteLoop = true, EmoteMoving = true }},
    smokecigar = { "amb@world_human_aa_smoke@male@idle_a", "idle_c", "Smoke Cigar",             AnimationOptions = { Prop = 'prop_cigar_01', PropBone = 28422, PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 180.0 }, EmoteLoop = true, EmoteMoving = true }},
    uncuff = { "mp_arresting", "a_uncuff", "Uncuff",                                            AnimationOptions = { EmoteLoop = true, EmoteMoving = true }},
    bandage = {
        "anim@amb@business@weed@weed_inspecting_high_dry@",
        "weed_inspecting_high_base_inspector",
        "Bandaging",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ifaks = {
        "mp_suicide",
        "pill",
        "ifaks",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = true
        }
    },



    -- UWU EMOTE START

    uwu1 = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_sml_drink', PropBone = 28422, PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 130.0 }, EmoteLoop = true, EmoteMoving = true, } },
    uwu2 = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_lrg_drink', PropBone = 28422, PropPlacement = { 0.03, 0.0, -0.08, 0.0, 0.0, 130.0 }, EmoteLoop = true, EmoteMoving = true, } },
    uwu3 = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_cup_straw', PropBone = 28422, PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 130.0 }, EmoteLoop = true, EmoteMoving = true, } },
    uwu4 = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_mug', PropBone = 28422, PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 130.0 }, EmoteLoop = true, EmoteMoving = true, } },
    uwu5 = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions = { Prop = 'uwu_pastry', PropBone = 18905, PropPlacement = { 0.16, 0.06, -0.03, -50.0, 16.0, 60.0 }, EmoteMoving = true, } },
    uwu6 = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions = { Prop = 'uwu_cookie', PropBone = 18905, PropPlacement = { 0.16, 0.08, -0.01, -225.0, 20.0, 60.0 }, EmoteMoving = true, } },
    uwu7 = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions = { Prop = 'uwu_sushi', PropBone = 18905, PropPlacement = { 0.18, 0.03, 0.02, -50.0, 16.0, 60.0 }, EmoteMoving = true, } },
    uwu8 = { "amb@world_human_seat_wall_eating@male@both_hands@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_eggroll', PropBone = 60309, PropPlacement = { 0.10, 0.03, 0.08, -95.0, 60.0, 0.0 }, EmoteMoving = true, } },
    uwu9 = { "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "", AnimationOptions = { Prop = "uwu_salad_bowl", PropBone = 60309, PropPlacement = { 0.0, 0.0300, 0.0100, 0.0, 0.0, 0.0 }, SecondProp = 'uwu_salad_spoon', SecondPropBone = 28422, SecondPropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 }, EmoteLoop = true, EmoteMoving = true, } },
    uwu10 = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions = { Prop = 'uwu_sandy', PropBone = 18905, PropPlacement = { 0.16, 0.08, 0.05, -225.0, 20.0, 60.0 }, EmoteMoving = true, } },
    uwu11 = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_cupcake', PropBone = 28422, PropPlacement = { 0.0, 0.0, -0.03, 0.0, 0.0, 130.0 }, EmoteLoop = true, EmoteMoving = true, } },
    uwu12 = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_btea', PropBone = 28422, PropPlacement = { 0.02, 0.0, -0.05, 0.0, 0.0, 130.0 }, EmoteLoop = true, EmoteMoving = true, } },
    uwu13 = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions = { Prop = 'uwu_gdasik', PropBone = 18905, PropPlacement = { 0.16, 0.08, 0.02, -225.0, 20.0, 60.0 }, EmoteMoving = true, } },
    
    -- UWU EMOTE END

    --BURGER SHOT EMOTE START
    torpedo = { "mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Torpedo", AnimationOptions = { Prop = "prop_food_bs_burger2", PropBone = 18905, PropPlacement = { 0.10, -0.07, 0.091, 15.0, 135.0 }, EmoteMoving = true, EmoteLoop = true, } },
    bsfries = { "mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Fries", AnimationOptions = { Prop = "prop_food_bs_chips", PropBone = 18905, PropPlacement = { 0.09, -0.06, 0.05, 300.0, 150.0 }, EmoteMoving = true, EmoteLoop = true, } },
    donut = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut", AnimationOptions = { Prop = 'prop_amb_donut', PropBone = 18905, PropPlacement = { 0.13, 0.05, 0.02, -50.0, 16.0, 60.0 }, EmoteMoving = true } },
    bscoke = { "mp_player_intdrink", "loop_bottle", "BS Coke", AnimationOptions = { Prop = "prop_food_bs_juice01", PropBone = 18905, PropPlacement = { 0.04, -0.10, 0.10, 240.0, -60.0 }, EmoteMoving = true, EmoteLoop = true, } },
    bscoffee = { "mp_player_intdrink", "loop_bottle", "BS Coffee", AnimationOptions = { Prop = "prop_food_bs_coffee", PropBone = 18905, PropPlacement = { 0.08, -0.10, 0.10, 240.0, -60.0 }, EmoteMoving = true, EmoteLoop = true, } },

    -- BURGER SHOT EMOTE END

 



-- ===== CatCafe UwU EMOTES (placements synced with item configs) =====

-- FOOD
uwu_cake_a = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "UwU Cake",
    AnimationOptions = { Prop = "bzzz_uwuprops_cake_a", PropBone = 18905, PropPlacement = {0.15, 0.06, 0.03, 22.0, 142.0, 0.0}, EmoteMoving = true, EmoteLoop = true }},

uwu_cookie = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "UwU Cookie",
    AnimationOptions = { Prop = "bzzz_uwuprops_cookie_a", PropBone = 18905, PropPlacement = {0.15, 0.06, 0.02, 29.0, 142.0, 0.0}, EmoteMoving = true, EmoteLoop = true }},

uwu_donut = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "UwU Donut",
    AnimationOptions = { Prop = "bzzz_uwuprops_donut_a", PropBone = 18905, PropPlacement = {0.15, 0.06, 0.03, 22.0, 142.0, 0.0}, EmoteMoving = true, EmoteLoop = true }},

uwu_icecream = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "UwU Ice Cream",
    AnimationOptions = { Prop = "bzzz_uwuprops_icecream_a", PropBone = 18905, PropPlacement = {0.15, 0.06, 0.02, -48.0, 142.0, 0.0}, EmoteMoving = true, EmoteLoop = true }},

uwu_cone_a = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "UwU Cone A",
    AnimationOptions = { Prop = "bzzz_uwuprops_icecone_a", PropBone = 18905, PropPlacement = {0.15, 0.06, 0.02, -62.0, 142.0, 0.0}, EmoteMoving = true, EmoteLoop = true }},
uwu_cone_b = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "UwU Cone B",
    AnimationOptions = { Prop = "bzzz_uwuprops_icecone_b", PropBone = 18905, PropPlacement = {0.15, 0.06, 0.02, -62.0, 142.0, 0.0}, EmoteMoving = true, EmoteLoop = true }},
uwu_cone_c = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "UwU Cone C",
    AnimationOptions = { Prop = "bzzz_uwuprops_icecone_c", PropBone = 18905, PropPlacement = {0.15, 0.06, 0.02, -62.0, 142.0, 0.0}, EmoteMoving = true, EmoteLoop = true }},
uwu_cone_d = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "UwU Cone D",
    AnimationOptions = { Prop = "bzzz_uwuprops_icecone_d", PropBone = 18905, PropPlacement = {0.15, 0.06, 0.02, -62.0, 142.0, 0.0}, EmoteMoving = true, EmoteLoop = true }},

uwu_popsicle = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "UwU Popsicle",
    AnimationOptions = { Prop = "bzzz_uwuprops_popsicle_a", PropBone = 18905, PropPlacement = {0.16, 0.07, 0.0, -32.0, -32.0, 0.0}, EmoteMoving = true, EmoteLoop = true }},

uwu_wafer = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "UwU Wafer",
    AnimationOptions = { Prop = "bzzz_uwuprops_wafer_a", PropBone = 18905, PropPlacement = {0.15, 0.06, 0.02, 29.0, 142.0, 0.0}, EmoteMoving = true, EmoteLoop = true }},

uwu_lollipop = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "UwU Lollipop",
    AnimationOptions = { Prop = "bzzz_uwuprops_lollipop_a", PropBone = 18905, PropPlacement = {0.16, 0.07, 0.0, -32.0, -32.0, 0.0}, EmoteMoving = true, EmoteLoop = true }},


-- DRINKS
uwu_cappuccino = { "mp_player_intdrink", "loop_bottle", "UwU Cappuccino",
    AnimationOptions = { Prop = "bzzz_uwuprops_cappuccino_a", PropBone = 18905, PropPlacement = {0.12, 0.0, 0.04, -40.0, 106.0, -17.0}, EmoteMoving = true, EmoteLoop = true }},

uwu_coffee = { "mp_player_intdrink", "loop_bottle", "UwU Coffee",
    AnimationOptions = { Prop = "bzzz_uwuprops_coffee_a", PropBone = 18905, PropPlacement = {0.12, 0.0, 0.04, -40.0, 106.0, -17.0}, EmoteMoving = true, EmoteLoop = true }},

uwu_iced_a = { "mp_player_intdrink", "loop_bottle", "UwU Iced Coffee A",
    AnimationOptions = { Prop = "bzzz_uwuprops_drink_a", PropBone = 18905, PropPlacement = {0.11, -0.02, 0.05, -80.0, 58.0, -32.0}, EmoteMoving = true, EmoteLoop = true }},
uwu_iced_b = { "mp_player_intdrink", "loop_bottle", "UwU Iced Coffee B",
    AnimationOptions = { Prop = "bzzz_uwuprops_drink_b", PropBone = 18905, PropPlacement = {0.11, -0.02, 0.05, -80.0, 58.0, -32.0}, EmoteMoving = true, EmoteLoop = true }},
uwu_iced_c = { "mp_player_intdrink", "loop_bottle", "UwU Iced Coffee C",
    AnimationOptions = { Prop = "bzzz_uwuprops_drink_c", PropBone = 18905, PropPlacement = {0.11, -0.02, 0.05, -80.0, 58.0, -32.0}, EmoteMoving = true, EmoteLoop = true }},
uwu_iced_d = { "mp_player_intdrink", "loop_bottle", "UwU Iced Coffee D",
    AnimationOptions = { Prop = "bzzz_uwuprops_drink_d", PropBone = 18905, PropPlacement = {0.11, -0.02, 0.05, -80.0, 58.0, -32.0}, EmoteMoving = true, EmoteLoop = true }},




    -- ===================== Grill / BS Set (placements & bones matched) =====================
grill_zucchini  = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Zucchini",
    AnimationOptions = { Prop = "bzzz_food_grill_zucchini_grill_a",  PropBone = 60309, PropPlacement = {0.05, 0.0, 0.0, 31.0, -33.0, 82.0}, EmoteMoving = true, EmoteLoop = true }},

grill_tofu      = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Tofu",
    AnimationOptions = { Prop = "bzzz_food_grill_tofu_grill_a",      PropBone = 60309, PropPlacement = {0.05, 0.0, 0.0, 31.0, -33.0, 82.0}, EmoteMoving = true, EmoteLoop = true }},

grill_ossobuco  = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Ossobuco",
    AnimationOptions = { Prop = "bzzz_food_grill_steak_grill_d",     PropBone = 60309, PropPlacement = {0.03, -0.04, -0.02, 30.0, 0.0, -8.0}, EmoteMoving = true, EmoteLoop = true }},

grill_tbone     = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS T-Bone",
    AnimationOptions = { Prop = "bzzz_food_grill_steak_grill_c",     PropBone = 60309, PropPlacement = {0.06, -0.04, -0.02, 24.0, 30.0, -62.0}, EmoteMoving = true, EmoteLoop = true }},

grill_tomahawk  = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Tomahawk",
    AnimationOptions = { Prop = "bzzz_food_grill_steak_grill_b",     PropBone = 60309, PropPlacement = {0.05, 0.0, 0.0, 31.0, -33.0, 82.0}, EmoteMoving = true, EmoteLoop = true }},

grill_steak     = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Steak",
    AnimationOptions = { Prop = "bzzz_food_grill_steak_grill_a",     PropBone = 60309, PropPlacement = {0.05, 0.0, 0.0, 31.0, -33.0, 82.0}, EmoteMoving = true, EmoteLoop = true }},

grill_skewer    = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Skewer",
    AnimationOptions = { Prop = "bzzz_food_grill_skewer_grill_a",    PropBone = 60309, PropPlacement = {0.05, 0.0, 0.0, 31.0, -33.0, 82.0}, EmoteMoving = true, EmoteLoop = true }},

grill_sausage   = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Sausage",
    AnimationOptions = { Prop = "bzzz_food_grill_sausage_grill_a",   PropBone = 60309, PropPlacement = {0.05, 0.0, 0.0, 31.0, -33.0, 82.0}, EmoteMoving = true, EmoteLoop = true }},

grill_salmon    = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Salmon",
    AnimationOptions = { Prop = "bzzz_food_grill_salmon_grill_a",    PropBone = 60309, PropPlacement = {0.0, 0.0, -0.01, 10.0, -2.0, 82.0}, EmoteMoving = true, EmoteLoop = true }},

grill_rib       = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Rib",
    AnimationOptions = { Prop = "bzzz_food_grill_ribs_grill_b",      PropBone = 60309, PropPlacement = {0.01, -0.01, -0.01, -62.0, 5.0, 174.0}, EmoteMoving = true, EmoteLoop = true }},

grill_potato    = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Potato",
    AnimationOptions = { Prop = "bzzz_food_grill_potato_grill_a",    PropBone = 60309, PropPlacement = {-0.03, 0.0, -0.01, 2.0, -15.0, 106.0}, EmoteMoving = true, EmoteLoop = true }},

grill_pineapple = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Pineapple",
    AnimationOptions = { Prop = "bzzz_food_grill_pineapple_grill_a", PropBone = 60309, PropPlacement = {-0.03, 0.0, -0.01, 2.0, -15.0, 106.0}, EmoteMoving = true, EmoteLoop = true }},

grill_naan      = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Naan",
    AnimationOptions = { Prop = "bzzz_food_grill_naan_grill_a",      PropBone = 60309, PropPlacement = {0.03, -0.06, -0.04, 32.0, 5.0, 25.0}, EmoteMoving = true, EmoteLoop = true }},

grill_mushrooms = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Mushrooms",
    AnimationOptions = { Prop = "bzzz_food_grill_mushrooms_grill_a", PropBone = 60309, PropPlacement = {0.05, 0.0, 0.0, 31.0, -33.0, 82.0}, EmoteMoving = true, EmoteLoop = true }},

grill_halloumi  = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Halloumi",
    AnimationOptions = { Prop = "bzzz_food_grill_halloumi_grill_a",  PropBone = 60309, PropPlacement = {-0.03, 0.0, 0.0, 22.0, -25.0, 85.0}, EmoteMoving = true, EmoteLoop = true }},

grill_fish      = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Fish",
    AnimationOptions = { Prop = "bzzz_food_grill_fish_grill_a",      PropBone = 60309, PropPlacement = {0.06, 0.0, -0.01, -20.0, -16.0, -83.0}, EmoteMoving = true, EmoteLoop = true }},

grill_corn      = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Corn",
    AnimationOptions = { Prop = "bzzz_food_grill_corn_grill_a",      PropBone = 60309, PropPlacement = {0.05, 0.0, 0.0, 31.0, -33.0, 82.0}, EmoteMoving = true, EmoteLoop = true }},

grill_chx_steak = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Chicken Steak",
    AnimationOptions = { Prop = "bzzz_food_grill_chicken_grill_d",   PropBone = 60309, PropPlacement = {-0.01, 0.0, 0.0, -20.0, -16.0, -83.0}, EmoteMoving = true, EmoteLoop = true }},

grill_chx_wing  = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Chicken Wing",
    AnimationOptions = { Prop = "bzzz_food_grill_chicken_grill_c",   PropBone = 60309, PropPlacement = {-0.01, 0.0, 0.0, -20.0, -16.0, -83.0}, EmoteMoving = true, EmoteLoop = true }},

grill_chx_thigh = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Chicken Thigh",
    AnimationOptions = { Prop = "bzzz_food_grill_chicken_grill_b",   PropBone = 60309, PropPlacement = {-0.01, 0.0, 0.0, -20.0, -16.0, -83.0}, EmoteMoving = true, EmoteLoop = true }},

grill_camembert = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Camembert",
    AnimationOptions = { Prop = "bzzz_food_grill_camembert_grill_a", PropBone = 60309, PropPlacement = {-0.01, 0.0, 0.0, -20.0, -16.0, -83.0}, EmoteMoving = true, EmoteLoop = true }},

grill_burger    = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Burger",
    AnimationOptions = { Prop = "bzzz_food_grill_burger_grill_d",    PropBone = 60309, PropPlacement = {0.0, -0.02, -0.03, 0.0, 0.0, -50.0}, EmoteMoving = true, EmoteLoop = true }},

grill_baguette  = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Baguette",
    AnimationOptions = { Prop = "bzzz_food_grill_baguette_grill_c",  PropBone = 60309, PropPlacement = {0.07, 0.01, -0.02, 0.15, 0.0, -60.0}, EmoteMoving = true, EmoteLoop = true }},

grill_bacon     = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "BS Bacon",
    AnimationOptions = { Prop = "bzzz_food_grill_bacon_grill_a",     PropBone = 60309, PropPlacement = {0.02, -0.01, -0.01, 0.0, 0.0, 80.0}, EmoteMoving = true, EmoteLoop = true }},

    


------------------------------------ bzzz_juices ------------------------------------
-- Fruits (Eat)
fruit_apple = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Apple",
    AnimationOptions = { Prop = "bzzz_drink_juice_fruit_apple", PropBone = 18905, PropPlacement = {0.15, 0.08, 0.0, -127.0, -39.0, 87.0}, EmoteMoving = true, EmoteLoop = true }},
fruit_banana = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Banana",
    AnimationOptions = { Prop = "bzzz_drink_juice_fruit_banana", PropBone = 18905, PropPlacement = {0.15, 0.08, 0.0, -127.0, -81.0, 17.0}, EmoteMoving = true, EmoteLoop = true }},
fruit_cherry = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Cherry",
    AnimationOptions = { Prop = "bzzz_drink_juice_fruit_cherry", PropBone = 18905, PropPlacement = {0.15, 0.11, -0.02, -76.0, -38.0, -179.0}, EmoteMoving = true, EmoteLoop = true }},
fruit_currant = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Currant",
    AnimationOptions = { Prop = "bzzz_drink_juice_fruit_currant", PropBone = 18905, PropPlacement = {0.17, 0.05, 0.03, -335.0, -136.0, -165.0}, EmoteMoving = true, EmoteLoop = true }},
fruit_grapefruit = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Grapefruit",
    AnimationOptions = { Prop = "bzzz_drink_juice_fruit_grapefruit", PropBone = 18905, PropPlacement = {0.15, 0.07, 0.0, -258.0, -118.0, -126.0}, EmoteMoving = true, EmoteLoop = true }},
fruit_kiwi = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Kiwi",
    AnimationOptions = { Prop = "bzzz_drink_juice_fruit_kiwi", PropBone = 18905, PropPlacement = {0.15, 0.07, 0.0, -258.0, -118.0, -126.0}, EmoteMoving = true, EmoteLoop = true }},
fruit_orange = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Orange",
    AnimationOptions = { Prop = "bzzz_drink_juice_fruit_orange", PropBone = 18905, PropPlacement = {0.15, 0.07, 0.0, -258.0, -118.0, -126.0}, EmoteMoving = true, EmoteLoop = true }},
fruit_peach = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Peach",
    AnimationOptions = { Prop = "bzzz_drink_juice_fruit_peach", PropBone = 18905, PropPlacement = {0.15, 0.07, 0.0, -333.0, -128.0, -161.0}, EmoteMoving = true, EmoteLoop = true }},
fruit_pear = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Pear",
    AnimationOptions = { Prop = "bzzz_drink_juice_fruit_pear", PropBone = 18905, PropPlacement = {0.14, 0.07, 0.03, -236.0, -128.0, -161.0}, EmoteMoving = true, EmoteLoop = true }},
fruit_pineapple = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Pineapple",
    AnimationOptions = { Prop = "bzzz_drink_juice_fruit_pineapple", PropBone = 18905, PropPlacement = {0.16, 0.10, -0.02, -141.0, -190.0, -161.0}, EmoteMoving = true, EmoteLoop = true }},
fruit_plum = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Plum",
    AnimationOptions = { Prop = "bzzz_drink_juice_fruit_plum", PropBone = 18905, PropPlacement = {0.15, 0.06, 0.01, -126.0, -135.0, -71.0}, EmoteMoving = true, EmoteLoop = true }},
fruit_strawberry = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Strawberry",
    AnimationOptions = { Prop = "bzzz_drink_juice_fruit_strawberry", PropBone = 18905, PropPlacement = {0.17, 0.06, 0.01, -126.0, -79.0, 20.0}, EmoteMoving = true, EmoteLoop = true }},

-- Glasses (Drink) — same placement for all glasses
glass_apple = { "mp_player_intdrink", "loop_bottle", "Drink Apple Juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_glass_apple", PropBone = 18905, PropPlacement = {-0.02, -0.04, 0.10, 34.0, 140.0, 224.0}, EmoteMoving = true, EmoteLoop = true }},
glass_banana = { "mp_player_intdrink", "loop_bottle", "Drink Banana Juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_glass_banana", PropBone = 18905, PropPlacement = {-0.02, -0.04, 0.10, 34.0, 140.0, 224.0}, EmoteMoving = true, EmoteLoop = true }},
glass_cherry = { "mp_player_intdrink", "loop_bottle", "Drink Cherry Juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_glass_cherry", PropBone = 18905, PropPlacement = {-0.02, -0.04, 0.10, 34.0, 140.0, 224.0}, EmoteMoving = true, EmoteLoop = true }},
glass_currant = { "mp_player_intdrink", "loop_bottle", "Drink Currant Juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_glass_currant", PropBone = 18905, PropPlacement = {-0.02, -0.04, 0.10, 34.0, 140.0, 224.0}, EmoteMoving = true, EmoteLoop = true }},
glass_grapefruit = { "mp_player_intdrink", "loop_bottle", "Drink Grapefruit Juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_glass_grapefruit", PropBone = 18905, PropPlacement = {-0.02, -0.04, 0.10, 34.0, 140.0, 224.0}, EmoteMoving = true, EmoteLoop = true }},
glass_kiwi = { "mp_player_intdrink", "loop_bottle", "Drink Kiwi Juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_glass_kiwi", PropBone = 18905, PropPlacement = {-0.02, -0.04, 0.10, 34.0, 140.0, 224.0}, EmoteMoving = true, EmoteLoop = true }},
glass_orange = { "mp_player_intdrink", "loop_bottle", "Drink Orange Juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_glass_orange", PropBone = 18905, PropPlacement = {-0.02, -0.04, 0.10, 34.0, 140.0, 224.0}, EmoteMoving = true, EmoteLoop = true }},
glass_peach = { "mp_player_intdrink", "loop_bottle", "Drink Peach Juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_glass_peach", PropBone = 18905, PropPlacement = {-0.02, -0.04, 0.10, 34.0, 140.0, 224.0}, EmoteMoving = true, EmoteLoop = true }},
glass_pear = { "mp_player_intdrink", "loop_bottle", "Drink Pear Juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_glass_pear", PropBone = 18905, PropPlacement = {-0.02, -0.04, 0.10, 34.0, 140.0, 224.0}, EmoteMoving = true, EmoteLoop = true }},
glass_pineapple = { "mp_player_intdrink", "loop_bottle", "Drink Pineapple Juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_glass_pineapple", PropBone = 18905, PropPlacement = {-0.02, -0.04, 0.10, 34.0, 140.0, 224.0}, EmoteMoving = true, EmoteLoop = true }},
glass_plum = { "mp_player_intdrink", "loop_bottle", "Drink Plum Juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_glass_plum", PropBone = 18905, PropPlacement = {-0.02, -0.04, 0.10, 34.0, 140.0, 224.0}, EmoteMoving = true, EmoteLoop = true }},
glass_strawberry = { "mp_player_intdrink", "loop_bottle", "Drink Strawberry Juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_glass_strawberry", PropBone = 18905, PropPlacement = {-0.02, -0.04, 0.10, 34.0, 140.0, 224.0}, EmoteMoving = true, EmoteLoop = true }},

-- Cartons (Drink Big) — pour anim & shared placement
box_apple = { "impexp_int-0", "mp_m_waremech_01_dual-0", "Pouring apple juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_box_apple", PropBone = 57005, PropPlacement = {-0.04, -0.04, -0.09, 52.0, 131.0, 273.0}, EmoteMoving = true, EmoteLoop = true }},
box_banana = { "impexp_int-0", "mp_m_waremech_01_dual-0", "Pouring banana juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_box_banana", PropBone = 57005, PropPlacement = {-0.04, -0.04, -0.09, 52.0, 131.0, 273.0}, EmoteMoving = true, EmoteLoop = true }},
box_cherry = { "impexp_int-0", "mp_m_waremech_01_dual-0", "Pouring cherry juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_box_cherry", PropBone = 57005, PropPlacement = {-0.04, -0.04, -0.09, 52.0, 131.0, 273.0}, EmoteMoving = true, EmoteLoop = true }},
box_currant = { "impexp_int-0", "mp_m_waremech_01_dual-0", "Pouring currant juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_box_currant", PropBone = 57005, PropPlacement = {-0.04, -0.04, -0.09, 52.0, 131.0, 273.0}, EmoteMoving = true, EmoteLoop = true }},
box_grapefruit = { "impexp_int-0", "mp_m_waremech_01_dual-0", "Pouring grapefruit juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_box_grapefruit", PropBone = 57005, PropPlacement = {-0.04, -0.04, -0.09, 52.0, 131.0, 273.0}, EmoteMoving = true, EmoteLoop = true }},
box_kiwi = { "impexp_int-0", "mp_m_waremech_01_dual-0", "Pouring kiwi juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_box_kiwi", PropBone = 57005, PropPlacement = {-0.04, -0.04, -0.09, 52.0, 131.0, 273.0}, EmoteMoving = true, EmoteLoop = true }},
box_orange = { "impexp_int-0", "mp_m_waremech_01_dual-0", "Pouring orange juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_box_orange", PropBone = 57005, PropPlacement = {-0.04, -0.04, -0.09, 52.0, 131.0, 273.0}, EmoteMoving = true, EmoteLoop = true }},
box_peach = { "impexp_int-0", "mp_m_waremech_01_dual-0", "Pouring peach juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_box_peach", PropBone = 57005, PropPlacement = {-0.04, -0.04, -0.09, 52.0, 131.0, 273.0}, EmoteMoving = true, EmoteLoop = true }},
box_pear = { "impexp_int-0", "mp_m_waremech_01_dual-0", "Pouring pear juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_box_pear", PropBone = 57005, PropPlacement = {-0.04, -0.04, -0.09, 52.0, 131.0, 273.0}, EmoteMoving = true, EmoteLoop = true }},
box_pineapple = { "impexp_int-0", "mp_m_waremech_01_dual-0", "Pouring pineapple juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_box_pineapple", PropBone = 57005, PropPlacement = {-0.04, -0.04, -0.09, 52.0, 131.0, 273.0}, EmoteMoving = true, EmoteLoop = true }},
box_plum = { "impexp_int-0", "mp_m_waremech_01_dual-0", "Pouring plum juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_box_plum", PropBone = 57005, PropPlacement = {-0.04, -0.04, -0.09, 52.0, 131.0, 273.0}, EmoteMoving = true, EmoteLoop = true }},
box_strawberry = { "impexp_int-0", "mp_m_waremech_01_dual-0", "Pouring strawberry juice",
    AnimationOptions = { Prop = "bzzz_drink_juice_box_strawberry", PropBone = 57005, PropPlacement = {-0.04, -0.04, -0.09, 52.0, 131.0, 273.0}, EmoteMoving = true, EmoteLoop = true }},








    ---------------------------------------- bzzz_restaurantfood ----------------------------------------

res_food_a = { "bzzz@restaurant@eat", "bzzz_restaurant_eat", "Eat Schnitzel with Fries",
    AnimationOptions = {
        Prop = "bzzz_restaurant_food_a",
        PropBone = 60309,
        PropPlacement = {0.08, -0.04, 0.07, -30.0, 10.0, 0.0},
        PropTwo = "bzzz_restaurant_fork_a",
        PropTwoBone = 28422,
        PropTwoPlacement = {0.07, 0.05, -0.03, -100.0, 24.0, -86.0},
        EmoteMoving = true,
        EmoteLoop = true
    }
},

res_food_b = { "bzzz@restaurant@eat", "bzzz_restaurant_eat", "Eat Schnitzel with Croquettes",
    AnimationOptions = {
        Prop = "bzzz_restaurant_food_b",
        PropBone = 60309,
        PropPlacement = {0.08, -0.04, 0.07, -30.0, 10.0, 0.0},
        PropTwo = "bzzz_restaurant_fork_b",
        PropTwoBone = 28422,
        PropTwoPlacement = {0.07, 0.05, -0.03, -100.0, 24.0, -86.0},
        EmoteMoving = true,
        EmoteLoop = true
    }
},

res_food_c = { "bzzz@restaurant@eat", "bzzz_restaurant_eat", "Eat Spaghetti",
    AnimationOptions = {
        Prop = "bzzz_restaurant_food_c",
        PropBone = 60309,
        PropPlacement = {0.08, -0.04, 0.07, -30.0, 10.0, 0.0},
        PropTwo = "bzzz_restaurant_fork_c",
        PropTwoBone = 28422,
        PropTwoPlacement = {0.07, 0.05, -0.03, -100.0, 24.0, -86.0},
        EmoteMoving = true,
        EmoteLoop = true
    }
},

res_food_d = { "bzzz@restaurant@eat", "bzzz_restaurant_eat", "Eat Grilled Fish",
    AnimationOptions = {
        Prop = "bzzz_restaurant_food_d",
        PropBone = 60309,
        PropPlacement = {0.08, -0.04, 0.07, -30.0, 10.0, 0.0},
        PropTwo = "bzzz_restaurant_fork_d",
        PropTwoBone = 28422,
        PropTwoPlacement = {0.07, 0.05, -0.03, -100.0, 24.0, -86.0},
        EmoteMoving = true,
        EmoteLoop = true
    }
},

res_food_e = { "bzzz@restaurant@eat", "bzzz_restaurant_eat", "Eat Steak with Potatoes",
    AnimationOptions = {
        Prop = "bzzz_restaurant_food_e",
        PropBone = 60309,
        PropPlacement = {0.08, -0.04, 0.07, -30.0, 10.0, 0.0},
        PropTwo = "bzzz_restaurant_fork_e",
        PropTwoBone = 28422,
        PropTwoPlacement = {0.07, 0.05, -0.03, -100.0, 24.0, -86.0},
        EmoteMoving = true,
        EmoteLoop = true
    }
},

res_food_f = { "bzzz@restaurant@eat", "bzzz_restaurant_eat", "Eat Steak with Fries",
    AnimationOptions = {
        Prop = "bzzz_restaurant_food_f",
        PropBone = 60309,
        PropPlacement = {0.08, -0.04, 0.07, -30.0, 10.0, 0.0},
        PropTwo = "bzzz_restaurant_fork_a",
        PropTwoBone = 28422,
        PropTwoPlacement = {0.07, 0.05, -0.03, -100.0, 24.0, -86.0},
        EmoteMoving = true,
        EmoteLoop = true
    }
},

res_food_g = { "bzzz@restaurant@eat", "bzzz_restaurant_eat", "Eat Lobster",
    AnimationOptions = {
        Prop = "bzzz_restaurant_food_g",
        PropBone = 60309,
        PropPlacement = {0.08, -0.04, 0.07, -30.0, 10.0, 0.0},
        PropTwo = "bzzz_restaurant_fork_d",
        PropTwoBone = 28422,
        PropTwoPlacement = {0.07, 0.05, -0.03, -100.0, 24.0, -86.0},
        EmoteMoving = true,
        EmoteLoop = true
    }
},

res_food_h = { "bzzz@restaurant@eat", "bzzz_restaurant_eat", "Eat Eggs with Toast",
    AnimationOptions = {
        Prop = "bzzz_restaurant_food_h",
        PropBone = 60309,
        PropPlacement = {0.08, -0.04, 0.07, -30.0, 10.0, 0.0},
        PropTwo = "bzzz_restaurant_fork_f",
        PropTwoBone = 28422,
        PropTwoPlacement = {0.07, 0.05, -0.03, -100.0, 24.0, -86.0},
        EmoteMoving = true,
        EmoteLoop = true
    }
},

res_food_i = { "bzzz@restaurant@eat", "bzzz_restaurant_eat", "Eat Sushi",
    AnimationOptions = {
        Prop = "bzzz_restaurant_food_i",
        PropBone = 60309,
        PropPlacement = {0.08, -0.04, 0.07, -30.0, 10.0, 0.0},
        PropTwo = "bzzz_restaurant_fork_h",
        PropTwoBone = 28422,
        PropTwoPlacement = {0.07, 0.05, -0.03, -100.0, 24.0, -86.0},
        EmoteMoving = true,
        EmoteLoop = true
    }
},

res_food_j = { "bzzz@restaurant@eat", "bzzz_restaurant_eat", "Eat Shrimps with Sauce",
    AnimationOptions = {
        Prop = "bzzz_restaurant_food_j",
        PropBone = 60309,
        PropPlacement = {0.08, -0.04, 0.07, -30.0, 10.0, 0.0},
        PropTwo = "bzzz_restaurant_material_shrimp_a",
        PropTwoBone = 28422,
        PropTwoPlacement = {0.07, 0.05, -0.03, -100.0, 24.0, -86.0},
        EmoteMoving = true,
        EmoteLoop = true
    }
},

res_food_k = { "bzzz@restaurant@eat", "bzzz_restaurant_eat", "Eat Chicken with Potatoes",
    AnimationOptions = {
        Prop = "bzzz_restaurant_food_k",
        PropBone = 60309,
        PropPlacement = {0.08, -0.04, 0.07, -30.0, 10.0, 0.0},
        PropTwo = "bzzz_restaurant_fork_e",
        PropTwoBone = 28422,
        PropTwoPlacement = {0.07, 0.05, -0.03, -100.0, 24.0, -86.0},
        EmoteMoving = true,
        EmoteLoop = true
    }
},

res_food_l = { "bzzz@restaurant@eat", "bzzz_restaurant_eat", "Eat Vegetarian Salad",
    AnimationOptions = {
        Prop = "bzzz_restaurant_food_l",
        PropBone = 60309,
        PropPlacement = {0.08, -0.04, 0.07, -30.0, 10.0, 0.0},
        PropTwo = "bzzz_restaurant_fork_g",
        PropTwoBone = 28422,
        PropTwoPlacement = {0.07, 0.05, -0.03, -100.0, 24.0, -86.0},
        EmoteMoving = true,
        EmoteLoop = true
    }
},


-- ===== Custom Emotes for Cat Cafe =====
cat_cake = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Cat Cake",
    AnimationOptions = { Prop = "bzzz_food_dessert_a", PropBone = 18905, PropPlacement = {0.14, 0.04, 0.02, -45.0, -38.0, 5.0}, EmoteMoving = true, EmoteLoop = false }},

creamy_pasta = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Creamy Pasta",
    AnimationOptions = { Prop = "prop_sandwich_01", PropBone = 18905, PropPlacement = {0.12, 0.06, 0.01, -48.0, 18.0, 58.0}, EmoteMoving = true, EmoteLoop = false }},

iced_mocha = { "amb@code_human_wander_drinking@female@base", "static", "Drink Iced Mocha",
    AnimationOptions = { Prop = "beanmachine_cup", PropBone = 28422, PropPlacement = {0.0100, 0.0, 0.0250, 0.0, 0.0, -135.0}, EmoteLoop = true, EmoteMoving = true }},

chocolate_latte = { "amb@code_human_wander_drinking@female@base", "static", "Drink Chocolate Latte",
    AnimationOptions = { Prop = "beanmachine_cup2", PropBone = 28422, PropPlacement = {0.0, 0.0, -0.0500, 0.0, 0.0, -175.0}, EmoteLoop = true, EmoteMoving = true }},

strawberry_shake = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Strawberry Shake",
    AnimationOptions = { Prop = "brum_cherryshake_strawberry", PropBone = 28422, PropPlacement = {0.0800, 0.0650, -0.0300, -112.0, -163.0, 22.0}, EmoteLoop = true, EmoteMoving = true }},


-- ===== Custom Emotes for BurgerShot (OPTIMIZED) =====
beef_burger = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Beef Burger",
    AnimationOptions = { Prop = "prop_cs_burger_01", PropBone = 18905, PropPlacement = {0.12, 0.06, 0.01, -52.0, 14.0, 58.0}, EmoteMoving = true, EmoteLoop = false }},

chicken_burger = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Chicken Burger",
    AnimationOptions = { Prop = "prop_cs_burger_01", PropBone = 18905, PropPlacement = {0.12, 0.06, 0.01, -52.0, 14.0, 58.0}, EmoteMoving = true, EmoteLoop = false }},

cheese_fries = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Cheese Fries",
    AnimationOptions = { Prop = "prop_food_bs_chips", PropBone = 18905, PropPlacement = {0.11, 0.05, 0.03, -55.0, 18.0, 62.0}, EmoteMoving = true, EmoteLoop = false }},

cold_coffee = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Drink Cold Coffee",
    AnimationOptions = { Prop = "p_amb_coffeecup_01", PropBone = 28422, PropPlacement = {0.01, 0.0, 0.01, 5.0, 2.0, -3.0}, EmoteLoop = true, EmoteMoving = true }},

vanilla_shake = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Vanilla Shake",
    AnimationOptions = { Prop = "brum_cherryshake_vanilla", PropBone = 28422, PropPlacement = {0.0800, 0.0650, -0.0300, -112.0, -163.0, 22.0}, EmoteLoop = true, EmoteMoving = true }},

fountain_drink = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Fountain Drink",
    AnimationOptions = { Prop = "prop_rpemotes_soda01", PropBone = 28422, PropPlacement = {0.0450, 0.0050, -0.0550, -85.0, -23.0, -25.0}, EmoteLoop = true, EmoteMoving = true }},


-- ===== Custom Emotes for Sea Pearl =====
neptunes_platter = { "bzzz@restaurant@eat", "bzzz_restaurant_eat", "Eat Neptune's Platter",
    AnimationOptions = {
        Prop = "bzzz_restaurant_food_j",
        PropBone = 60309,
        PropPlacement = {0.08, -0.04, 0.07, -30.0, 10.0, 0.0},
        PropTwo = "bzzz_restaurant_material_shrimp_a",
        PropTwoBone = 28422,
        PropTwoPlacement = {0.07, 0.05, -0.03, -100.0, 24.0, -86.0},
        EmoteMoving = true,
        EmoteLoop = true
    }
},

fish_and_chips = { "bzzz@restaurant@eat", "bzzz_restaurant_eat", "Eat Fish & Chips",
    AnimationOptions = {
        Prop = "bzzz_restaurant_food_d",
        PropBone = 60309,
        PropPlacement = {0.08, -0.04, 0.07, -30.0, 10.0, 0.0},
        PropTwo = "bzzz_restaurant_fork_d",
        PropTwoBone = 28422,
        PropTwoPlacement = {0.07, 0.05, -0.03, -100.0, 24.0, -86.0},
        EmoteMoving = true,
        EmoteLoop = true
    }
},

golden_calamari = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Golden Calamari",
    AnimationOptions = { Prop = "prop_food_bs_chips", PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0}, EmoteMoving = true }},

ocean_breeze = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Drink Ocean Breeze",
    AnimationOptions = { Prop = "prop_drink_whisky", PropBone = 28422, PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0}, EmoteLoop = true, EmoteMoving = true }},

coral_twist = { "anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Drink Coral Twist",
    AnimationOptions = { Prop = "prop_drink_champ", PropBone = 18905, PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0}, EmoteMoving = true, EmoteLoop = true }},

deep_sea_kola = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Deep Sea Kola",
    AnimationOptions = { Prop = "prop_rpemotes_soda03", PropBone = 28422, PropPlacement = {0.0470, 0.0040, -0.0600, -88.0263, -25.0367, -27.3898}, EmoteLoop = true, EmoteMoving = true }},


-- ===== Custom Emotes for Joe Bar =====
whiskey_twist = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Drink Whiskey Twist",
    AnimationOptions = { Prop = "prop_drink_whisky", PropBone = 28422, PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0}, EmoteLoop = true, EmoteMoving = true }},

vodka_cran = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Drink Vodka Cranberry",
    AnimationOptions = { Prop = "prop_drink_whisky", PropBone = 28422, PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0}, EmoteLoop = true, EmoteMoving = true }},

tequila_sunrise = { "anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Drink Tequila Sunrise",
    AnimationOptions = { Prop = "prop_drink_champ", PropBone = 18905, PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0}, EmoteMoving = true, EmoteLoop = true }},


-- ===== Custom Emotes for Lust Resort =====
lust_platter = { "bzzz@restaurant@eat", "bzzz_restaurant_eat", "Eat Lust Platter",
    AnimationOptions = {
        Prop = "bzzz_restaurant_food_k",
        PropBone = 60309,
        PropPlacement = {0.08, -0.04, 0.07, -30.0, 10.0, 0.0},
        PropTwo = "bzzz_restaurant_fork_e",
        PropTwoBone = 28422,
        PropTwoPlacement = {0.07, 0.05, -0.03, -100.0, 24.0, -86.0},
        EmoteMoving = true,
        EmoteLoop = true
    }
},

glazed_chicken = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Glazed Chicken",
    AnimationOptions = { Prop = "prop_cs_burger_01", PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0}, EmoteMoving = true }},

calamari_rings = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Calamari Rings",
    AnimationOptions = { Prop = "prop_food_bs_chips", PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0}, EmoteMoving = true }},

high_roller = { "anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Drink High Roller",
    AnimationOptions = { Prop = "prop_drink_champ", PropBone = 18905, PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0}, EmoteMoving = true, EmoteLoop = true }},

midnight_lust = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Drink Midnight Lust",
    AnimationOptions = { Prop = "prop_drink_whisky", PropBone = 28422, PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0}, EmoteLoop = true, EmoteMoving = true }},

beachside = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Drink Beachside",
    AnimationOptions = { Prop = "prop_drink_whisky", PropBone = 28422, PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0}, EmoteLoop = true, EmoteMoving = true }},


-- ===== Custom Emotes for Salt Lab Cafe =====
iced_mango_smoothie = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Iced Mango Smoothie",
    AnimationOptions = { Prop = "brum_cherryshake_raspberry", PropBone = 28422, PropPlacement = {0.0800, 0.0650, -0.0300, -112.0, -163.0, 22.0}, EmoteLoop = true, EmoteMoving = true }},

tropical_smoothie = { "smo@milkshake_idle", "milkshake_idle_clip", "Sip Tropical Smoothie",
    AnimationOptions = { Prop = "brum_cherryshake_lemon", PropBone = 28422, PropPlacement = {0.0800, 0.0650, -0.0300, -112.0, -163.0, 22.0}, EmoteLoop = true, EmoteMoving = true }},

blue_mojito = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Drink Blue Mojito",
    AnimationOptions = { Prop = "prop_drink_champ", PropBone = 28422, PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0}, EmoteLoop = true, EmoteMoving = true }},

chicken_sandwich = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Chicken Sandwich",
    AnimationOptions = { Prop = "prop_sandwich_01", PropBone = 18905, PropPlacement = {0.12, 0.06, 0.01, -48.0, 18.0, 58.0}, EmoteMoving = true, EmoteLoop = false }},

veggie_wrap = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Veggie Wrap",
    AnimationOptions = { Prop = "prop_sandwich_01", PropBone = 18905, PropPlacement = {0.12, 0.06, 0.01, -48.0, 18.0, 58.0}, EmoteMoving = true, EmoteLoop = false }},

brownie = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Brownie",
    AnimationOptions = { Prop = "bzzz_food_dessert_a", PropBone = 18905, PropPlacement = {0.14, 0.04, 0.02, -45.0, -38.0, 5.0}, EmoteMoving = true, EmoteLoop = false }},


}