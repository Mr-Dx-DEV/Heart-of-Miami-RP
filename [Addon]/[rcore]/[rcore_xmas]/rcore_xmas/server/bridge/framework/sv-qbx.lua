if isBridgeLoaded('Framework', Framework.QBX) then
    function Framework.getIdentifier(client)
        local player = exports[Framework.QBX]:GetPlayer(client)
        if player == nil then return nil end

        return player.PlayerData.citizenid
    end

    function Framework.getJob(client)
        local player = exports[Framework.QBX]:GetPlayer(client)
        if player == nil then return nil end

        return {
            name = player.PlayerData.job.name,
            grade = player.PlayerData.job.grade.level
        }
    end

    function Framework.getCharacterName(client)
        local player = exports[Framework.QBX]:GetPlayer(client)
        if player == nil then return nil end

        local firstname = player.PlayerData.charinfo.firstname
        local lastname = player.PlayerData.charinfo.lastname
        return string.format('%s %s', firstname, lastname)
    end

    function Framework.sendNotification(client, message, type)
        if message == nil then return end

        exports[Framework.QBX]:Notify(tonumber(client), message, type, 5000)
    end

    function Framework.isAdmin(client)
        return IsPlayerAceAllowed(client, 'command')
    end

    function Framework.getPlayer(client)
        return exports[Framework.QBX]:GetPlayer(client)
    end

    function Framework.getOfflineCharacterName(identifier)
        if identifier == nil or identifier == '' then
            log.error('Invalid identifier provided for offline character name retrieval.')
            return nil
        end

        local result = MySQL.Sync.fetchAll('SELECT charinfo FROM players WHERE citizenid = @citizenid', {
            ['@citizenid'] = identifier
        })

        if not result or #result == 0 then
            return nil
        end

        local character = result[1]
        if character == nil then
            log.error('Character data does not exist for identifier: ' .. tostring(identifier))
            return nil
        end

        if type(character.charinfo) == 'string' then
            character.charinfo = json.decode(character.charinfo)
        end

        if character.charinfo.firstname == nil or character.charinfo.lastname == nil then
            log.error('Character data incomplete for identifier: ' .. tostring(identifier))
            return nil
        end

        return string.format('%s %s', character.charinfo.firstname, character.charinfo.lastname)
    end

    RegisterNetEvent('QBCore:Server:OnPlayerLoaded', function()
        local client = source
        TriggerEvent('rcore_xmas:bridge:playerLoaded', client)
    end)
end
