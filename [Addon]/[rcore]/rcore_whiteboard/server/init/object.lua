function GetSharedObjectSafe()
    local object = promise:new()
    local resolved = false

    if Config.Framework and Config.Framework ~= Frameworks.STANDALONE then
        local triggers = Config.FrameworkTriggers[Config.Framework]
        local resName = triggers['resourceName']
        if Config.Framework == Frameworks.ESX then
            xpcall(function()
                object:resolve(exports[resName]['getSharedObject']())

                resolved = true
            end, function()
                xpcall(function()
                    TriggerEvent(triggers['object'], function(obj)
                        object:resolve(obj)

                        resolved = true
                    end, debug.traceback)
                end)
            end)
        end

        if Config.Framework == Frameworks.QBCORE then
            xpcall(function()
                object:resolve(exports[resName]['GetCoreObject']())

                resolved = true
            end, function()
                xpcall(function()
                    object:resolve(exports[resName]['GetSharedObject']())

                    resolved = true
                end, function()
                    xpcall(function()
                        TriggerEvent(triggers['object'], function(obj)
                            object:resolve(obj)

                            resolved = true
                        end)
                    end, debug.traceback)
                end)
            end)
        end

        SetTimeout(1000, function()
            if resolved == false then
                print('^1================ WARNING ================^7')
                print('^7Could not ^2load^7 shared object!^7')
                print('^1================ WARNING ================^7')
            end
        end)
    else
        if Config.Framework ~= Frameworks.STANDALONE then
            print('^1================ WARNING ================^7')
            print('^7Could not ^2load^7 shared object!^7')
            print('^7Config.Framework value is not set properly!^7')
            print('^1================ WARNING ================^7')
        end

    end

    return object
end
