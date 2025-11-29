Config = Config or {}
Loc = {}

-- //////////////////////////////////////////////////
-- ///////////////// Our Discord ////////////////////
-- //////// https://discord.gg/bJNxYDAm5u ///////////
-- //////////////////////////////////////////////////

Config = {
    debug = false, -- Shows polyzones created inside the game
    Lan = 'en', -- Translation, 'en' 'pl' 'de' 'da' 'fr' 'in' 'am' 'ph' 'no' 'nl' 'ja' 'da' 'ru' 'gr' 'se' 'lt' 'ar' 'bg' 'bs', 'cn', 'cs', 'ee', 'el', 'en', 'es', 'et', 'fa', 'fi', 'ge', 'he', 'hu', 'id', 'is', 'it', 'lv', 'pt', 'pt-br', 'ro', 'rs', 'sl', 'sv', 'th', 'tr', 'vn'
    Framework = 'qbox', -- 'qb' 'qbox' 'esx' or "custom" if you put it as "custom", you will need to edit the functions in opensource/client.lua and opensource/server.lua
    ESX = "new", -- (only for ESX users) "new" or "old" chosoe the version of ESX you are using
    Inventory = "ox", -- "ox" or "qs" or "qb" or "origen" or "tgiann" or "esx" or "lj" or "ps", or "custom" if you put it as "custom", you will need to edit the inventory functions in opensource/client.lua and opensource/server.lua
    Notification = "ox", -- "ox" or "qb" or "esx" or "custom" if you put it as "custom", you will need to edit the notification function in opensource/client.lua and opensource/server.lua
    Progressbar = "ox", -- "ox" or "qb" or "custom" if you put it as "custom", you will need to edit the progressbar function in opensource/client.lua
    ProgressbarType = "circle", -- "circle" or "bar" | ONLY USED FOR OX PROGRESSBAR
    Dispatch = {
        Resource = 'cd', -- "ps" "cd" "qs" "origen" "tk" "codem" "rcore" "l2s" "redutzu" "lb" "sonoran" or "outlaw" or "custom", if you put it as "custom", you will need to edit the dispatch function in opensource/client.lua
        -- If you wish to change the text on the dispatch you can do it here:
        Title = 'Suspicious Sale',
        Description = 'A Suspicious sale was made',
        Code = '10-69',

        Blip = {
            Text = 'Suspicious Sale',
            Color = 1,
            Sprite = 69,
            Scale = 0.8
        }
    },

    Interaction = 'ox_target', -- ox_target, qb-target, drawtext, worldinteract (worldinteract requires https://github.com/darktrovx/interact)

    DrawtextButton = 38, -- [E] by default
    Drawtext = "OX", -- OLDQB for old qb-drawtext, QB for new qbcore drawtext, OX for ox_lib
    DrawTextZoneSize = vec3(1.4, 1.4, 2), -- Size of the drawtext zone
    DrawTextRotation = 70.0, -- Rotation of the drawtext zone

    CurrencySymbol = '$', -- Currency Symbol, you can change it to any symbol you want.
    InventoryPath = 'auto', -- Inventory Path, change it to you inventory path for images. auto by default
    PoliceJobs = {["police"] = true}, -- Jobs that receive the dispatch and are checked for their count if you want to add more follow this example: PoliceJobs = {["police"] = true, ["fbi"] = true, ["swat"] = true}
    UseXP = false, -- If you want to use XP system, set this to true, otherwise set it to false
    ClientSideXP = false, -- If you want to use the client side XP system, set this to true, otherwise set it to false and it will use the server side XP system

    ProgressbarConfig = {
        Enable = true, -- If you want to use a progress bar, set this to true, otherwise set it to false and it will not use a progress bar
        Duration = 2000, -- Duration of the progress bar in milliseconds
        Text = 'Selling...', -- Text of the progress bar
        Animation = {
            Enable = true, -- If you want to use an animation, set this to true, otherwise set it to false and it will not use an animation
            NPCSync = true, -- If you want to make the npc play the emote aswell set this to true, otherwise set it to false and only the player will do the animation.
            Dict = 'mp_common', -- Animation dict
            Anim = 'givetake1_b', -- Animation name
        }
    },

    Shops = {
        ['pawnshop'] = {
            -- Menu/Target Options
            ["MenuTitle"] = 'Pawnshop', -- Menu Title. title on the sell menu
            ["TargetIcon"] = 'fas fa-dollar-sign', -- Target Icon, you can use any icon from fontawesome
            ["TargetText"] = 'Sell Products', -- Target/TextUI Text
            ["TargetSize"] = 1.5, -- Target Size
            ["TargetDistance"] = 1.0, -- Target Distance
            ["OnlyShowItemsInInventory"] = false, -- true = Show only the items that the player has in his inventory, false show all items on this shop

            ["Coords"] = vec4(412.15, 315.22, 102.13, 210.65), -- Coords of the ped or target

            ["Ped"] = {
                Enable = false, -- If you want to use a ped, set this to true, otherwise set it to false and it will use only target/drawtext
                Model = `a_m_m_business_01`,
                ["IdleAnimation"] = {
                    AnimationType = "animation", -- "animation" or "scenario" or "none"

                    Animation = { -- Animation, you can use a scenario or an animation (https://forge.plebmasters.de/animations?ped=A_F_Y_Beach_01)
                        dict = "amb@world_human_leaning@female@wall@back@hand_up@idle_a",
                        anim = "idle_a"
                    },
                    Scenario = 'WORLD_HUMAN_CLIPBOARD', -- Use this if you want a scenario instead of an animation (https://github.com/DioneB/gtav-scenarios)
                },
                ["SuccessfulAnimation"] = { -- Player Successful Animation, you can use a scenario or an animation
                    AnimationType = "animation", -- "animation" or "scenario" or "none"

                    Animation = { -- Animation, you can use a scenario or an animation (forge.plebmasters.de/animations?ped=A_F_Y_Beach_01)
                        dict = 'mp_common',
                        anim = 'givetake1_b'
                    },
                    Scenario = 'WORLD_HUMAN_CLIPBOARD', -- Use this if you want a scenario instead of an animation (https://github.com/DioneB/gtav-scenarios)
                    Duration = 2,
                    AdvancedAnimation = false,
                },
                ["PedSuccessfulAnimation"] = { -- Ped/Npc Successful Animation, you can use a scenario or an animation
                    AnimationType = "animation", -- "animation" or "scenario" or "none"

                    Animation = { -- Animation, you can use a scenario or an animation (forge.plebmasters.de/animations?ped=A_F_Y_Beach_01)
                        dict = 'mp_common',
                        anim = 'givetake1_b'
                    },
                    Scenario = 'WORLD_HUMAN_CLIPBOARD', -- Use this if you want a scenario instead of an animation (https://github.com/DioneB/gtav-scenarios)
                },
            },

            ["TimeFrame"] = {
                Enable = true, -- If you want to use a time frame, set this to true, otherwise set it to false and it will be open 24/7
                Time = {open = 9, close = 22}, -- Time frame when the shop is open, if the shop is closed the player will get a notification when interacting.
            },
            
            ["PoliceCount"] = 0, -- Minimum police online to access the shop

            ["Blip"] = {
                Enable = true, -- If you want to use a blip, set this to true
                Text = "Pawnshop", -- Blip text
                Sprite = 605, -- Blip icon, https://docs.fivem.net/docs/game-references/blips/
                Color = 0, -- Blip color, https://docs.fivem.net/docs/game-references/blips/#blip-colors
                Scale = 0.8
            },

            ["Items"] = {
                ['goldbar'] = { -- The "spawn" name of the item
                    Label = "Gold Bar", -- The name that will show on the menu
                    Price = 10000, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = true, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['md_silverring'] = { -- The "spawn" name of the item
                    Label = 'Silver Ring', -- The name that will show on the menu
                    Price = 3000, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['md_goldring'] = { -- The "spawn" name of the item
                    Label = 'Gold Ring', -- The name that will show on the menu
                    Price = 5000, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['md_diamondearings'] = { -- The "spawn" name of the item
                    Label = 'Diamond Earings', -- The name that will show on the menu
                    Price = 7000, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['md_goldearings'] = { -- The "spawn" name of the item
                    Label = 'Gold Earings', -- The name that will show on the menu
                    Price = 5000, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['md_goldnecklace'] = { -- The "spawn" name of the item
                    Label = 'Gold Necklace', -- The name that will show on the menu
                    Price = 12000, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['md_diamondnecklace'] = { -- The "spawn" name of the item
                    Label = 'Diamond Necklace', -- The name that will show on the menu
                    Price = 15000, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['rolex'] = { -- The "spawn" name of the item
                    Label = 'Golden Watch', -- The name that will show on the menu
                    Price = 3500, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['goldchain'] = { -- The "spawn" name of the item
                    Label = 'Golden Chain', -- The name that will show on the menu
                    Price = 2750, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['10kgoldchain'] = { -- The "spawn" name of the item
                    Label = '10k Gold Chain', -- The name that will show on the menu
                    Price = 3250, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['goldcoin'] = { -- The "spawn" name of the item
                    Label = 'Gold Coin', -- The name that will show on the menu
                    Price = 1500, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['antiquecoin'] = { -- The "spawn" name of the item
                    Label = 'Antique Coin', -- The name that will show on the menu
                    Price = 1000, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['diamond'] = { -- The "spawn" name of the item
                    Label = 'Diamond', -- The name that will show on the menu
                    Price = 1000, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                 ['diamond_ring'] = { -- The "spawn" name of the item
                    Label = 'Diamond Ring', -- The name that will show on the menu
                    Price = 1500, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['pocketwatch'] = { -- The "spawn" name of the item
                    Label = 'Pocket Watch', -- The name that will show on the menu
                    Price = 750, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['tv'] = { -- The "spawn" name of the item
                    Label = 'Television', -- The name that will show on the menu
                    Price = 2500, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['microwave'] = { -- The "spawn" name of the item
                    Label = 'Microwave', -- The name that will show on the menu
                    Price = 1500, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['monitor'] = { -- The "spawn" name of the item
                    Label = 'Monitor', -- The name that will show on the menu
                    Price = 2000, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['printer'] = { -- The "spawn" name of the item
                    Label = 'Printer', -- The name that will show on the menu
                    Price = 500, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['flat_tv'] = { -- The "spawn" name of the item
                    Label = 'Flat Screen TV', -- The name that will show on the menu
                    Price = 3000, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['old_tv'] = { -- The "spawn" name of the item
                    Label = 'Old TV', -- The name that will show on the menu
                    Price = 2000, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['dj_deck'] = { -- The "spawn" name of the item
                    Label = 'DJ Deck', -- The name that will show on the menu
                    Price = 1500, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['console'] = { -- The "spawn" name of the item
                    Label = 'Console', -- The name that will show on the menu
                    Price = 750, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['samsungphone'] = { -- The "spawn" name of the item
                    Label = 'Samsung S10', -- The name that will show on the menu
                    Price = 250, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['iphone'] = { -- The "spawn" name of the item
                    Label = 'I phone', -- The name that will show on the menu
                    Price = 350, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['brokengameboy'] = { -- The "spawn" name of the item
                    Label = 'Broken GameBoy', -- The name that will show on the menu
                    Price = 100, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['fitbit'] = { -- The "spawn" name of the item
                    Label = 'Fitbit', -- The name that will show on the menu
                    Price = 100, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },

                ['x_artpiece'] = { -- The "spawn" name of the item
                    Label = 'Art Piece', -- The name that will show on the menu
                    Price = 1500, -- The price that the item will be sold for

                    ["DisableMoney"] = false, -- If you set this to true, only the item specified in ["ItemReward"] will be given

                    ["ItemReward"] = { -- you can delete this table if you don't want to use it
                        Enable = false, -- If you want to give the player an item as a reward, set this to true, otherwise set it to false and it will only give money
                        Item = "pawnshopcoin", -- The item that will be given to the player.
                        Amount = 1, -- Amount of the item to give (per item sold, sold * amount)
                    },
                },
            },

            ["BulkSale"] = {  -- you can also delete this table if you don't want to use it
                Enable = true, -- Enable or disable bulk sale
                BulkAmount = 20, -- Amount of items that people need to sell
                ExtraCash = 3, -- (%) Percentage of extra cash gained from selling in bulk
            },
        },
        
    }
}

if Config.InventoryPath == "" or Config.InventoryPath == 'auto' then
    if GetResourceState('ox_inventory') == 'started' then
        Config.InventoryPath = 'ox_inventory/web/images/'
    elseif GetResourceState('qs-inventory') == 'started' then
        Config.InventoryPath = 'qs-inventory/html/images/'
    elseif GetResourceState('qb-inventory') == 'started' then
        Config.InventoryPath = 'qb-inventory/html/images/'
    elseif GetResourceState('ps-inventory') == 'started' then
        Config.InventoryPath = 'ps-inventory/html/images/'
    elseif GetResourceState('lj-inventory') == 'started' then
        Config.InventoryPath = 'lj-inventory/html/images/'
    elseif GetResourceState('tgiann-inventory') == 'started' then
        Config.InventoryPath = 'inventory_images/images/'
    elseif GetResourceState('origen_inventory') == 'started' then
        Config.InventoryPath = 'origen_inventory/html/img/'
    elseif GetResourceState('codem-inventory') == 'started' then
        Config.InventoryPath = 'codem-inventory/html/itemimages/'
    else
        print('^1[Config.InventoryPath] You have auto detection on for inventory images, but your inventory is not started or supported by default. Please check your configuration and set the path manually.^7')
    end
end

function LoadPreset(name, data)
    if name == "example" then return end
    if IsDuplicityVersion() then
        if Config.Shops[name] then
            lib.print.warn(string.format('Shop "%s" already exists in Config.Shops. Overwriting it...', name))
        else
            lib.print.info(string.format('Shop "%s" has been added via a preset.', name))
        end
    end

    Config.Shops[name] = data
end