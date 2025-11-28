return {
    cityhalls = {
        {
            coords = vec3(-437.085, 1096.909, 328.766),
            showBlip = true,
            blip = {
                label = 'City Services',
                shortRange = true,
                sprite = 176,
                display = 4,
                scale = 0.8,
                colour = 3,
            },
            licenses = {
                ['id'] = {
                    item = 'id_card',
                    label = 'ID',
                    cost = 50,
                },
                ['driver'] = {
                    item = 'driver_license',
                    label = 'Driver License',
                    cost = 50,
                },
                -- ['weapon'] = {
                --     item = 'weaponlicense',
                --     label = 'Weapon License',
                --     cost = 50,
                -- },
            },
        },
    },

    employment = {
        enabled = false, -- Set to false to disable the employment menu
        jobs = {
            unemployed = 'Unemployed',
            trucker = 'Trucker',
            taxi = 'Taxi',
            tow = 'Tow Truck',
            reporter = 'News Reporter',
            garbage = 'Garbage Collector',
            bus = 'Bus Driver',
        },
    },
}
