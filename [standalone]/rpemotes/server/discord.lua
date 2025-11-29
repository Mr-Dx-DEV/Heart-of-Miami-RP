local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('rpemotes:server:checkDiscordRoles', function(source, cb)
    local src = source

    local hasGold = exports.zdiscord:isRolePresent(src, '1404669577799012473')
    local hasPlatinum = exports.zdiscord:isRolePresent(src, '1404669577799012473')
    local hasDiamond = exports.zdiscord:isRolePresent(src, '1404669577799012473')
    local hasAmethyst = exports.zdiscord:isRolePresent(src, '1404669577799012473')

    -- Prevent nil values (default to false)
    hasGold = hasGold ~= nil and hasGold or false
    hasPlatinum = hasPlatinum ~= nil and hasPlatinum or false
    hasDiamond = hasDiamond ~= nil and hasDiamond or false
    hasAmethyst = hasAmethyst ~= nil and hasAmethyst or false

    local result = {
        gold = hasGold,
        platinum = hasPlatinum,
        diamond = hasDiamond,
        amethyst = hasAmethyst
    }

    cb(result)
end)
