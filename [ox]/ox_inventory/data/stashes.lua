return {
	{
		coords = vec3(464.07, -974.54, 31.12),
		target = {
			loc = vec3(464.07, -974.54, 31.12),
			length = 1.6,
			width = 1,
			heading = 105.03,
			minZ = 30.01,
			maxZ = 32.93,
			label = 'Open personal locker'
		},
		name = 'policelocker',
		label = 'Personal locker',
		owner = true,
		slots = 70,
		weight = 100000,
		groups = shared.police
	},

	{
		coords = vec3(2822.1, 4732.37, 47.89),
		target = {
			loc = vec3(2822.1, 4732.37, 47.89),
			length = 1.6,
			width = 1,
			heading = 95.48,
			minZ = 46.93,
			maxZ = 48.93,
			label = 'Open personal locker'
		},
		name = 'sahplocker',
		label = 'Personal locker',
		owner = true,
		slots = 70,
		weight = 100000,
		groups = shared.police
	},

	{
		coords = vec3(-347.81, -589.51, 32.77),
		target = {
			loc = vec3(-347.81, -589.51, 32.77),
			length = 1.0,
			width = 2.0,
			heading = 70.0,
			minZ = 42.26,
			maxZ = 46.26,
			label = 'Open personal locker'
		},
		name = 'emslocker_open',
		label = 'Personal EMS Open Locker',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = {['ambulance'] = 0}
	},

    {
		coords = vec3(-332.4, -579.32, 32.77),
		target = {
			loc = vec3(-332.4, -579.32, 32.77),
			length = 1.0,
			width = 2.0,
			heading = 70,
			minZ = 42.26,
			maxZ = 46.26,
			label = 'Open personal locker'
		},
		name = 'emslocker_locked',
		label = 'Personal EMS Locked Locker',
		owner = true,
		slots = 70,
		weight = 100000,
		groups = {['ambulance'] = 6}
	},

	{
		coords = vector3(199.21, -429.3, 47.33),
		target = {
			loc = vector3(199.21, -429.3, 47.33),
			length = 0.6,
			width = 1.8,
			heading = 155.2,
			minZ = 45.34,
			maxZ = 49.74,
			label = 'Open personal locker'
		},
		name = 'dojlocker',
		label = 'Personal Locker',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = {['doj'] = 0}
	},
}
