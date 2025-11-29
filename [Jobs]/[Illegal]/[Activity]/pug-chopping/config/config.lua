------------------------------
Config.MiniGameScript = 'ps-ui' -- [arcade machine] Recommended to use ps-ui script (if you do not want to use ps-ui search the script for Config.MiniGameScript and change it to your liking)
----------
Config.ChopBlip = 653 -- The blip icon for when a player goes and breaks down a car for its parts. Blip id's can be found here: https://docs.fivem.net/docs/game-references/blips/
Config.ChopBlipColor = 46 -- The blip icon color for when a player goes and breaks down a car for its parts. Blip id's can be found here: https://docs.fivem.net/docs/game-references/blips/
----------
Config.DropOffBlip = 357 -- The blip icon for when a player has to take a car back to there garage after they stole it. Blip id's can be found here: https://docs.fivem.net/docs/game-references/blips/
Config.DropOffBlipColor = 2 -- The blip icon color for when a player has to take a car back to there garage after they stole it. Blip id's can be found here: https://docs.fivem.net/docs/game-references/blips/
----------
Config.BigCircleBlipColor = 49 -- Big blip color for when you need to find the car to pickup
----------
----------
Config.CarsNeededToEarnForDrop = 175 -- The amount of cars a garages has needed to earn overall to have a chance at getting Config.RareItem1 and Config.RareItem2 drops when they search a trunk
Config.RareItem2 = "advancedlockpick" -- Another very rare item you cab only get when searching a trunk if your garage has earned over Config.CarsNeededToEarnForDrop cars overall
Config.RareItemChance2 = 4 -- The % of chance player gets Config.RareItem2 if there garage has earned over Config.CarsNeededToEarnForDrop amount.. (so if you change this to 50 for example the player will have a 50% chance of Config.RareItem2 every time they search a trunk)
----------
Config.RareItem1 = "boostinglaptop" -- A very rare item you cab only get when searching a trunk if your garage has earned over Config.CarsNeededToEarnForDrop cars overall
Config.RareItemChance = 1 -- The % of chance player gets Config.RareItem1 if there garage has earned over Config.CarsNeededToEarnForDrop amount. (so if you change this to 50 for example the player will have a 50% chance of Config.RareItem1 every time they search a trunk)
----------
----------
Config.RandomRareItem = "trackeritem" -- Random Rare drop a player can get when searching a trunk with no requirements needed
Config.RandomRareItemChance = 25 -- % chance player gets Config.RandomRareItem when searching a trunk (no requirements needed for the player to get this item unlike how Config.RareItem1 and Config.RareItem2 work)
----------
----------
Config.EnableEnterAtAllLocations = false -- Make this false if you want to make it so that players can only enter their garage from the location they purchased it from.
Config.SetVehiclesLocked = true -- Set this false if you want vehicles to be unlocked when players go to pick them up when stealing the,
Config.UseProgressBar = true -- Some esx servers may not use a progress bar. (ignore this if your qbcore)
Config.DoCutSceneWehnPurchase = true -- Toggle the cutscene that plays when a player buys a garage true or false
Config.DoCameraEffect = true -- Create a camera effect every time you enter the garage
Config.CanRemoveGarageOwner = false -- If the members of the garage can remove the owner or not
Config.UsingNewQBCore = false -- If you are using an older qbcore server that has not been updated to the qbcore may 2024 2.0 version make this false. This mostly handles stashes for the inventory and the shops.
----------
----------
Config.JobRequired = false -- Make this true or false for if the player needs the Config.JobName job role to do this job.
Config.JobName = "mechanic" -- This is the job name required only if Config.JobRequired is true
----------
----------
Config.UseSharedVehicleCars = false -- (QBCore ONLY) Make this true if you want the vehicles that are randomly spawned to be picked up to be any vehicle in the shared.lua (if the shop is boat, air, or police it will reroll the car until its not one of thoese)
Config.GetCopCarChanceIfLandsOnCopCar = 30 -- % chance of getting the police car if the random roll of a vehicle lands on a cop car (Ignore this if Config.UseSharedVehicleCars is false as this never gets used if Config.UseSharedVehicleCars is false)
----------
----------
Config.DrawtextStyle = "White&NoBackground" -- This is the draw text style for breaking down the car. (Purupe&White) or (White&NoBackground) are the two style options

