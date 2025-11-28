RegisterServerEvent('av_gangs:getMoney', function(netId, gang, zone) -- triggered when u rob a gang npc
    dbug("robNPC(netId, gang)", netId, gang)
    local src = source
    local player = GetPlayerPed(src)
    local coords = GetEntityCoords(player)
    local npc = NetworkGetEntityFromNetworkId(netId)
    if npc and DoesEntityExist(npc) then
        local state = Entity(npc).state
        if not state['robbed'] then
            state['robbed'] = true
        else
            dbug("Already robbed, cancel process.")
            return
        end
    else
        dbug("Entity doesn't exist, cancel process.")
        return
    end
    local members = getMembers(gang)
    local count = 0
    if members and next(members) then
        for _, v in pairs(members) do
            local Player = exports['av_laptop']:getSourceByIdentifier(v['identifier'])
            if Player then
                TriggerClientEvent('av_gangs:alertMember', Player, coords, Lang['robbery_alert'])
                count += 1
            end
        end
    end
    if Config.MinOnlineForNPC and count < Config.MinOnlineForNPC then
        dbug('Not enough players online (online,required)', count, Config.MinOnlineForNPC)
        TriggerClientEvent('av_laptop:notification', src, Lang['app_title'], Lang['not_enough_enemies'], 'warning')
        return
    end
    local total = math.random(Config.RobMoney['min'], Config.RobMoney['max'])
    exports['av_laptop']:addMoney(src,Config.RobAccount,total)
    local myGang = getGang(src)
    if Config.GangWinsXP and Config.GangWinsXP > 0 then
        if myGang and myGang['name'] then
            addXP(myGang['name'],Config.GangWinsXP)
        end
    end
    local settings = Config.RobNPC
    if not settings or not settings['enabled'] then return end
    if settings['toAdd'] and tonumber(settings['toAdd']) > 0 then
        if myGang and myGang['name'] then
            addZoneXP(myGang['name'],zone,settings['toAdd'])
        end
    end
    if settings['toRemove'] and tonumber(settings['toRemove']) > 0 then
        removeZoneXP(gang,zone,settings['toRemove'])
    end
    if Config.RobNPCReputation and Config.RobNPCReputation['enabled'] then
        addReputation(src, Config.RobNPCReputation['points'] or 1)
    end
end)