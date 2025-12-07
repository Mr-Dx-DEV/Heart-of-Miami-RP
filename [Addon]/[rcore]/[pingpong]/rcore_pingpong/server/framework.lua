function IsResourceRunning(res)
    local s = GetResourceState(res)
    return s == "starting" or s == "started"
end

if IsResourceRunning(Config.ESXResourceName) then
    ESX = exports[Config.ESXResourceName]:getSharedObject()
elseif IsResourceRunning(Config.QBCoreResourceName) then
    QBCore = exports[Config.QBCoreResourceName]:GetCoreObject()
end

local function GetEsxPlayer(playerId)
    return ESX.GetPlayerFromId(playerId)
end

local function GetQbCorePlayer(playerId)
    return QBCore.Functions.GetPlayer(playerId)
end

function GetPlayerMoney(playerId)
    if IsResourceRunning(Config.QBCoreResourceName) then
        local player = GetQbCorePlayer(playerId)
        if player then
            if Config.BettingInventoryName then
                local totalAmount = 0
                for k, v in pairs(player.Functions.GetItemsByName(Config.BettingInventoryName)) do
                    totalAmount = totalAmount + (v.amount or v.count)
                end
                return totalAmount
            end
            return player.Functions.GetMoney("cash")
        end
        return 0
    elseif IsResourceRunning(Config.ESXResourceName) then
        local player = GetEsxPlayer(playerId)
        if player then
            if Config.BettingInventoryName then
                local xItem = player.getInventoryItem(Config.BettingInventoryName)
                if xItem then
                    return xItem.count or xItem.amount or 0
                end
            end
            return player.getMoney()
        end
        return 0
    end
end

function GivePlayerMoney(playerId, money)
    if IsResourceRunning(Config.QBCoreResourceName) then
        local player = GetQbCorePlayer(playerId)
        if player then
            if Config.BettingInventoryName then
                player.Functions.AddItem(Config.BettingInventoryName, money)
                return
            end
            player.Functions.AddMoney("cash", money)
        end
    elseif IsResourceRunning(Config.ESXResourceName) then
        local player = GetEsxPlayer(playerId)
        if player then
            if Config.BettingInventoryName then
                player.addInventoryItem(Config.BettingInventoryName, money)
                return
            end
            player.addMoney(money)
        end
    end
end

function RemovePlayerMoney(playerId, money)
    if IsResourceRunning(Config.QBCoreResourceName) then
        local player = GetQbCorePlayer(playerId)
        if player then
            if Config.BettingInventoryName then
                player.Functions.RemoveItem(Config.BettingInventoryName, money)
                return
            end
            player.Functions.RemoveMoney("cash", money)
        end
    elseif IsResourceRunning(Config.ESXResourceName) then
        local player = GetEsxPlayer(playerId)
        if player then
            if Config.BettingInventoryName then
                player.removeInventoryItem(Config.BettingInventoryName, money)
                return
            end
            player.removeMoney(money)
        end
    end
end

function GetPlayerRealName(playerId)
    if IsResourceRunning(Config.QBCoreResourceName) then
        local player = GetQbCorePlayer(playerId)
        if player then
            if player.PlayerData.charinfo and player.PlayerData.charinfo.firstname then
                return player.PlayerData.charinfo.firstname
            else
                return player.PlayerData.name
            end
        end
    elseif IsResourceRunning(Config.ESXResourceName) then
        local player = GetEsxPlayer(playerId)
        if player then
            return player.getName()
        end
    end
    return GetPlayerName(playerId)
end

