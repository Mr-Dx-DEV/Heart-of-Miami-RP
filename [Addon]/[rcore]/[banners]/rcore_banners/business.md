## Jobs - QBOX

Path: qbox/shared/jobs.lua

```lua
['gov'] = {
    label = 'GOV',
    defaultDuty = true,
    offDutyPay = false,
    grades = {
        [0] = {
            name = 'Freelancer',
            payment = 10
        },
        [1] = {
            name = 'Novice',
            payment = 10
        },
        [2] = {
            name = 'Medior',
            payment = 10
        },
        [3] = {
            name = 'CTO',
            payment = 10
        },
        [4] = {
            name = 'Chief',
            isboss = true,
            bankAuth = true,
            payment = 150
        },
    },
},
```

## Jobs - QBCore

Path: qb-core/shared/jobs.lua

```lua
["printers"] = {
    label = "Printers",
    defaultDuty = false,
    offDutyPay = true,
    grades = {
        ["0"] = {
            name = "Member",
            payment = 50
        },

        ["1"] = {
            name = "Novice",
            payment = 2000
        },

        ["2"] = {
            name = "Manager",
            payment = 150
        },

        ["3"] = {
            name = "Boss",
            isboss = true,
            payment = 200
        },

    }
},


["gov"] = {
    label = "Gov",
    defaultDuty = false,
    offDutyPay = true,
    grades = {
        ["0"] = {
            name = "Member",
            payment = 50
        },

        ["1"] = {
            name = "Novice",
            payment = 100
        },

        ["2"] = {
            name = "Manager",
            payment = 150
        },

        ["3"] = {
            name = "Boss",
            isboss = true,
            payment = 200
        },

    }
},
```