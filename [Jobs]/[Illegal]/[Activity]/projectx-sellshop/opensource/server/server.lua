if Config.Framework == 'esx' then
    ESX = exports["es_extended"]:getSharedObject()
end
if Config.Framework == 'qb' then
    QBCore = exports['qb-core']:GetCoreObject()
end
if Config.Framework == 'qbox' then
    Qbox = exports.qbx_core
end

-- Inventory Functions
if Config.Inventory == 'custom' then
    --- @param source number The source id.
    --- @param item string The item name.
    --- @param addRemove string Either 'add' or 'remove' to indicate action.
    --- @param amount number The amount of the item.
    -- ItemBox Function
    function ItemBox(source, item, addRemove, amount)
        -- Your custom itembox function
    end

    --- @param source number The source id.
    --- @param item string The item name.
    --- @param amount number The quantity to add.
    --- @param info table Metadata.
    -- AddItem Function
    function AddItem(source, item, amount, info)
        -- Your custom inventory additem function
    end

    --- @param source number The source id.
    --- @param item string The item name.
    --- @param amount number The quantity to remove.
    -- RemoveItem Function
    function RemoveItem(source, item, amount)
        -- Your custom inventory removeitem function
    end
end

-- Server SIde Notification System
if Config.Notification == 'custom' then
    --- @param source number The source id.
    --- @param notification string The notification text.
    --- @param notificationType string The type of notification (e.g., 'success', 'error').
    --- @param duration number The duration in milliseconds.
    function NotificationServer(source, notification, notificationType, duration)
        -- Your custom notification system
    end
end

-- AddMoney Function
if Config.Framework == 'custom' then
    --- @param source number The source id.
    --- @param amount number The amount to add.
    function AddMoney(source, amount)
        -- Your custom addmoney function
    end
end

if Logs.Service and Logs.Service == 'custom' then
    --- @param title string The title of the logged event
    --- @param msg string The content of the logged event
    function CustomLog(title, msg)
        -- Your custom logging function
    end
end

--- Adds XP to the player.
--- @param source number The source id.
--- @param shop string The shop name.
--- @param item string The item name.
--- @param itemamount number The amount of the item.
function AddExp(source, shop, item, exp)
    if Config.ClientSideXP then
        TriggerClientEvent('projectx-sellshop:client:AddExp', source, shop, item, exp)
    else
        -- Your custom server-side XP function (Configured by default with pickle_xp)
        if GetResourceState('pickle_xp') == 'started' then
            exports['pickle_xp']:AddPlayerXP(source, "selling", exp)
        end
    end
end
