local QBCore = exports['qb-core']:GetCoreObject()

-- Global variables for buff management
local showHUD = true
local clientBuffs = {}
local lastServerSync = 0

local function GetBuffs()
    -- If making multiple calls to GetBuffs we dont get a result of the 2nd call
    -- The wait seems to fix the issue
    Wait(500)
    local p = promise.new()
    QBCore.Functions.TriggerCallback('buffs:server:fetchBuffs', function(result)
        p:resolve(result)
    end)
    return Citizen.Await(p)
end

--- Method to fetch if player has buff with name and is not nil
--- @param buffName string - Name of the buff
--- @return bool
local function HasBuff(buffName)
    -- Use local clientBuffs instead of making server callback every time
    -- This is much more efficient and prevents callback overload
    return clientBuffs[buffName] ~= nil and clientBuffs[buffName] > 0
end exports('HasBuff', HasBuff)

--- Method to fetch buff details if player has buff active
--- @param buffName string - Name of the buff
--- @return table
local function GetBuff(buffName)
    local buffData = Config.Buffs[buffName]
    -- Check if we were given a correct buff name
    if buffData == nil then
        return nil
    end

    local buffs = GetBuffs()
    local time = nil
    
    if buffs then
        time = buffs[buffName]
    end

    if time == nil then
        time = 0
    end

    if buffData.type == 'buff' then
        return {
            time = time,
            buffName = buffName,
            iconName = buffData.iconName,
            iconColor = buffData.iconColor,
            progressColor = buffData.progressColor,
            progressValue = (time * 100) / buffData.maxTime,
            type = buffData.type,
        }
    else
        return {
            time = time,
            iconColor = buffData.iconColor,
            maxTime = buffData.maxTime,
            type = buffData.type,
        }
    end
end exports('GetBuff', GetBuff)

--- Method to fetch nui details of all buffs, used when a player that had buffs
--- logged out and back in to the server
--- @return table | nil
local function GetBuffNUIData()
    local buffs = GetBuffs()

    if buffs == nil then
        return nil
    end

    local nuiData = {}

    for buffName, buffTime in pairs(buffs) do
        local buffData = Config.Buffs[buffName]

        if buffData.type == 'buff' then
            nuiData[buffName] = {
                buffName = buffName,
                display = true,
                iconName = buffData.iconName,
                iconColor = buffData.iconColor,
                progressColor = buffData.progressColor,
                progressValue = (buffTime * 100) / buffData.maxTime,
            }
        else
            nuiData[buffName] = {
                display = true,    
                enhancementName = buffName,
                iconColor = buffData.iconColor
            }
        end
    end

    return nuiData
end exports('GetBuffNUIData', GetBuffNUIData)

--- Method to add buff to player
--- @param playerID string - Player identifier
--- @param buffName string - Name of the buff
--- @return bool - Success of removing the player buff
local function AddBuff(buffName, time)
    local p = promise.new()
    QBCore.Functions.TriggerCallback('buffs:server:addBuff', function(result)
        p:resolve(result)
    end, buffName, time)
    return Citizen.Await(p)
end exports('AddBuff', AddBuff)

-- Sync with server buffs (defined early so buff effects can use it)
local function SyncServerBuffs()
    local buffs = GetBuffs()
    if buffs then
        -- Completely replace clientBuffs with server data to prevent drift
        clientBuffs = {}
        for buffName, buffTime in pairs(buffs) do
            clientBuffs[buffName] = buffTime
        end
        lastServerSync = GetGameTimer()
    end
end

--- Custom Buffs, edit to your liking ---

--- Method to add stamina buff to player
--- @param time  - Time in ms the health buff will be active
--- @param value - The amount of speed boost the player will recieve
local function StaminaBuffEffect(time, value)
    AddBuff("stamina", time)
    
    -- Wait for server to process and event to update clientBuffs
    Wait(500)
    
    -- Check if buff was actually added
    if not exports['ps-buffs']:HasBuff("stamina") then
        SyncServerBuffs()
        Wait(500)
        if not exports['ps-buffs']:HasBuff("stamina") then
            return
        end
    end
    
    CreateThread(function()
        SetRunSprintMultiplierForPlayer(PlayerId(), value)
        
        while exports['ps-buffs']:HasBuff("stamina") do
            Wait(500)
            SetPlayerStamina(PlayerId(), GetPlayerStamina(PlayerId()) + math.random(8,15))
        end
        
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    end)
end exports('StaminaBuffEffect', StaminaBuffEffect)

--- Method to add swimming buff to player
--- @param time  - Time in ms the health buff will be active
--- @param value - The amount of swimming speed boost the player will recieve
local function SwimmingBuffEffect(time, value)
    AddBuff("swimming", time)
    Wait(500)
    
    if not exports['ps-buffs']:HasBuff("swimming") then
        SyncServerBuffs()
        Wait(500)
        if not exports['ps-buffs']:HasBuff("swimming") then
            return
        end
    end
    
    CreateThread(function()
        SetSwimMultiplierForPlayer(PlayerId(), value)
        while exports['ps-buffs']:HasBuff("swimming") do
            Wait(500)
            SetPlayerStamina(PlayerId(), GetPlayerStamina(PlayerId()) + math.random(1,10))
        end
        SetSwimMultiplierForPlayer(PlayerId(), 1.0)
    end)
