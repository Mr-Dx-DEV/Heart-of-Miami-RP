local Core              = GetCoreObject() -- framwork
local current_inventory = Config.inventory
local Player            = {}

function Player.GetObject(source)
    return Core.Functions.GetPlayer(source)
end

function Player.GetObjectByIdentifier(Identifier)
    return Core.Functions.GetPlayerByCitizenId(Identifier)
end

local get_name_query = 'SELECT JSON_EXTRACT(charinfo,"$.firstname","$.lastname") as name FROM `players` WHERE citizenid = ?'
function Player.GetName(Identifier)
    local res = MySQL.Sync.fetchAll(get_name_query, { Identifier })
    res = res[1]
    if not res then return nil end
    res = json.decode(res['name'])
    return res[1] .. ' ' .. res[2]
end

function Player.GetJob(PlayerObject)
    -- name, grade
    return PlayerObject.PlayerData.job.name, PlayerObject.PlayerData.job.grade.level
end

function Player.GetGang(PlayerObject)
    -- name, grade
    return PlayerObject.PlayerData.gang.name, PlayerObject.PlayerData.gang.grade.level
end

function Player.GetSource(PlayerObject)
    return PlayerObject.PlayerData.source
end

local function init_give_item()
    if current_inventory == 'ox_inventory' then
        return function(source, PlayerObject, item_name, amount, slot, info, success, fail, hideItemBox)
            exports.ox_inventory:AddItem(source, item_name, amount, info, slot, function(res)
                if res then
                    if success then
                        success()
                    end
                else
                    if fail then
                        fail()
                    end
                end
            end)
        end
    elseif current_inventory == 'qb-inventory' or current_inventory == 'qb-inventory-legacy' or current_inventory == 'ps-inventory' then
        return function(source, PlayerObject, item_name, amount, slot, info, success, fail, hideItemBox)
            local res = PlayerObject.Functions.AddItem(item_name, amount, slot, info)
            if res and (hideItemBox == nil or hideItemBox and hideItemBox == false) then
                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item_name], "add")
            end
            if res and success then
                success()
            elseif not res and fail then
                fail()
            end
        end
    else
        return function() end -- Default case
    end
end

local giveItem = init_give_item()

function Player.GiveItem(source, PlayerObject, item_name, amount, slot, info, success, fail, hideItemBox)
    giveItem(source, PlayerObject, item_name, amount, slot, info, success, fail, hideItemBox)
end

local function init_remove_item()
    if current_inventory == 'ox_inventory' then
        return function(source, PlayerObject, item_name, amount, slot, metadata)
            return exports.ox_inventory:RemoveItem(source, item_name, amount, metadata or nil, slot)
        end
    elseif current_inventory == 'qb-inventory' or current_inventory == 'qb-inventory-legacy' or current_inventory == 'ps-inventory' then
        return function(source, PlayerObject, item_name, amount, slot, metadata)
            local res = PlayerObject.Functions.RemoveItem(item_name, amount, slot)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item_name], "remove")
            return res
        end
    else
        return function() end -- Default case
    end
end

local removeItem = init_remove_item()

function Player.RemoveItem(source, PlayerObject, item_name, amount, slot, metadata)
    return removeItem(source, PlayerObject, item_name, amount, slot, metadata)
end

function Player.GiveMoney(PlayerObject, method, amount)
    return PlayerObject.Functions.AddMoney(method, amount)
end

function Player.TakeMoney(PlayerObject, method, amount)
    return PlayerObject.Functions.RemoveMoney(method, amount)
end

local function init_searchItemByName()
    if current_inventory == 'ox_inventory' then
        return function(PlayerObject, item_name)
            local source = Player.GetSource(PlayerObject)
            return exports['ox_inventory']:Search(source, 1, item_name)
        end
    elseif current_inventory == 'qb-inventory' or current_inventory == 'qb-inventory-legacy' or current_inventory == 'ps-inventory' then
        return function(PlayerObject, item_name)
            return PlayerObject.Functions.GetItemsByName(item_name)
        end
    else
        return function() end -- Default case
    end
end

Player.SearchItemByName = init_searchItemByName()

function Player.GetIdentifier(PlayerOrSource, account_bound_type)
    local _type = type(PlayerOrSource)
    if account_bound_type then
        local source = PlayerOrSource
        return 'something'
    end
    if _type == "number" then
        local source = PlayerOrSource
        local player = Player.GetObject(source)
        return player.PlayerData.citizenid
    elseif _type == 'table' then
        local player = PlayerOrSource
        return player.PlayerData.citizenid
    end
    return false
end

function Player.Money(PlayerObject, method)
    return PlayerObject.PlayerData.money[method]
end

return {
    Player = Player,
}
