if GetResourceState('qb-core') ~= 'started' then return end

local QBCore = exports['qb-core']:GetCoreObject()

Core = {
    -- This function is returning identifier of player
    GetPlayerIdentifier = function(self, src)
        local player = QBCore.Functions.GetPlayer(src)
        return player?.PlayerData?.citizenid
    end,

    -- This function returns current player job name
    GetPlayerJob = function(self, src)
        local player = QBCore.Functions.GetPlayer(src)
        return player?.PlayerData?.job?.name
    end,

    -- This function is returning all jobs registered on server
    GetJobs = function(self)
        return QBCore.Shared.Jobs
    end,

    -- Function that return all players with specified job
    GetPlayersWithJob = function(self, jobName)
        local players = {}
        for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
            if v.PlayerData?.job?.name == jobName then
                players[#players + 1] = k
            end
        end
        return players
    end,

    -- Function that setting job for specified player
    SetPlayerJob = function(self, src, job, grade)
        local player = QBCore.Functions.GetPlayer(src)

        if not player then return false end

        return player.Functions.SetJob(job, grade)
    end
}