Config = {}

Config.webhook = "WEBHOOK"						-- Webhook to send logs to discord
Config.lang = "en"								-- Set the file language [en/br]

Config.Framework = {							-- Framework settings
	['account'] = 'bank',						-- Change here the account that should be used with expenses
	['account_premium'] = 'bank',				-- Change here the account that should be used when buying premium for ad
}

Config.format = {
	['currency'] = 'USD',						-- This is the currency format, so that your currency symbol appears correctly [Examples: BRL, USD]
	['location'] = 'en-US'						-- This is the location of your country, to format the decimal places according to your standard [Examples: pt-BR, en-US]
}

Config.keyToOpenMenu = {
	['enabled'] = true,							-- Config to enable/disable the open menu using key
	['key'] = 303								-- Key to open menu (303 = U)
}

Config.commandToOpenMenu = {
	['enabled'] = true,							-- Config to enable/disable the open menu using chat command
	['command'] = 'ebay'						-- Command to open menu
}

Config.locationToOpenMenu = {
	['enabled'] = true,							-- Config to enable/disable the open menu using blips
	['locations'] = {							-- Blip locations
		{-1082.2553710938,-247.60269165039,37.763233184814}
	}
}

Config.premium = {
	['fixed_value'] = false,					-- true: It means that in order to have a premium advertisement, a fixed price defined in the line below will be paid | false: It means that the price will be set according to the advertised product price
	['price'] = 10								-- Premium cost, this will be considered as a percentage or a fixed price
}

Config.itemsPerPage = 10
Config.premiumItemsPerPage = 4

--[[
	To use the upload image, this client ID must be filled. Follow this steps:
	1. Create an account on imgur (https://imgur.com/signin)
	2. Register an application (https://api.imgur.com/oauth2/addclient)
	3. On Authorization type select the second option: OAuth 2 authorization without  a callback URL
	4. Fill the other fields and submit
	5. On new page you'll receive the cliend ID, just paste it there
]]
Config.imgurClientId = ""
Config.useImgurAPI = false						-- Set this false if you having trouble while uploading images

Config.Blacklisteditems = {						-- List of items that you dont want to be sold on system
	["weed"] = true,
	["coca"] = true
}

Config.BlacklistedVehicles = {					-- List of vehicles that you dont want to be sold on system
	["riot"] = true
}

Config.carBanner = "banner/cars.jpg"			-- Banner that will appear on cars page
Config.carsClasses = {							-- Categries for cars
	[1] = "Sports",
	[2] = "SUV",
	[3] = "Classics",
	[4] = "Motorcycles",
	[5] = "Hatch"
}

Config.itemsBanner = "banner/items.jpg"			-- Banner that will appear on items page
Config.itemsClasses = {							-- Categories for items
	[1] = "Food",
	[2] = "Drink",
	[3] = "Utilities",
	[4] = "Tools",
	[5] = "Clothing",
	[6] = "Electronics",
	[7] = "Vehicle Parts",
	[8] = "Others"
}

Config.profileBanner = "banner/profile.jpg"		-- Banner that will appear on profile page

Config.beautifierItemNames = {					-- Item labels to make the item names beautiful when showing the list (if you use item label you dont need to use this config)
	["tequila"] = "Tequila",
	["ring"] = "Ring",
}

Config.beautifierCarNames = {					-- Vehicle labels to make the vehicle names beautiful when showing the list
	["panto"] = "Panto",
	["oracle"] = "Oracle",
	["jesko"] = "Konig",
}

Config.createTable = true