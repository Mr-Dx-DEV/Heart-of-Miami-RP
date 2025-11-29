if GetResourceState('qb-core') ~= 'started' then return end

local QBCore = exports['qb-core']:GetCoreObject()

Core = {
    -- This function should return character firstname
    GetFirstname = function(self)
        local player = QBCore.Functions.GetPlayerData()
        return player?.charinfo?.firstname
    end,

    -- This function should return character lastname
    GetLastname = function(self)
        local player = QBCore.Functions.GetPlayerData()
        return player?.charinfo?.lastname
    end,

    -- This function should return player job name
    GetPlayerJob = function(self)
        local player = QBCore.Functions.GetPlayerData()
        return player?.job?.name
    end,

    -- This function should return player job grade
    GetPlayerJobGrade = function(self)
        local player = QBCore.Functions.GetPlayerData()
        return player?.job?.grade?.level
    end,

    -- This function is responsible for starting notifications
    Notify = function(self, message, type, length)
        QBCore.Functions.Notify(message, type, length)
    end
}

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    InitializeScript()

    Utils.UpdatePlayerData()
    Utils.UpdateJob()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function()
    Utils.UpdateJob()
end)
