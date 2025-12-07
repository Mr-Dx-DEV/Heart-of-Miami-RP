enable: Config.ox_inv = true

---

Add these to the item list to the ox_inv:
```LUA
['radiocar_dismounter'] = {
    label = 'radiocar_dismounter',
    weight = 250,
    close = true,
    consume = 0,
    client = {},
    server = {
        export = 'rcore_itemradio.radiocar_dismounter',
    },
},
['radiocar'] = {
    label = 'radiocar gray style',
    weight = 250,
    close = true,
    consume = 0,
    client = {},
    server = {
        export = 'rcore_itemradio.radiocar',
    },
},
['radiocar_blue'] = {
    label = 'radiocar blue style',
    weight = 250,
    close = true,
    consume = 0,
    client = {},
    server = {
        export = 'rcore_itemradio.radiocar_blue',
    },
},
```
---