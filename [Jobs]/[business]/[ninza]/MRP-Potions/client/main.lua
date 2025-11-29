lib.callback.register('dynyx-rings:client:useRing', function(itemName)
    if not Config.Rings[itemName] then
        return false
    end

    local finished = false
    local success = false
    
    Progress.Start(Config.ProgressBar, function(completed)
        finished = true
        if completed then
            success = true
        else
            Framework.Notify(Config.Notifications.cancelled.description, Config.Notifications.cancelled.type)
        end
    end)
    
    while not finished do
        Wait(100)
    end
    
    return success
end)

local function GetBuffExportFunction(buffType)
    if buffType == 'armor' then
        return 'AddArmorBuff'
    elseif buffType == 'health' then
        return 'AddHealthBuff'
    elseif buffType == 'stamina' then
        return 'StaminaBuffEffect'
    elseif buffType == 'stress' then
        return 'AddStressBuff'
    elseif buffType == 'swimming' then
        return 'SwimmingBuffEffect'
    else
        return nil
    end
end

RegisterNetEvent('dynyx-rings:client:applyBuff', function(itemName)
    local ring = Config.Rings[itemName]
    
    if ring then
        local buffScript = 'ps-buffs'
        local buffScriptState = GetResourceState(buffScript)
        
        if buffScriptState ~= 'started' then
            Framework.Notify('Error: ps-buffs is not running!', 'error')
            return
        end
        
        local exportFunction = GetBuffExportFunction(ring.buffType)
        if not exportFunction then
            Framework.Notify('Error: Invalid buff type', 'error')
            return
        end
        
        Inventory.ItemBox(itemName, "remove")
        Framework.Notify('You put on the ' .. ring.label .. ' - Buff applied for ' .. math.floor(ring.buffTime/1000) .. 's', Config.Notifications.success.type)
        
        local buffTime = tonumber(ring.buffTime)
        local buffValue = tonumber(ring.buffValue)
        
        if exportFunction == 'AddArmorBuff' then
            exports['ps-buffs']:AddArmorBuff(buffTime, buffValue)
        elseif exportFunction == 'AddHealthBuff' then
            exports['ps-buffs']:AddHealthBuff(buffTime, buffValue)
        elseif exportFunction == 'StaminaBuffEffect' then
            exports['ps-buffs']:StaminaBuffEffect(buffTime, buffValue)
        elseif exportFunction == 'AddStressBuff' then
            exports['ps-buffs']:AddStressBuff(buffTime, buffValue)
        elseif exportFunction == 'SwimmingBuffEffect' then
            exports['ps-buffs']:SwimmingBuffEffect(buffTime, buffValue)
        end
    end
end)