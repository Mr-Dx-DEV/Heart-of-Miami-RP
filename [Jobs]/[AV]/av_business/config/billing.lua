Config = Config or {}
Config.BillingCommand = "billing" -- Open the user panel where player can see all his bills and pay them or false to open it from your own menu/script
Config.BillingDistance = 20.0 -- Distance between the customer and the employee, we don't want players sending invoices to random ppl all around the map...
Config.MaxDaysLimit = 5 -- After X days, the amount will be automatically deducted from the player's bank account
Config.RemovePaid = 3 -- Remove paid invoices after X days, we don't want the DB to be full or unused data
Config.AvailableAccounts = { -- Available payment options for player, the canUse function is server side NOT client
    {value = "bank", label = "Bank Account", canUse = function(source) return true end},
    {value = "cash", label = "Cash", canUse = function(source) return true end}, -- change value to money if using ESX
    {value = "society", label = "Society Funds", canUse = function(source) return exports['av_laptop']:isBoss(source) end},
}