function useEffects(ingredients, type, itemName) -- No need to modify this
    dbug("useEffects(itemName, type, ingredientes)", itemName, type, json.encode(ingredients))
    local triggered = false
    if itemName and Config.DefaultEffects[itemName] then
        dbug('itemName exists in Config.DefaultEffects', itemName)
        Config.DefaultEffects[itemName]()
        triggered = true
    end
    if not triggered and ingredients then
        for _, v in pairs(ingredients) do
            if Config.Effects and Config.Effects[v] then
                triggered = true
                dbug("TriggerEffect()", v)
                CreateThread(function()
                    Config.Effects[v]()
                end)
            end
        end
    end
    dbug("No ingredients effect, trigger default one?", type)
    if not triggered and Config.DefaultEffects[type] then
        dbug("TriggerDefaultEffect()", type)
        Config.DefaultEffects[type]()
    end
    dbug("useEffects() finished...")
end

function alcohol(seconds)
    local time = seconds or 30
    local ped = PlayerPedId()
    DoScreenFadeOut(1000)
    Wait(1000)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(ped, true)
    lib.requestAnimSet("MOVE_M@DRUNK@VERYDRUNK", 10000)
    SetPedMovementClipset(ped, "MOVE_M@DRUNK@VERYDRUNK", 1)
    SetPedIsDrunk(ped, true)
    SetPedAccuracy(ped, 0)
    DoScreenFadeIn(1000)
    Wait(time * 1000)
    DoScreenFadeOut(1000)
    Wait(1000)
    DoScreenFadeIn(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(ped, 0)
    SetPedIsDrunk(ped, false)
    SetPedMotionBlur(ped, false)
end

function drugs(seconds)
    local time = seconds or 30
    local ped = PlayerPedId()
    DoScreenFadeOut(1000)
    Wait(1000)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(ped, true)
    lib.requestAnimSet("MOVE_M@DRUNK@VERYDRUNK", 10000)
    SetPedMoveRateOverride(ped, 10.0)
    SetRunSprintMultiplierForPlayer(ped, 1.49)
    SetPedIsDrunk(ped, true)
    SetPedAccuracy(ped, 0)
    DoScreenFadeIn(1000)
    Wait(time * 1000)
    DoScreenFadeOut(1000)
    Wait(1000)
    DoScreenFadeIn(1000)
    SetPedMoveRateOverride(ped, 0.0)
    SetRunSprintMultiplierForPlayer(ped, 1.0)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(ped, 0)
    SetPedIsDrunk(ped, false)
    SetPedMotionBlur(ped, false)
end