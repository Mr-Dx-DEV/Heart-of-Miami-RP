Config = {}
Config.Locale = 'en' --html locale you can change at client/html/script.js
-- Only debug function
Config.Debug = false
Config.DebugLevel = {
    'CRITICAL',
    'ERROR',
}

-- Standalone = Framework.Standalone
-- ESX = Framework.ESX
-- QBCore = Framework.QBCore
Config.Framework = Framework.ESX

-- ox_inventory = Inventory.OX
-- es_extended = Inventory.ESX
-- qb-inventory = Inventory.QB
Config.Inventory = Inventory.OX

-- ox_mysql = Database.OX
-- ghmattimysql = Database.GHATTI
-- mysql-async = Database.MYSQLASYNC
Config.Database = Database.MYSQLASYNC

---IF YOU DONT USE OWN SOLUTION USE THIS (check server/framework/events.lua)
Config.RemoveAndReturnWeapon = true --Will remove weapons and add rented weapons, after leaving line it will return player guns
if Config.Inventory == Inventory.OX then
    --We use ox_inventory logic instead of gta
    Config.RemoveAndReturnWeapon = false
end

Config.DebugDraw = false
Config.DebugDrawOnlyShots = false
--
Config.Payment = 20 --Global payment price
--If you have different calls
--Rcore notification can be found at our discord free to download
Config.UseRcoreNotification = false --You have to install script rcore_notification first

--Marker setup
Config.NearObjectDistance = 50.0
Config.CheckPlayerPosition = 500

Config.InRadius = 0.3        --In marker radius
Config.RenderDistance = 25.0 --Marker render

--Do not change this if you dont know what are u doing
Config.DefaultBlipOptions = {
    scale = 1.0,
    shortRange = true,
    type = 4,
    color = 55,
}
Config.Offsets = {
    center = {
        x = 0,
        y = 0,
        z = 0.52
    },
    head = {
        x = 0,
        y = 0,
        z = 1.05
    }
}

--AmmoItemName can be found in ox_inventory/data/weapons.lua or qb-inventory/data/weapons.lua
local guns = { --You can use guns variable for all guns or you can setup specifically every target line
    {
        hash = 'WEAPON_PISTOL',
        label = 'Pistol 9mm',
        ammo = 30,
        ammoItemName = 'ammo-9', --for ox_inventory & qb-inventory
        rentPrice = 100,
    },
    {
        hash = 'WEAPON_MICROSMG',
        label = 'Micro SMG',
        ammo = 30,
        ammoItemName = 'ammo-45', --for ox_inventory & qb-inventory
        rentPrice = 300,
    },
}

