function storeAdminCache(cache, playerId, value)
    cache[tostring(playerId)] = value
end

function getAdminCache(cache, playerId)
    return cache[tostring(playerId)]
end

function resetAdminCache(cache, playerId)
    if cache[tostring(playerId)] then
        cache[tostring(playerId)] = nil
    end
end

function isAllowedGroup(src, group)
    if Config.Framework == Frameworks.ESX then
        if FrameworkObject then
            local xPlayer = FrameworkObject.GetPlayerFromId(tonumber(src))
            if xPlayer then
                local pGroup = xPlayer.getGroup()
                dbg.info(string.format('Retrieved group compare for playerId %s: ESX Group: %s, player Group: %s', src, pGroup, group))
                if pGroup == group then
                    return true
                end
                return false
            else
                dbg.critical("Empty xPlayer variable!")
                return false
            end
        else
            dbg.critical("Empty FrameworkObject variable!")
            return false
        end
    elseif Config.Framework == Frameworks.QBCORE then
        return FrameworkObject.Functions.HasPermission(src, group)
    end
    return false
end

local function hasPermissions(source, cache, groups, acePermission)
    local isAllowed = false

    if getAdminCache(cache, source) ~= nil then
        dbg.info(string.format('Permissions from cache for player %s: hasPermissions: %s', source, getAdminCache(cache, source)))
        return getAdminCache(cache, source)
    end

    if Config.UseAcePermissions and Ace.Can(source, acePermission) then
        storeAdminCache(cache, source, true)
        return true
    end

    if Config.UseAcePermissions then
        return false
    end

    if source == 0 then
        return
        --Console
    end

    for _, gr in pairs(groups) do
        if isAllowedGroup(source, gr) then
            isAllowed = true
            break
        end
    end

    if isAllowed then
        storeAdminCache(cache, source, isAllowed)
    end

    return isAllowed
end

function hasAdminPermissions(playerId)
    return hasPermissions(playerId, adminPermissionsCache, Config.AllowedGroups, Permissions.ADMIN)
end

-- ACTIONS
function canEditAllShortcuts(playerId)
    return hasAdminPermissions(playerId)
end

function canEditAllAliases(playerId)
    return hasAdminPermissions(playerId)
end

function canAddShortcut(playerId)
    if Config.UseAcePermissions then
        return Ace.Can(playerId, Permissions.USE_SHORTCUTS)
    end
    -- if hasAdminPermissions(playerId) then
    --     return true
    -- end
    return true
end

function canEditShortcut(playerId)
    if Config.UseAcePermissions then
        return Ace.Can(playerId, Permissions.USE_SHORTCUTS)
    end
    -- if hasAdminPermissions(playerId) then
    --     return true
    -- end
    return true
end

function canDeleteShortcut(playerId)
    if Config.UseAcePermissions then
        return Ace.Can(playerId, Permissions.USE_SHORTCUTS)
    end
    -- if hasAdminPermissions(playerId) then
    --     return true
    -- end
    return true
end

function canAddCategory(playerId)
    return hasAdminPermissions(playerId)
end

function canEditCategory(playerId)
    return hasAdminPermissions(playerId)
end

function canDeleteCategory(playerId)
    return hasAdminPermissions(playerId)
end

function canAddPremadeShortcut(playerId)
    return hasAdminPermissions(playerId)
end

function canEditPremadeShortcut(playerId)
    return hasAdminPermissions(playerId)
end

function canDeletePremadeShortcut(playerId)
    return hasAdminPermissions(playerId)
end

function canAddAlias(playerId)
    return true
end

function canEditAlias(playerId)
    return true
end

function canDeleteAlias(playerId)
    return true
end