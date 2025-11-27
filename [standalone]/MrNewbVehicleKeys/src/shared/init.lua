Bridge = exports.community_bridge:Bridge()

function locale(message)
    return Bridge.Language.Locale(message)
end

function TableContains(table, value, nested)
    if not table then return false end
    return lib.table.contains(table, value)
end

function GetClosestVehicle(coords, distance, includePlayerVeh)
    local veh = lib.getClosestVehicle(coords, distance, includePlayerVeh)
    return veh
end

function DoDebugPrint(message)
	if not Config.Utility.Debug then return end
	return Bridge.Prints.Debug(message)
end

function VerifyValidEntity(entity)
    return entity and entity ~= -1 and DoesEntityExist(entity) and GetEntityType(entity) ~= 0 or false
end

function TrimString(plate)
    local stringIfy = tostring(plate)
    return stringIfy:match("^%s*(.-)%s*$"):upper()
end

function GenerateRandomString()
    return Bridge.Ids.RandomLower(nil, 8)
end

if not IsDuplicityVersion() then return end

if Config.Prefrences.UseThirdPartyLockpick then return end

Bridge.Framework.RegisterUsableItem(Config.ItemBasedSettings.advancedlockpickItemName, function(src, itemData)
    TriggerClientEvent('lockpicks:UseLockpick', src, true, itemData.slot)
end)

Bridge.Framework.RegisterUsableItem(Config.ItemBasedSettings.lockpickItemName, function(src, itemData)
    TriggerClientEvent('lockpicks:UseLockpick', src, false, itemData.slot)
end)