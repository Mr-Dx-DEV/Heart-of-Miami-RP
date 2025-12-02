Config.PetShop = {
	["default"] = {
		jobRequirement = "none",
		shopModel = "mp_m_shopkeep_01",
		startingSkillPoints = 0, -- the starting skill points for this shop
		priceModifier = 1.0, -- the modifer for the price of the pets (e.g. 1.0 = 100% of the price, 0.5 = 50% of the price)
		markerCoords = vector4(562.84, 2736.84, 41.11, 184.91),
		cam = {
			coords = vector3(562.46, 2738.76, 42.36),
			rot = vector3(0.0, 0.0, 3.0),
		},
		pets = {
			"a_c_rottweiler",
			"a_c_retriever",
			"a_c_pug",
			"a_c_husky",
			"a_c_poodle",
			"a_c_westy",
			"a_c_shepherd",
			"a_c_cat_01",
			"a_c_rabbit_01",
		},
		petCoords = vector4(562.35, 2741.28, 43.87, 218.6),
		blip = { name = "Pet Shop", sprite = 442, color = 5, size = 1.0 },
		-- Edit this function if you want custom requirements to open the pet shop
		customRequirement = function()
			return true
		end,
	},
	["farm"] = {
		jobRequirement = "none",
		shopModel = "a_m_m_farmer_01",
		startingSkillPoints = 0, -- the starting skill points for this shop
		priceModifier = 1.0, -- the modifer for the price of the pets (e.g. 1.0 = 100% of the price, 0.5 = 50% of the price)
		markerCoords = vector4(431.74, 6469.69, 27.77, 76.91),
		cam = {
			coords = vector3(434.64, 6463.79, 28.75),
			rot = vector3(0.0, 0.0, 227.88),
		},
		pets = {
			"a_c_pig",
			"a_c_cow",
			"Younghorse",
			"Rangehorse",
			"Fullhorse",
			"Donkey",
			"a_c_rat",
			"a_c_boar",
			"a_c_hen",
			"a_c_deer",
		},
		petCoords = vector4(437.7, 6461.04, 28.75, 47.6),
		blip = { name = "Farm Pet Shop", sprite = 442, color = 22, size = 1.0 },
		customRequirement = function()
			return true
		end,
	},
	["exotic"] = {
		jobRequirement = "none",
		shopModel = "cs_hunter",
		startingSkillPoints = 0, -- the starting skill points for this shop
		priceModifier = 1.0, -- the modifer for the price of the pets (e.g. 1.0 = 100% of the price, 0.5 = 50% of the price)
		markerCoords = vector4(1301.63, 4320.54, 37.14, 305.43),
		cam = {
			coords = vector3(1300.97, 4324.07, 38.37),
			rot = vector3(0.0, 0.0, 125.56),
		},
		pets = {
			"a_c_chimp",
			"a_c_rhesus",
			"a_c_mtlion",
		},
		petCoords = vector4(1299.34, 4322.98, 38.28, 307.5),
		blip = { name = "Exotic Pet Shop", sprite = 442, color = 10, size = 1.0 },
		-- Edit this function if you want custom requirements to open the pet shop
		customRequirement = function()
			return true
		end,
	},
	["policeShop"] = {
		jobRequirement = "police",
		shopModel = "s_m_y_cop_01",
		startingSkillPoints = 5, -- the starting skill points for this shop
		priceModifier = 0.5, -- the modifer for the price of the pets (e.g. 1.0 = 100% of the price, 0.5 = 50% of the price)
		markerCoords = vector4(433.0, -999.8, 29.75, 185.0),
		cam = {
			coords = vector3(435.9, -1001.47, 30.72),
			rot = vector3(-10.0, 0.0, 268.22),
		},
		pets = {
			"a_c_rottweiler",
			"Fullhorse",
		},
		petCoords = vector4(438.9, -1001.55, 30.72, 143.81),
		blip = { name = "Pet Police Shop", sprite = 442, color = 29, size = 1.0 },
		-- Edit this function if you want custom requirements to open the pet shop
		customRequirement = function()
			return true
		end,
	},
}

