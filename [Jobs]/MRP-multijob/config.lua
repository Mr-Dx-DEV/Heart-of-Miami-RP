return {
	---@type table<string, boolean> Jobs that are allowed to go on duty
	dutyEnabledJobs = {
		["police"] = true,
		["ambulance"] = true,
	},

	debug = false,

	vip = {
		roles = {
			member = "1404669577799012473",
			silver = "1404669577799012473", 
			gold = "1404669577799012473",
			platinum = "1404669577799012473",
			diamond = "1404669577799012473"
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
		bypassCooldownRoles = {"1404669577799012473"}, 
		disabledJobs = {}, 
	},
	
	bossMenu = {
		-- Maximum distance to detect nearby players for hiring
		maxDistance = 10.0,
		-- Jobs that are not allowed to hire players
		disabledHiring = {},
	}
}
