# Project X K4MB1 Traphouse Robbery

## Links

[Discord](https://discord.gg/bJNxYDAm5u)
[Store](https://www.projectx.gg)

## Dependencies

[ox_lib](https://github.com/overextended/ox_lib)
[K4MB1-Traphouse](https://www.k4mb1maps.com/package/5851520)
[Minigames-zip](https://drive.google.com/file/d/1ylq6sBVyCrTTaGVp7bpShavZ1Au3IYOn/view?usp=sharing)

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

-- For qb-inventory:

```lua
    ['x_device']              = {['name'] = 'x_device',               ['label'] = 'X Device',            ['weight'] = 50,   ['type'] = 'item',         ['image'] = 'x_device.png',             ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = '?????????'},
    ['x_stethoscope']            = {['name'] = 'x_stethoscope',               ['label'] = 'X Stethoscope',          ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_stethoscope.png',            ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "click click"},
    ['traphousekey']            = {['name'] = 'traphousekey',               ['label'] = 'Traphouse Key',          ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'traphousekey.png',             ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "????"},
    ['x_device_pin']            = {['name'] = 'x_device_pin',               ['label'] = 'Decrypted USB',          ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_device.png',                 ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "????"},
    ['x_document']                = {['name'] = 'x_document',               ['label'] = 'Traphouse Documents',      ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_document.png',               ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "????"},

```

-- For ox_inventory:

```lua
["x_device"] = {
  label = "X Device",
  weight = 200,
  stack = false,
  close = false,
  description = "",
  client = {
   image = "x_device.png",
  }
},
["x_device_pin"] = {
  label = "Decrypted Device",
  weight = 200,
  stack = false,
  close = false,
  description = "",
  client = {
   image = "x_device.png",
  }
},
["x_stethoscope"] = {
  label = "X Stethoscope",
  weight = 200,
  stack = false,
  close = false,
  description = "",
  client = {
   image = "x_stethoscope.png",
  }
},
["traphousekey"] = {
  label = "Traphouse Key",
  weight = 300,
  stack = false,
  close = false,
  description = "",
  client = {
   image = "traphousekey.png",
  }
},
["x_document"] = {
  label = "X Documents",
  weight = 250,
  stack = false,
  close = false,
  description = "",
  client = {
   image = "x_document.png",
  }
},
```
