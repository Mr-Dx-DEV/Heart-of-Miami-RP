local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('citizen', function(source, args, rawCommand)
    local Player = QBCore.Functions.GetPlayer(source)

    if Player then
        local citizenid = Player.PlayerData.citizenid
        local charname = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
        local steamname = GetPlayerName(source)
        local license = nil

        -- Get player license
        for k, v in pairs(GetPlayerIdentifiers(source)) do
            if string.sub(v, 1, string.len("license2:")) == "license2:" then
                license = v
                break
            end
        end

        -- Send data to client to display
        TriggerClientEvent('citizen:showInfo', source, {
            citizenid = citizenid,
            charname = charname,
            steamname = steamname,
            license = license
        })
    end
end, false)