Config.DrawMarkerIcon = 1 -- DrawMarker icon for dropping stolen vehicle off. List of Marker icons can be found here: https://docs.fivem.net/docs/game-references/markers/
Config.DrawMarkerColor = {R = 255, G = 97, B = 255} -- DrawMarker color for dropping stolen vehicle off. Rgb selector can be found here: https://www.rapidtables.com/web/color/RGB_Color.html
----------
----------
Config.Currency = "bank" -- (money, bank, cash) what currency the player should get when breaking down parts and use to buy the garage

Config.PayForScrappingCarMin = 550 -- Minimum amount a player can receive for fully scrapping a car (when they get in the car and hit E after removing all of the vehicles parts)
Config.PayForScrappingCarMax = 700 -- Maximum amount a player can receive for fully scrapping a car (when they get in the car and hit E after removing all of the vehicles parts)
----------
----------
Config.ChancePoliceAraCalled = 80 -- % chance that the police are called (1-100)
Config.GaragePrice = 2500000 -- price of garage (how much the owner of the garage pays to get one)
Config.BegginingPlayerCap = 1 -- The starting members capacity the garage starts with (DO NOT MAKE THIS LESS THEN 1)
Config.BegginingVehicleCap = 1 -- The vehicle cap that the garage starts out with (How many cars can be stored when you purchase the garage. players upgrade these over time)
Config.MembersUpgradePrice = 100000 -- Cost of upgrading members capacity (multiplied by current member capacity. example is if there is 4 players on the garage it will be 4*5500 = 22000)
Config.MaximumMembers = 20 -- How many members can be apart of one garage
Config.KickMemberPrice = 50000 -- Cost of kicking a member (to prevent members being constantly swapped out and abused)
----------
Config.VehicleCapUpgradePrice = 80000 -- This is the base cost of upgrading how many vehicles can be stored in the garage it is multiplied by the garages current vehicle cap. (Config.VehicleCapUpgradePrice * CurrentGarage.vehiclecap)
Config.IncreaseVehicleAmount = 1 -- Amount of car slots you can upgrade at one time
----------
Config.CoolDown = 30 -- (MINUTES) The cooldown period players must wait before starting a new chop after finishing the previous one.
----------
Config.VehicleRepairMultiplier = 5 -- whatever health is missing out of 1000 of a vehilce will cost $Config.VehicleRepairMultiplier * the number of damage of the vehicle
----------
Config.EnteringTheGarageKey = 38 -- [E] Keypress to enter the garage. Key press document for each key can be found here: https://docs.fivem.net/docs/game-references/controls/
Config.EnterTheGarageText = "[E] GARAGE" -- Text that displays for entering the garage
----------

-- Different zone locations where you can enter a garage from. (this is too keep players not all piled up at one garage)
Config.GarageSpots = {
    { center = vector4(-802.96, 354.97, 87.87, 357.57), radius = 5.0 }, -- FACE AWAY FROM THE GARAGE WHEN DOING THESE
    { center = vector4(-1374.33, -331.29, 39.17, 27.55), radius = 5.0 }, -- FACE AWAY FROM THE GARAGE WHEN DOING THESE
    { center = vector4(-242.74, -233.83, 36.52, 88.81), radius = 5.0 }, -- FACE AWAY FROM THE GARAGE WHEN DOING THESE
    { center = vector4(151.5, -123.53, 54.83, 159.15), radius = 3.5 }, -- FACE AWAY FROM THE GARAGE WHEN DOING THESE
    { center = vector4(-1598.85, -460.89, 37.31, 135.75), radius = 5.2 }, -- FACE AWAY FROM THE GARAGE WHEN DOING THESE
    { center = vector4(-1541.58, -586.59, 33.88, 300.76), radius = 5.0 }, -- FACE AWAY FROM THE GARAGE WHEN DOING THESE
}

