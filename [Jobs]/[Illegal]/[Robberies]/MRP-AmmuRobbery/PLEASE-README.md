# Project X Gabz Ammunation Robbery

## Links

[Discord](https://discord.gg/bJNxYDAm5u)
[Store](https://www.projectx.gg)

## Dependencies

[ox_lib](https://github.com/overextended/ox_lib)
[Zip-With-All-Minigames-Required](https://drive.google.com/file/d/1rNeXdIkgBqbG_FXCtCOEdVqXiwPI--_C/view?usp=sharing) -- Drag and drop them into your standalone folder or minigame folder
[Gabz Ammunation Map](https://fivem.gabzv.com/package/5024631)

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

## Items required for the robbery

### Should be obtained from outside of the robbery for progress

- ammunation_key

### Items required from a shop/black market

- x_phone
- x_circuittester
- x_trojanusb
- advancedlockpick
- bag

### The rest of the items are obtained within the robbery

-- For qb-inventory:

```lua
    ['x_phone']          = {['name'] = 'x_phone',           ['label'] = 'X Phone',    ['weight'] = 50,   ['type'] = 'item',         ['image'] = 'x_phone.png',        ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = '?????????'},
    ['bag']          = {['name'] = 'bag',           ['label'] = 'Bag',    ['weight'] = 50,   ['type'] = 'item',         ['image'] = 'bag.png',        ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = '?????????'},
    ['x_circuittester']        = {['name'] = 'x_circuittester',           ['label'] = 'X Circuit Tester',          ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_circuittester.png',          ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "????"},
    ['x_trojanusb']                    = {['name'] = 'x_trojanusb',       ['label'] = 'X Trojan USB',               ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_trojanusb.png',                   ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "????"},
    ['x_trojanusb2']                    = {['name'] = 'x_trojanusb2',       ['label'] = 'X Encrypted Trojan',       ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_trojanusb2.png',                   ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "????"},
    ['advancedlockpick']                = {['name'] = 'advancedlockpick',                  ['label'] = 'Advanced Lockpick',         ['weight'] = 500,          ['type'] = 'item',         ['image'] = 'advancedlockpick.png',        ['unique'] = false,         ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = 'If you lose your keys a lot this is very useful... Also useful to open your beers'},
    ['ammunation_key']                    = {['name'] = 'ammunation_key',      ['label'] = 'Ammunation Key',           ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'ammunation_key.png',                   ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "????"},
```

-- For ox_inventory:

```lua
 ["bag"] = {
  label = "Duffel Bag",
  weight = 250,
  stack = false,
  close = false,
  description = "Duffel bag",
  client = {
    image = "bag.png",
  }
 },
  ["x_trojanusb"] = {
  label = "X Trojan USB",
  weight = 125,
  stack = false,
  close = false,
  description = "?????????",
  client = {
   image = "x_trojanusb.png",
    },
  },
  ["x_trojanusb2"] = {
  label = "X Encrypted Trojan",
  weight = 125,
  stack = false,
  close = false,
  description = "?????????",
  client = {
   image = "x_trojanusb2.png",
  }
 },
  ["x_circuittester"] = {
  label = "X Circuit Tester",
  weight = 125,
  stack = false,
  close = false,
  description = "?????????",
  client = {
   image = "x_circuittester.png",
  }
 },
  ["x_phone"] = {
  label = "X Phone",
  weight = 125,
  stack = false,
  close = false,
  description = "?????????",
  client = {
   image = "x_phone.png",
  }
 },
   ["advancedlockpick"] = {
  label = "Advanced Lockpick",
  weight = 500,
  stack = true,
  close = true,
  description = "If you lose your keys a lot this is very useful... Also useful to open your beers",
  client = {
   image = "advancedlockpick.png",
  }
 },
   ["ammunation_key"] = {
  label = "Ammunation Key",
  weight = 125,
  stack = false,
  close = false,
  description = "?????????",
  client = {
   image = "ammunation_key.png",
  }
 },
 ```
