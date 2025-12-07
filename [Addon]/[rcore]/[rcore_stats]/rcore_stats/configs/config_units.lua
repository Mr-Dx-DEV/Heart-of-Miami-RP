Config = Config or {}

Config.Units = {
    speed = {
        metric = {
            label = 'km/h',
            modifier = 3.6,
            precision = 0,
        },
        imperial = {
            label = 'mph',
            modifier = 2.23693629,
            precision = 0,
        }
    },
    distance = {
        metric = {
            label = 'km',
            modifier = 1 / 1000,
            precision = 2,
        },
        imperial = {
            label = 'mi',
            modifier = 1 / 1609.3444978926,
            precision = 2,
        }
    },
    finance = {
        metric = {
            label = '$:amount:',
            modifier = 1,
            precision = 0,
        },
        imperial = {
            label = '$:amount:',
            modifier = 1,
            precision = 0,
        },
    }
}
