local Config = {}

Config.Debug = false -- Loads of prints in F8 
Config.UseMPH = false -- Use MPH instead of KPH

Config.Stress = {
  chance = 0.1, -- Percentage stress chance when shooting (0-1)
  minForShaking = 50, -- Minimum stress level for screen shaking
  minForSpeeding = 1000, -- Minimum stress level for speeding while buckled (works with JG HUD seatbelt)
  minForSpeedingUnbuckled = 100, -- Minimum stress level for speeding while unbuckled (works with JG HUD seatbelt)
  whitelistedWeapons = { -- Weapons which don't give stress
    `weapon_petrolcan`, -- Please use backticks (`) not quotes ("/')
    `weapon_hazardcan`,
    `weapon_fireextinguisher`,
  },
  blurIntensity = {
      [1] = {min = 10, max = 20, intensity = 1000},
      [2] = {min = 20, max = 30, intensity = 1281},
      [3] = {min = 30, max = 40, intensity = 1562},
      [4] = {min = 40, max = 50, intensity = 1843},
      [5] = {min = 50, max = 60, intensity = 2125},
      [6] = {min = 60, max = 70, intensity = 2406},
      [7] = {min = 70, max = 80, intensity = 2687},
      [8] = {min = 80, max = 90, intensity = 2968},
      [9] = {min = 90, max = 100, intensity = 3250},
      [10] = {min = 100, max = 110, intensity = 3531}, -- just in case stress can exceed 100
  },

  effectInterval = {
      [1] = {min = 10, max = 20, timeout = math.random(50000, 60000)},
      [2] = {min = 20, max = 30, timeout = math.random(45625, 55625)},
      [3] = {min = 30, max = 40, timeout = math.random(41250, 51250)},
      [4] = {min = 40, max = 50, timeout = math.random(36875, 46875)},
      [5] = {min = 50, max = 60, timeout = math.random(32500, 42500)},
      [6] = {min = 60, max = 70, timeout = math.random(28125, 38125)},
      [7] = {min = 70, max = 80, timeout = math.random(23750, 33750)},
      [8] = {min = 80, max = 90, timeout = math.random(19375, 29375)},
      [9] = {min = 90, max = 100, timeout = math.random(15000, 20000)},
  }
}

Config.WhitelistedJobs = {} -- Disable stress for whatever jobs you want

return Config