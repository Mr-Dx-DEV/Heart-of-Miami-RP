---Job names must be lower case (top level table key)
---@type table<string, Job>
return {
	["unemployed"] = {
		label = "Civilian",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Freelancer",
				payment = 100,
			},
		},
	},
	["police"] = {
		label = "LSPD",
		type = "leo",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Cadet",
				payment = 7060,
			},
			[1] = {
				name = "Probationary Officer",
				payment = 8236,
			},
			[2] = {
				name = "Officer",
				payment = 9414,
			},
			[3] = {
				name = "Senior Officer",
				payment = 10590,
			},
			[4] = {
				name = "Corporal",
				payment = 11766,
			},
			[5] = {
				name = "Sergeant",
				payment = 12942,
			},
			[6] = {
				name = "Operational Sergeant",
				payment = 14118,
			},
			[7] = {
				name = "Lieutenant",
				payment = 15368,
			},
			[8] = {
				name = "Captain",
				payment = 16474,
			},
			[9] = {
				name = "Commander",
				isboss = true,
				bankAuth = true,
				payment = 18474,
			},
			[10] = {
				name = "Chief",
				isboss = true,
				bankAuth = true,
				payment = 20474,
			},
		},
	},
	-- ['bcso'] = {
	--     label = 'BCSO',
	--     type = 'leo',
	--     defaultDuty = true,
	--     offDutyPay = false,
	--     grades = {
	--         [0] = {
	--             name = 'Recruit',
	--             payment = 50
	--         },
	--         [1] = {
	--             name = 'Officer',
	--             payment = 75
	--         },
	--         [2] = {
	--             name = 'Sergeant',
	--             payment = 100
	--         },
	--         [3] = {
	--             name = 'Lieutenant',
	--             payment = 125
	--         },
	--         [4] = {
	--             name = 'Chief',
	--             isboss = true,
	--             bankAuth = true,
	--             payment = 150
	--         },
	--     },
	-- },
	-- ['sasp'] = {
	--     label = 'SASP',
	--     type = 'leo',
	--     defaultDuty = true,
	--     offDutyPay = false,
	--     grades = {
	--         [0] = {
	--             name = 'Recruit',
	--             payment = 50
	--         },
	--         [1] = {
	--             name = 'Officer',
	--             payment = 75
	--         },
	--         [2] = {
	--             name = 'Sergeant',
	--             payment = 100
	--         },
	--         [3] = {
	--             name = 'Lieutenant',
	--             payment = 125
	--         },
	--         [4] = {
	--             name = 'Chief',
	--             isboss = true,
	--             bankAuth = true,
	--             payment = 150
	--         },
	--     },
	-- },
	["ambulance"] = {
		label = "EMS",
		type = "ems",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "EMR",
				payment = 4118,
			},
			[1] = {
				name = "EMT",
				payment = 4707,
			},
			[2] = {
				name = "Paramedic",
				payment = 5295,
			},
			[3] = {
				name = "Lead Paramedic",
				payment = 5883,
			},
			[4] = {
				name = "Senior Paramedic",
				payment = 6471,
			},
			[5] = {
				name = "Surgeon",
				payment = 7059,
			},
			[6] = {
				name = "Lieutenant",
				payment = 7648,
			},
			[7] = {
				name = "Captain",
				payment = 8237,
			},
			[8] = {
				name = "Coordinator",
				payment = 9237,
			},
			[9] = {
				name = "Operations Manager",
				isboss = true,
				bankAuth = true,
				payment = 10237,
			},
			[10] = {
				name = "Board OF Directors",
				isboss = true,
				bankAuth = true,
				payment = 11237,
			},
		},
	},
	["realestate"] = {
		label = "Real Estate",
		type = "realestate",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Recruit",
				payment = 50,
			},
			[1] = {
				name = "House Sales",
				payment = 75,
			},
			[2] = {
				name = "Business Sales",
				payment = 100,
			},
			[3] = {
				name = "Broker",
				payment = 125,
			},
			[4] = {
				name = "Manager",
				isboss = true,
				bankAuth = true,
				payment = 150,
			},
		},
	},

	["brdd"] = {
		label = "Business Regulation Depertment",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "BRDD",
				payment = 500,
			},
			[1] = {
				name = "Head Of BRDD",
				isboss = true,
				bankAuth = true,
				payment = 1000,
			},
		},
	},

	["taxi"] = {
		label = "Taxi",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Recruit",
				payment = 50,
			},
			[1] = {
				name = "Driver",
				payment = 75,
			},
			[2] = {
				name = "Event Driver",
				payment = 100,
			},
			[3] = {
				name = "Sales",
				payment = 125,
			},
			[4] = {
				name = "Manager",
				isboss = true,
				bankAuth = true,
				payment = 150,
			},
		},
	},
	["bus"] = {
		label = "Bus",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Driver",
				payment = 50,
			},
		},
	},
	["cardealer"] = {
		label = "Vehicle Dealer",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Recruit",
				payment = 50,
			},
			[1] = {
				name = "Showroom Sales",
				payment = 75,
			},
			[2] = {
				name = "Business Sales",
				payment = 100,
			},
			[3] = {
				name = "Finance",
				payment = 125,
			},
			[4] = {
				name = "Manager",
				isboss = true,
				bankAuth = true,
				payment = 150,
			},
		},
	},
	["lsmechanic"] = {
		label = "Mechanic",
		type = "mechanic",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Recruit",
				payment = 100,
			},
			[1] = {
				name = "Novice",
				payment = 100,
			},
			[2] = {
				name = "Experienced",
				payment = 100,
			},
			[3] = {
				name = "Advanced",
				payment = 100,
			},
			[4] = {
				name = "Manager",
				isboss = true,
				bankAuth = true,
				payment = 100,
			},
		},
	},
	["saltlabmechanic"] = {
		label = "Mechanic",
		type = "mechanic",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Recruit",
				payment = 100,
			},
			[1] = {
				name = "Novice",
				payment = 100,
			},
			[2] = {
				name = "Experienced",
				payment = 100,
			},
			[3] = {
				name = "Advanced",
				payment = 100,
			},
			[4] = {
				name = "Manager",
				isboss = true,
				bankAuth = true,
				payment = 100,
			},
		},
	},
	["harmony"] = {
		label = "Harmony",
		type = "mechanic",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Recruit",
				payment = 1,
			},
			[1] = {
				name = "Novice",
				payment = 1,
			},
			[2] = {
				name = "Experienced",
				payment = 1,
			},
			[3] = {
				name = "Advanced",
				payment = 1,
			},
			[4] = {
				name = "Manager",
				isboss = true,
				bankAuth = true,
				payment = 1,
			},
		},
	},

	["judge"] = {
		label = "Honorary",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Judge",
				payment = 1,
			},
		},
	},
	["lawyer"] = {
		label = "Law Firm",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Associate",
				payment = 1,
			},
		},
	},
	["reporter"] = {
		label = "Reporter",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Journalist",
				payment = 1,
			},
		},
	},
	["trucker"] = {
		label = "Trucker",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Driver",
				payment = 1,
			},
		},
	},
	["tow"] = {
		label = "Towing",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Driver",
				payment = 1,
			},
		},
	},
	["vineyard"] = {
		label = "Vineyard",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Picker",
				payment = 1,
			},
		},
	},
	["hotdog"] = {
		label = "Hotdog",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Sales",
				payment = 1,
			},
		},
	},
	["nazar"] = {
		label = "Nazar Restaurant",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			[0] = { name = "New Hire", payment = 100 },
			[1] = { name = "Employee", payment = 100 },
			[2] = { name = "Senior Staff", payment = 100 },
			[3] = { name = "Manager", payment = 100 },
			[4] = { name = "Hiring Manager", isboss = true, payment = 100 },
			[5] = { name = "Owner", isboss = true, payment = 100 },
		},
	},


	["saltlabcafe"] = {
		label = "SaltLab Cafe",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			[0] = { name = "New Hire", payment = 100 },
			[1] = { name = "Employee", payment = 100 },
			[2] = { name = "Supervisor", payment = 100 },
			[3] = { name = "Manager", payment = 100 },
			[4] = { name = "Hiring Manager", isboss = true, payment = 100 },
			[5] = { name = "Owner", isboss = true, payment = 100 },
		},
	},
	["catcafe"] = {
		label = "UWU Cafe",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			[0] = { name = "New Hire", payment = 100 },
			[1] = { name = "Employee", payment = 100 },
			[2] = { name = "Supervisor", payment = 100 },
			[3] = { name = "Manager", payment = 100 },
			[4] = { name = "Hiring Manager", isboss = true, payment = 100 },
			[5] = { name = "Owner", isboss = true, payment = 100 },
		},
	},
	["burgershot"] = {
		label = "Burgershot",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			[0] = { name = "New Hire", payment = 100 },
			[1] = { name = "Employee", payment = 100 },
			[2] = { name = "Supervisor", payment = 100 },
			[3] = { name = "Manager", payment = 100 },
			[4] = { name = "Hiring Manager", isboss = true, payment = 100 },
			[5] = { name = "Owner", isboss = true, payment = 100 },
		},
	},
    ["dfc"] = {
		label = "Dome DFC",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			[0] = { name = "New Hire", payment = 100 },
			[1] = { name = "Employee", payment = 100 },
			[2] = { name = "Supervisor", payment = 100 },
			[3] = { name = "Manager", payment = 100 },
			[4] = { name = "Hiring Manager", isboss = true, payment = 100 },
			[5] = { name = "Owner", isboss = true, payment = 100 },
		},
	},

	["seapearls"] = {
		label = "Sea Pearls",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			[0] = { name = "New Hire", payment = 100 },
			[1] = { name = "Employee", payment = 100 },
			[2] = { name = "Supervisor", payment = 100 },
			[3] = { name = "Manager", payment = 100 },
			[4] = { name = "Hiring Manager", isboss = true, payment = 100 },
			[5] = { name = "Owner", isboss = true, payment = 100 },
		},
	},
	["crucialfix"] = {
		label = "Crucial Fix Compound",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			[0] = { name = "New Hire", payment = 100 },
			[1] = { name = "Employee", payment = 100 },
			[2] = { name = "Supervisor", payment = 100 },
			[3] = { name = "Manager", payment = 100 },
			[4] = { name = "Hiring Manager", isboss = true, payment = 100 },
			[5] = { name = "Owner", isboss = true, payment = 100 },
		},
	},
	["lustresort"] = {
		label = "Lust Resort Compound",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			[0] = { name = "New Hire", payment = 100 },
			[1] = { name = "Employee", payment = 100 },
			[2] = { name = "Supervisor", payment = 100 },
			[3] = { name = "Manager", payment = 100 },
			[4] = { name = "Hiring Manager", isboss = true, payment = 100 },
			[5] = { name = "Owner", isboss = true, payment = 100 },
		},
	},
	["joebar"] = {
		label = "Joe Bar",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			[0] = { name = "New Hire", payment = 100 },
			[1] = { name = "Employee", payment = 100 },
			[2] = { name = "Supervisor", payment = 100 },
			[3] = { name = "Manager", payment = 100 },
			[4] = { name = "Hiring Manager", isboss = true, payment = 100 },
			[5] = { name = "Owner", isboss = true, payment = 100 },
		},
	},
	["unicorn"] = {
		label = "Vanilla Unicorn",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			[0] = { name = "New Hire", payment = 100 },
			[1] = { name = "Employee", payment = 100 },
			[2] = { name = "Supervisor", payment = 100 },
			[3] = { name = "Manager", payment = 100 },
			[4] = { name = "Hiring Manager", isboss = true, payment = 100 },
			[5] = { name = "Owner", isboss = true, payment = 100 },
		},
	},
	["yakuza"] = {
		label = "Yakuza Compound",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			[0] = { name = "New Hire", payment = 100 },
			[1] = { name = "Employee", payment = 100 },
			[2] = { name = "Supervisor", payment = 100 },
			[3] = { name = "Manager", payment = 100 },
			[4] = { name = "Hiring Manager", isboss = true, payment = 100 },
			[5] = { name = "Owner", isboss = true, payment = 100 },
		},
	},
	["hacker_compound"] = {
		label = "Hacker Compound",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			[0] = { name = "New Hire", payment = 100 },
			[1] = { name = "Employee", payment = 100 },
			[2] = { name = "Supervisor", payment = 100 },
			[3] = { name = "Manager", payment = 100 },
			[4] = { name = "Hiring Manager", isboss = true, payment = 100 },
			[5] = { name = "Owner", isboss = true, payment = 100 },
		},
	},

	["cityhall"] = {
		label = "CityHall",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			["0"] = {
				name = "Government Staff",
				isboss = false,
				payment = 10,
			},
			["1"] = {
				name = "Mayor",
				isboss = true,
				payment = 100,
			},
		},
	},

	---- 17mov

	["builder"] = {
		label = "Builder",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Construction Worker",
				payment = 50,
			},
			[1] = {
				name = "Senior Builder",
				payment = 75,
			},
		},
	},

	["deliverer"] = {
		label = "Deliverer",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Courier",
				payment = 50,
			},
			[1] = {
				name = "Senior Courier",
				payment = 75,
			},
		},
	},

	["electrician"] = {
		label = "Electrician",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Technician",
				payment = 50,
			},
			[1] = {
				name = "Master Electrician",
				payment = 75,
			},
		},
	},

	["garbage"] = {
		label = "Garbage Collector",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Collector",
				payment = 50,
			},
			[1] = {
				name = "Supervisor",
				payment = 75,
			},
		},
	},

	["gruppe6"] = {
		label = "Gruppe Sechs",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Security Officer",
				payment = 50,
			},
			[1] = {
				name = "Security Supervisor",
				payment = 75,
			},
		},
	},

	["lumberjack"] = {
		label = "Lumberjack",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Woodcutter",
				payment = 50,
			},
			[1] = {
				name = "Foreman",
				payment = 75,
			},
		},
	},

	["miner"] = {
		label = "Miner",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Prospector",
				payment = 50,
			},
			[1] = {
				name = "Senior Miner",
				payment = 75,
			},
		},
	},

	["oilrig"] = {
		label = "Oil Rig Worker",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Operator",
				payment = 50,
			},
			[1] = {
				name = "Rig Supervisor",
				payment = 75,
			},
		},
	},

	["postman"] = {
		label = "Postman",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Mail Carrier",
				payment = 50,
			},
			[1] = {
				name = "Postmaster",
				payment = 75,
			},
		},
	},

	["treasure"] = {
		label = "Treasure Hunter",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Explorer",
				payment = 50,
			},
			[1] = {
				name = "Master Hunter",
				payment = 75,
			},
		},
	},

	["windowcleaner"] = {
		label = "Window Cleaner",
		defaultDuty = true,
		offDutyPay = false,
		grades = {
			[0] = {
				name = "Cleaner",
				payment = 50,
			},
			[1] = {
				name = "Supervisor",
				payment = 75,
			},
		},
	},

	beanmachine = {
		label = "Beanmachine",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
	lsbeanmachine = {
		label = "Legion Square Beanmachine",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
	coolbeans = {
		label = "Coolbeans",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
	hawkerboys = {
		label = "Three Hawker Boys",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
	mpburgershot = {
		label = "Mirror Park Burgershot",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
	ssburgershot = {
		label = "Sandy Shores Burgershot",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
	vpburgershot = {
		label = "Vespucci Burgershot",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
	cafeday = {
		label = "Cafe Day",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
	bwsaloon = {
		label = "Black Wood Saloon",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
	rfclucking = {
		label = "Rockford Clucking Bell",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
	vwupnatom = {
		label = "Vinewood Up-N-Atom",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
	gsupnatom = {
		label = "Grapeseed Up-N-Atom",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
	icentralbar = {
		label = "Italian Central Bar",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
	rexdiner = {
		label = "Rex Diner",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
	comedyclub = {
		label = "Comedy Club",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
	malibuclub = {
		label = "Malibu Club",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
	coffeeshop = {
		label = "Coffee Shop",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
	wigwam = {
		label = "Wigwam Burger",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
	cafe = {
		label = "Café",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
	caseysdiner = {
		label = "Café",
		defaultDuty = false,
		offDutyPay = false,
		grades = {
			["0"] = { name = "Recruit", payment = 50 },
			["1"] = { name = "Novice", payment = 75 },
			["2"] = { name = "Experienced", payment = 100 },
			["3"] = { name = "Advanced", payment = 125 },
			["4"] = { name = "Manager", isboss = true, payment = 150 },
		},
	},
}
