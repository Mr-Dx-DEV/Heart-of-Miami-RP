Config = {}

Config.Rings = {
    ['armor_potion'] = {
        label = 'Diamond Ring',
        buffType = 'armor',
        buffTime = 180000,
        buffValue = 3,
    },
    
    ['health_potion'] = {
        label = 'Ruby Ring',
        buffType = 'health',
        buffTime = 180000,
        buffValue = 3,
    },
    
    ['stamina_potion'] = {
        label = 'Sapphire Ring',
        buffType = 'stamina',
        buffTime = 180000,
        buffValue = 2.0,
    },
    
    ['stress_potion'] = {
        label = 'Citrine Ring',
        buffType = 'stress',
        buffTime = 180000,
        buffValue = 3,
    },
    
    ['gallery_onyx-ring'] = {
        label = 'Onyx Ring',
        buffType = 'swimming',
        buffTime = 180000,
        buffValue = 2.0,
    }
}

Config.ProgressBar = {
    duration = 5000,
    label = 'Putting on Ring..',
    position = 'bottom',
    useWhileDead = false,
    canCancel = true,
    disableCar = false,
    disableMove = false,
    disableCombat = true,
    disableMouse = false,
    animation = {
        dict = 'mp_missheist_countrybank@nervous',
        clip = 'nervous_idle'
    }
}

Config.Notifications = {
    success = {
        title = 'Ring Equipped',
        type = 'success'
    },
    cancelled = {
        title = 'Cancelled',
        description = 'You stopped putting on the ring',
        type = 'error'
    }
}

