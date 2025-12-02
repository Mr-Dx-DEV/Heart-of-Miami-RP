--[[
    In this file your can find pet related data, its also here you can add new models
]]

-- Main pet table for data
Config.Pets = {
	["a_c_rottweiler"] = { label = "Rottweiler", price = 500, attack = true, sniff = true },
	["a_c_retriever"] = { label = "Retriever", price = 400, attack = true, sniff = true },
	["a_c_pug"] = { label = "Pug", price = 350, attack = false, sniff = true },
	["a_c_husky"] = { label = "Husky", price = 400, attack = true, sniff = true },
	["a_c_poodle"] = { label = "Poodle", price = 350, attack = false, sniff = true },
	["a_c_westy"] = { label = "Westie", price = 350, attack = false, sniff = true },
	["a_c_shepherd"] = { label = "Shepard", price = 400, attack = true, sniff = true },
	["a_c_cat_01"] = { label = "Cat", price = 400, attack = false, sniff = false },
	["a_c_rat"] = { label = "Rat", price = 150, attack = false, sniff = false },
	["a_c_rabbit_01"] = { label = "Rabbit", price = 250, attack = false, sniff = false },
	["a_c_boar"] = { label = "Boar", price = 250, attack = false, sniff = false },
	["a_c_hen"] = { label = "Hen", price = 250, attack = false, sniff = false },
	["Donkey"] = { label = "Donkey", price = 250, attack = false, sniff = false },
	["Fullhorse"] = { label = "Full Breed Horse", price = 250, attack = false, sniff = false },
	["Rangehorse"] = { label = "Range Horse", price = 250, attack = false, sniff = false },
	["Younghorse"] = { label = "Young Horse", price = 250, attack = false, sniff = false },
	["a_c_cow"] = { label = "Cow", price = 250, attack = false, sniff = false },
	["a_c_deer"] = { label = "Deer", price = 250, attack = false, sniff = false },
	["a_c_pig"] = { label = "Pig", price = 250, attack = false, sniff = false },
	["a_c_mtlion"] = { label = "Lion", price = 250, attack = true, sniff = false },
	["a_c_chimp"] = { label = "Chimp", price = 250, attack = true, sniff = false },
	["a_c_rhesus"] = { label = "Ape", price = 250, attack = true, sniff = false },
}

-- if you want to allow certain dogs to be pettable (make sure they have the right bones for the animation)
Config.PettableDogs = {
	["a_c_rottweiler"] = true,
	["a_c_husky"] = true,
	["a_c_retriever"] = true,
	["a_c_chop"] = true,
	["a_c_shepherd"] = true,
}

-- if it is set to "scene" it will play animation (for dogs) otherwise it will teleport
Config.PetsAllowedInVehicle = {
	["a_c_rottweiler"] = "scene",
	["a_c_retriever"] = "scene",
	["a_c_husky"] = "scene",
	["a_c_shepherd"] = "scene",
	["a_c_pug"] = "teleport",
	["a_c_poodle"] = "teleport",
	["a_c_westy"] = "teleport",
	["a_c_cat_01"] = "teleport",
	["a_c_rat"] = "teleport",
	["a_c_rabbit_01"] = "teleport",
	["a_c_hen"] = "teleport",
}

