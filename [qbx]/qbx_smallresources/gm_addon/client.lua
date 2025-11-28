local raised = false

function BlockActions(bool)
    DisablePlayerFiring(PlayerPedId(), bool) -- Shooting
    DisableControlAction(0, 25, bool) -- Aiming
    DisableControlAction(0, 140, bool) -- Melee Attack 1
    DisableControlAction(0, 141, bool) -- Melee Attack 2
    DisableControlAction(0, 142, bool) -- Melee Attack 3
    DisableControlAction(0, 37, bool) -- Weapon Wheel
    DisableControlAction(0, 45, bool) -- Reloading
end

function RaiseHands()
    TaskPlayAnim(PlayerPedId(), "missminuteman_1ig_2", "handsup_enter", 8.0, 8.0, -1, 50, 0, false, false, false)
    raised = true
end

function LowerHands()
    ClearPedTasks(PlayerPedId())
    raised = false
end

--Main Script--
CreateThread(function()
    RequestAnimDict("missminuteman_1ig_2")
    while not HasAnimDictLoaded("missminuteman_1ig_2") do
        Wait(100)
    end

    while true do
        Wait(0)

        --Hands Control--
        RegisterCommand('hu', function()
            if not raised and not IsPedInAnyVehicle(PlayerPedId(), true) and not IsPedSwimming(PlayerPedId()) then
                RaiseHands()
            else
                LowerHands()
            end
        end)

        --Disable actions while raising hands--
        if raised then
            BlockActions(true)
        end

        --Ragdoll Fixing--
        if IsPedRagdoll(PlayerPedId()) and raised then
            raised = false
        end
    end
end)


--Exports for other scripts--
exports('raiseHands', function()
    RaiseHands()
end)

exports('lowerHands', function()
    LowerHands()
end)

exports('checkHands', function()
    return raised
end)