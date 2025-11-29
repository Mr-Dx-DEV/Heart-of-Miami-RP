-- GM_DrugSell Configuration
-- All adjustable values for the drug-selling script
Config = {}

-- Framework & Notification Settings
Config.Framework = 'qb' -- 'auto', 'qb', 'esx'
Config.NotificationSystem = 'ox_lib' -- 'framework', 'ox_lib', 'native', 'mythic', 'okoknotify'
Config.TargetSystem = 'ox_target' -- 'ox_target' or 'qb-target'
Config.DebugMode = false -- Enable debug prints

-- ============================================================================
-- DEALER PED SETTINGS
-- ============================================================================
Config.DealerPedModel = 'a_m_m_afriamer_01' -- Ped model hash or name
Config.DealerPedAnimation = 'WORLD_HUMAN_STUPOR' -- Animation to play

-- ============================================================================
-- DEALER LOCATIONS (rotates per server restart)
-- Format: vec4(x, y, z, heading)
-- ============================================================================
Config.DealerLocations = {
    vec4(181.701, -1203.891, 28.295, 164.145), 
    vec4(246.664, 111.814, 101.517, 337.498),
    vec4(-1610.969, -1045.151, 4.991, 144.44),
    vec4(86.406, 811.317, 210.121, 232.52),
    vec4(1007.727, -107.969, 72.889, 30.681),
    vec4(128.778, -1259.05, 28.443, 287.193),
}

