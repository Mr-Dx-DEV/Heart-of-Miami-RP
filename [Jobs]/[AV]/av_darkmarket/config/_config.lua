-- READ THE DOCS BEFORE USING THIS SCRIPT: https://docs.av-scripts.com/
Config = {}
Config.Debug = false
Config.RefreshItems = 60 -- Every X minutes, server will refresh the item list and show possible new items based in probability, false to disable it (Config.RandomizeItems = false)
Config.App = {
    name = "darkmarket",
    label = "Dark Market", -- You can rename the app by editing this field
    isEnabled = function(serial)
        return true
    end
}
Config.MoneyAccounts = { -- Money accounts used to buy items
    {name = "cosmo", label = "Cosmo", icon = "fa-brands fa-ethereum"},
    {name = "bank", label = "Bank", icon = "fa-solid fa-wallet"},
}

--[[
    This is an example of the fields that each item should contain:
    
    probability = Chance (0-100%) for the item to be available in market.
    {
        name = "drug_package", -- item name
        label = "Drug Ingredients", -- item label
        metadata = {purity = "100%", strain = "AV Scripts"}, -- If u don't want metadata just leave it empty: metadata = {}
        stock = 5, -- stock per server restart
        price = 1, -- price
        account = "cosmo", -- account used for purchase 
        accountLabel = "Cosmo", -- account label for UI
        probability = 100, -- From 0 to 100%, prob from getting the item added to the shop in every refresh
        image? = "url.png" -- or false, image url just in case u don't want to use the one from your inventory path
        extension? = "webp"-- or false, the image file extension, just in case you have a mix between png and webp images in your inv, png is used by default
    },
]]

Config.Categories = {
    ['hacker'] = { 
        label = "Hacker", -- category label, how the player will see it in laptop
        canAccess = function() -- do a client side check here, true/false if the player can access the category
            if exports['av_laptop']:getJob().name == "police" then
                return false
            end
            return true
        end,
        items = {
            {name = "dongle", label = "Dongle", metadata = {}, stock = 5, price = 50, account = "gne", accountLabel = "GNE", probability = 100, image = "https://files.fivemerr.com/images/ab1a931c-03b5-4c92-81db-45607a7231fc.webp"},
            {name = "hacking_device", label = "Hacking Device", metadata = {}, stock = 5, price = 100, account = "cosmo", accountLabel = "Cosmo", probability = 100},
            {name = "water_bottle", label = "Water", metadata = {}, stock = 5, price = 100, account = "cosmo", accountLabel = "Cosmo", probability = 100, extension = "webp"},
        }
    }, 
    ["drugs"] = { 
        label = "Drugs", -- category label, how the player will see it in laptop
        canAccess = function() -- do a client side check here, true/false if the player can access the category
            if exports['av_laptop']:getJob().name == "police" then
                return false
            end
            if GetResourceState('av_gangs') ~= "started" then
                return false
            end
            local gang = exports['av_gangs']:getGang()
            if gang and gang['name'] then -- If is member of any gang can access
                return true
            end
            return false
        end,
        items = {
            {name = "water_bottle", label = "Water", metadata = {}, stock = 5, price = 1, account = "cosmo", accountLabel = "Cosmo", probability = 100},
        }
    },
    ["weapons"] = { 
        label = "Weapons", -- category label, how the player will see it in laptop
        canAccess = function() -- do a client side check here, true/false if the player can access the category
            if exports['av_laptop']:getJob().name == "police" then
                return false
            end
            if GetResourceState('av_gangs') ~= "started" then
                return false
            end
            local gang = exports['av_gangs']:getGang()
            if gang and gang['name'] == "ballas" then -- If is member of Ballas gang can access
                return true
            end
            return false
        end,
        items = {
            {name = "weapon_pistol", label = "Pistol", metadata = {}, stock = 5, price = 5000, account = "cosmo", accountLabel = "Cosmo", probability = 100},
        }
    },
}