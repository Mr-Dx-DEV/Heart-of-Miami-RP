-- If you need support I now have a discord available, it helps me keep track of issues and give better support.

-- https://discord.gg/9pCDHmjYwd

Config = {
	Lan = "en",
	System = {
		Debug = false,
		EventDebug = false,

		Menu = "ox",  			-- "qb", "ox", "gta"
		Notify = "ox",			-- "qb", "ox", "gta", "esx"
		ProgressBar = "ox", 	-- "qb", "ox", "gta", "esx"

		DontUseTarget = false,	-- uses drawtext targets instead of alt targets
	},

	Crafting = {
		craftCam = true,
		MultiCraft = true,
		MultiCraftAmounts = { [1], [5], [10] },	
		showItemBox = true,
	},

	General = {
		ApGov = false, 			-- Toggle support for AP-Goverment Tax

		lookAtCharge = true,	-- "true" to use the "look at charge" feature
		List = true, 			-- "true" to use nearby player list feature in the cash registers, "false" for manual id entry

		PaymentRadius = 15, 	-- This is how far the playerlist will check for nearby players (based on the person charging)

		Usebzzz = false, 		-- enable if you're using the prop from bzzz

		Enablecommand = true, 	-- Enables the /cashregister command

		PhoneBank = false, 		-- Set this to false to use the popup payment system FOR CARD/BANK PAYMENTS instead of using phone invoices
								-- This doesn't affect Cash payments as they by default use a confirmation window
								-- This is helpful for phones that don't support invoices well

		Peds = true, 			-- "true" to enable peds spawning in banks
		PedPool = { 			-- If Peds is true, use this pool of ped models to pick from
			"IG_Bankman",
			"U_M_M_BankMan",
			"S_F_M_Shop_HIGH",
			"S_M_M_HighSec_02",
			"S_M_M_HighSec_03",
			"S_M_M_HighSec_04",
			"A_F_Y_Business_01",
			"A_F_Y_Business_02",
			"A_F_Y_Business_03",
			"A_F_Y_Business_04",
			"A_M_M_Business_01",
			"A_M_Y_Business_02",
			"A_M_Y_Business_03",
			"U_F_M_CasinoShop_01",
		},

		PhoneType = "qb", 		-- Change this setting to make invoices work with your phone script [still testing this currently]
								-- "qb" for qb-phone
								-- "gks" for GKSPhone


		Gabz = false, 	-- "true" to enable Gabz Bank locations
						-- this corrects the ATM/Bank Cashier + Ticket Cash in locations

		menuLogo = "https://static.wikia.nocookie.net/gtawiki/images/b/bd/Fleeca-GTAV-Logo.png",

	},

	ATMs = {
		enable = false,			-- Enable this if wanting to use jim-payments atm systems
		showBlips = false,

		ATMModels = { `prop_atm_01`, `prop_atm_02`, `prop_atm_03`, `prop_fleeca_atm`, `gabz_sm_pb_atmframe` },

	},

	Banks = {
		enable = false,			-- Enable this if wanting to use jim-payments banking systems
		showBlips = false,

	},

	CustomCashRegisters = {
		--	["jobname"] = { -- Player job role restriction
		--		{ coords = vector4(0, 0, 0, 0), }, -- vector4 to place the till and the way it faces
		--		{ coords = vector4(0, 0, 0, 0), prop = true, }, -- "prop = true" spawns a prop at the coords
		--	},
		-- ["burgershot"] = { -- Player job role restriction
		-- 	{ coords = vector4(-1191.64, -894.04, 14.12, 347.15), prop = false, },
		-- 	{ coords = vector4(-1193.48, -893.69, 14.12, 350.65), prop = false, },
		-- 	{ coords = vector4(-1195.51, -893.18, 14.12, 353.64), prop = false, },
		-- 	{ coords = vector4(-1197.48, -892.45, 14.12, 346.71), prop = false, }

		-- },
		-- ["seapearls"] = { -- Player job role restriction
		-- 	{ coords = vector4(-599.57, -725.19, 211.85, 76.96), prop = true, }
		-- },
		-- ["catcafe"] = { -- Player job role restriction
		-- 	{ coords = vector4(-584.28, -1062.76, 22.40, 38.74), prop = true, }
		-- },
	},

	Receipts = {
		TicketSystem = false, 		-- Enable this if you want to use the ticket system false
		TicketSystemAll = false, 	-- Enable this to give tickets to all workers clocked in

		Commission = true, 			-- Set this to true to enable Commissions and give the person charging a percentage of the total
		CommissionAll = false, 		-- Set this to true to give commission to workers clocked in
		CommissionDouble = false, 	-- Set this to true if you want the person charging to get double Commission
		CommissionLimit = false,	-- If true, this limits the Commission to only be given if over the "MinAmountForTicket".
									-- If false, Commission will be given for any amount
		CommissionSplit = true,		-- If true, payment is split between employee (Commission %) and job account (remaining %)

		CashInLocations = {
			vec4(252.23, 223.11, 106.29, 159.2), -- Default Third Window along in Pacific Bank
		},

		CashInAnywhere = false,	-- enable this to add cash ticket option to any banking location

		-- MinAmountforTicket should be your cheapest item
		-- PayPerTicket should never be higher than MinAmountforTicket
		Jobs = {
			['burgershot'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.70,},
			['catcafe'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.10,},
			['seapearls'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.80,},
			['saltlabcafe'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.75,},


			['crucialfix'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.90,},
			['lustresort'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.10,},
			['joebar'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.10,},
			['vanillaunicorn'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.10, },
			['nazar'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.10,},


			
			


			['saltlabmechanic'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.75,},
			['mechanic'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.90,},
			-- ['hotbox'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.15,},
		
			-- ['vanillaunicorn'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.15, },

			-- ['lifeinvader'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.15,},
			-- ['puffpuffpass'] = { MinAmountforTicket = 50, PayPerTicket = 50, Commission = 0.15,},
		
		},

	},
	PolCharge = {
		-- The /polcharge command requires specific jobs to be set
		-- No tickets for these, it's just commission (0.25 = 25%)
		FineJobs = {
			['ambulance'] = { Commission = 0.20 }, 
			['police'] = { Commission = 0.20 },
		},
		MaxFineAmount = 100000, 
		FineJobConfirmation = false, --"true" makes it so fines need confirmation, "false" skips this ands just removes the money
		FineJobList = true, -- "true" to use nearby player list feature in the cash registers, "false" for manual id entry
		lookAtCharge = false, -- "true" to use the "look at charge" feature
	},
}

PlayerGang, PlayerJob, onDuty = {}, {}, nil

-- Test function for locales
function locale(section, string)
    if not Config.Lan or Config.Lan == "" then return print("Error, no langauge set") end
    local localTable = Loc[Config.Lan]
    if not localTable then return "Locale Table Not Found" end
    if not localTable[section] then return "["..section.."] Invalid" end
    if not localTable[section][string] then return "["..string.."] Invalid" end
    return localTable[section][string]
end