-- ============================================================================
-- BULK SELLING CONFIGURATION
-- ============================================================================
Config.BulkSellingEnabled = true -- Enable/Disable bulk selling functionality
Config.BulkMode = 'multi' -- 'multi' (up to 4 jobs) or 'single' (one at a time)
Config.BulkLocations = {
    {
        name = "Redwood Lights",
        mainPos = vector3(1021.108, 2448.554, 44.382),
        pedSpawns = {
            vector3(1014.475, 2445.404, 44.379),
            vector3(1030.886, 2459.33, 49.565),
            vector3(1026.9788, 2455.5439, 48.5704),
            vector3(1017.8271, 2456.6187, 48.5704),
            vector3(1020.7081, 2463.144, 48.5704),
            vector3(1031.4447, 2451.3752, 48.5704),
            vector3(1029.7576, 2443.2395, 48.5704),
            vector3(1029.7576, 2443.2395, 48.5704),
            vector3(1016.4, 2431.2329, 45.2557),
            vector3(1015.504, 2449.405, 43.425),
            vector3(1029.9048, 2447.5808, 44.6344),
            vector3(1030.0388, 2447.6404, 52.6205),
            vector3(1025.1229, 2435.9663, 52.6205),
            vector3(1038.1613, 2463.5447, 48.2357),
            vector3(1003.5598, 2424.6194, 48.5805),
            vector3(974.4958, 2428.8406, 54.2582),
            vector3(979.0154, 2420.9124, 54.3575),
            vector3(1027.4442, 2440.886, 57.3789),

        },
        bossPos = vector3(1027.021, 2440.8547, 48.5704),
        vehicleSpawns = {
            vector3(994.614, 2455.178, 48.794),
        }
    },
    {
        name = "Mount Chiliad",
        mainPos = vector3(-1125.304, 4924.141, 218.993),
        pedSpawns = {
           vector3(-1141.7605, 4912.9741, 219.9737),
           vector3(-1147.9193, 4908.6782, 219.9737),
           vector3(-1152.1738, 4910.7529, 218.9417),
           vector3(-1166.7358, 4922.709, 221.7984),
           vector3(-1164.7479, 4929.7095, 222.2614),
           vector3(-1148.9005, 4939.606, 221.2736),
           vector3(-1137.7994, 4935.9893, 221.2736),
           vector3(-1134.4227, 4944.8701, 221.2736),
           vector3(-1135.5657, 4913.6982, 218.8721),
           vector3(-1078.3043, 4939.668, 228.2268),
           vector3(-1045.3888, 4917.854, 211.5374),
           vector3(-1118.4243, 4903.6152, 221.584),
           vector3(-1138.6151, 4951.5835, 226.1988),
           vector3(-1125.2233, 4894.9712, 217.4776),
           vector3(-1097.9889, 4894.5117, 215.0715),
        },
        bossPos =  vector3(-1100.8097, 4939.9907, 217.3565),
        vehicleSpawns = {
            vector3(-1153.082, 4916.869, 220.801),
        }
    },
    {
        name = "Dock Yard",
        mainPos = vector3(1062.989, -3260.872, 5.899),
        pedSpawns = {
           vector3(1065.2108, -3253.2053, 6.138),
           vector3(1061.7727, -3267.574, 6.1382),
           vector3(1063.3859, -3272.0391, 6.1376),
           vector3(1090.9001, -3269.7065, 4.8959),
           vector3(1093.1782, -3251.1404, 4.8984),
           vector3(1086.0247, -3244.2947, 14.9919),
           vector3(1055.4467, -3269.8613, 4.8979),
           vector3(1095.8392, -3267.3438, 9.0282),
           vector3(1068.8275, -3246.2705, 4.8948),
           vector3(1112.9908, -3253.249, 8.0941),
           vector3(1053.618, -3267.4697, 8.0938),
           vector3(1060.2279, -3260.7964, 4.9),
           vector3(1060.595, -3245.8826, 4.8947),
           vector3(1098.99, -3246.7756, 4.8953),
           vector3(1079.4933, -3288.9243, 9.1239),
           vector3(1057.3516, -3248.887, 8.0937),
           
        },
        bossPos =  vector3(1092.7533, -3261.6091, 4.8972),
        vehicleSpawns = {
            vector3(1121.0, -3261.095, 5.898)
        }
    },
    {
        name = "Granny House",
        mainPos = vector3(2449.886, 4976.391, 46.81),
        pedSpawns = {
           vector3(2455.9111, 4982.9771, 45.8099),
           vector3(2433.3689, 4970.6382, 49.9387),
           vector3(2434.9634, 4973.1606, 50.5678),
           vector3(2441.8779, 4986.5781, 50.5648),
           vector3(2442.8298, 4987.5356, 50.5648),
           vector3(2440.9219, 4974.5967, 50.5794),
           vector3(2443.4155, 4978.6011, 50.5647),
           vector3(2453.1816, 4981.9341, 47.0603),
           vector3(2449.981, 4980.9731, 45.8104),
           vector3(2454.3093, 4984.2324, 45.8098),
           vector3(2460.3691, 4989.9424, 45.8105),
           vector3(2430.7922, 4968.4058, 45.8268),
           vector3(2435.3567, 4972.9731, 45.8306),
           vector3(2484.6614, 4957.4072, 43.902),
           vector3(2487.472, 4974.89, 45.241),
           vector3(2411.8967, 5006.0234, 45.4886),
           vector3(2436.0828, 5009.9312, 45.7898),
           vector3(2469.7764, 4941.4487, 44.0698),
           vector3(2456.967, 4984.491, 46.366),
           
        },
        bossPos = vector3(2451.1106, 4968.8794, 49.8663),
        vehicleSpawns = {
           vector3(2454.886, 4949.749, 45.1)
        }
    },
}

Config.BulkDeliveryPedModels = {
    'g_m_y_ballaeast_01',
    'g_m_importexport_01',
    'g_m_m_chicold_01',
    'g_m_y_lost_01',
    'g_m_y_ballasout_01',
    'g_m_y_mexgoon_01',
    'g_m_y_lost_03',
    'g_m_y_salvagoon_01',
    'g_m_y_strpunk_01',
    'g_m_y_mexgoon_02',
    'g_m_y_lost_02',
}

Config.BossPedModel = 'g_m_y_salvaboss_01' -- Boss ped model
Config.GuardPedModel = 'g_m_m_armgoon_01' -- Guard ped model

Config.DeliveryPedCount = 15 -- Number of peds to spawn at delivery
Config.ZoneHasBoss = true -- Boss always spawns
Config.BossGuardCount = 2 -- Number of guards for boss (always spawn)
Config.DeliveryPedDistance = 100.0 -- Distance to despawn peds

