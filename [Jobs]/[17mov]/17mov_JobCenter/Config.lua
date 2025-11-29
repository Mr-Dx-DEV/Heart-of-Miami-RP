Config = {}

Config.Lang =
"en"                        -- Langugage that you want to use (before changing this value make sure that this lang is exists into ./locale directory)
Config.UseTarget = true     -- Change it to true if you want to use a target system. All settings about the target system are under target.lua file.
Config.DistanceCheck = true -- Allows to find players that thries to get some job with 17mov_JobCenter:SetPlayerJob event, but he's so far from job center ped. If set to true job will not be set and you will receive information in the server console. Set this to false if you want to open menu from other locations than default with 17mov_JobCenter:OpenMenu event

-- Configuration of locations where you can open job center menu
Config.Locations = {
    {
        Model = "a_f_y_business_04",                          -- Model of ped https://docs.fivem.net/docs/game-references/ped-models/
        Position = vector4(-1083.21, -245.90, 37.76, 214.30), -- Position of ped (it's vector4 so first 3 numbers are xyz and 4 number is heading)
        Distance = 8,                                         -- Distance of interaction - how close you need to stay to be able to open menu
    },
}

-- Here you can configure blips
Config.Blips = {
    {
        Label = _L("Blip.Label"), -- Can be changed into locale
        Position = vector3(-1083.21, -245.90, 37.76),
        Sprite = 826,
        Color = 23,
        Scale = 0.6,
    }
}

-- Some settings of menu
Config.NUI = {
    GlobalColor = "#4da6ff",    -- "Accent" color of menu
    Logo = "images/logo.webp",  -- Path to logo (located into /web) - should be relative path, so should start without "/"
    AnnouncementEnabled = true, -- You can toogle displaying of "announcement" tab into header
    Tabs = {                    -- Here you can change path to background images of each "tab"
        ServerJobs = "images/jobs.webp",
        ServerBusiness = "images/business.webp",
        Chat = "images/chat.webp",
    },
    ChatSettings = {        -- This is configuration of "rate limits" into chat. Telling how much messages you can send into specified time
        MessagesCount = 10, -- How much messages
        TimeLimit = 5000,   -- In what time (ms)
    },
}

-- Here you can add jobs to job center
-- NOTE: If your job is not displaying into menu it's propably not registered as job into framework!
Config.Jobs = {
    -- ["NAME_OF_JOB"] = {                                                           -- Key is name of job from framework
    --     enabled = true,                                                           -- Is this job enabled
    --     applyJob = false,                                                          -- Is player can apply to this job
    --     grade = 1,                                                                -- Grade that player will recive
    --     coords = vector3(926.47, -1560.25, 30.74),                                -- Job location
    --     icon = "path/to/icon.svg",                                                -- URL to icon - iff nil it's just not displayed
    --     image = "path/to/image.webp",                                              -- URL to image that is "banner"
    --     subtitle = "Lorem ipsum",                                                 -- Subtitle of this job
    --     description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", -- Description of this job
    --     stats = {                                                                 -- Stats configuration
    --         -- These functions allows you to configure your stats systems. Both working on server side! If nil is returned then it's just not display
    --         earnings = function()
    --             -- Average hour salary- returns string you can use FormatMoney(earnings) function
    --             if IsDuplicityVersion() then
    --                 return nil
    --             end
    --         end,
    --         time = function()
    --             -- Average worked time - need to return number (time into ms)
    --             if IsDuplicityVersion() then
    --                 return nil
    --             end
    --         end,
    --     },
    -- },
    ["builder"] = {
        enabled = true,
        applyJob = false,
        grade = 1,
        coords = vector3(926.47, -1560.25, 30.74),
        icon = "images/icons/builder.svg",
        image = "images/jobs/builder.webp",
        title = "Builder Job",
        subtitle = "Construct your future, one building at a time",
        description =
        "Time to put on your hard hat and build your future! As a builder, you'll take on construction projects around the city, from laying foundations to erecting structures. Use heavy equipment, transport materials, and watch your hard work come to life as you complete each job. Whether you're working solo or collaborating with a crew, this role is perfect for players who love getting hands-on and making a visible impact. Roll up your sleeves, grab your tools, and start building your way to success today!",
        stats = {
            -- These functions allows you to configure your stats systems. Both working on server side! If nil is returned then it's just not display
            earnings = function()
                -- Average hour salary- returns string you can use FormatMoney(earnings) function
                if IsDuplicityVersion() then
                    return nil
                end
            end,
            time = function()
                -- Average worked time - need to return number (time into ms)
                if IsDuplicityVersion() then
                    return nil
                end
            end,
        },
    },
    ["deliverer"] = {
        enabled = true,
        applyJob = false,
        grade = 1,
        coords = vector3(78.66, 111.75, 81.17),
        icon = "images/icons/deliverer.svg",
        image = "images/jobs/deliverer.webp",
        title = "Deliverer Job",
        subtitle = "Delivering smiles across the city",
        description =
        "Deliver the boxes and keep the city happy! As a postman, you'll pick up and deliver packages and important items to residents and businesses across town. Stay on the move, follow your route, and ensure everything gets to the right place on time. This job is perfect for players who enjoy a steady pace and the satisfaction of completing tasks. Grab your bag, hit the streets, and start delivering today!",
        stats = {
            -- These functions allows you to configure your stats systems. Both working on server side! If nil is returned then it's just not display
            earnings = function()
                -- Average hour salary- need to return number
                if IsDuplicityVersion() then
                    return nil
                end
            end,
            time = function()
                -- Average worked time - need to return number (time into ms)
                if IsDuplicityVersion() then
                    return nil
                end
            end,
        },
    },
    ["electrician"] = {
        enabled = true,
        applyJob = false,
        grade = 1,
        coords = vector3(751.06, 222.85, 87.42),
        icon = "images/icons/electrician.svg",
        image = "images/jobs/electrician.webp",
        title = "Electrician Job",
        subtitle = "Keep the lights on and circuits alive",
        description =
        "Light up the city and earn some serious cash as an electrician! Whether it's fixing power lines, installing new electrical systems, or troubleshooting wiring issues, this job has you covered. Use your tools to keep the lights on and make sure everything is running smoothly. Perfect for players who enjoy problem-solving and working with their hands, the electrician job offers great rewards for your skills. Grab your gear, get to work, and keep the city charged up!",
        stats = {
            -- These functions allows you to configure your stats systems. Both working on server side! If nil is returned then it's just not display
            earnings = function()
                -- Average hour salary- need to return number
                if IsDuplicityVersion() then
                    return nil
                end
            end,
            time = function()
                -- Average worked time - need to return number (time into ms)
                if IsDuplicityVersion() then
                    return nil
                end
            end,
        },
    },
    ["garbage"] = {
        enabled = true,
        applyJob = false,
        grade = 1,
        coords = vector3(-321.56, -1545.74, 30.01),
        icon = "images/icons/garbage.svg",
        image = "images/jobs/garbage.webp",
        title = "Garbage Collector Job",
        subtitle = "Keeping our city clean and green",
        description =
        "Help keep the city clean and earn cash while doing it! As a garbage collector, you'll drive around in a garbage truck, pick up trash bags from designated spots, and deliver them to the waste processing plant. It's a straightforward job with steady pay, perfect for players who enjoy simple, hands-on work. Roll up your sleeves, hop in the truck, and start making a difference by keeping the streets spotless!",
        stats = {
            -- These functions allows you to configure your stats systems. Both working on server side! If nil is returned then it's just not display
            earnings = function()
                -- Average hour salary- need to return number
                if IsDuplicityVersion() then
                    return nil
                end
            end,
            time = function()
                -- Average worked time - need to return number (time into ms)
                if IsDuplicityVersion() then
                    return nil
                end
            end,
        },
    },
    ["gruppe6"] = {
        enabled = true,
        applyJob = false,
        grade = 1,
        coords = vector3(-0.43, -0.17, 0.38),
        icon = "images/icons/gruppe6.svg",
        image = "images/jobs/gruppe6.webp",
        title = "Gruppe Sechs Job",
        subtitle = "Securing your world, one patrol at a time",
        description =
        "As a Gruppe Sechs operative, two things matter: the cash and keeping it moving. Hop into your armored truck, plan secure routes, and deliver money between banks, shops, and big companies - but stay sharp. Criminals are always watching, and once they make a move, the Police won't be far behind. Use high-tech tablets to coordinate heists or track down robbers, depending on your side of the law. With built-in tutorials, smooth interactions, and full customization, this job is packed with action, teamwork, and high stakes. Whether you're guarding the bag or trying to steal it, Gruppe Sechs is where chaos meets cash!",
        stats = {
            -- These functions allows you to configure your stats systems. Both working on server side! If nil is returned then it's just not display
            earnings = function()
                -- Average hour salary- need to return number
                if IsDuplicityVersion() then
                    return nil
                end
            end,
            time = function()
                -- Average worked time - need to return number (time into ms)
                if IsDuplicityVersion() then
                    return nil
                end
            end,
        },
    },
    ["lumberjack"] = {
        enabled = true,
        applyJob = false,
        grade = 1,
        coords = vector3(-552.9, 5348.58, 74.74),
        icon = "images/icons/lumberjack.svg",
        image = "images/jobs/lumberjack.webp",
        title = "Lumberjack Job",
        subtitle = "Chop, transport, and build your success",
        description =
        "As a lumberjack, you'll head into the woods to chop down trees, load up the logs, and transport them to the processing plant. Watch as raw timber transforms into valuable materials you can sell for profit! With smooth animations and easy-to-follow steps, this job offers a fun, hands-on way to earn your money. Whether you're working solo or teaming up with friends, the lumberjack life is all about hard work and big rewards! Grab your axe and start cutting today!",
        stats = {
            -- These functions allows you to configure your stats systems. Both working on server side! If nil is returned then it's just not display
            earnings = function()
                -- Average hour salary- need to return number
                if IsDuplicityVersion() then
                    return nil
                end
            end,
            time = function()
                -- Average worked time - need to return number (time into ms)
                if IsDuplicityVersion() then
                    return nil
                end
            end,
        },
    },
    ["miner"] = {
        enabled = true,
        applyJob = false,
        grade = 1,
        coords = vector3(2445.14, 1532.14, 39.89),
        icon = "images/icons/miner.svg",
        image = "images/jobs/miner.webp",
        title = "Miner Job",
        subtitle = "Dig deep for treasures beneath the earth",
        description =
        "Ready to dig deep and strike it rich? As a miner, you'll head underground to extract valuable ores and minerals. Use heavy-duty tools to break rocks, collect resources, and transport them for processing. The harder you work, the bigger your rewards! Whether you prefer working solo or with a team, this job is perfect for players who enjoy hands-on labor and big payoffs. Grab your pickaxe, venture into the depths, and start uncovering treasures today!",
        stats = {
            -- These functions allows you to configure your stats systems. Both working on server side! If nil is returned then it's just not display
            earnings = function()
                -- Average hour salary- need to return number
                if IsDuplicityVersion() then
                    return nil
                end
            end,
            time = function()
                -- Average worked time - need to return number (time into ms)
                if IsDuplicityVersion() then
                    return nil
                end
            end,
        },
    },
    ["oilrig"] = {
        enabled = true,
        applyJob = false,
        grade = 1,
        coords = vector3(1395.79, -3278.07, 6.23),
        icon = "images/icons/oilrig.svg",
        image = "images/jobs/oilrig.webp",
        title = "Oil Rig Job",
        subtitle = "Fuel the world from the sea's depths",
        description =
        "As an oil rig worker, you'll head out to sea to extract valuable oil from deep beneath the ocean. Operate heavy machinery, maintain the rig, and process raw oil into a sellable product. The job is hands-on and packed with action, offering great pay for your hard work. Whether you're working solo or with a crew, this is your chance to experience the thrills of life on an oil rig. Suit up, get to work, and start making that black gold!",
        stats = {
            -- These functions allows you to configure your stats systems. Both working on server side! If nil is returned then it's just not display
            earnings = function()
                -- Average hour salary- need to return number
                if IsDuplicityVersion() then
                    return nil
                end
            end,
            time = function()
                -- Average worked time - need to return number (time into ms)
                if IsDuplicityVersion() then
                    return nil
                end
            end,
        },
    },
    ["postman"] = {
        enabled = true,
        applyJob = false,
        grade = 1,
        coords = vector3(-232.16, -915.15, 32.31),
        icon = "images/icons/postman.svg",
        image = "images/jobs/postman.webp",
        title = "Postman Job",
        subtitle = "Connecting people through every letter",
        description =
        "Become the city's trusted mail carrier! In this job, you'll pick up and fill news vending machines. Keep things running smoothly as you travel by foot or vehicle, ensuring timely deliveries and keeping everyone connected. If you enjoy a job with steady movement and a chance to interact with the community, this is the perfect role. Grab your mailbag, hit the streets, and start delivering right away!",
        stats = {
            -- These functions allows you to configure your stats systems. Both working on server side! If nil is returned then it's just not display
            earnings = function()
                -- Average hour salary- need to return number
                if IsDuplicityVersion() then
                    return nil
                end
            end,
            time = function()
                -- Average worked time - need to return number (time into ms)
                if IsDuplicityVersion() then
                    return nil
                end
            end,
        },
    },
    ["treasure"] = {
        enabled = true,
        applyJob = false,
        grade = 1,
        coords = vector3(167.82, -2222.7, 7.24),
        icon = "images/icons/tresture_hunter.svg",
        image = "images/jobs/treasure_hunter.webp",
        title = "Treasure Hunter",
        subtitle = "Seek fortunes in the world's hidden corners",
        description =
        "Embark on an adventurous quest as a treasure hunter! Dive into the depths of the ocean or explore hidden locations to uncover valuable treasures. Use your tools to search for buried loot, rare artifacts, and other precious finds. The thrill of discovery and big rewards make this job perfect for adventurers and risk-takers. Grab your gear, follow the clues, and start your journey to riches today! Who knows what treasures await?",
        stats = {
            -- These functions allows you to configure your stats systems. Both working on server side! If nil is returned then it's just not display
            earnings = function()
                -- Average hour salary- need to return number
                if IsDuplicityVersion() then
                    return nil
                end
            end,
            time = function()
                -- Average worked time - need to return number (time into ms)
                if IsDuplicityVersion() then
                    return nil
                end
            end,
        },
    },
    ["windowcleaner"] = {
        enabled = true,
        applyJob = false,
        grade = 1,
        coords = vec3(-1243.98, -1240.71, 11.03),
        icon = "images/icons/window_cleaner.svg",
        image = "images/jobs/window_cleaner.webp",
        title = "Window Cleaner Job",
        subtitle = "A clear view for a brighter day",
        description =
        "Time to climb high and shine bright! As a window cleaner, you'll scale buildings to keep the city's windows sparkling clean. Use your cleaning tools to remove dirt and grime, earning cash for every job completed. With great views and rewarding pay, this is a perfect job for those who aren't afraid of heights and love a fresh, clean finish. Grab your gear, take to the skies, and start making the city shine one window at a time!",
        stats = {
            -- These functions allows you to configure your stats systems. Both working on server side! If nil is returned then it's just not display
            earnings = function()
                -- Average hour salary- need to return number
                if IsDuplicityVersion() then
                    return nil
                end
            end,
            time = function()
                -- Average worked time - need to return number (time into ms)
                if IsDuplicityVersion() then
                    return nil
                end
            end,
        },
    },
}

-- Here you can add your businesses
-- NOTE: If business is not displaying into menu it's propably not registered as job into framework!
Config.Business = {
    -- ["NAME_OF_JOB"] = {                                                           -- Key is name of job from framework
    --     enabled = true,                                                           -- Is this job enabled
    --     applyJob = false,                                                         -- Is player can apply to this job
    --     grade = 1,                                                                -- Grade that player will recive
    --     gradeEdit = 0,                                                            -- Grade that player need to have to edit business page
    --     coords = vector3(926.47, -1560.25, 30.74),                                -- Business location
    --     icon = "path/to/icon.svg",                                                -- URL to icon - iff nil it's just not displayed
    --     image = "path/to/image.webp",                                              -- URL to image that is "banner"
    --     subtitle = "Lorem ipsum",                                                 -- Subtitle of this job
    --     description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", -- Description of this job
    --     stats = {                                                                 -- Stats configuration
    --         -- These functions allows you to configure your stats systems. Both working on server side! If nil is returned then it's just not display
    --         earnings = function()
    --             -- Average hour salary- returns string you can use FormatMoney(earnings) function
    --             if IsDuplicityVersion() then
    --                 return nil
    --             end
    --         end,
    --         time = function()
    --             -- Average worked time - need to return number (time into ms)
    --             if IsDuplicityVersion() then
    --                 return nil
    --             end
    --         end,
    --     },
    -- },
    -- ["ammunation"] = {
    --     enabled = true,
    --     applyJob = false,
    --     grade = 1,
    --     gradeEdit = 0,
    --     coords = vector3(23.0, -1105.67, 29.8),
    --     icon = "images/icons/ammunation.svg",
    --     image = "images/jobs/ammunation.webp",
    --     title = "Ammunation",
    --     subtitle = "Your defense is our priority",
    --     description = "Your one-stop shop for firearms, ammunition, and tactical gear. Whether you're gearing up for protection, a heist, or just peace of mind, we've got you covered. From handguns and shotguns to explosives and body armor, we ensure you're always ready for anything.",
    --     stats = {
    --         -- These functions allows you to configure your stats systems. Both working on server side! If nil is returned then it's just not display
    --         earnings = function()
    --             -- Average hour salary- need to return number
    --             if IsDuplicityVersion() then
    --                 return nil
    --             end
    --         end,
    --         time = function()
    --             -- Average worked time - need to return number (time into ms)
    --             if IsDuplicityVersion() then
    --                 return nil
    --             end
    --         end,
    --     },
    -- },
    -- ["weedshop"] = {
    --     enabled = true,
    --     applyJob = false,
    --     grade = 1,
    --     gradeEdit = 0,
    --     coords = vector3(-1168.64, -1572.89, 4.66),
    --     icon = "images/icons/weedshop.svg",
    --     image = "images/jobs/weedshop.webp",
    --     title = "Weed shop",
    --     subtitle = "Elevate your senses with premium cannabis",
    --     description = "Your go-to spot for premium cannabis and accessories. Whether you're looking to unwind, enhance creativity, or simply relax, we've got the finest strains and products to suit your needs. From top-shelf flowers to edibles and concentrates, we ensure quality with every purchase.",
    --     stats = {
    --         -- These functions allows you to configure your stats systems. Both working on server side! If nil is returned then it's just not display
    --         earnings = function()
    --             -- Average hour salary- need to return number
    --             if IsDuplicityVersion() then
    --                 return nil
    --             end
    --         end,
    --         time = function()
    --             -- Average worked time - need to return number (time into ms)
    --             if IsDuplicityVersion() then
    --                 return nil
    --             end
    --         end,
    --     },
    -- },
    -- ["bennys"] = {
    --     enabled = true,
    --     applyJob = false,
    --     grade = 1,
    --     gradeEdit = 0,
    --     coords = vector3(-211.72, -1325.31, 30.89),
    --     icon = "images/icons/bennys.svg",
    --     image = "images/jobs/bennys.webp",
    --     title = "Bennys",
    --     subtitle = "Customize your ride, express your style",
    --     description = "Your ultimate destination for custom vehicles and upgrades. Whether you're looking to enhance your ride's performance, style, or both, we've got you covered with top-of-the-line modifications. From sleek body kits to powerful engines, we turn your dream car into a reality.",
    --     stats = {
    --         -- These functions allows you to configure your stats systems. Both working on server side! If nil is returned then it's just not display
    --         earnings = function()
    --             -- Average hour salary- need to return number
    --             if IsDuplicityVersion() then
    --                 return nil
    --             end
    --         end,
    --         time = function()
    --             -- Average worked time - need to return number (time into ms)
    --             if IsDuplicityVersion() then
    --                 return nil
    --             end
    --         end,
    --     },
    -- },
    -- ["tattoo"] = {
    --     enabled = true,
    --     applyJob = false,
    --     grade = 1,
    --     gradeEdit = 0,
    --     coords = vector3(-1153.44, -1425.52, 4.95),
    --     icon = "images/icons/tattoo.svg",
    --     image = "images/jobs/tattoo.webp",
    --     title = "Tattoo Shop",
    --     subtitle = "Ink your skin with stories and art",
    --     description = "Your best tattoo destination for unique, custom designs. Whether it's your first piece or your latest addition, our skilled artists will bring your vision to life with precision and creativity. From bold statements to intricate details, we've got the perfect ink for you.",
    --     stats = {
    --         -- These functions allows you to configure your stats systems. Both working on server side! If nil is returned then it's just not display
    --         earnings = function()
    --             -- Average hour salary- need to return number
    --             if IsDuplicityVersion() then
    --                 return nil
    --             end
    --         end,
    --         time = function()
    --             -- Average worked time - need to return number (time into ms)
    --             if IsDuplicityVersion() then
    --                 return nil
    --             end
    --         end,
    --     },
    -- },
    -- ["gym"] = {
    --     enabled = true,
    --     applyJob = false,
    --     grade = 1,
    --     gradeEdit = 0,
    --     coords = vector3(-1201.14, -1569.93, 4.61),
    --     icon = "images/icons/gym.svg",
    --     image = "images/jobs/gym.webp",
    --     title = "Gym",
    --     subtitle = "Sculpt your body, elevate your spirit",
    --     description = "The ultimate place to push your limits and sculpt your perfect physique. Whether you're here to build strength, improve fitness, or transform your body, we've got the equipment, trainers, and motivation to help you succeed. From weights to cardio, we provide everything you need to crush your goals.",
    --     stats = {
    --         -- These functions allows you to configure your stats systems. Both working on server side! If nil is returned then it's just not display
    --         earnings = function()
    --             -- Average hour salary- need to return number
    --             if IsDuplicityVersion() then
    --                 return nil
    --             end
    --         end,
    --         time = function()
    --             -- Average worked time - need to return number (time into ms)
    --             if IsDuplicityVersion() then
    --                 return nil
    --             end
    --         end,
    --     },
    -- },
    ["pdm"] = {
        enabled = false,
        applyJob = false,
        grade = 1,
        gradeEdit = 0,
        coords = vector3(-45.67, -1098.34, 26.42),
        icon = "images/icons/pdm.svg",
        image = "images/jobs/pdm.webp",
        title = "Vehicle Dealer (PDM)",
        subtitle = "Drive the dream, luxury within reach",
        description =
        "Your exclusive destination for high-end vehicles and luxury rides. Whether you're looking for the latest sports car, a classic collector's piece, or a customized beauty, we offer the finest selection of premium vehicles. Drive in style and elevate your driving experience with us.",
        stats = {
            -- These functions allows you to configure your stats systems. Both working on server side! If nil is returned then it's just not display
            earnings = function()
                -- Average hour salary- need to return number
                if IsDuplicityVersion() then
                    return nil
                end
            end,
            time = function()
                -- Average worked time - need to return number (time into ms)
                if IsDuplicityVersion() then
                    return nil
                end
            end,
        },
    },
}
