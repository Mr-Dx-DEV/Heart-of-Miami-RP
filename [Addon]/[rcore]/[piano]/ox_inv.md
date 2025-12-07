in rcore_piano/config.lua

enable: Config.ox_inv = true

---

Add these to the item list to the ox_inv:
```LUA
['piano'] = {
    label = 'piano',
    weight = 250,
    close = true,
    consume = 0,
    client = {},
    server = {
        export = 'rcore_piano.piano',
    },
},
```