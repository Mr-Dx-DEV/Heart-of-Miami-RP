Config.Job = {
    pos = vec3(270.824, 7.128, 79.245),   -- Coords where people take the job

    RequiredDeliveries = 5,               -- How many posters needs to be placed for mission be done
    InteractCheckDist = 2.0,              -- Check distance to render help keys / interaction
    ActiveJobPeopleLimit = 5,             -- How many people can do the job at once

    ResetPool = 2,                        -- How long it takes before same location can be used again for mission

    DeliverDuration = 6,                  -- How long it takes to place banner on the wall
    ResetMissionCooldown = 5,             -- Cooldown to start next job.

    BaseReward = 100, -- Default base reward for finished job

    RewardItem = 'money', -- Reward item for finished job

    NPC = {
        heading = -100.0, -- Heading of start mission NPC
        model = 'a_m_m_soucent_02' -- Start mission NPC model
    },

    Blip = {
        enabled = true, -- Render job location blip?
        scale = 1.0,    -- Scale of blip
        sprite = 267,   -- P symbol
        color = 5,      -- Yellow
        type = 'job_static', -- Dont adjust it
    }
}

JobLocations = {
    { pos = vec3(-1063.016, -2543.65, 20.62),   rot = vec3(0, 0, 60) },
    { pos = vec3(-1190.562, -1573.05, 4.825),   rot = vec3(0, 0, 125) },
    { pos = vec3(-1699.368, 184.65, 64.37),     rot = vec3(0, 0, 125) },
    { pos = vec3(310.839, 181.765, 104.35),     rot = vec3(0, 0, 20) },
    { pos = vec3(465.75, -1852.445, 28.21),     rot = vec3(0, 0, 175.96) },
    { pos = vec3(-545.036, -203.059, 38.675),   rot = vec3(0, 0, 30) },
    { pos = vec3(208.2, -921.705, 31.15),       rot = vec3(0, 0, -35) },
    { pos = vec3(1218.216, -417.705, 68.175),   rot = vec3(0, 0, -105) },
    { pos = vec3(-425.6, 1108.455, 328.135),    rot = vec3(0, 0, 164.5) },
    { pos = vec3(797.05, -2136.48, 29.999),     rot = vec3(0, 0, -180) },
    { pos = vec3(-3030.482, 60.75, 12.06),      rot = vec3(0, 0, -120) },
    { pos = vec3(702, 563.167, 129.5),          rot = vec3(0, 0, -20) },
    { pos = vec3(-1045.026, -1029.15, 2.58),    rot = vec3(0, 0, -60) },
    { pos = vec3(-788.9, 308.72, 86.15),        rot = vec3(0, 0, 0) },
    { pos = vec3(-998.319, -322.35, 38.275),    rot = vec3(0, 1, -62.5) },
    { pos = vec3(230.292, -407.74, 48.375),     rot = vec3(0, 0, 160) },
    { pos = vec3(-528.15, -855.011, 30.425),    rot = vec3(0, 0, 180) },
    { pos = vec3(763.426, -947.7, 26.275),      rot = vec3(0, 0, 96) },
    { pos = vec3(137.853, -1474.6, 29.81),      rot = vec3(0, 0, -40.4) },
    { pos = vec3(1150.35, -292.433, 69.48),     rot = vec3(0, 0, -170) },
    { pos = vec3(-1618.889, -1049.25, 13.6),    rot = vec3(0, 0, 140) },
    { pos = vec3(-2256.5, 235.642, 175.05),     rot = vec3(0, 0, 179) },

    -- 142

    { pos = vec3(419.641, -986.05, 29.875),     rot = vec3(0, 0, -90) },
    { pos = vec3(-554.332, 274.35, 83.475),     rot = vec3(0, 0, -5) },
    { pos = vec3(-1126.816, -1561.701, 4.83),   rot = vec3(0, 0, 35) },
    { pos = vec3(-1396.85, -592.888, 30.775),   rot = vec3(0, 0, -147) },
    { pos = vec3(-1279.4, 311.658, 65.94),      rot = vec3(0, 0, 60.9) },
    { pos = vec3(-159.774, -1427.009, 31.665),  rot = vec3(0, 0, -57.7) },
    { pos = vec3(555.282, -1563.469, 29.725),   rot = vec3(0, 0, -135.1) },
    { pos = vec3(217.787, 301.1, 106.035),      rot = vec3(0, 0, 69) },
    { pos = vec3(-61, -207.764, 46.245),        rot = vec3(0, 0, -20) },
    { pos = vec3(434.335, -2039.761, 23.895),   rot = vec3(0, 0, 140) },
    { pos = vec3(-231.604, -1298.944, 31.75),   rot = vec3(0, 0, 0) },
    { pos = vec3(947.9, -1458.78, 31.85),       rot = vec3(0, 0, -179.8) },
    { pos = vec3(1133.9, -963.072, 47.95),      rot = vec3(0, 0, -166.7) },
    { pos = vec3(1022, 160.278, 81.44),         rot = vec3(0, 0, -122) },
    { pos = vec3(-2283.602, 372.85, 175.05),    rot = vec3(0, 0, -135) },
    { pos = vec3(-800.3, -94.84, 38.1),         rot = vec3(0, 0, 27.1) },
    { pos = vec3(-546.55, -45.461, 42.95),      rot = vec3(0, 2, -114) },
    { pos = vec3(1089.2, -505.245, 63.475),     rot = vec3(0, -1, 5) },
    { pos = vec3(269.328, -641.8, 42.47),       rot = vec3(0, 0, -110) },

    -- 143

    { pos = vec3(-941.9, -1190.512, 5.35),      rot = vec3(0, 0, 29.5) },
    { pos = vec3(-1411.444, -96.376, 52.96),    rot = vec3(0, 0, 107.5) },
    { pos = vec3(194.194, -1819.134, 29.105),   rot = vec3(0, 0, 140) },
    { pos = vec3(189.139, -1091.49, 29.74),     rot = vec3(0, 0, 90) },
    { pos = vec3(-600, -351.126, 35.425),       rot = vec3(0, -2.16, 1.2) },
    { pos = vec3(863.361, -1015.34, 30.44),     rot = vec3(0, 0, -90) },
    { pos = vec3(-1065.998, -2548.815, 14.395), rot = vec3(0, 0, 60) },
    { pos = vec3(-242.85, -349.054, 30.45),     rot = vec3(0, 0, -132.5) },
    { pos = vec3(-569.25, -681.635, 32.8),      rot = vec3(0, 0, -180) },
    { pos = vec3(-231.604, -1298.944, 31.75),   rot = vec3(0, 0, 0) },
    { pos = vec3(442.8, -690.119, 29.13),       rot = vec3(0, 0, -180) },
    { pos = vec3(322.55, 312.226, 105.715),     rot = vec3(0, 0, 167.2) },
    { pos = vec3(-103.994, -585.95, 36.72),     rot = vec3(0, 0, 70) },
    { pos = vec3(-1190.6, -1572.996, 4.82),     rot = vec3(0, 0, 125) },
    { pos = vec3(-1802.043, -1196.85, 13.47),   rot = vec3(0, 0, -130) },
    { pos = vec3(47.85, -177.132, 55.52),       rot = vec3(0, 0, 160) },
    { pos = vec3(491.128, -1300.8, 29.745),     rot = vec3(0, 0, 90) },
    { pos = vec3(219.228, 1189.95, 226.045),    rot = vec3(0, 0, 103.5) },
    { pos = vec3(1320.674, -1650.8, 52.6),      rot = vec3(0, 0, -141) }
}