-- The different model variations for the models
Config.PetVariations = {
	["a_c_retriever"] = {
		{ componentId = 0, textureId = 0 },
		{ componentId = 0, textureId = 1 },
		{ componentId = 0, textureId = 2 },
		{ componentId = 0, textureId = 3 },
	},
	["a_c_rottweiler"] = {
		{ componentId = 4, textureId = 0 },
		{ componentId = 4, textureId = 1 },
		{ componentId = 4, textureId = 2 },
	},
	["a_c_husky"] = {
		{ componentId = 0, textureId = 0 },
		{ componentId = 0, textureId = 1 },
		{ componentId = 0, textureId = 2 },
	},
	["a_c_shepherd"] = {
		{ componentId = 0, textureId = 0 },
		{ componentId = 0, textureId = 1 },
		{ componentId = 0, textureId = 2 },
	},
	["a_c_pug"] = {
		{ componentId = 4, textureId = 0 },
		{ componentId = 4, textureId = 1 },
		{ componentId = 4, textureId = 2 },
		{ componentId = 4, textureId = 3 },
	},
	["a_c_westy"] = {
		{ componentId = 4, textureId = 0 },
		{ componentId = 4, textureId = 1 },
		{ componentId = 4, textureId = 2 },
	},
	["a_c_cat_01"] = {
		{ componentId = 0, textureId = 0 },
		{ componentId = 0, textureId = 1 },
		{ componentId = 0, textureId = 2 },
	},
	["a_c_rat"] = {
		{ componentId = 0, textureId = 0 },
		{ componentId = 0, textureId = 1 },
		{ componentId = 0, textureId = 2 },
		{ componentId = 0, textureId = 4 },
	},
	["a_c_rabbit_01"] = {
		{ componentId = 0, textureId = 0 },
		{ componentId = 0, textureId = 1 },
		{ componentId = 0, textureId = 2 },
	},
	["a_c_poodle"] = {
		{ componentId = 0, textureId = 0 },
	},
	["a_c_boar"] = {
		{ componentId = 0, textureId = 0 },
	},
	["a_c_hen"] = {
		{ componentId = 0, textureId = 0 },
	},
	["Donkey"] = {
		{ componentId = 0, textureId = 0 },
	},
	["Fullhorse"] = {
		{ componentId = 0, textureId = 0 },
	},
	["Rangehorse"] = {
		{ componentId = 0, textureId = 0 },
	},
	["Younghorse"] = {
		{ componentId = 0, textureId = 0 },
	},
	["a_c_cow"] = {
		{ componentId = 0, textureId = 0 },
	},
	["a_c_deer"] = {
		{ componentId = 0, textureId = 0 },
	},
	["a_c_pig"] = {
		{ componentId = 0, textureId = 0 },
	},
	["a_c_mtlion"] = {
		{ componentId = 0, textureId = 0 },
	},
	["a_c_chimp"] = {
		{ componentId = 0, textureId = 0 },
	},
	["a_c_rhesus"] = {
		{ componentId = 0, textureId = 0 },
	},
}

-- If you want to add more ridable models you can add them here
Config.RidingOffsets = {
	["Donkey"] = { offset = vector3(-0.3, 0.0, 0.3), rot = vector3(0.0, 0.0, 90.0) },
	["Fullhorse"] = { offset = vector3(-0.3, 0.0, 0.3), rot = vector3(0.0, 0.0, 90.0) },
	["Rangehorse"] = { offset = vector3(-0.3, 0.0, 0.3), rot = vector3(0.0, 0.0, 90.0) },
	["Younghorse"] = { offset = vector3(-0.3, 0.0, 0.3), rot = vector3(0.0, 0.0, 90.0) },
}

-- If you want to add more carry models you can add them here
Config.CarryParameters = {
	["a_c_retriever"] = {
		carryAnim = true,
		coords = vector3(-0.17, 0.18, -0.33),
		rot = vector3(260.0, 340.0, 30.0),
	},
	["a_c_rottweiler"] = {
		carryAnim = true,
		coords = vector3(-0.17, 0.18, -0.33),
		rot = vector3(260.0, 340.0, 30.0),
	},
	["a_c_husky"] = { carryAnim = true, coords = vector3(-0.17, 0.18, -0.33), rot = vector3(260.0, 340.0, 30.0) },
	["a_c_shepherd"] = { carryAnim = true, coords = vector3(-0.17, 0.18, -0.33), rot = vector3(260.0, 340.0, 30.0) },
	["a_c_pug"] = { carryAnim = true, coords = vector3(-0.11, 0.07, -0.35), rot = vector3(230.0, 373.0, 33.5) },
	["a_c_poodle"] = { carryAnim = true, coords = vector3(-0.11, 0.07, -0.35), rot = vector3(230.0, 373.0, 33.5) },
	["a_c_westy"] = { carryAnim = true, coords = vector3(-0.11, 0.07, -0.35), rot = vector3(230.0, 373.0, 33.5) },
	["a_c_cat_01"] = { coords = vector3(0.09, -0.07, 0.25), rot = vector3(291.0, 291.0, -90.0) },
	["a_c_rat"] = { coords = vector3(0.14, -0.06, 0.12), rot = vector3(-8.5, 350.0, 9.0) },
	["a_c_rabbit_01"] = { coords = vector3(0.1, -0.1, 0.18), rot = vector3(5.5, 345.0, 20.0) },
	["a_c_hen"] = { coords = vector3(0.1, -0.1, 0.18), rot = vector3(5.5, 345.0, 20.0) },
}

