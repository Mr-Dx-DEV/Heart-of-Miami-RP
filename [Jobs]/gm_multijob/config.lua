return {
	---@type table<string, boolean> Jobs that are allowed to go on duty
	dutyEnabledJobs = {
		["police"] = true,
		["ambulance"] = true,
	},

	debug = true,

	vip = {
		roles = {
			member = "1347445310674178113",
			silver = "1347445310766452803", 
			gold = "1347445310766452805",
			platinum = "1347445310766452806",
			diamond = "1347445310766452807"
		},
		maxJobs = {
			default = 1, 
			member = 1, 
			silver = 2, 
			gold = 3,   
			platinum = 4, 
			diamond = 5   
		}
	},

	jobSwitch = {
		cooldown = 300, 
		bypassCooldownRoles = {"1347445310871437340"}, 
		disabledJobs = {}, 
	},
	
	bossMenu = {
		-- Maximum distance to detect nearby players for hiring
		maxDistance = 10.0,
		-- Jobs that are not allowed to hire players
		disabledHiring = {},
	}
}
