in rcore_drunk/config.lua

enable: Config.ox_inv = true

---

Add these to the item list to the ox_inv:
```LUA
['vodka'] = {
    label = 'Vodka',
    weight = 250,
    close = true,
    consume = 0,
    client = {},
    server = {
        export = 'rcore_drunk.vodka',
    },
},
['beer'] = {
    label = 'beer',
    weight = 250,
    close = true,
    client = {},
    consume = 0,
    server = {
        export = 'rcore_drunk.beer',
    },
},
['wine'] = {
    label = 'wine',
    weight = 250,
    close = true,
    client = {},
    consume = 0,
    server = {
        export = 'rcore_drunk.wine',
    },
},
['whiskey'] = {
    label = 'whiskey',
    weight = 250,
    close = true,
    client = {},
    consume = 0,
    server = {
        export = 'rcore_drunk.whiskey',
    },
},
['breath_alcohol_tester'] = {
    label = 'breath_alcohol_tester',
    weight = 250,
    close = true,
    client = {},
    consume = 0,
    server = {
        export = 'rcore_drunk.breath_alcohol_tester',
    },
},
['supervodka'] = {
    label = 'supervodka',
    weight = 250,
    close = true,
    client = {},
    consume = 0,
    server = {
        export = 'rcore_drunk.supervodka',
    },
},
```
---