# ox inventory `ox_inventory/data/items.lua`
```lua
["notepad"] = {
    label = "Notepad",
    weight = 100,
    stack = false,
    close = true,
    description = "Sometimes handy to remember something.",
    server = {
        export = "cad-notepad.useItem",
    }
},

["notepad_slip"] = {
    label = "Note",
    weight = 10,
    stack = false,
    close = true,
    description = "Piece of paper which has something written on it.",
    server = {
        export = "cad-notepad.useItem",
    }
},
```

# qb inventory / ps inventory / lj inventory `(qb-core/shared/items.lua)`
```lua
    notepad = { name = 'notepad', label = 'Notepad', weight = 100, type = 'item', image = 'notepad.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'Sometimes handy to remember something.' },
    notepad_slip = { name = 'notepad_slip', label = 'Note', weight = 100, type = 'item', image = 'notepad_slip.png', unique = true, useable = true, shouldClose = true, combinable = nil, description = 'Piece of paper which has something written on it.' },
```

# qs inventory `(qs-inventory/shared/items.lua)`
```lua
['notepad'] = {
    ['name'] = 'notepad',
    ['label'] = 'Notepad',
    ['weight'] = 100,
    ['type'] = 'item',
    ['image'] = 'notepad.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'Sometimes handy to remember something.'
},
['notepad_slip'] = {
    ['name'] = 'notepad_slip',
    ['label'] = 'Note',
    ['weight'] = 100,
    ['type'] = 'item',
    ['image'] = 'notepad_slip.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'Piece of paper which has something written on it.'
},
```
