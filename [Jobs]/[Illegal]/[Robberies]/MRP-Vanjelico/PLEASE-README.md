# Project X MXC Vangelico Jewelry Heist

## Links

[Discord](https://discord.gg/bJNxYDAm5u)
[Store](https://www.projectx.gg)

## Dependencies

[ox_lib](https://github.com/overextended/ox_lib)
[MXC-Jewelry-Map](https://www.markz3d.com/products?product=6533130)
[Minigames-zip](https://drive.google.com/file/d/17neJ68AUjioTrIlNUfiB7fcDHK5Iab1i/view?usp=sharing)
(Optional)
[Projectx-Masks](github.com/iWN3/projectx-masks)

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
['bag']                  = {['name'] = 'bag',                   ['label'] = 'Bag',                ['weight'] = 400,   ['type'] = 'item',         ['image'] = 'bag.png',                ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Duffel bag'},
['x_device']          = {['name'] = 'x_device',           ['label'] = 'X Device',    ['weight'] = 50,   ['type'] = 'item',         ['image'] = 'x_device.png',        ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = '?????????'},
["diamond_ring"]      = {["name"] = "diamond_ring",          ["label"] = "Diamond Ring",    ["weight"] = 200,   ["type"] = "item",   ["image"] = "diamond_ring.png",   ["unique"] = false,  ["useable"] = false,  ["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["ruby_ring"]       = {["name"] = "ruby_ring",          ["label"] = "Ruby Ring",     ["weight"] = 200,   ["type"] = "item",   ["image"] = "ruby_ring.png",    ["unique"] = false,  ["useable"] = false,  ["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["sapphire_ring"]      = {["name"] = "sapphire_ring",       ["label"] = "Sapphire Ring",    ["weight"] = 200,   ["type"] = "item",   ["image"] = "sapphire_ring.png",   ["unique"] = false,  ["useable"] = false,  ["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["emerald_ring"]      = {["name"] = "emerald_ring",          ["label"] = "Emerald Ring",    ["weight"] = 200,   ["type"] = "item",   ["image"] = "emerald_ring.png",   ["unique"] = false,  ["useable"] = false,  ["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["diamond_necklace"]     = {["name"] = "diamond_necklace",       ["label"] = "Diamond Necklace",   ["weight"] = 200,   ["type"] = "item",   ["image"] = "diamond_necklace.png",  ["unique"] = false,  ["useable"] = false,  ["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["ruby_necklace"]      = {["name"] = "ruby_necklace",       ["label"] = "Ruby Necklace",    ["weight"] = 200,   ["type"] = "item",   ["image"] = "ruby_necklace.png",   ["unique"] = false,  ["useable"] = false,  ["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["sapphire_necklace"]     = {["name"] = "sapphire_necklace",    ["label"] = "Sapphire Necklace",   ["weight"] = 200,   ["type"] = "item",   ["image"] = "sapphire_necklace.png",  ["unique"] = false,  ["useable"] = false,  ["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["emerald_necklace"]     = {["name"] = "emerald_necklace",       ["label"] = "Emerald Necklace",   ["weight"] = 200,   ["type"] = "item",   ["image"] = "emerald_necklace.png",  ["unique"] = false,  ["useable"] = false,  ["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["diamond_earring"]     = {["name"] = "diamond_earring",       ["label"] = "Diamond Earrings",   ["weight"] = 200,   ["type"] = "item",   ["image"] = "diamond_earring.png",   ["unique"] = false,  ["useable"] = false,  ["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["ruby_earring"]      = {["name"] = "ruby_earring",        ["label"] = "Ruby Earrings",    ["weight"] = 200,   ["type"] = "item",   ["image"] = "ruby_earring.png",   ["unique"] = false,  ["useable"] = false,  ["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["sapphire_earring"]     = {["name"] = "sapphire_earring",     ["label"] = "Sapphire Earrings",   ["weight"] = 200,   ["type"] = "item",   ["image"] = "sapphire_earring.png",  ["unique"] = false,  ["useable"] = false,  ["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
["emerald_earring"]     = {["name"] = "emerald_earring",       ["label"] = "Emerald Earrings",   ["weight"] = 200,   ["type"] = "item",   ["image"] = "emerald_earring.png",   ["unique"] = false,  ["useable"] = false,  ["shouldClose"] = false, ["combinable"] = nil,   ["description"] = ""},
['glass_cutter']         = {['name'] = 'glass_cutter',         ['label'] = 'Glass Cutter',    ['weight'] = 1000,   ['type'] = 'item',   ['image'] = 'glass_cutter.png',         ['unique'] = false,     ['useable'] = false,  ['shouldClose'] = false,  ['combinable'] = nil,   ['description'] = ""}, 
['giant_gem']             = {['name'] = 'giant_gem',         ['label'] = 'Giant Gem',        ['weight'] = 2500,   ['type'] = 'item',   ['image'] = 'giant_gem.png',            ['unique'] = false,     ['useable'] = false,  ['shouldClose'] = false,  ['combinable'] = nil,   ['description'] = ""}, 
['vangelicokey']            = {['name'] = 'vangelicokey',            ['label'] = 'Vangelico Key',    ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'vangelicokey.png',             ['unique'] = false,        ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = ""},
['box_of_jewelry']          = {['name'] = 'box_of_jewelry',          ['label'] = 'Box of jewelry',    ['weight'] = 50,   ['type'] = 'item',         ['image'] = 'box_of_jewelry.png',     ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = '?????????'},
['x_circuittester']        = {['name'] = 'x_circuittester',       ['label'] = 'X Circuit Tester',      ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_circuittester.png',       ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "????"},
['mxckey']                    = {['name'] = 'mxckey',                   ['label'] = 'MXC Key',                  ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'mxckey.png',                   ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "????"},
['x_fingerprinttape']                    = {['name'] = 'x_fingerprinttape',                   ['label'] = 'Fingerprint Tape',                  ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_fingerprinttape.png',                   ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "????"},
['x_fingerprintbag']                    = {['name'] = 'x_fingerprintbag',                   ['label'] = 'Fingerprint Bag',                  ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_fingerprintbag.png',                   ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "????"},
['giant_gem']             = {['name'] = 'giant_gem_green',         ['label'] = 'Giant Green Gem',        ['weight'] = 2500,   ['type'] = 'item',   ['image'] = 'giant_gem_green.png',            ['unique'] = false,     ['useable'] = false,  ['shouldClose'] = false,  ['combinable'] = nil,   ['description'] = ""}, 
['gem_necklace']             = {['name'] = 'gem_necklace',         ['label'] = 'Gem Necklace',        ['weight'] = 2500,   ['type'] = 'item',   ['image'] = 'gem_necklace.png',            ['unique'] = false,     ['useable'] = false,  ['shouldClose'] = false,  ['combinable'] = nil,   ['description'] = ""}, 
['x_panther_gem']             = {['name'] = 'x_panther_gem',         ['label'] = 'Panther Gem',        ['weight'] = 2500,   ['type'] = 'item',   ['image'] = 'x_panther_gem.png',            ['unique'] = false,     ['useable'] = false,  ['shouldClose'] = false,  ['combinable'] = nil,   ['description'] = ""}, 

```

-- For ox_inventory:

```lua
["glass_cutter"] = {
  label = "Glass Cutter",
  weight = 1000,
  stack = false,
  close = false,
  description = "",
  client = {
   image = "glass_cutter.png",
  }
},

["giant_gem"] = {
  label = "Giant Gem",
  weight = 2500,
  stack = false,
  close = false,
  description = "",
  client = {
   image = "giant_gem.png",
  }
},

["diamond_necklace"] = {
  label = "Diamond Necklace",
  weight = 200,
  stack = true,
  close = false,
  description = "",
  client = {
   image = "diamond_necklace.png",
  }
},

["diamond_ring"] = {
  label = "Diamond Ring",
  weight = 200,
  stack = true,
  close = false,
  description = "",
  client = {
   image = "diamond_ring.png",
  }
},

["diamond_earring"] = {
  label = "Diamond Earring",
  weight = 200,
  stack = true,
  close = false,
  description = "",
  client = {
   image = "diamond_earring.png",
  }
},

["ruby_ring"] = {
  label = "Ruby Ring",
  weight = 200,
  stack = true,
  close = false,
  description = "",
  client = {
   image = "ruby_ring.png",
  }
},

["ruby_necklace"] = {
  label = "Ruby Necklace",
  weight = 200,
  stack = true,
  close = false,
  description = "",
  client = {
   image = "ruby_necklace.png",
  }
},

["ruby_earring"] = {
  label = "Ruby Earring",
  weight = 200,
  stack = true,
  close = false,
  description = "",
  client = {
   image = "ruby_earring.png",
  }
},

["sapphire_ring"] = {
  label = "Sapphire Ring",
  weight = 200,
  stack = true,
  close = false,
  description = "",
  client = {
   image = "sapphire_ring.png",
  }
},

["sapphire_necklace"] = {
  label = "Sapphire Necklace",
  weight = 200,
  stack = true,
  close = false,
  description = "",
  client = {
   image = "sapphire_necklace.png",
  }
},

["sapphire_earring"] = {
  label = "Sapphire Earring",
  weight = 200,
  stack = true,
  close = false,
  description = "",
  client = {
   image = "sapphire_earring.png",
  }
},

["emerald_ring"] = {
  label = "Emerald Ring",
  weight = 200,
  stack = true,
  close = false,
  description = "",
  client = {
   image = "emerald_ring.png",
  }
},

["emerald_necklace"] = {
  label = "Emerald Necklace",
  weight = 200,
  stack = true,
  close = false,
  description = "",
  client = {
   image = "emerald_necklace.png",
  }
},

["emerald_earring"] = {
  label = "Emerald Earring",
  weight = 200,
  stack = true,
  close = false,
  description = "",
  client = {
   image = "emerald_earring.png",
  }
},
      
 ["x_device"] = {
  label = "Flapper Hero",
  weight = 125,
  stack = false,
  close = false,
  description = "?????????",
  client = {
    image = "x_device.png",
  }
 },
   
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

  ["box_of_jewelry"] = {
  label = "Box of jewelry",
  weight = 2500,
  stack = false,
  close = false,
  description = "?????????",
  client = {
   image = "box_of_jewelry.png",
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
  ["x_fingerprintbag"] = {
  label = "Fingerprint Bag",
  weight = 125,
  stack = false,
  close = false,
  description = "?????????",
  client = {
   image = "x_fingerprintbag.png",
  }
 },
   ["x_fingerprinttape"] = {
  label = "Fingerprint Tape",
  weight = 125,
  stack = false,
  close = false,
  description = "?????????",
  client = {
   image = "x_fingerprinttape.png",
  }
 },
   ["mxckey"] = {
  label = "MXC Key",
  weight = 125,
  stack = false,
  close = false,
  description = "?????????",
  client = {
   image = "mxckey.png",
  }
 },
 ["giant_gem_green"] = {
  label = "Giant Green Gem",
  weight = 2500,
  stack = false,
  close = false,
  description = "",
  client = {
   image = "giant_gem_green.png",
  }
},
 ["gem_necklace"] = {
  label = "Gem Necklace",
  weight = 2500,
  stack = false,
  close = false,
  description = "",
  client = {
   image = "gem_necklace.png",
  }
},
 ["x_panther_gem"] = {
  label = "Panther Gem",
  weight = 2500,
  stack = false,
  close = false,
  description = "",
  client = {
   image = "x_panther_gem.png",
  }
},
```
