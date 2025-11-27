return {
	PoliceArmoury = {
		name = 'Police Armoury',
		groups = {
			['police'] = 0,
			['bcso'] = 0,
			['sasp'] = 0,
			['fib'] = 0
		},
		inventory = {
			-- Default Rank 0(Cadet)
			{ name = 'pdbodycam', price = 0, metadata = { registered = true, serial = 'POL' }, grade = 0},
			{ name = 'pddashcam', price = 0, metadata = { registered = true, serial = 'POL' }, grade = 0},
			{ name = 'panicbutton', price = 0, metadata = { registered = true, serial = 'POL' }, grade = 0},
			{ name = 'government_handcuffs', price = 0, metadata = { registered = true, serial = 'POL' }, grade = 0},
			{ name = 'ifak', price = 0, metadata = { registered = true, serial = 'POL' }, grade = 0},
			{ name = 'policegunrack', price = 0, metadata = { registered = true, serial = 'POL' }, grade = 0},
			{ name = 'heavyarmor', price = 0, metadata = { registered = true, serial = 'POL' }, grade = 0},
			{ name = 'radio', price = 0, metadata = { registered = true, serial = 'POL' }, grade = 0},
			{ name = 'megaphone', price = 0, metadata = { registered = true, serial = 'POL' }, grade = 0},
			{ name = 'spikestrip', price = 0, metadata = { registered = true, serial = 'POL' }, grade = 0},
			{ name = 'binoculars', price = 0, metadata = { registered = true, serial = 'GOV' }, grade = 0},
			{ name = 'weapon_stungun', price = 0, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 0},
			{ name = 'WEAPON_PDBATON', price = 0, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 0},
			{ name = 'xd_gov_pistol_ammo', price = 0, grade = 0},
			{ name = 'weapon_flashlight', price = 0, metadata = { registered = true, serial = 'POL' }, grade = 0},
			{ name = 'tablet', price = 0, metadata = { registered = true, serial = 'POL' }, grade = 0},
			{ name = 'kq_tow_rope', price = 0, metadata = { registered = true, serial = 'POL' }, grade = 0},
			{ name = 'kq_winch', price = 0, metadata = { registered = true, serial = 'POL' }, grade = 0},

			-- Rank 1(Officer)
			{ name = 'WEAPON_PDG22', price = 0, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 1},
			{ name = 'WEAPON_PDC7', price = 0, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 1},
			{ name = 'weapon_pumpshotgun_mk2', price = 0, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 1},
			{ name = 'xd_gov_shotgun_ammo', price = 0, grade = 1},
			{ name = 'xd_gov_rifle_ammo', price = 0, grade = 1},

			-- Rank 1(SWAT)
			{ name = 'WEAPON_PDBM3', price = 0, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 1},
			{ name = 'weapon_smg', price = 0, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 1},
			{ name = 'xd_gov_smg_ammo', price = 0, grade = 1},

			-- Rank 4(Corporal)
			{ name = 'WEAPON_PDG19', price = 0, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 4},
			{ name = 'WEAPON_HK417', price = 0, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 4},
			{ name = 'weapon_m4', price = 0, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 4},
			{ name = 'parachute', price = 0, metadata = { registered = true, serial = 'GOV' }, grade = 4},
			{ name = 'diving_gear', price = 0, metadata = { registered = true, serial = 'GOV' }, grade = 4},
			{ name = 'diving_fill', price = 0, metadata = { registered = true, serial = 'GOV' }, grade = 4},
            -- { name = 'tracking_bracelet', price = 0, metadata = { registered = true, serial = 'GOV' }, grade = 4},

			-- Rank 6(Command)
			{ name = 'weapon_scarh', price = 0, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 6},
			{ name = 'weapon_pistol50', price = 0, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 6},
			{ name = 'police_stormram', price = 0, metadata = { registered = true, serial = 'POL' }, grade = 6},

			-- Rank 7 (High Command)
			{ name = 'WEAPON_PDM700', price = 0, metadata = { registered = true, serial = 'POL' }, license = 'weapon', grade = 6},
			{ name = 'xd_gov_sniper_ammo', price = 0, grade = 6},

			-- Rank 9 (High Command)
			{ name = 'at_clip_extended_rifle', price = 0, grade = 9  },
			{ name = 'at_scope_small', price = 0, grade = 9  },
			{ name = 'at_scope_medium', price = 0, grade = 9  },
			{ name = 'at_flashlight', price = 0, grade = 9  },
			{ name = 'at_suppressor_light', price = 0, grade = 9  },
			{ name = 'at_clip_extended_smg', price = 0, grade = 9  },
			{ name = 'at_scope_large', price = 0, grade = 9  },
			{ name = 'at_grip', price = 0, grade = 9  },
			{ name = 'at_suppressor_heavy', price = 0, grade = 9  },
			{ name = 'at_barrel', price = 0, grade = 9  },
			{ name = 'at_clip_extended_pistol', price = 0, grade = 9  },
			{ name = 'at_clip_extended_shotgun', price = 0, grade = 9  },
		}, locations = {
			
            vec3(468.37, -985.22, 26.09),   --- MRPD
			vec3(2807.95, 4729.98, 47.89), --- SAHP
			vec3(-448.252, 7103.879, 22.384), --- Roxwood Police Station
		}, targets = {
			
			{ loc = vec3(468.37, -985.22, 26.09), length = 2.8, width = 3.0, heading = 66.45, minZ = 25.88, maxZ = 27.88, distance = 3 },
		}
	},

	Medicine = {
		name = 'Medicine Cabinet',
		groups = {
			['ambulance'] = 0
		},
		blip = {
			id = 403, colour = 69, scale = 0.8
		}, inventory = {
			--Rank 0(Trainee)
			{ name = 'pdbodycam', price = 0, metadata = { registered = true, serial = 'EMS' }, grade = 0},
			{ name = 'pddashcam', price = 0, metadata = { registered = true, serial = 'EMS' }, grade = 0},
			{ name = 'panicbutton', price = 0, metadata = { registered = true, serial = 'EMS' }, grade = 0},
			{ name = 'radio', price = 0, metadata = { registered = true, serial = 'EMS' }, grade = 0},
			{ name = 'weapon_flashlight', price = 0, metadata = { registered = true, serial = 'EMS' }, grade = 0},
			{ name = 'heavyarmor', price = 0, metadata = { registered = true, serial = 'EMS' }, grade = 0},
			{ name = 'ifak', price = 0, metadata = { registered = true, serial = 'EMS' }, grade = 0},
			{ name = 'binoculars', price = 0, metadata = { registered = true, serial = 'EMS' }, grade = 0},
			{ name = 'tablet', price = 0, metadata = { registered = true, serial = 'EMS' }, grade = 0 },
			{ name = 'bobby_pin', price = 0, grade = 0  },

			--Rank 1(EMT)
			{ name = 'weapon_stungun', price = 0, metadata = { registered = true, serial = 'EMS' }, license = 'weapon', grade = 1},
			{ name = 'government_handcuffs', price = 0, metadata = { registered = true, serial = 'EMS' }, grade = 1},

			--Rank 2(Lead EMT)
			{ name = 'diving_gear', price = 0, metadata = { registered = true, serial = 'EMS' }, grade = 3},
			{ name = 'diving_fill', price = 0, metadata = { registered = true, serial = 'EMS' }, grade = 2},
			{ name = 'parachute', price = 0, metadata = { registered = true, serial = 'EMS' }, grade = 2},

			--Rank 2(Combat Medic)

			--Rank 3(Paramedic)


			--Rank 4(Nurse)


			--Rank 5(Doctor)

            { name = 'prescription_pad', price = 0, metadata = { registered = true, serial = 'EMS' }, grade = 5},

			--Rank 6(Command)
			--Rank 7(High Command)
			--Rank 8(Assistant Chief)
			--Rank 9(Chief of EMS)

			-- DONT DELETE
			-- { name = 'temporary_tourniquet', price = 0, metadata = { registered = true, serial = 'EMS' }, grade = 0   },
			-- { name = 'pager', price = 0, metadata = { registered = true, serial = 'EMS' }, grade = 0   },
			-- { name = 'weapon_fireextinguisher', price = 0, grade = 0  },

            -- Basic EMS Stuffs
            { name = 'medbag', price = 0, grade = 0  },
            { name = 'morphine30', price = 0, grade = 6  },
            { name = 'morphine15', price = 0, grade = 6  },
            { name = 'perc30', price = 0, grade = 6  },
            { name = 'perc10', price = 0, grade = 6  },
            { name = 'perc5', price = 0, grade = 6  },
            { name = 'vic10', price = 0, grade = 6  },
            { name = 'vic5', price = 0, grade = 6  },
            { name = 'medikit', price = 0, grade = 0  },

		}, locations = {
			vec3(-309.75, -589.45, 32.78)
		}, targets = {

		}
	},

	VendingMachineDrinks = {
		name = 'Vending Machine',
		inventory = {
			{ name = 'water', price = 10 },
			{ name = 'cola', price = 10 },
		},
		model = {
			`prop_vend_soda_02`, `prop_vend_fridge01`, `prop_vend_water_01`, `prop_vend_soda_01`
		}
	},

	rcorespray = {
		name = 'Gang Sprays',
        blip = {
			id = 521, colour = 3, scale = 0.8
		},
		inventory = {
			{ name = 'spray', price = 150000, count = 5 },
            { name = 'spray_remover', price = 150000, count = 5 },

		}, locations = {
			vector3(-297.484, -1332.118, 31.296)
		}, targets = {
			{ loc = vector3(-297.484, -1332.118, 31.296), length = 2.2, width = 1.2, heading = 297, minZ = 41.02, maxZ = 45.02, distance = 3 },
		}
	},
}
