local ox_inventory = exports.ox_inventory
RegisterNetEvent('vl_businesses:registerstash', function (stashName, stashLabel, slots, maxWeight, coords)
    ox_inventory:RegisterStash(stashName, stashLabel, tonumber(slots), tonumber(maxWeight), false, false, coords)
end)