Config.AccessoryShop = {
	shops = {
		["default"] = {
			markerCoords = vector4(565.69, 2738.22876, 41.25, 165.0),
			shopModel = "cs_mrsphillips",
			blip = { name = "Accessory Shop", sprite = 442, color = 5, size = 1.0 },
			cam = {
				coords = vector3(3.59, -779.98, 31.18),
				rot = vector3(0.0, 0.0, 3.0),
			},
		},
	},
	shopItems = {
		["collar"] = {
			{
				name = "collar_brown",
				price = 50,
			},
			{
				name = "collar_black",
				price = 100,
			},
			{
				name = "collar_red",
				price = 100,
			},
			{
				name = "collar_white",
				price = 100,
			},
			{
				name = "collar_blue",
				price = 100,
			},
			{
				name = "collar_orange",
				price = 100,
			},
			{
				name = "collar_pink",
				price = 100,
			},
			{
				name = "collar_green",
				price = 100,
			},
		},
		["neck"] = {
			{
				name = "p_omega_neck_01_s",
				price = 50,
			},
			{
				name = "p_oscar_necklace_s",
				price = 50,
			},
			{
				name = "p_stretch_necklace_s",
				price = 50,
			},
			{
				name = "p_omega_neck_02_s",
				price = 50,
			},
			-- {
			--     name = "p_csbporndudes_necklace_s",
			--     price = 50,
			-- },
			{
				name = "sf_prop_sf_necklace_01a",
				price = 50,
			},
			{
				name = "p_jewel_necklace01_s",
				price = 50,
			},
			{
				name = "tr_prop_tr_dd_necklace_01a",
				price = 50,
			},
			{
				name = "p_wade_necklace_s",
				price = 50,
			},
			{
				name = "h4_prop_h4_necklace_01a",
				price = 50,
			},
			{
				name = "ch_p_ch_jimmy_necklace_2_s",
				price = 50,
			},
			{
				name = "p_cs_tracy_neck2_s",
				price = 50,
			},
			{
				name = "p_cs_beverly_lanyard_s",
				price = 50,
			},
			{
				name = "p_jimmy_necklace_s",
				price = 50,
			},
			{
				name = "p_lamarneck_01_s",
				price = 50,
			},
		},
		["bag"] = {
			{
				name = "prop_michael_backpack",
				price = 600,
			},
			{
				name = "prop_parapack_01",
				price = 600,
			},
			{
				name = "p_ld_heist_bag_01",
				price = 600,
			},
			{
				name = "xm_prop_x17_bag_med_01a",
				price = 600,
			},
			{
				name = "prop_stat_pack_01",
				price = 600,
			},
			{
				name = "ch_p_m_bag_var01_arm_s",
				price = 600,
			},
			{
				name = "ch_p_m_bag_var03_arm_s",
				price = 600,
			},
			{
				name = "ch_p_m_bag_var04_arm_s",
				price = 600,
			},
			{
				name = "ch_p_m_bag_var06_arm_s",
				price = 600,
			},
			{
				name = "ch_p_m_bag_var07_arm_s",
				price = 600,
			},
			{
				name = "ch_p_m_bag_var08_arm_s",
				price = 600,
			},
			{
				name = "ch_p_m_bag_var09_arm_s",
				price = 600,
			},
			{
				name = "ch_p_m_bag_var10_arm_s",
				price = 600,
			},
			{
				name = "xm3_prop_xm3_backpack_01a",
				price = 600,
			},
			{
				name = "prop_beach_bag_01b",
				price = 600,
			},
			{
				name = "h4_prop_h4_pouch_01a",
				price = 600,
			},
		},
		["head"] = {
			{
				name = "prop_proxy_hat_01",
				price = 100,
			},
			{
				name = "reh_prop_reh_hat_cowboy_01a",
				price = 100,
			},
			{
				name = "prop_hard_hat_01",
				price = 100,
			},
			{
				name = "sf_prop_sf_helmet_01a",
				price = 100,
			},
			{
				name = "prop_ld_hat_01",
				price = 100,
			},
			{
				name = "v_ret_gc_ear01",
				price = 100,
			},
			{
				name = "xm3_prop_xm3_hat_ron_01a",
				price = 100,
			},
			{
				name = "sf_prop_art_cap_01a",
				price = 100,
			},
			-- {
			--     name = "v_res_fa_cap01",
			--     price = 100,
			-- },
			{
				name = "prop_cap_01",
				price = 100,
			},
			{
				name = "m23_2_prop_m32_hat_captain_01a",
				price = 100,
			},
			{
				name = "ba_prop_battle_headphones_dj",
				price = 100,
			},
			{
				name = "prop_player_gasmask",
				price = 100,
			},
			{
				name = "xm3_prop_xm3_helmet_01a",
				price = 100,
			},
			{
				name = "m23_2_prop_m32_peterscap_01a",
				price = 100,
			},
			{
				name = "prop_ear_defenders_01",
				price = 100,
			},
			{
				name = "p_single_rose_s",
				price = 100,
			},
			{
				name = "ch_prop_drills_hat02x",
				price = 100,
			},
			{
				name = "ch_prop_drills_hat01x",
				price = 100,
			},
			{
				name = "reh_prop_reh_rebreather_01a",
				price = 100,
			},
		},
		["glasses"] = {
			{
				name = "prop_safety_glasses",
				price = 100,
			},
			{
				name = "xm_prop_x17_b_glasses_01",
				price = 100,
			},
			{
				name = "xm3_prop_xm3_glasses_ron_01a",
				price = 100,
			},
			{
				name = "prop_cs_sol_glasses",
				price = 100,
			},
		},
		["items"] = {
			{
				name = "doghouse_1",
				price = 200,
			},
			{
				name = "pet_leash",
				price = 100,
			},
			{
				name = "pet_food",
				price = 20,
			},
		},
	},
}
