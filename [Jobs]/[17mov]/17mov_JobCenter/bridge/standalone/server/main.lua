if GetResourceState('qb-core') == 'started' or GetResourceState('es_extended') == 'started' then return end

Core = {
    -- This function is returning identifier of player
    GetPlayerIdentifier = function(self, src)
        -- Your custom code
        return nil
    end,

    -- This function returns current player job name
    GetPlayerJob = function(self, src)
        -- Your custom code
        return nil
    end,

    -- This function is returning all jobs registered on server
    GetJobs = function(self)
        -- Your custom code
        return nil
    end,

    -- Function that return all players with specified job
    GetPlayersWithJob = function(self, jobName)
        -- Your custom code
        return nil
    end,

    -- Function that setting job for specified player
    SetPlayerJob = function(self, src, job, grade)
        -- Your custom code
        return nil
    end
}