Config.Gunranges = {
    { --!! MRPD
        blip = {
            pos = vector3(486.6824, -1001.8287, 30.6920),
            color = 27,
            sprite = 110,
            shortRange = true,
            name = 'Gunrange'
        },
        menu = {
            {
                valueIndex = 1,
                label = '<span style="font-size: 20px;">Distance 7m</span><div style="color:green;">Renting price: ' ..
                    Config.Payment .. '$</div>',
            },
        },
        targets = {
            [9] = {
                guns = guns,
                marker = {
                    type = 29,

                    scale = {
                        x = 0.5,
                        y = 0.5,
                        z = 0.5
                    },

                    color = {
                        r = 50,
                        g = 255,
                        b = 50,
                        a = 255
                    },

                    rotation = false,
                    faceCamera = false,
                    bobUpAndDown = false,

                    pos = vector3(484.5746, -1005.5339, 30.7099),
                },
                targets = {
                    { --Target menu index 1
                        pos = vector3(477.9978, -1005.5682, 30.6896),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 90.00,

                        -- if the shooting points dont go upwards/side ways
                        -- 1 = y, z are used
                        -- 2 = x, z are used
                        -- 3 = z, y are used as a render coords.
                        SwitchAxis = "1",

                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.08,

                        -- if you shoot lets say 7 on right side and it will
                        -- display it on left side. Switch one of these
                        -- Axis to true so it will correct the position of point.
                        ReverseAxisX = false,
                        ReverseAxisY = true,
                        ReverseAxisZ = false,
                    },
                }
            },
        }
    },

    {
        blip = {
            pos = vector3(827.09, -2163.81, 29.66),
            color = 27,
            sprite = 110,
            shortRange = true,
            name = 'Gunrange'
        },
        menu = {
            {
                valueIndex = 1,
                label = '<span style="font-size: 20px;">Distance 7m</span><div style="color:green;">Renting price: ' ..
                    Config.Payment .. '$</div>',
            },
            {
                valueIndex = 2,
                label = '<span style="font-size: 20px;">Distance 12m</span><div style="color:green;">Renting price: ' ..
                    Config.Payment .. '$</div>',
            },
            {
                valueIndex = 3,
                label = '<span style="font-size: 20px;">Distance 30m</span><div style="color:green;">Renting price: ' ..
                    Config.Payment .. '$</div>',
            },
        },
        targets = {
            [1] = {
                guns = guns,
                marker = {
                    type = 29,
                    color = {
                        r = 50,
                        g = 255,
                        b = 50,
                        a = 255
                    },
                    pos = vector3(827.09, -2163.81, 29.66),
                },
                targets = {
                    { --Target menu index 1
                        pos = vector3(827.02, -2171.33, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,

                        -- if the shooting points dont go upwards/side ways
                        -- 1 = y, z are used
                        -- 2 = x, z are used
                        -- 3 = z, y are used as a render coords.
                        SwitchAxis = "2",

                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        -- if you shoot lets say 7 on right side and it will
                        -- display it on left side. Switch one of these
                        -- Axis to true so it will correct the position of point.
                        ReverseAxisX = false,
                        ReverseAxisY = false,
                        ReverseAxisZ = false,
                    },
                    { --Target menu index 2
                        pos = vector3(827.02, -2180.53, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,

                        -- if the shooting points dont go upwards/side ways
                        -- 1 = y, z are used
                        -- 2 = x, z are used
                        -- 3 = z, y are used as a render coords.
                        SwitchAxis = "2",

                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        -- if you shoot lets say 7 on right side and it will
                        -- display it on left side. Switch one of these
                        -- Axis to true so it will correct the position of point.
                        ReverseAxisX = false,
                        ReverseAxisY = false,
                        ReverseAxisZ = false,
                    },
                    {
                        pos = vector3(827.08, -2191.66, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,

                        -- if the shooting points dont go upwards/side ways
                        -- 1 = y, z are used
                        -- 2 = x, z are used
                        -- 3 = z, y are used as a render coords.
                        SwitchAxis = "2",

                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        -- if you shoot lets say 7 on right side and it will
                        -- display it on left side. Switch one of these
                        -- Axis to true so it will correct the position of point.
                        ReverseAxisX = false,
                        ReverseAxisY = false,
                        ReverseAxisZ = false,
                    },
                }
            },
            [2] = {
                guns = guns,
                marker = {
                    type = 29,
                    color = {
                        r = 50,
                        g = 255,
                        b = 50,
                        a = 255
                    },
                    pos = vector3(826.09, -2163.81, 29.66)
                },
                targets = {
                    {
                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        pos = vector3(826.02, -2171.33, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,
                    },
                    {
                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        pos = vector3(826.02, -2180.53, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,
                    },
                    {
                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        pos = vector3(826.08, -2191.66, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,
                    },
                }
            },
            [3] = {
                guns = guns,
                marker = {
                    type = 29,
                    color = {
                        r = 50,
                        g = 255,
                        b = 50,
                        a = 255
                    },
                    pos = vector3(825.09, -2163.81, 29.66)
                },
                targets = {
                    {
                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        pos = vector3(825.02, -2171.33, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,
                    },
                    {
                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        pos = vector3(825.02, -2180.53, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,
                    },
                    {
                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        pos = vector3(825.08, -2191.66, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,
                    },
                }
            },
            [4] = {
                guns = guns,
                marker = {
                    type = 29,
                    color = {
                        r = 50,
                        g = 255,
                        b = 50,
                        a = 255
                    },
                    pos = vector3(824.09, -2163.81, 29.66)
                },
                targets = {
                    {
                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        pos = vector3(824.02, -2171.33, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,
                    },
                    {
                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        pos = vector3(824.02, -2180.53, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,
                    },
                    {
                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        pos = vector3(824.08, -2191.66, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,
                    },
                }
            },
            [5] = {
                guns = guns,
                marker = {
                    type = 29,
                    color = {
                        r = 50,
                        g = 255,
                        b = 50,
                        a = 255
                    },
                    pos = vector3(819.09, -2163.81, 29.66)
                },
                targets = {
                    {
                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        pos = vector3(819.02, -2171.33, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,
                    },
                    {
                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        pos = vector3(819.02, -2180.53, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,
                    },
                    {
                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        pos = vector3(819.08, -2191.66, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,
                    },
                }
            },
            [6] = {
                guns = guns,
                marker = {
                    type = 29,
                    color = {
                        r = 50,
                        g = 255,
                        b = 50,
                        a = 255
                    },
                    pos = vector3(818.09, -2163.81, 29.66)
                },
                targets = {
                    {
                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        pos = vector3(818.02, -2171.33, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,
                    },
                    {
                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        pos = vector3(818.02, -2180.53, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,
                    },
                    {
                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        pos = vector3(818.08, -2191.66, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,
                    },
                }
            },
            [7] = {
                guns = guns,
                marker = {
                    type = 29,
                    color = {
                        r = 50,
                        g = 255,
                        b = 50,
                        a = 255
                    },
                    pos = vector3(817.09, -2163.81, 29.66)
                },
                targets = {
                    {
                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        pos = vector3(817.02, -2171.33, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,
                    },
                    {
                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        pos = vector3(817.02, -2180.53, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,
                    },
                    {
                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        pos = vector3(817.08, -2191.66, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,
                    },
                }
            },
            [8] = {
                guns = guns,
                marker = {
                    type = 29,
                    color = {
                        r = 50,
                        g = 255,
                        b = 50,
                        a = 255
                    },
                    pos = vector3(816.09, -2163.81, 29.66)
                },
                targets = {
                    {
                        pos = vector3(816.02, -2171.33, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,

                        -- if the shooting points dont go upwards/side ways
                        -- make it true.
                        SwitchAxis = false,

                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        -- if you shoot lets say 7 on right side and it will
                        -- display it on left side. Switch one of these
                        -- Axis to true so it will correct the position of point.
                        ReverseAxisX = false,
                        ReverseAxisY = false,
                        ReverseAxisZ = false,
                    },
                    {
                        pos = vector3(816.02, -2180.53, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,

                        -- if the shooting points dont go upwards/side ways
                        -- make it true.
                        SwitchAxis = false,

                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        -- if you shoot lets say 7 on right side and it will
                        -- display it on left side. Switch one of these
                        -- Axis to true so it will correct the position of point.
                        ReverseAxisX = false,
                        ReverseAxisY = false,
                        ReverseAxisZ = false,
                    },
                    {
                        pos = vector3(816.08, -2191.66, 29.67),
                        model = GetHashKey('prop_range_target_01'),
                        heading = 7.36,

                        -- if the shooting points dont go upwards/side ways
                        -- make it true.
                        SwitchAxis = false,

                        -- if the position of point need correction. Make it here
                        VectorXoffset = 0.0,
                        VectorYoffset = -0.07,

                        -- if you shoot lets say 7 on right side and it will
                        -- display it on left side. Switch one of these
                        -- Axis to true so it will correct the position of point.
                        ReverseAxisX = false,
                        ReverseAxisY = false,
                        ReverseAxisZ = false,
                    },
                }
            }
        }
    }
}