-- How much chopping each car part pays when you break them down at the upgradable welding bench (Config.Currency)
Config.VehiclePartsPay = {
    ["chop_wheel"] = {
        Min = 260, -- Minimum pay
        Max = 351 -- Maximum pay
    },
    ["chop_door"] = {
        Min = 260, -- Minimum pay
        Max = 351 -- Maximum pay
    },
    ["chop_hood"] = {
        Min = 260, -- Minimum pay
        Max = 351 -- Maximum pay
    },
    ["chop_trunk"] = {
        Min = 260, -- Minimum pay
        Max = 351 -- Maximum pay
    },
}
--

-- Locations where you drop the vehicle off too. (it will choose one of these random coords)
Config.DeliveryCoords = {  -- Vehicle Delivery Cords where you will take the car to chop
    vector4(226.12, 107.29, 92.78, 355.6),
    vector4(1000.75, -1559.69, 30.06, 177.69),
    vector4(2052.06, 3191.46, 44.49, 334.38),
    vector4(1206.39, 2640.27, 37.12, 142.75),
    vector4(-1490.75, -203.42, 49.7, 220.14),
    vector4(1563.29, -2168.8, 76.82, 171.31),
    vector4(-468.43, -1675.82, 18.36, 357.4),
    vector4(-646.16, -1727.5, 23.79, 182.03),
}

-- Spawns of the vehicles inside of the garage (wouldnt touch this unless you fully understand it)
Config.CarSpawnLocations = {
    vector4(978.15, -2993.91, -40.34, 179.37),
    vector4(985.26, -2995.46, -40.34, 202.44),
    vector4(991.62, -2992.49, -40.34, 162.17),
    vector4(998.51, -2992.61, -40.34, 131.37),
    vector4(999.3, -2997.89, -40.34, 87.53),
    vector4(991.42, -3000.82, -40.34, 89.36),
    vector4(1002.19, -3005.82, -40.34, 90.19),
    vector4(1005.01, -3010.37, -40.34, 94.07),
    vector4(1002.72, -3014.76, -40.34, 100.78),
    vector4(1009.48, -3026.34, -40.34, 356.32),
    vector4(1009.12, -3027.06, -37.59, 180.72),
    vector4(1004.09, -3026.95, -40.35, 359.49),
    vector4(1004.04, -3027.48, -37.58, 359.63),
    vector4(998.38, -3026.32, -40.34, 177.4),
    vector4(998.47, -3027.27, -37.58, 0.08),
    vector4(993.46, -3026.14, -40.35, 352.96),
    vector4(993.11, -3027.33, -37.59, 1.59),
    vector4(989.75, -3015.43, -40.34, 276.16),
    vector4(984.92, -3009.17, -40.34, 269.43),
    vector4(978.31, -3009.84, -40.34, 0.21),
    vector4(977.63, -3017.28, -40.34, 32.75),
    vector4(955.07, -3018.41, -40.34, 270.85),
    vector4(955.15, -3018.56, -37.59, 270.29),
    vector4(955.35, -3023.58, -40.35, 89.65),
    vector4(955.21, -3023.78, -37.59, 270.37),
    vector4(955.64, -3028.7, -40.34, 269.44),
    vector4(954.84, -3028.79, -37.58, 270.4),
    vector4(956.51, -3032.81, -40.35, 310.98),
    vector4(959.51, -3035.61, -40.34, 357.69),
    vector4(959.27, -3035.58, -37.58, 180.24),
    vector4(963.41, -3034.92, -40.34, 354.9),
    vector4(963.56, -3035.91, -37.59, 1.1),
    vector4(967.8, -3034.85, -40.34, 354.7),
    vector4(967.92, -3036.06, -37.58, 0.01),
    vector4(971.67, -3034.58, -40.35, 358.03),
    vector4(971.83, -3035.69, -37.58, 359.13),
    vector4(975.2, -3031.32, -40.34, 252.8),
    vector4(976.08, -3036.1, -40.35, 359.29),
    vector4(976.23, -3035.72, -37.59, 358.3),
    vector4(961.66, -3029.75, -40.35, 318.36),
}