-- NPC Weapons
Config.NPCWeapons = {
    'WEAPON_PISTOL',
    'WEAPON_COMBATPISTOL',
    'WEAPON_APPISTOL',
    'WEAPON_MICROSMG',
    'WEAPON_SMG',
}

-- NPC Parameters
Config.PedParameters = {
    Health = 200,                   -- NPC health
    Headshots = false,               -- Can be killed by headshots
    CombatAbility = 100,            -- Combat ability (0-100)
    Accuracy = 100,                  -- Weapon accuracy (0-100)
    CombatRange = 2,                -- Combat range (0=melee, 1=short, 2=medium, 3=long)
    CombatMovement = 2,             -- Combat movement (0=static, 1=defensive, 2=aggressive, 3=suicidal)
    CanRagdoll = false,              -- Can ragdoll when hit
}

-- NPC Behaviors
Config.NPCAttackChance = 0.5 -- 50% chance NPC attacks during bulk
Config.NPCLootOnKill = true -- NPCs loot items from dead players
Config.NPCEscapeVehicles = {
    'blista',
    'oracle',
    'fugitive',
    'granger'
}
Config.NPCEscapeDistance = 200.0 -- Distance to escape point

Config.BulkAcceptToReachSeconds = 900 -- 15 minutes to reach location
Config.BulkMinAmount = 50
Config.BulkMaxAmount = 100
Config.BulkItems = {
    'kq_meth_high',
    'coke',
} 

-- ============================================================================
-- BLIP & ZONE CONFIGURATION
-- ============================================================================
Config.BlipType = 'radius' -- 'normal' or 'radius' (radius blip shows zone size)
Config.BlipRadius = 100.0 -- Radius size for radius blips (in meters)
Config.BlipColour = 1 -- Blip colour (2 = red)
Config.BlipScale = 0.8 -- Blip scale
Config.RadiusAlpha = 60 -- Opcacity for radius blip

Config.UseOxZone = true -- Use ox_lib zones for delivery
Config.DeliveryZoneRadius = 50.0 -- Radius for delivery zone (meters)

-- ============================================================================
-- DEALER ITEM ROTATION
-- ============================================================================
Config.DealerItemRotationSeconds = 300 -- 5 minutes - how often dealer changes item
Config.BulkCooldownAfterSuccessSeconds = 1800
Config.BulkCooldownAfterFailSeconds = 2400 -- 40 min on fail
Config.ServerCooldownAfterJobSeconds = 1800 -- For 'single' mode
Config.ServerCooldownAfterAllOccupiedSeconds = 1800 -- When all 4 slots full

-- ============================================================================
-- PRICING & QUANTITY MODIFIERS
-- ============================================================================
Config.ItemPrices = {
    kq_weed_bag_og_kush = 800,
    kq_weed_bag_purple_haze = 1000,
    kq_weed_bag_white_widow = 1300,
    kq_weed_bag_blue_dream = 1500,
    kq_meth_low = 4000,
    kq_meth_mid = 5000,
    kq_meth_high = 6000,
    coke = 4500,
}

-- Quantity-based price modifiers (lower quantity = higher price)
Config.QuantityPriceModifiers = {
    {min = 50, max = 100, multiplier = 1.0},
}

-- Cops price effect
Config.CopsPriceEffect = true -- Enable/disable cop count affecting price
Config.CopsEffectScale = 0.02 -- Price increase per cop (2% per cop)
Config.MaxCopsEffect = 0.2 -- Max 50% increase from cops

-- Police job names (for detecting online police)
Config.PoliceJobNames = {
    'police',
    'lspd',
    'bcso',
    'sasp',
    'cop',
}

-- ============================================================================
-- PERFORMANCE & OPTIMIZATION
-- ============================================================================
Config.PlayerAcceptRateLimitSeconds = 5 -- Rate limit accept attempts

