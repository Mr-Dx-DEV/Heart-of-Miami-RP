-- This config is made to Kiiya Wigwam Burgers MLO - https://kiiya.tebex.io/package/6300825

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

local restaurantConfig = {
    enabled = true,
    label = 'Dome DFC',
    job = 'dfc',
    ingredients = Config.ingredients.globalIngredients,
    maxIngredients = 6,
    maxRecipes = 10,
    maxRecipePrice = 1000,
    blip = { enabled = true, coords = vec3(-2350.49, -915.81, 10.82), sprite = 538, color = 17, scale = 0.6, display = 4 },
    zone = {
        points = {
            vec3(-2359.65, -912.57, 11.24),
            vec3(-2349.40, -899.88, 11.78),
            vec3(-2335.49, -920.31, 10.67),
            vec3(-2348.33, -929.43, 11.30)


        },
        thickness = 15,
    },
    management = {
        { coords = vec3(-2344.05, -923.28, 10.85), radius = 0.6 },
    },
    stashes = {
        { coords = vec3(-2350.49, -921.51, 10.88), radius = 0.6, label = 'Fridge', slots = 50, weight = 100 },
        -- { coords = vec3(-854.8, -1128.45, 7.8), radius = 0.6, label = 'Pass', slots = 50, weight = 100 },
    },
    trays = {
        { coords = vec3(-2347.95, -919.33, 10.84), radius = 0.5, label = 'Tray', slots = 10, weight = 10 },
        -- { coords = vec3(-854.8, -1126.5, 7.1), radius = 0.5, label = 'Tray', slots = 10, weight = 10 },
    },
    prepare = {
        { coords = vec3(-2349.44, -924.11, 11.10), radius = 0.3, label = 'Prepare', ingredients = Config.ingredients.globalIngredients, anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' } },
    },
    stations = {
        { coords = vec3(-2348.60, -925.21, 11.23), radius = 0.4, label = 'Drinks Machine', type = 'drink', anim = { dict = 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_a@normal', clip = 'pour_one' } },
        { coords = vec3(-2345.76, -924.91, 10.80), radius = 0.4, label = 'Grill', type = 'food', anim = { dict = 'amb@prop_human_bbq@male@idle_a', clip = 'idle_b' }, prop = { bone = 28422, model = 'prop_fish_slice_01', pos = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0) } },
    },
    registers = {
        { coords = vec3(-2346.22, -919.79, 10.86), radius = 0.4, label = 'Register', playersRadius = 5.0, comission = 10 },
        { coords = vec3(-2344.85, -921.84, 10.83), radius = 0.4, label = 'Register', playersRadius = 5.0, comission = 10 },
    },
    menus = {
        { coords = vec3(-2344.98, -920.92, 12.05), radius = 0.35, label = 'Beanmachine Menu' },
    },
    offlineShop = {
        { coords = vec4(-2347.67, -920.09, 9.76, 31.16), label = 'Shop', model = 's_f_y_sweatshop_01', scenario = 'WORLD_HUMAN_AA_COFFEE' },
    },
    boxes = {
        { coords = vec3(-2349.70, -922.83, 10.74), radius = 0.3 },
    },
    delivery = {
        { coords = vec3(-2355.29, -911.49, 10.99), radius = 0.25, priceLost = 10, comission = 10, cooldown = 10 },
    },
    chairs = {},
}

AddRestaurant(restaurantConfig)
