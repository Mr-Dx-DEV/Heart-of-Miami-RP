if Config.Framework.Active ~= Framework.QBCORE then
    SharedObject.Config = {
        Server = {
            Permissions = {
                "user", "mod", "moderator", "help", "helper", "admin", "superadmin", "god",
            },
        },
    }
end

for k, v in pairs(SharedObject.Config.Server.Permissions) do
    ExecuteCommand(("add_ace qbcore.%s rcore_perm.%s allow"):format(v, v))
    ExecuteCommand(("add_ace group.%s rcore_perm.%s allow"):format(v, v))
end

function IsPlayerInGroup(source, groups, acePermission)
    if acePermission then
        if IsPlayerAceAllowed(source, acePermission) then
            return true
        end
    end

    if Config.Framework.Active == Framework.STANDALONE or Config.Framework.Active == Framework.QBCORE then
        for k, v in pairs(groups) do
            if IsPlayerAceAllowed(source, "rcore_perm." .. v) then
                return true
            end
        end
    end

    if Config.Framework.Active == Framework.ESX then
        local xPlayer = SharedObject.GetPlayerFromId(source)
        if xPlayer then
            for k, v in pairs(groups) do
                if xPlayer.getPermissions then
                    if Config.PermissionGroup.ESX[1][xPlayer.getPermissions()] then
                        return true
                    end
                end
                if xPlayer.getGroup then
                    if Config.PermissionGroup.ESX[2][xPlayer.getGroup()] then
                        return true
                    end
                end
            end
        end
    end
    return false
end

CreateThread(function()
    local deepCopy = function(object)
        local lookup_table = {}
        local function _copy(object)
            if type(object) ~= "table" then
                return object
            elseif lookup_table[object] then
                return lookup_table[object]
            end
            local new_table = {}
            lookup_table[object] = new_table
            for index, value in pairs(object) do
                new_table[_copy(index)] = _copy(value)
            end
            return setmetatable(new_table, getmetatable(object))
        end
        return _copy(object)
    end

    local permissionGroup = deepCopy(Config.PermissionGroup)
    for framework, v in pairs(permissionGroup) do
        for index, _v in pairs(v) do
            for key, permissions in pairs(_v) do
                Config.PermissionGroup[framework][index][key] = nil
                Config.PermissionGroup[framework][index][permissions] = true
            end
        end
    end
end)