local QBCore = exports['qb-core']:GetCoreObject()

-- Table to store ziptied players
local ZiptiedPlayers = {}

QBCore.Functions.CreateUseableItem('ziptie', function(source) 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    local HasZiptie = QBCore.Functions.HasItem(src, 'ziptie')
    if not HasZiptie then return end
    TriggerClientEvent('Crazy:Client:UseZiptie', src)
end)

RegisterNetEvent('Crazy:Server:ZiptiePlayer', function(playerId)
    local src = source
    local playerPed = GetPlayerPed(src)
    local targetPed = GetPlayerPed(playerId)
    local playerCoords = GetEntityCoords(playerPed)
    local targetCoords = GetEntityCoords(targetPed)
    local Player = QBCore.Functions.GetPlayer(src)
    local ZiptiedPlayer = QBCore.Functions.GetPlayer(playerId)
    local HasZiptie = QBCore.Functions.HasItem(src, 'ziptie')
        
    if #(playerCoords - targetCoords) > 2.5 then return end
    
    if HasZiptie then
        if Player.Functions.RemoveItem('ziptie', 1) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['ziptie'], 'remove')

            -- Store ziptied player data
            ZiptiedPlayers[playerId] = {
                ziptiedBy = src,
                ziptiedAt = os.time(),
                playerName = ZiptiedPlayer.PlayerData.charinfo.firstname .. " " .. ZiptiedPlayer.PlayerData.charinfo.lastname,
                ziptierName = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
            }

            TriggerClientEvent("Crazy:Client:GetZiptied", ZiptiedPlayer.PlayerData.source, Player.PlayerData.source)
        end
    end
end)


RegisterNetEvent('Crazy:Server:UnZiptie', function(TargetId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local UnZiptiedPlayer = QBCore.Functions.GetPlayer(TargetId)
    local PlayerPed = GetPlayerPed(src)
    local TargetPed = GetPlayerPed(TargetId)
    local uzpPos = GetEntityCoords(TargetPed)
    local pPos = GetEntityCoords(PlayerPed)
    local Distance = #(pPos - uzpPos)
    local HasItems = QBCore.Functions.HasItem(src, Config.UnZipItems)
    
    if Distance > 2.5 then return end
    if HasItems then
        -- Remove from ziptied players table
        ZiptiedPlayers[TargetId] = nil

        TriggerClientEvent('Crazy:Client:GetUnZiptied', UnZiptiedPlayer.PlayerData.source, Player.PlayerData.source)
    end
end)

-- Handle wiggle out of zipties
RegisterNetEvent('Crazy:Server:ZiptieWiggle', function()
    local src = source
    -- Remove from ziptied players table when they wiggle out
    ZiptiedPlayers[src] = nil
end)

-- Handle player disconnect to clean up data
AddEventHandler('playerDropped', function()
    local src = source
    if ZiptiedPlayers[src] then
        ZiptiedPlayers[src] = nil
    end
end)

-- Export function to check if a player is ziptied
exports('IsPlayerZiptied', function(playerId)
    return ZiptiedPlayers[playerId] ~= nil
end)

-- Export function to get ziptie data for a player
exports('GetZiptieData', function(playerId)
    return ZiptiedPlayers[playerId]
end)

-- Export function to get all ziptied players
exports('GetAllZiptiedPlayers', function()
    return ZiptiedPlayers
end)

