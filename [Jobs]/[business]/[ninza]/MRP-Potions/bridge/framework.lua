Framework = {}
Framework.Name = nil
Framework.Object = nil

if GetResourceState('es_extended') == 'started' then
    Framework.Name = 'ESX'
    Framework.Object = exports['es_extended']:getSharedObject()
elseif GetResourceState('qbx_core') == 'started' then
    Framework.Name = 'QBX'
    Framework.Object = exports['qb-core']:GetCoreObject()
elseif GetResourceState('qb-core') == 'started' then
    Framework.Name = 'QB'
    Framework.Object = exports['qb-core']:GetCoreObject()
end

function Framework.GetPlayer(source)
    if Framework.Name == 'ESX' then
        return Framework.Object.GetPlayerFromId(source)
    elseif Framework.Name == 'QBX' then
        return exports.qbx_core:GetPlayer(source)
    elseif Framework.Name == 'QB' then
        return Framework.Object.Functions.GetPlayer(source)
    end
    return nil
end

function Framework.GetPlayerData()
    if Framework.Name == 'ESX' then
        return Framework.Object.GetPlayerData()
    elseif Framework.Name == 'QBX' then
        return exports.qbx_core:GetPlayerData()
    elseif Framework.Name == 'QB' then
        return Framework.Object.Functions.GetPlayerData()
    end
    return nil
end

function Framework.Notify(message, type, duration)
    if lib then
        lib.notify({
            description = message,
            type = type or 'info',
            duration = duration or 5000
        })
    elseif Framework.Name == 'ESX' then
        Framework.Object.ShowNotification(message)
    elseif Framework.Name == 'QBX' or Framework.Name == 'QB' then
        Framework.Object.Functions.Notify(message, type or 'primary', duration or 5000)
    end
end

