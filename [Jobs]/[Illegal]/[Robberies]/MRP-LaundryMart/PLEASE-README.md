# Project X K4MB1 Laundromat Robbery

## Links

[Discord](https://discord.gg/bJNxYDAm5u)
[Store](https://www.projectx.gg)

## Dependencies

[ox_lib](https://github.com/overextended/ox_lib)
[K4MB1 Panache Map](https://k4mb1maps.com/product/6711148)
[Minigames](https://github.com/Byte-Labs-Studio/bl_ui)

### Required Dependencies if you want to use the script as is

[QBCore-QBOX]
[ps-dispatch](https://github.com/Project-Sloth/ps-dispatch)

[ESX]
[linden_outlawalert](https://github.com/thelindat/linden_outlawalert)

### Installation

- Step 1: Extract the script from the zip file and place it into your scripts folder.
- Step 2: Add the minigames that are found in the zip file above into your standalone/dependencies folder (Make sure they are not in the same folder as the robbery script).
- Step 3: Add the items from below and the images from the images folder to your inventory.
- Step 4: Configure the config.lua file to work with your server by changing the Framework, Inventory, Dispatch, Target name.
- Step 5: Make sure that the Framework, ox_lib, your Target, Dispatch, Inventory, and Minigames are started before the robbery script.

### Add this to the server.cfg

```lua
  ensure ox_lib -- This should be placed under ensure qb-core in your server.cfg, if you just downloaded it
```

### Images done by Artwork Inventory

[Discord](https://discord.gg/Z2awpnXKdw) -- Use code ProjectX for 10% off!

### Should be obtained from outside of the robbery for progress

- laundromatkey

### Items required from a shop/black market

- x_device
- x_cratejammer
- bag

### The rest of the items are obtained within the robbery

-- For qb-inventory:

```lua
  ['x_cratejammer']        = {['name'] = 'x_cratejammer',       ['label'] = 'X Crate Jammer',      ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_cratejammer.png',       ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "boop beep"},
  ['x_device']          = {['name'] = 'x_device',           ['label'] = 'X Device',    ['weight'] = 50,   ['type'] = 'item',         ['image'] = 'x_device.png',        ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = '?????????'},
  ['bag']                  = {['name'] = 'bag',                   ['label'] = 'Bag',                ['weight'] = 400,   ['type'] = 'item',         ['image'] = 'bag.png',                ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Duffel bag'},
  ['laundromatkey']                  = {['name'] = 'laundromatkey',                   ['label'] = 'Laundromat Key',                ['weight'] = 400,   ['type'] = 'item',         ['image'] = 'laundromatkey.png',                ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Laundromat key'},
  ['x_shirt']                  = {['name'] = 'x_shirt',                   ['label'] = 'Shirt',                ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_shirt.png',                ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A Shirt'},
  ['x_shirt_pile']             = {['name'] = 'x_shirt_pile',              ['label'] = 'Pile of Shirts',        ['weight'] = 800,   ['type'] = 'item',         ['image'] = 'x_shirt_pile.png',                ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Pile of shirts'},
  ['x_overalls']               = {['name'] = 'x_overalls',                ['label'] = 'Overalls',             ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_overalls.png',             ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Overalls'},
  ['x_towel']                  = {['name'] = 'x_towel',                   ['label'] = 'Towel',                ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_towel.png',                ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A Towel'},
  ['x_hat']                  = {['name'] = 'x_hat',                   ['label'] = 'Hat',                ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_hat.png',                ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'A Hat'},
```

-- For ox_inventory:

```lua
["x_cratejammer"] = {
    label = "X Crate Jammer",
    weight = 300,
    stack = false,
    close = false,
    description = "?????????",
    client = {
        image = "x_cratejammer.png",
    }
},
['x_device'] = {
    label = "X Device",
    weight = 50,
    stack = false,
    close = false,
    description = "?????????",
    client = {
        image = "x_device.png",
    }
},
['bag'] = {
    label = "Bag",
    weight = 400,
    stack = false,
    close = false,
    description = "Duffel bag",
    client = {
        image = "bag.png",
    }
},
['laundromatkey'] = {
    label = "Laundromat Key",
    weight = 400,
    stack = false,
    close = false,
    description = "Laundromat Key",
    client = {
        image = "laundromatkey.png",
    }
},
['x_shirt'] = {
    label = "Shirt",
    weight = 200,
    stack = false,
    close = false,
    description = "A Shirt",
    client = {
        image = "x_shirt.png",
    }
},
['x_shirt_pile'] = {
    label = "Pile of shirts",
    weight = 800,
    stack = false,
    close = false,
    description = "Pile of shirts",
    client = {
        image = "x_shirt_pile.png",
    }
},
['x_overalls'] = {
    label = "Overalls",
    weight = 200,
    stack = false,
    close = false,
    description = "Overalls",
    client = {
        image = "x_overalls.png",
    }
},
['x_towel'] = {
    label = "A Towel",
    weight = 200,
    stack = false,
    close = false,
    description = "A Towel",
    client = {
        image = "x_towel.png",
    }
},
['x_hat'] = {
    label = "A Hat",
    weight = 200,
    stack = false,
    close = false,
    description = "A Towel",
    client = {
        image = "x_hat.png",
    }
},
```
