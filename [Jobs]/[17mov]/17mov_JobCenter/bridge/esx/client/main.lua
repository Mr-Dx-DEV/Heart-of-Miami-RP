if GetResourceState('es_extended') ~= 'started' then return end

local ESX = exports['es_extended']:getSharedObject()

Core = {
    -- This function should return character firstname
    GetFirstname = function(self)
        ESX.PlayerData = ESX.GetPlayerData()
        return ESX.PlayerData?.firstName
    end,

    -- This function should return character lastname
    GetLastname = function(self)
        ESX.PlayerData = ESX.GetPlayerData()
        return ESX.PlayerData?.lastName
    end,

    -- This function should return player job name
    GetPlayerJob = function(self)
        ESX.PlayerData = ESX.GetPlayerData()
        return ESX.PlayerData?.job?.name
    end,

    -- This function should return player job grade
    GetPlayerJobGrade = function(self)
        ESX.PlayerData = ESX.GetPlayerData()
        return ESX.PlayerData?.job?.grade
    end,

    -- This function is responsible for starting notifications
    Notify = function(self, message, type, length)
        ESX.ShowNotification(message, type, length)
    end
}

RegisterNetEvent("esx:playerLoaded", function()
    InitializeScript()

    Utils.UpdatePlayerData()
    Utils.UpdateJob()
end)

RegisterNetEvent("esx:setJob", function ()
    Utils.UpdateJob()
end)
