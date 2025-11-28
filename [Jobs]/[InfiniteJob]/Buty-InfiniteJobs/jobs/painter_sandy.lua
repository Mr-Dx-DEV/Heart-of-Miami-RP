return {
    JobInfo = {
        Name = "painter sandy",
        JobID = { "painter_sandy", 0 },
        Img = "img/paintersandy.jpg",
        ExperienceRequired = 500,
        info =
        "Take care of painting houses and buildings for customers and as soon as you finish, come back here to get paid.",

        Tutorial = {
            [1] = "First you must know that your paint roller is in the trunk, approach and take it.",
            [2] = "Go to the buildings marked on the map and approach the walls to paint them.",
            [3] = "When you're done, go and get paid here.",
        }
    },

    JobConfig = {

        Tool = {
            prop = "prop_paint_roller",
            objcoord = { 18905, 0.30, 0.1, 0.0, 0.0, 170.0, -20.0 },
            objcoord2 = { 18905, 0.30, 0.1, 0.0, 0.0, 170.0, -20.0 },
            animation_action = { "car_2_mcs_1-0", "s_m_y_airworker-0", 3000 },
            animation_take = nil,
            particles = ""
        },

        type = 1,

        deleteprop = false,

        {
            CreateGroup = vec4(-1135.1902, 2683.4216, 17.4965, 164.0548),

            CreateGroupPed_model = "s_m_m_gentransport",

            Workclothes = vec4(-1133.1203, 2688.2481, 17.8004, 224.9343),

            Vehicle = {
                coord = vec4(-1127.3518, 2697.0863, 17.8004, 313.1862),
                spawnvehicle = vec4(-1132.7531, 2698.7512, 18.8233, 312.2549),
                model = "paradise",
                doors = { 2, 3 },
                coord_prop_tool = {
                    [1] = { -0.24, 0.0, -0.40, 0.0, 0.0, 0.0 },
                    [2] = { 0.0, 0.0, -0.40, 0.0, 0.0, 0.0 },
                    [3] = { 0.24, 0.0, -0.40, 0.0, 0.0, 0.0 },
                    [4] = { 0.44, 0.0, -0.40, 0.0, 0.0, 0.0 },
                },
            },

            skill = {
                use = true,
                difficultyLevels = { 'easy', 'easy', { areaSize = 60, speedMultiplier = 1.1 }, 'easy' },
                controls = { 'w', 'a', 's', 'd' },
                particles = "liquid_splash_paint",
            },

            Route = {

                [1] = {

                    {
                        coord = vec4(-1924.8075, 2051.3333, 140.8324, 80.9658),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = true, name = "rubber", quantity = 1 },
                    },
                    {
                        coord = vec4(-1925.0551, 2058.8296, 140.8342, 163.5683),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = true, name = "rubber", quantity = 1 },
                    },
                    {
                        coord = vec4(-1935.1753, 2057.8081, 140.8371, 262.5879),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = true, name = "rubber", quantity = 1 },
                    },
                    {
                        coord = vec4(-1937.8929, 2046.5095, 140.8289, 258.5547),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(-1936.9537, 2040.3334, 140.8278, 349.8183),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(-1930.1750, 2038.7089, 140.8317, 347.0719),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(-1883.3619, 2049.2478, 141.0074, 338.7328),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(-1895.0365, 2053.4985, 141.0003, 344.7105),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(-1895.7535, 2061.2891, 140.9980, 326.4341),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(-1905.6541, 2069.4370, 140.8054, 321.6270),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(-1912.7909, 2078.4585, 140.3837, 230.0760),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(-1897.4341, 2078.8638, 140.9977, 145.6598),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(-1865.2161, 2068.7346, 140.9978, 187.7489),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(-1871.1586, 2053.0022, 140.9838, 72.4031),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                },

                -- [2] = {

                --     {
                --         coord = vec4(-316.8074, 2821.5356, 58.5995, 229.1549),
                --         propname = "prop_cs_diaphram",
                --         GetItem = { use = true, name = "rubber", quantity = 1},
                --     },
                --     {
                --         coord = vec4(-313.1972, 2827.0530, 58.5874, 233.1932),
                --         propname = "prop_cs_diaphram",
                --         GetItem = { use = true, name = "rubber", quantity = 1},
                --     },
                --     {
                --         coord = vec4(-309.0219, 2826.5447, 58.8890, 147.5625),
                --         propname = "prop_cs_diaphram",
                --         GetItem = { use = true, name = "rubber", quantity = 1},
                --     },
                --     {
                --         coord = vec4(-302.4777, 2819.3325, 59.4413, 52.4189),
                --         propname = "prop_cs_diaphram",
                --         GetItem = {use = false, name = "painter_sandy", quantity = 1},
                --     },
                --     {
                --         coord = vec4(-300.8452, 2813.9697, 59.3765, 149.5653),
                --         propname = "prop_cs_diaphram",
                --         GetItem = {use = false, name = "painter_sandy", quantity = 1},
                --     },
                --     {
                --         coord = vec4(-301.7361, 2809.6116, 59.4247, 54.5899),
                --         propname = "prop_cs_diaphram",
                --         GetItem = {use = false, name = "painter_sandy", quantity = 1},
                --     },
                --     {
                --         coord = vec4(-304.1214, 2806.0010, 59.4462, 54.3320),
                --         propname = "prop_cs_diaphram",
                --         GetItem = {use = false, name = "painter_sandy", quantity = 1},
                --     },
                --     {
                --         coord = vec4(-305.3682, 2803.1892, 59.4470, 147.6615),
                --         propname = "prop_cs_diaphram",
                --         GetItem = {use = false, name = "painter_sandy", quantity = 1},
                --     },
                --     {
                --         coord = vec4(-304.3199, 2798.9819, 59.4128, 57.6833),
                --         propname = "prop_cs_diaphram",
                --         GetItem = {use = false, name = "painter_sandy", quantity = 1},
                --     },
                --     {
                --         coord = vec4(-306.8333, 2795.2361, 59.4283, 60.7735),
                --         propname = "prop_cs_diaphram",
                --         GetItem = {use = false, name = "painter_sandy", quantity = 1},
                --     },
                --     {
                --         coord = vec4(-314.9060, 2794.0339, 59.6147, 327.9385),
                --         propname = "prop_cs_diaphram",
                --         GetItem = {use = false, name = "painter_sandy", quantity = 1},
                --     },
                --     {
                --         coord = vec4(-323.7496, 2792.2146, 59.2853, 332.5002),
                --         propname = "prop_cs_diaphram",
                --         GetItem = {use = false, name = "painter_sandy", quantity = 1},
                --     },
                --     {
                --         coord = vec4(-330.6563, 2796.8484, 58.7304, 330.5720),
                --         propname = "prop_cs_diaphram",
                --         GetItem = {use = false, name = "painter_sandy", quantity = 1},
                --     },
                --     {
                --         coord = vec4(-331.0961, 2804.8745, 58.6147, 332.6750),
                --         propname = "prop_cs_diaphram",
                --         GetItem = {use = false, name = "painter_sandy", quantity = 1},
                --     },
                -- },

                [2] = {

                    {
                        coord = vec4(1692.0063, 3582.8386, 35.6209, 30.5159),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = true, name = "rubber", quantity = 1 },
                    },
                    {
                        coord = vec4(1688.8817, 3581.0674, 35.9550, 40.5919),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = true, name = "rubber", quantity = 1 },
                    },
                    {
                        coord = vec4(1685.6249, 3579.2339, 35.8636, 34.3233),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = true, name = "rubber", quantity = 1 },
                    },
                    {
                        coord = vec4(1683.0481, 3580.0522, 35.6419, 299.3825),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(1681.1191, 3583.4753, 35.6467, 305.6591),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(1679.4406, 3586.4365, 35.6526, 303.8515),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(1683.1531, 3589.8379, 35.6199, 211.2504),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(1690.7740, 3594.1675, 35.6201, 207.0697),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(1694.1316, 3596.0513, 35.6166, 211.8597),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(1697.9950, 3593.3145, 35.6291, 118.8517),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(1684.7635, 3614.3506, 35.4145, 210.5421),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(1687.2010, 3615.7310, 35.3865, 210.7939),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(1689.8988, 3617.2466, 35.3530, 214.7439),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                    {
                        coord = vec4(1694.8927, 3619.0366, 35.3232, 117.8443),
                        propname = "prop_cs_diaphram",
                        GetItem = { use = false, name = "painter_sandy", quantity = 1 },
                    },
                },
            },

            Finish = {
                model = "s_m_m_ccrew_01",
                coord = vec4(-1123.4790, 2682.7053, 17.7555, 226.3955),
                Quantity = 10000,
                paymentmethod = {
                    option = "cash", -- cash/bank/item
                    item_name = ""   -- if you use <option = "item"> then put here the name of the item you will pay with.
                },
                exp = 50,
                increase_per_level = 10
            },
        },

    },

    Clothes = {
        male = {
            tshirt_1 = 15,
            tshirt_2 = 0,
            torso_1 = 206,
            torso_2 = 0,
            decals_1 = 0,
            decals_2 = 0,
            arms = 11,
            pants_1 = 241,
            pants_2 = 1,
            shoes_1 = 142,
            shoes_2 = 0,
            chain_1 = -1,
            chain_2 = 0,
            helmet_1 = -1,
            helmet_2 = 0,
            ears_1 = -1,
            ears_2 = 0,
            bproof_1 = 0,
            bproof_2 = 0
        },
        female = {
            tshirt_1 = 146,
            tshirt_2 = 0,
            torso_1 = 197,
            torso_2 = 0,
            decals_1 = 0,
            decals_2 = 0,
            arms = 9,
            pants_1 = 239,
            pants_2 = 3,
            shoes_1 = 177,
            shoes_2 = 1,
            chain_1 = -1,
            chain_2 = 0,
            helmet_1 = -1,
            helmet_2 = 0,
            bproof_1 = 0,
            bproof_2 = 0,
        }
    }
}
