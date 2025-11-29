if GetResourceState('es_extended') ~= 'started' then return end

local ESX = exports['es_extended']:getSharedObject()

Core = {
    -- This function is returning identifier of player
    GetPlayerIdentifier = function(self, src)
        local player = ESX.GetPlayerFromId(src)
        return player?.identifier
    end,

    -- This function returns current player job name
    GetPlayerJob = function(self, src)
        local player = ESX.GetPlayerFromId(src)
        return player?.job?.name
    end,

    -- This function is returning all jobs registered on server
    GetJobs = function(self)
        return ESX.GetJobs()
    end,

    -- Function that return all players with specified job
    GetPlayersWithJob = function(self, jobName)
        return ESX.GetExtendedPlayers('job', jobName)
    end,

    -- Function that setting job for specified player
    SetPlayerJob = function(self, src, job, grade)
        local xPlayer = ESX.GetPlayerFromId(src)

        if not xPlayer then
            return false
        end

        return xPlayer.setJob(job, grade)
    end
}