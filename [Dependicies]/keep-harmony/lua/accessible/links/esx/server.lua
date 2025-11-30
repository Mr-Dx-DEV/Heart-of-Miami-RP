local framework         = Framework()
local ESX               = GetCoreObject() -- framwork
local current_inventory = Config.inventory
local MySQL             = MySQL
local ox_inventory      = exports.ox_inventory
local Player            = {}

function Player.GetObject(source)
    return ESX.GetPlayerFromId(source)
end

function Player.GetObjectByIdentifier(Identifier)
    return ESX.GetPlayerFromIdentifier(Identifier)
end

function Player.GetName(Identifier)
    local query = 'SELECT CONCAT(firstname," ", lastname) AS name FROM `users` WHERE identifier = ?'
    return MySQL.Sync.fetchScalar(query, {
        Identifier
    })
end

function Player.GetJob(PlayerObject)
    -- name, grade
    local job = PlayerObject.getJob()
    return job.name, job.grade
end

function Player.GetGang(PlayerObject)
    -- esx doesn't have gang by default
    return "none", "none"
end

function Player.GetSource(PlayerObject)
    return PlayerObject.source
end

function Player.GiveItem(source, PlayerObject, item_name, amount, slot, info, success, fail)
    ox_inventory:AddItem(source, item_name, amount, info, slot, function(res)
        if res and success then
            success()
        end
        if not res and fail then
            fail()
        end
    end)
end

function Player.RemoveItem(source, PlayerObject, item_name, amount, slot, metadata)
    return ox_inventory:RemoveItem(source, item_name, amount, metadata or nil, slot)
end

function Player.GiveMoney(PlayerObject, method, amount)
    amount = tonumber(amount)

    if method == 'cash' then
        return PlayerObject.addMoney(amount)
    elseif method == 'bank' then
        return PlayerObject.addAccountMoney('bank', amount)
    end
end

function Player.TakeMoney(PlayerObject, method, amount)
    amount = tonumber(amount)

    if method == 'cash' then
        local money = PlayerObject.getMoney()
        if money >= amount then
            PlayerObject.removeMoney(amount)
            return true
        else
            return false
        end
    elseif method == 'bank' then
        return PlayerObject.removeAccountMoney('bank', amount)
    end
end

function Player.GetIdentifier(PlayerOrSource, account_bound_type)
    local _type = type(PlayerOrSource)
    if account_bound_type then
        local source = PlayerOrSource
        return 'something'
    end

    if _type == "number" then

    elseif _type == 'table' then
        return PlayerOrSource.getIdentifier()
    end
    return false
end

function Player.Money(PlayerObject, method)
    method = method == 'cash' and 'money'
    return PlayerObject.getAccount(method)
end

function Player.SearchItemByName(PlayerObject, item_name)
    local source = Player.GetSource(PlayerObject)
    return ox_inventory:Search(source, 1, item_name)
end

return {
    Player = Player,
}
