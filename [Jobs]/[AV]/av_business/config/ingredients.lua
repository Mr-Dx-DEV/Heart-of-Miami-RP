Config = Config or {}
-- Supplies general settings
Config.SuppliesBlip = {
    sprite = 478,
    color = 3,
    label = "Supplies"
}
Config.SuppliesLocations = {
    {model = `mp_m_shopkeep_01`, x = 526.1072, y = -1655.1650, z = 29.3594, heading = 47.4738},
    {model = `mp_m_shopkeep_01`, x = 92.3224, y = 6359.4932, z = 31.3759, heading = 21.1605},
}
Config.SuppliesStash = { -- Stash used to pickup ingredients after purchase
    prefix = "supplies", -- stash name prefix / supplies stash is a mix of prefix + job name (e.g. suppliesuwucafe, suppliespolice, suppliesburgershot)
    label = "Supplies",
    slots = 100,
    weight = 100000
}
Config.MaxSupplies = 100 -- Max amount of items player can buy from the same ingredient
Config.MinIngredients = 3   -- Min ingredients needed to register a new item
Config.MaxIngredients = 5   -- max ingredients u can select when u register an item

-- Ingredients Config
Config.Ingredients = {  -- You need to register this items in your Framework/Inventory, this ones are just EXAMPLES
    -- value:string = item name (exactly how is named in your inventory/framework)
    -- label:string = item label 
    -- jobs:<table | false> = table with allowed jobs to use this ingredient or false to make it available for everyone
    -- type:string[] = table with ItemTypes, this needs to be a table
    -- price:<number | false> = used for Supplies tab / if no price is set, will be ignored
    -- For ingredient effects please check config/effects.lua

    { value = "water", label = "Water", jobs = { "uwucafe", "burgershot" }, type = {"drink"}, price = 1 },
    { value = "sugar", label = "Sugar", jobs = { "uwucafe", "burgershot" }, type = {"drink", "food"}, price = 1 },
    { value = "chocolate", label = "Chocolate", jobs = false, type = {"drink", "food"}, price = 1 },
    { value = "milk", label = "Milk", jobs = false, type = {"drink", "food"}, price = 1 },
    { value = "ice", label = "Ice", jobs = false, type = {"drink"}, price = 1 },
}