-- ============================================================================
-- PROGRESS BAR SETTINGS
-- ============================================================================
Config.ProgressBars = {
    -- Single progress bar for talking with the boss (increased duration)
    talkToBoss = {
        label = 'Talking with the boss...',
        duration = 10000, -- 6 seconds - increased from 2 seconds
        canCancel = false
    },
    -- Progress bar for looting boss
    lootBoss = {
        label = 'Looting boss...',
        duration = 5000,
        canCancel = false
    }
}


-- ============================================================================
-- SINGLE SELLING CONFIGURATION
-- ============================================================================
Config.SingleSellEnabled = true -- Enable/disable single selling

-- Single Selling Items (completely separate from bulk selling)
-- Ped will randomly select from items player has in inventory
-- minSell: minimum amount ped will try to buy
-- maxSell: maximum amount ped will try to buy
Config.SingleSellItems = {
    -- Weed
    { item = 'kq_weed_bag_og_kush', minSell = 1, maxSell = 3, price = 500 },
    { item = 'kq_weed_bag_purple_haze', minSell = 1, maxSell = 3, price = 700 },
    { item = 'kq_weed_bag_white_widow', minSell = 1, maxSell = 2, price = 1000 },
    { item = 'kq_weed_bag_blue_dream', minSell = 1, maxSell = 2, price = 1200 },
    -- Meth
    { item = 'kq_meth_low', minSell = 1, maxSell = 1, price = 2500 },
    { item = 'kq_meth_mid', minSell = 1, maxSell = 1, price = 3500 },
    { item = 'kq_meth_high', minSell = 1, maxSell = 1, price = 4500 },
    -- Coke
    { item = 'coke', minSell = 1, maxSell = 2, price = 3000 },
}

-- Police Price Modifier for Single Selling
-- Price increases based on number of active police online
-- Formula: basePrice * zoneMultiplier * policePriceModifier
Config.SingleSellPolicePriceEffect = true -- Enable/disable police affecting price
Config.SingleSellPoliceEffectScale = 0.05 -- Price increase per police officer (15% per cop)
Config.SingleSellMaxPoliceEffect = 0.5 -- Maximum price multiplier from police (150% = 2.5x price)

-- Ped Spawning Configuration (for dealerped mode)
Config.PedSpawning = {
    Enabled = true,                    -- Enable/disable ped spawning
    SpawnDistance = 60.0,              -- Distance from player where peds spawn
    WalkDistance = 5.0,                -- Distance peds walk towards player before stopping
    SpawnCooldown = 3000,              -- Cooldown between ped spawns (milliseconds)
    MinPeds = 1,                       -- Minimum peds to spawn
    MaxPeds = 2,                       -- Maximum peds that can be active at once
    PedModels = {                      -- Ped models to randomly spawn
        'g_m_importexport_01',
        'g_m_y_ballaeast_01',
        'g_m_y_azteca_01',
        'g_m_y_ballaorig_01',
        'g_m_m_korboss_01',
        'g_m_y_famdnf_01',
        'g_m_y_lost_01',
        'g_m_y_lost_03',
        'g_m_y_salvagoon_01',
        'g_m_y_pologoon_01',
        'g_m_m_mexboss_02',

    },
    PedTimeout = 60000,                -- Time before ped despawns if not interacted (milliseconds)
}

-- These cooldowns persist even if player leaves and rejoins the server
Config.SingleSellRejectCooldown = 300 -- 5 minutes in seconds (when player rejects a zone)
Config.SingleSellZoneExitCooldown = 600 -- 10 minutes in seconds (when player leaves zone during job)

-- Mode: 'attack' = ped steals and attacks player, 'steal' = ped steals and runs away, 'random' = random between both
Config.PedRobberyMode = 'random' -- 'attack', 'steal', or 'random'
Config.PedRobberyAttackChance = 0.2 -- 50% chance to attack (only used if mode is 'random')
Config.PedRobberyMoneyReward = math.random(5, 50) -- Money reward for killing ped in attack mode (set to 0 to disable)
Config.PedRobberyStealChance = 0.3 -- 30% chance ped will steal drugs instead of buying normally

-- Options: 'bat', 'knife', 'pistol', 'random'
Config.PedAttackWeapon = 'random' 