end exports('SwimmingBuffEffect', SwimmingBuffEffect)

--- Method to add health buff to player
--- @param time  - Time in ms the health buff will be active
--- @param value - The amount of HP the player will gain over time
local function AddHealthBuff(time, value)
    AddBuff("super-health", time)
    
    -- Wait for server to process and event to update clientBuffs
    Wait(500)
    
    if not HasBuff("super-health") then
        SyncServerBuffs()
        Wait(500)
        if not HasBuff("super-health") then
            return
        end
    end
    
    CreateThread(function()
        while HasBuff("super-health") do
            Wait(5000)
            if GetEntityHealth(PlayerPedId()) < 200 then
                SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + value)
            end
        end
    end)
end exports('AddHealthBuff', AddHealthBuff)

--- Method to add armor buff to player
--- @param time  - Time in ms the health buff will be active
--- @param value - The amount of Armor the player will gain over time
local function AddArmorBuff(time, value)
    AddBuff("super-armor", time)
    Wait(500)
    
    if not HasBuff("super-armor") then
        SyncServerBuffs()
        Wait(500)
        if not HasBuff("super-armor") then
            return
        end
    end
    
    CreateThread(function()
        while HasBuff("super-armor") do
            Wait(5000)
            if GetPedArmour(PlayerPedId()) < 100 then
                SetPedArmour(PlayerPedId(), GetPedArmour(PlayerPedId()) + value)
            end
        end
    end)
end exports('AddArmorBuff', AddArmorBuff)

--- Method to add stress buff to player
--- @param time  - Time in ms the stress buff will be active
--- @param value - The amount of stress the player will lose every 5 seconds
local function AddStressBuff(time, value)
    AddBuff("super-stress", time)
    
    -- Wait for server to process and event to update clientBuffs
    Wait(600)
    
    if not HasBuff("super-stress") then
        SyncServerBuffs()
        Wait(500)
        if not HasBuff("super-stress") then
            return
        end
    end
    
    CreateThread(function()
        while HasBuff("super-stress") do
            Wait(5000)
            TriggerServerEvent("hud:server:RelieveStress", value)
        end
    end)
end exports('AddStressBuff', AddStressBuff)

--- Simple UI HUD Display ---

-- Function to update the UI with current buffs
local function UpdateBuffUI()
    SendNUIMessage({
        action = 'updateBuffs',
        buffs = clientBuffs
    })
end

-- Notify when resource is ready
CreateThread(function()
    Wait(1000)
    print("^2[PS-BUFFS]^7 Buff HUD loaded! Use /testbuff to test and /togglebuffhud to toggle display")
    
    -- Initialize clientBuffs with current server buffs
    SyncServerBuffs()
    
    SendNUIMessage({
        action = 'show'
    })
end)

-- Event handler for buff updates from server
RegisterNetEvent('hud:client:BuffEffect', function(data)
    local buffName = data.buffName
    
    if data.display == false then
        -- Remove buff from client buffs
        if clientBuffs[buffName] then
            clientBuffs[buffName] = nil
        end
    else
        -- If progressValue is provided, calculate the time from it
        if data.progressValue then
            local buffData = Config.Buffs[buffName]
            if buffData then
                local time = (data.progressValue * buffData.maxTime) / 100
                clientBuffs[buffName] = time
            end
        else
            -- Fallback: sync with server in background
            CreateThread(function()
                local serverBuffs = GetBuffs()
                if serverBuffs and serverBuffs[buffName] then
                    clientBuffs[buffName] = serverBuffs[buffName]
                end
            end)
        end
    end
    
    -- Update UI immediately
    UpdateBuffUI()
end)

-- Event handler for enhancement updates from server
RegisterNetEvent('hud:client:EnhancementEffect', function(data)
    local enhancementName = data.enhancementName
    
    if data.display == false then
        -- Remove enhancement from client buffs
        if clientBuffs[enhancementName] then
            clientBuffs[enhancementName] = nil
        end
    else
        -- Sync with server IMMEDIATELY (not in background thread)
        Wait(50) -- Small delay to let server finish processing
        local serverBuffs = GetBuffs()
        if serverBuffs and serverBuffs[enhancementName] then
            clientBuffs[enhancementName] = serverBuffs[enhancementName]
        end
    end
    
    -- Update UI immediately
    UpdateBuffUI()
end)

-- Main HUD Update Thread
CreateThread(function()
    while true do
        Wait(100) -- Check every 100ms for smooth updates

        if showHUD then
            local currentTime = GetGameTimer()

            -- Sync with server every 5 seconds
            if currentTime - lastServerSync >= 5000 then
                SyncServerBuffs()
            end

            -- Decrease client-side buff times
            for buffName, buffTime in pairs(clientBuffs) do
                if buffTime > 0 then
                    clientBuffs[buffName] = buffTime - 100
                else
                    clientBuffs[buffName] = nil
                end
            end

            -- Update UI every second
            if currentTime % 1000 < 100 then
                UpdateBuffUI()
            end
        end
    end
end)

