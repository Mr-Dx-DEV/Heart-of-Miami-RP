QBCORE_OBJECT_GETTERS = {
    coreObject = function()
        local success, result = pcall(function()
            return exports[Framework.QBCore]:GetCoreObject()
        end)

        return success and result or nil
    end,
    sharedObject = function()
        local success, result = pcall(function()
            return exports[Framework.QBCore]:GetSharedObject()
        end)

        return success and result or nil
    end,
    event = function()
        local qbObj = nil
        local breakPoint = 0
        local p = promise.new()
        Citizen.CreateThread(function()
            while not qbObj do
                Wait(100)
                TriggerEvent('QBCore:GetObject', function(obj)
                    qbObj = obj
                end)

                breakPoint = breakPoint + 1
                if breakPoint == 25 then
                    break
                end
            end

            p:resolve(qbObj)
        end)

        return Citizen.Await(p)
    end
}

if isBridgeLoaded('Framework', Framework.QBCore) then
    local function getQBObject()
        local QBCore = QBCORE_OBJECT_GETTERS.coreObject()
        if QBCore == nil then
            QBCore = QBCORE_OBJECT_GETTERS.sharedObject()
            if QBCore == nil then
                QBCore = QBCORE_OBJECT_GETTERS.event()
            end
        end

        return QBCore
    end

    local QBCore = getQBObject()

    if QBCore == nil then
        log.error('Failed to get QBCore object, please check if QBCore is loaded correctly.')
        return
    end

    Framework.object = QBCore

    function Framework.getIdentifier(client)
        client = tonumber(client)
        local player = QBCore.Functions.GetPlayer(client)
        if player == nil then return nil end

        return player.PlayerData.citizenid
    end

    function Framework.getJob(client)
        local player = QBCore.Functions.GetPlayer(client)
        if player == nil then return nil end

        return {
            name = player.PlayerData.job.name,
            grade = player.PlayerData.job.grade_name,
        }
    end

    function Framework.getCharacterName(client)
        local player = QBCore.Functions.GetPlayer(client)
        if player == nil then return nil end

        local firstname = player.PlayerData.charinfo.firstname
        local lastname = player.PlayerData.charinfo.lastname
        return string.format('%s %s', firstname, lastname)
    end

    function Framework.sendNotification(client, message, type)
        TriggerClientEvent('QBCore:Notify', tonumber(client), message, type, 5000)
    end

    function Framework.isAdmin(client)
        for _, adminGroup in ipairs(Config.FrameworkAdminGroups[Bridge.Framework]) do
            if QBCore.Functions.HasPermission(client, adminGroup) then
                return true
            end
        end

        return false
    end

    function Framework.getPlayer(client)
        return QBCore.Functions.GetPlayer(client)
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