-- priceMultiplier: Adjust item price for this zone (1.0 = base price, 1.2 = 20% increase, 0.8 = 20% decrease)
Config.SingleSellingZones = {
    {
        zoneID = 1,
        zoneName = 'Vinewood',
        zone = {
            vector3(-524.24, 304.55, 83.02),
            vector3(-146.97, 323.479, 105.311),
            vector3(32.982, 257.875, 109.605),
            vector3(-89.641, -90.26, 57.719),
            vector3(-546.992, 27.788, 44.221)
        },
        minZ = 0.0,
        maxZ = 100.0,
        priceMultiplier = 1.3, -- 30% increase
    },
    {
        zoneID = 2,
        zoneName = 'Nikola',
        zone = {
            vector3(859.565, -551.127, 30.333),
            vector3(884.85, -520.45, 30.0),
            vector3(946.97, -493.18, 30.0),
            vector3(1025.76, -435.61, 30.0),
            vector3(1103.03, -372.73, 30.0),
            vector3(1135.61, -358.33, 30.0),
            vector3(1215.91, -376.52, 30.0),
            vector3(1268.18, -405.30, 30.0),
            vector3(1286.36, -461.36, 30.0),
            vector3(1268.18, -515.15, 30.0),
            vector3(1259.09, -563.64, 30.0),
            vector3(1265.91, -601.52, 30.0),
            vector3(1282.58, -636.36, 30.0),
            vector3(1291.67, -670.45, 30.0),
            vector3(1280.30, -708.33, 30.0),
            vector3(1259.85, -737.88, 30.0),
            vector3(1222.73, -756.06, 30.0),
            vector3(1162.88, -759.09, 30.0),
            vector3(1087.12, -759.85, 30.0),
            vector3(1047.73, -756.82, 30.0),
            vector3(1021.97, -731.82, 30.0),
            vector3(976.52, -678.79, 30.0),
            vector3(934.85, -630.30, 30.0),
            vector3(888.64, -589.39, 30.0),
            vector3(865.15, -572.73, 30.0)
        },
        minZ = 0.0,
        maxZ = 100.0,
        priceMultiplier = 1.2, -- 20% increase
    },
    {
        zoneID = 3,
        zoneName = 'Vespucci',
        zone = {
            vector3(-1201.52, -990.91, 0.0),
            vector3(-968.18, -830.03, 0.0),
            vector3(-905.30, -926.52, 0.0),
            vector3(-874.24, -975.76, 0.0),
            vector3(-850.76, -1012.88, 0.0),
            vector3(-827.27, -1052.27, 0.0),
            vector3(-784.85, -1114.39, 0.0),
            vector3(-1062.12, -1266.67, 0.0),
            vector3(-1217.42, -1003.03, 0.0)
        },
        minZ = 0.0,
        maxZ = 100.0,
        priceMultiplier = 1.1, -- 10% increase
    },
    {
        zoneID = 4,
        zoneName = 'Gove Street',
        zone = {
            vector3(32.58, -1929.55, 0.0),
            vector3(167.42, -1773.48, 0.0),
            vector3(257.58, -1857.58, 0.0),
            vector3(110.61, -2022.73, 0.0)
        },
        minZ = 0.0,
        maxZ = 100.0,
        priceMultiplier = 1.2, -- 20% increase
    },
    {
        zoneID = 5,
        zoneName = 'Docs',
        zone = {
            vector3(880.30, -2951.52, 0.0),
            vector3(1071.97, -2951.52, 0.0),
            vector3(1071.21, -3112.12, 0.0),
            vector3(874.24, -3112.88, 0.0)
        },
        minZ = 0.0,
        maxZ = 100.0,
        priceMultiplier = 1.1, -- 10% increase
    },
    {
        zoneID = 6,
        zoneName = 'Senora FWY',
        zone = {
            vector3(2321.97, 2622.73, 20.0),
            vector3(2306.82, 2550.76, 20.0),
            vector3(2288.64, 2497.73, 20.0),
            vector3(2350.00, 2474.24, 20.0),
            vector3(2388.64, 2530.79, 20.0),
            vector3(2378.03, 2634.09, 20.0)
        },
        minZ = 0.0,
        maxZ = 100.0,
        priceMultiplier = 0.90, -- 10% decrease
    },
    {
        zoneID = 7,
        zoneName = 'Sandy Shores (Niland)',
        zone = {
            vector3(1962.88, 3868.18, 10.0),
            vector3(2033.33, 3746.97, 10.0),
            vector3(1890.15, 3668.18, 10.0),
            vector3(1815.91, 3781.06, 10.0)
        },
        minZ = 0.0,
        maxZ = 100.0,
        priceMultiplier = 1.05, -- 5% increase
    },
    {
        zoneID = 8,
        zoneName = 'Sandy Shores (Algonquin)',
        zone = {
            vector3(1962.88, 3868.18, 10.0),
            vector3(2033.33, 3746.97, 10.0),
            vector3(1890.15, 3668.18, 10.0),
            vector3(1815.91, 3781.06, 10.0)
        },
        minZ = 0.0,
        maxZ = 100.0,
        priceMultiplier = 1.03, -- 3% increase
    },
    {
        zoneID = 9,
        zoneName = 'Stab City',
        zone = {
            vector3(-17.42, 3681.82, 10.0),
            vector3(9.09, 3604.55, 10.0),
            vector3(104.55, 3580.30, 10.0),
            vector3(118.94, 3662.88, 10.0),
            vector3(118.94, 3736.36, 10.0),
            vector3(56.06, 3761.36, 10.0),
            vector3(0.00, 3734.09, 10.0)
        },
        minZ = 0.0,
        maxZ = 100.0,
        priceMultiplier = 1.05, -- 5% increase
    },
    {
        zoneID = 10,
        zoneName = 'Great Ocean Highway',
        zone = {
            vector3(1415.91, 6385.61, 5.0),
            vector3(1566.67, 6352.27, 5.0),
            vector3(1565.91, 6290.91, 5.0),
            vector3(1557.58, 6241.67, 5.0),
            vector3(1481.82, 6299.24, 5.0),
            vector3(1409.85, 6296.21, 5.0),
            vector3(1400.76, 6337.88, 5.0),
            vector3(1413.64, 6375.00, 5.0)
        },
        minZ = 0.0,
        maxZ = 100.0,
        priceMultiplier = 1.0, -- Base Price
    },
    {
        zoneID = 11,
        zoneName = 'Paleto Bay (North)',
        zone = {
            vector3(-162.12, 6350.00, 0.0),
            vector3(-87.88, 6283.33, 0.0),
            vector3(-31.82, 6293.94, 0.0),
            vector3(-3.03, 6250.00, 0.0),
            vector3(222.73, 6362.12, 0.0),
            vector3(150.00, 6481.82, 0.0),
            vector3(72.73, 6446.97, 0.0),
            vector3(4.55, 6510.61, 0.0)
        },
        minZ = 0.0,
        maxZ = 100.0,
        priceMultiplier = 1.03, -- 3% increase
    },
    {
        zoneID = 11,
        zoneName = 'Paleto Bay (Bayside)',
        zone = {
            vector3(-378.79, 6287.12, 0.0),
            vector3(-308.33, 6215.91, 0.0),
            vector3(-385.61, 6142.42, 0.0),
            vector3(-418.18, 6187.88, 0.0),
            vector3(-413.64, 6260.61, 0.0)
        },
        minZ = 0.0,
        maxZ = 100.0,
        priceMultiplier = 1.0, -- Base Price
    },
}

Config.SingleSellPoliceCallChance = 60  -- police call chance

-- ============================================================================
-- MONEY PAYMENT CONFIGURATION
-- ============================================================================
Config.Money = {
    cash = false,                    -- Give cash directly to player
    bank = false,                   -- Give money to bank account
    cashitem = 'dirtymoney',        -- Item to give if both cash and bank are false
    iteminfo = false                 -- If true, adds 'worth' metadata to cashitem; if false, gives plain item
}

-- ============================================================================
-- LOCALIZATION
-- ============================================================================
Config.Locale = 'en'
