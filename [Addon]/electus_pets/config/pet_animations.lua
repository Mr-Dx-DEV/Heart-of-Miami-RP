Config.PetAnims = {
	["a_c_rottweiler"] = {
		spawnAnim = { dict = "creatures@rottweiler@amb@sleep_in_kennel@", anim = "exit_kennel", await = true, loop = 0 },
		pickUp = { dict = "creatures@rottweiler@move", anim = "fetch_pickup", loop = 0, await = false },
		getInVehicle = { dict = "creatures@rottweiler@in_vehicle@std_car", anim = "get_in", loop = 0 },
		exitVehicle = { dict = "creatures@rottweiler@in_vehicle@std_car", anim = "get_out", loop = 0, await = 1 },
		layingDown = {
			dict = "creatures@rottweiler@amb@sleep_in_kennel@",
			anim = "sleep_in_kennel",
			loop = 1,
			await = false,
		},
		sit = { dict = "creatures@rottweiler@amb@world_dog_sitting@base", anim = "base", loop = 1, await = false },
		bark = { dict = "creatures@rottweiler@amb@world_dog_barking@idle_a", anim = "idle_a", loop = 0, await = false },
		pee = { dict = "creatures@rottweiler@move", anim = "pee_left_idle", loop = 0, await = false },
		poop = { dict = "creatures@rottweiler@move", anim = "idle_a", loop = 0, await = false },
		attack = { dict = "creatures@rottweiler@melee@", anim = "dog_attack", loop = 0, await = false },
	},
	["a_c_pug"] = {
		spawnAnim = { dict = "creatures@pug@amb@world_dog_sitting@exit", anim = "exit", await = true, loop = 0 },
		layingDown = { dict = "creatures@pug@amb@world_dog_sitting@base", anim = "base", loop = 1, await = false },
		bark = { dict = "creatures@amb@amb@world_dog_barking@idle_a", anim = "idle_a", loop = 0, await = false },
		pee = { dict = "creatures@rottweiler@move", anim = "pee_left_idle", loop = 0, await = false },
		attack = { dict = "creatures@rottweiler@melee@", anim = "dog_attack", loop = 0, await = false },
	},
	["a_c_retriever"] = {
		spawnAnim = { dict = "creatures@rottweiler@amb@sleep_in_kennel@", anim = "exit_kennel", await = true, loop = 0 },
		pickUp = { dict = "creatures@rottweiler@move", anim = "fetch_pickup", loop = 0, await = false },
		getInVehicle = { dict = "creatures@rottweiler@in_vehicle@std_car", anim = "get_in", loop = 0 },
		exitVehicle = { dict = "creatures@rottweiler@in_vehicle@std_car", anim = "get_out", loop = 0, await = 1 },
		layingDown = {
			dict = "creatures@rottweiler@amb@sleep_in_kennel@",
			anim = "sleep_in_kennel",
			loop = 1,
			await = false,
		},
		bark = { dict = "creatures@retriever@amb@world_dog_barking@idle_a", anim = "idle_a", loop = 0, await = false },
		sit = { dict = "creatures@rottweiler@amb@world_dog_sitting@base", anim = "base", loop = 1, await = false },
		pee = { dict = "creatures@rottweiler@move", anim = "pee_left_idle", loop = 0, await = false },
		attack = { dict = "creatures@rottweiler@melee@", anim = "dog_attack", loop = 0, await = false },
	},
	["a_c_husky"] = {
		spawnAnim = { dict = "creatures@rottweiler@amb@sleep_in_kennel@", anim = "exit_kennel", await = true, loop = 0 },
		getInVehicle = { dict = "creatures@rottweiler@in_vehicle@std_car", anim = "get_in", loop = 0 },
		pickUp = { dict = "creatures@rottweiler@move", anim = "fetch_pickup", loop = 0, await = false },
		exitVehicle = { dict = "creatures@rottweiler@in_vehicle@std_car", anim = "get_out", loop = 0, await = 1 },
		layingDown = {
			dict = "creatures@rottweiler@amb@sleep_in_kennel@",
			anim = "sleep_in_kennel",
			loop = 1,
			await = false,
		},
		bark = { dict = "creatures@rottweiler@amb@world_dog_barking@idle_a", anim = "idle_a", loop = 0, await = false },
		sit = { dict = "creatures@rottweiler@amb@world_dog_sitting@base", anim = "base", loop = 1, await = false },
		pee = { dict = "creatures@rottweiler@move", anim = "pee_left_idle", loop = 0, await = false },
		attack = { dict = "creatures@rottweiler@melee@", anim = "dog_attack", loop = 0, await = false },
	},
	["a_c_shepherd"] = {
		spawnAnim = { dict = "creatures@rottweiler@amb@sleep_in_kennel@", anim = "exit_kennel", await = true, loop = 0 },
		getInVehicle = { dict = "creatures@rottweiler@in_vehicle@std_car", anim = "get_in", loop = 0 },
		pickUp = { dict = "creatures@rottweiler@move", anim = "fetch_pickup", loop = 0, await = false },
		exitVehicle = { dict = "creatures@rottweiler@in_vehicle@std_car", anim = "get_out", loop = 0, await = 1 },
		layingDown = {
			dict = "creatures@rottweiler@amb@sleep_in_kennel@",
			anim = "sleep_in_kennel",
			loop = 1,
			await = false,
		},
		bark = { dict = "creatures@rottweiler@amb@world_dog_barking@idle_a", anim = "idle_a", loop = 0, await = false },
		sit = { dict = "creatures@rottweiler@amb@world_dog_sitting@base", anim = "base", loop = 1, await = false },
		pee = { dict = "creatures@rottweiler@move", anim = "pee_left_idle", loop = 0, await = false },
		attack = { dict = "creatures@rottweiler@melee@", anim = "dog_attack", loop = 0, await = false },
	},
	["a_c_poodle"] = {
		spawnAnim = { dict = "creatures@pug@amb@world_dog_sitting@exit", anim = "exit", await = true, loop = 0 },
		layingDown = { dict = "creatures@pug@amb@world_dog_sitting@base", anim = "base", loop = 1, await = false },
		bark = { dict = "creatures@pub@amb@world_dog_barking@idle_a", anim = "idle_a", loop = 0, await = false },
		pee = { dict = "creatures@rottweiler@move", anim = "pee_left_idle", loop = 0, await = false },
	},
	["a_c_westy"] = {
		spawnAnim = { dict = "creatures@pug@amb@world_dog_sitting@exit", anim = "exit", await = true, loop = 0 },
		layingDown = { dict = "creatures@pug@amb@world_dog_sitting@base", anim = "base", loop = 1, await = false },
		bark = { dict = "creatures@pub@amb@world_dog_barking@idle_a", anim = "idle_a", loop = 0, await = false },
		pee = { dict = "creatures@rottweiler@move", anim = "pee_left_idle", loop = 0, await = false },
	},
	["a_c_cat_01"] = {
		spawnAnim = { dict = "creatures@cat@amb@world_cat_sleeping_ground@exit", anim = "exit", await = true, loop = 0 },
		layingDown = {
			dict = "creatures@cat@amb@world_cat_sleeping_ground@base",
			anim = "base",
			loop = 1,
			await = false,
		},
	},
}

