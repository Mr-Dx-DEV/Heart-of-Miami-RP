local _IdentifierCache = {}

local function getPlayerIdentifierRaw(_source)
    for _, identifier in pairs(GetPlayerIdentifiers(_source)) do
        if string.find(identifier, Config.LicenseType) then
            if Config.LicenseWithoutPrefix then
                return string.gsub(identifier, Config.LicenseType .. ':', "")
            end
            return identifier
        end
    end

    dbg.critical('Could not found player identifier!')
    return nil
end

function GetPlayerIdentifierSafe(_source, withoutCache)
    local identifier = not withoutCache and _IdentifierCache[_source] or nil

    if identifier then
        return identifier
    end

    if Config.Framework == 1 or Config.Framework == 2 then
        while true do
            identifier = GetPlayerIdentifierFw(_source)

            if not identifier then
                Wait(1000)
            else
                break
            end
        end
    else
        identifier = getPlayerIdentifierRaw(_source)
    end

    _IdentifierCache[_source] = identifier

    return identifier
end
