-- Make sure to follow the laptop installation steps before using this or any other laptop app:
-- Make sure to follow the laptop installation steps before using this or any other laptop app:
-- https://docs.av-scripts.com/laptop-pack/av-laptop/installation

Config = {}
Config.Debug = false -- Used to show some prints in client and server console
Config.ZonesDebug = false -- It will show the zones debug
Config.Target = exports['av_laptop']:getTarget() -- No need to modify this, do it from av_laptop/config directly
Config.Command = "admin:business"  -- Used to open the admin menu
Config.AdminLevel = {"group.admin", "group.god"} -- Permission level needed to use admin command
Config.BankLogs = 5 -- Logs from bank tab will be deleted after X days to reduce memory load
Config.Applications = 5 -- Job applications will be deleted after X days to reduce memory load
Config.MaxQuestions = 3 -- Max questions per application form
-- If true, the boss can fire itself, if the player is just messing around and loses the job u will need to give it back manually
Config.BossCanEditItself = false
Config.BankAccount = 'bank' -- Used for deposit/withdraw and receive bonus payments
Config.UnemployedJobName = "unemployed" -- If a player gets fired he will get this job

Config.App = {
    name = "business",
    label = "Business", -- You can rename the app by editing this field
    isEnabled = function(serial)
        local job = exports['av_laptop']:getJob()
        if (job and job.name) and not Config.BlacklistedJobs[job.name] then
            return true
        end
        return false
    end
}

Config.BlacklistedJobs = { -- jobs from this list won't be able to access the business app
    ["unemployed"] = true,
    ["slaughterer"] = true,
    ["fisherman"] = true,
    ["miner"] = true,
    ["lumberjack"] = true,
    ["fueler"] = true,
    ["reporter"] = true,
    ["tailor"] = true,
}

Config.NoCustomItems = { -- This jobs won't be able to access Product tab and register new items
    ['police'] = true,
    ['ambulance'] = true,
    ['taxi'] = true,
    ['mechanic'] = true,
}

Config.UseSupplies = true -- or false if you don't want to use the supplies tab
Config.NoSuppliesTab = { -- This jobs won't be able to access Supplies tab and buy items
    ['police'] = true,
    ['ambulance'] = true,
    ['taxi'] = true,
    ['mechanic'] = true, 
}

-- Use this to block specific jobs from accessing Deliveries tab
Config.NoDeliveriesTab = {
    ['police'] = true,
    ['ambulance'] = true,
    ['taxi'] = true,
    ['mechanic'] = true,
}

Config.PosterJobs = { -- A table with all the jobs that can access the Poster tab in Business APP // they still need the poster zone available
    ['uwucafe'] = true,
    ['burgershot'] = true,
}

-- For Logs and custom logs tutorial please check: https://docs.av-scripts.com/laptop-pack-v3/av-business/config-options/logs
Config.Logs = { -- This is shown in the settings tab in business app, value needs to match the key index from events.lua and jobs can be false or a table with allowed jobs to use this logs
    { value = "applications", label = "Applications",  description = "Receive an alert when a new application is submitted to your business.", jobs = false },
    { value = "cashier",      label = "Cashier",       description = "Receive an alert when someone pays at the cashiers.", jobs = false },
    { value = "rate",         label = "Rating",        description = "Receive an alert when someone rates your business.", jobs = false },
    { value = "duty",         label = "Duty",          description = "Receive an alert when your STAFF enters/leaves duty.", jobs = false },
    { value = "employee",     label = "Employees",     description = "Receive an alert when an employee gets modified.", jobs = false },
    { value = "bank",         label = "Bank Logs",     description = "Receive an alert when someone makes a deposit/withdraw.", jobs = false },
    { value = "items",        label = "Items",         description = "Receive an alert when someone add/edit/delete an item from your business.", jobs = false },
    { value = "poster",       label = "Posters",       description = "Receive an alert when someone edits the business poster.", jobs = false },
    { value = "supplies",     label = "Supplies",      description = "Receive an alert when someone buys supplies for the business.", jobs = false },
--    { value = "custom_log",   label = "Custom Log",    description = "Only the jobs from the jobs table can access this log.", jobs = {"police", "ambulance"} },
}

function dbug(...)
    if Config.Debug then print ('^3[DEBUG]^7', ...) end
end

function warn(...)
    print ('^1[WARNING]^7', ...)
end