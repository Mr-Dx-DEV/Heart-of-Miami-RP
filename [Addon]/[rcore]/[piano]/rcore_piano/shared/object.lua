function GetEsxObject()
    local promise_ = promise:new()
    local obj
    xpcall(function()
        obj = exports["es_extended"]['getSharedObject']()
        promise_:resolve(obj)
    end, function(error)
        TriggerEvent(Config.ESX or "esx:getSharedObject", function(module)
            obj = module
            promise_:resolve(obj)
        end)
    end)

    Citizen.Await(obj)
    return obj
end