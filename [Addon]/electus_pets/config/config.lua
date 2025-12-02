Config = {}

Config.Framework = "qb" -- "esx" "qb"
Config.Locale = "en"
Config.Inventory = "ox_inventory" -- "esx" "qb" "ox_inventory" "qb-inventory" "tgiann "core" "codem"  "qs-inventory"
Config.TargetSystem = "ox_target" -- "none" "qtarget" "qb-target" "ox_target" and more
Config.VehicleInventory = "ox_inventory" -- options between "mf-inventory" "ox_inventory" "qb" "esx_inventoryhud_trunk" [https://github.com/Trsak/esx_inventoryhud_trunk] "esx_trunk" [https://github.com/schwim0341/esx_trunk] "qs-inventory"  "custom" [use GetCustomVehiclePlateInventoryItems in config don't use if you don't know a bit of coding]
Config.Debug = false
Config.EnableBlips = true

Config.CustomStringESXEvent = "esx:getSharedObject"
Config.CustomStringQBExport = "qb-core"

Config.PetMenuPos = "top-left" -- options between "top-right" "top-left" "bottom-right" "bottom-left"
Config.InventoryIconUrl = "nui://ox_inventory/web/images/" -- the url for your inventory icons

Config.AutomaticDoors = true -- if the vehicle doors should be auto opened

Config.GetCustomVehiclePlateInventoryItems = function(plate)
	--implement logic here (optional and requires vehicleInventory = "custom")
end

Config.Commands = {
	petMenu = "petmenu", -- for pet menu/skill menu
	petStorage = "pets", -- for pet storage if enablePetCommandForHouse is true
	petDog = "pet_dog", -- for petting your pet (only dogs)
	petSettings = "pet_settings", -- for pet settings
	petInteract = "pet_interact", -- for pet interAction
	petBag = "pet_bag", -- for pet bag
}

Config.PetHouseModels = {
	["dog_house1"] = {
		propId = "prop_doghouse_01",
		itemName = "doghouse_1",
		label = "Dog House",
		maxPets = 10,
		price = 1000,
	},
}

Config.MidGameCharacterSwap = "ZSX_Multicharacter:Listener:SwappedCharacter" -- event name of your character system where your swap character/logout

Config.AllowedJobsToSetAsFriends = { -- if you want to allow certain jobs to be able to set as friends
	"police",
	"ambulance",
}

Config.Items = {
	petFood = "pet_food",
	petWater = "water",
	petLeash = "pet_leash",
}

Config.PetFeeding = {
	waterGain = 20, -- the amount of water the pet gains from drinking water
	feedGain = 20, -- the amount of food the pet gains from eating food
}

Config.Breeding = {
	compatibleBreedingPercentage = 50, -- the percentage of 2 dogs being compatible to breed (set to 0 to disable)
	totalBreedingTimes = 2, -- the total amount of times a dog can breed
}

-- if you want to allow pets to attack other players or just npcs
Config.AllowPlayerAttack = true

Config.MaxAmountPetOutside = 4 -- max amount of pets allowed outside
Config.MaxAmountPetInsideCommandHouse = 10 -- max amount of pets allowed inside the house from command

-- (minutes) the time it takes for your pet to recover from being dead
Config.PetRecoverTime = 20

--Pet Houses
Config.EnablePetHouse = true
Config.EnableNetworkedHouses = false
Config.EnablePetCommandForHouse = true -- if you want to be able to command your pet from the pet house

-- max range for the pet to be able to do commands
Config.MaxCommandRange = 20.0

-- if you want to clear the riding task every frame
Config.RidingClearEveryFrame = true

-- if you want to be able to control the riding instead of switching between pet and player models etc. (false = more smooth true = if you have issues with the riding)
Config.EnableControlledRiding = false

-- if you want to enable pet bags
Config.EnablePetBags = true

Config.PaymentMethods = { -- remove either to only have one payment method
	{ label = "Cash", action = "cash" },
	{ label = "Card", action = "bank" },
}

-- if you want your pet to learn to sniff items or just be able to sniff items (from allowedSniffedItems) from the start
Config.EnableLearnToSniff = false

-- Add items which are allowed for your pet to sniff e.g. weed, meth or other drugs used on your server!
Config.AllowedSniffedItems = {
	"coke",
	"cocaine",
	"marijuana",
	"meth",
	"weed",
	"opium",
	"lsd",
	"water",
}

Config.RewardsXP = {
	uniqueActions = 3, --the xp given from unique interActions with pet
	perMinute = 1, --the xp given from wandering per mile
	successfulAttack = 20, --the xp given from a successful attack
	successfulSearch = 10, --the xp given from a successful search
	fetchedBall = 2, --the xp given from fetching a ball
	breeding = 100, --the xp given from breeding
	sniffNewItem = 15, --the xp given from sniffing a new item (if enabled)
	eat = 5,
	drink = 5,
	attackWheel = 7,
}

--the multiplier for the xp needed to level up (1.1 = 10% more xp needed to level up for every level done) starting xp required is always 100. Calculation is 100 * xpLevelMultiplier^(level-1)
Config.XpLevelMultiplier = 1.0

-- The required skill points for a upgrade
Config.SkillsUpgrade = {
	["bravery"] = { cost = 1 },
	["speed"] = { cost = 1 },
	["health"] = { cost = 1 },
	["thoughness"] = { cost = 1 },
	["obedience"] = { cost = 1 },
	["sniffing"] = { cost = 1 },
}

Config.AbilitiesUpgrade = {
	["addHealthEating"] = { cost = 2, amountOfHealth = 20 },
	["searchVehicle"] = { cost = 4, requireSniffLevel = 5 },
	["autoAttack"] = { cost = 3, requireBraveryLevel = 5 },
	["attackWheels"] = { cost = 3, requireBraveryLevel = 5 },
	["moreDailyTasks"] = { cost = 2, numberOfTasks = 2 },
	["guardArea"] = { cost = 4, requireBraveryLevel = 5 },
}

Config.JobRestrictions = {
	sniff = "none", -- "none" or "police" or {"police", "ambulance",}
	attack = { "police", "ambulance" }, -- "none" or "police" or {"police", "ambulance",}
}

Config.Delays = {
	statusRemoval = 450, -- (seconds) the time it takes for your pet's hunger to be removed by one (default 450s => (450*100)/3600 = 12.5 hours for the pet to go from 100 to 0 in hunger)
	newItemToSniffDelay = 100000, -- (milisec) total of 100 sec before the pet can get better at sniffing an item or sniff a new item
}

Config.VetPrice = 100
Config.Vets = {
	{
		coords = vector3(307.06, -1432.47, 28.97),
		heading = 140.0,
		model = "s_m_m_doctor_01",
		blip = { name = "Veterinary", sprite = 442, color = 2, size = 1.0 },
	},
}

Config.Bags = {
	maxSlots = 20,
	maxWeight = 10000,
}

Config.AddBallAfterFetch = true

Config.CanBeRidden = {
	["Donkey"] = true,
	["Fullhorse"] = true,
	["Rangehorse"] = true,
	["Younghorse"] = true,
}

Config.Ui = {
	commandContainerPosition = "topPosition", -- options between "topPosition", "bottomPosition", "Position", "rightPosition"
	closePetsPosition = "leftPosition", -- options between "topPosition", "bottomPosition", "leftPosition", "rightPosition"
}

Config.DailyTasks = {
	tasksPerDay = 5,
	tasks = {
		{ id = "feed", reward = 20, randomRange = { 1, 10 } },
		{ id = "water", reward = 20, randomRange = { 1, 10 } },
		{ id = "walk", reward = 10, randomRange = { 5, 20 } },
		{ id = "attack", reward = 30, randomRange = { 1, 2 } },
		{ id = "search", reward = 30, randomRange = { 1, 3 } },
		{ id = "fetchBall", reward = 10, randomRange = { 1, 5 } },
		{ id = "breed", reward = 50, randomRange = { 1, 1 } },
		{ id = "sniffNewItem", reward = 75, randomRange = { 1, 2 } },
		{ id = "playEmote", reward = 10, randomRange = { 5, 20 } },
	},
}
