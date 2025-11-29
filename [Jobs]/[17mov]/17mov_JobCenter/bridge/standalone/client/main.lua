if GetResourceState('qb-core') == 'started' or GetResourceState('es_extended') == 'started' then return end

Core = {
    -- This function should return character firstname
    GetFirstname = function(self)
        -- Your custom code
        return nil
    end,

    -- This function should return character lastname
    GetLastname = function(self)
        -- Your custom code
        return nil
    end,

    -- This function should return player job name
    GetPlayerJob = function(self)
        -- Your custom code
        return nil
    end,

    -- This function should return player job grade
    GetPlayerJobGrade = function(self)
        -- Your custom code
        return nil
    end,

    -- This function is responsible for starting notifications
    Notify = function(self, message, type, length)
        -- Your custom code
        return nil
    end
}