-- Used by the in-game accessory creator
Config.AccessoryKeys = {
	"prop_michael_backpack",
	"prop_parapack_01",
	"p_ld_heist_bag_01",
	"xm_prop_x17_bag_med_01a",
	"prop_proxy_hat_01",
	"reh_prop_reh_hat_cowboy_01a",
	"prop_hard_hat_01",
	"sf_prop_sf_helmet_01a",
	"sf_prop_art_cap_01a",
	"ba_prop_battle_headphones_dj",
	"prop_safety_glasses",
	"xm_prop_x17_b_glasses_01",
	"xm3_prop_xm3_glasses_ron_01a",
	"prop_ld_hat_01",
	"m23_2_prop_m32_hat_captain_01a",
	"prop_cs_panties_03",
	"v_ret_gc_ear01",
	"xm3_prop_xm3_hat_ron_01a",
	"p_jewel_necklace_02",
	"p_omega_neck_01_s",
	"p_oscar_necklace_s",
	"prop_player_gasmask",
	"xm3_prop_xm3_helmet_01a",
	"m23_2_prop_m32_peterscap_01a",
	"prop_ear_defenders_01",
	"p_single_rose_s",
	"ch_prop_drills_hat02x",
	"ch_prop_drills_hat01x",
	"ch_p_m_bag_var01_arm_s",
	"ch_p_m_bag_var03_arm_s",
	"ch_p_m_bag_var04_arm_s",
	"ch_p_m_bag_var06_arm_s",
	"ch_p_m_bag_var07_arm_s",
	"ch_p_m_bag_var08_arm_s",
	"ch_p_m_bag_var09_arm_s",
	"ch_p_m_bag_var10_arm_s",
	"prop_stat_pack_01",
	"p_stretch_necklace_s",
	"p_omega_neck_02_s",
	"sf_prop_sf_necklace_01a",
	"p_jewel_necklace01_s",
	"tr_prop_tr_dd_necklace_01a",
	"p_wade_necklace_s",
	"h4_prop_h4_necklace_01a",
	"ch_p_ch_jimmy_necklace_2_s",
	"prop_cs_sol_glasses",
	"p_cs_beverly_lanyard_s",
	"h4_prop_h4_pouch_01a",
	"p_lamarneck_01_s",
	"p_jimmy_necklace_s",
	"xm3_prop_xm3_backpack_01a",
	"p_cs_tracy_neck2_s",
	"prop_cap_01",
	"reh_prop_reh_rebreather_01a",
	"prop_beach_bag_01b",
}

-- Used by the in-game accessory creator
Config.PetKeys = {
	"a_c_rottweiler",
	"a_c_retriever",
	"a_c_pug",
	"a_c_husky",
	"a_c_poodle",
	"a_c_westy",
	"a_c_shepherd",
	"a_c_cat_01",
	"a_c_rat",
	"a_c_rabbit_01",
	"a_c_boar",
	"a_c_hen",
	"Donkey",
	"Fullhorse",
	"Rangehorse",
	"Younghorse",
	"a_c_cow",
	"a_c_deer",
	"a_c_pig",
	"a_c_mtlion",
	"a_c_chimp",
	"a_c_rhesus",
}
