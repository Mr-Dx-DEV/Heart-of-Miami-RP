local function getPlayerIdentifierRaw(_source)
    for _, identifier in pairs(GetPlayerIdentifiers(_source)) do
        if string.find(identifier, Config.LicenseType) then
            if Config.LicenseWithoutPrefix then
                return string.gsub(identifier, Config.LicenseType..':', "")
            end
            return identifier
        end
    end

    dbg.critical('Cannot found player identifier!')
    return nil
end

function getPlayerIdentifier(_source)
    return getPlayerIdentifierRaw(_source)
end