Config.Emotes = {
	["a_c_rottweiler"] = {
		{ emote = "sit", dict = "creatures@rottweiler@amb@world_dog_sitting@base", anim = "base", loop = 1 },
		{ emote = "beg", dict = "creatures@rottweiler@tricks@", anim = "beg_loop" },
		{ emote = "lieDown", dict = "creatures@rottweiler@amb@sleep_in_kennel@", anim = "sleep_in_kennel", loop = 1 },
		{ emote = "bark", dict = "creatures@rottweiler@amb@world_dog_barking@idle_a", anim = "idle_a" },
		{ emote = "paw", dict = "creatures@rottweiler@tricks@", anim = "paw_right_loop" },
		{ emote = "spin", dict = "creatures@retriever@amb@world_dog_barking@idle_a", anim = "idle_c" },
	},
	["a_c_pug"] = {
		{ emote = "sit", dict = "creatures@pug@amb@world_dog_sitting@base", anim = "base" },
	},
	["a_c_retriever"] = {
		{ emote = "sit", dict = "creatures@rottweiler@amb@world_dog_sitting@base", anim = "base", loop = 1 },
		{ emote = "beg", dict = "creatures@rottweiler@tricks@", anim = "beg_loop" },
		{ emote = "lieDown", dict = "creatures@rottweiler@amb@sleep_in_kennel@", anim = "sleep_in_kennel", loop = 1 },
		{ emote = "bark", dict = "creatures@rottweiler@amb@world_dog_barking@idle_a", anim = "idle_a" },
		{ emote = "paw", dict = "creatures@rottweiler@tricks@", anim = "paw_right_loop" },
		{ emote = "spin", dict = "creatures@retriever@amb@world_dog_barking@idle_a", anim = "idle_c" },
	},
	["a_c_husky"] = {
		{ emote = "sit", dict = "creatures@rottweiler@amb@world_dog_sitting@base", anim = "base", loop = 1 },
		{ emote = "beg", dict = "creatures@rottweiler@tricks@", anim = "beg_loop" },
		{ emote = "lieDown", dict = "creatures@rottweiler@amb@sleep_in_kennel@", anim = "sleep_in_kennel", loop = 1 },
		{ emote = "bark", dict = "creatures@rottweiler@amb@world_dog_barking@idle_a", anim = "idle_a" },
		{ emote = "paw", dict = "creatures@rottweiler@tricks@", anim = "paw_right_loop" },
		{ emote = "spin", dict = "creatures@retriever@amb@world_dog_barking@idle_a", anim = "idle_c" },
	},
	["a_c_shepherd"] = {
		{ emote = "sit", dict = "creatures@rottweiler@amb@world_dog_sitting@base", anim = "base", loop = 1 },
		{ emote = "beg", dict = "creatures@rottweiler@tricks@", anim = "beg_loop" },
		{ emote = "lieDown", dict = "creatures@rottweiler@amb@sleep_in_kennel@", anim = "sleep_in_kennel", loop = 1 },
		{ emote = "bark", dict = "creatures@rottweiler@amb@world_dog_barking@idle_a", anim = "idle_a" },
		{ emote = "paw", dict = "creatures@rottweiler@tricks@", anim = "paw_right_loop" },
		{ emote = "spin", dict = "creatures@retriever@amb@world_dog_barking@idle_a", anim = "idle_c" },
	},
	["a_c_poodle"] = {
		{ emote = "sit", dict = "creatures@pug@amb@world_dog_sitting@base", anim = "base", loop = 1 },
	},
	["a_c_westy"] = {
		{ emote = "sit", dict = "creatures@pug@amb@world_dog_sitting@base", anim = "base", loop = 1 },
	},
	["a_c_cat_01"] = {
		{ emote = "sit", dict = "creatures@cat@amb@world_cat_sleeping_ground@base", anim = "base", loop = 1 },
	},
	["a_c_rat"] = {
		{ emote = "sit", dict = "creatures@rat@move", anim = "idle" },
	},
	["a_c_rabbit_01"] = {
		{ emote = "sit", dict = "creatures@rabbit@move", anim = "idle" },
	},
	["a_c_hen"] = {
		{ emote = "sit", dict = "creatures@hen@amb@world_hen_standing@base", anim = "base" },
	},
	["a_c_pig"] = {
		{ emote = "sit", dict = "creatures@pig@move", anim = "idle" },
	},
}
