RegisterNetEvent(triggerName('joinLine'), function(gunrangeIndex, boxIndex, distanceIndex, rentPrice, gunHash, gunAmmo)
    if Config.Debug then
        --[[
        TriggerEvent(triggerName('makePointOnTarget'), {
            x = 0.01214599609375,
            y = 0.00067329406738281,
        }, 10)

        TriggerEvent(triggerName('makePointOnTarget'), {
            x = 0.00830078125,
            y = 0.54293441772461,
        }, 10)

        TriggerEvent(triggerName('makePointOnTarget'), {
            x = 0.21551513671875,
            y = 0.51041793823242,
        }, -1)

        TriggerEvent(triggerName('makePointOnTarget'), {
            x = -0.18023681640625,
            y = 0.48887825012207,
        }, -1)
        --]]
    end
end)

RegisterNetEvent(triggerName("PlayerHitTarget"), function(gunrangeIndex, score, newCoords)
    if Config.Debug then
        --print(gunrangeIndex, score, newCoords.x, newCoords.y)
    end
end)

RegisterNetEvent(triggerName('useSlot'), function(slotId, ammoSlotId)
    if isResourceLoaded(Inventory.OX) then
        if slotId == nil then return end
        exports[Inventory.OX]:useSlot(slotId)
        if ammoSlotId == nil then return end
        Citizen.Wait(100)
        exports[Inventory.OX]:useSlot(ammoSlotId)
    end
end)

RegisterNetEvent('esx:onPlayerLogout', function()
    toggleUIVisible(false)
end)
