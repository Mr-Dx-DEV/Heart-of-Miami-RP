if GetResourceState("ox_inventory") ~= "started" then return end

exports.ox_inventory:registerHook('swapItems', function(payload)
    local src = payload.source
    if payload.toType == "player" and payload.fromType == "player" then
        if type(payload.toSlot) == "table" and payload.toSlot.name == Config.ItemBasedSettings.keyRingItem then
            AddToKeyRing(src, payload.fromSlot, payload.toSlot.slot)
        end
    end
    return true
end, {
    itemFilter = {
        [Config.ItemBasedSettings.vehicleKeysItem] = true,
    },
})

RegisterNetEvent("MrNewbVehicleKeys_v2:Server:DestroyKey", function(slot)
    local src = source
    Bridge.Inventory.RemoveItem(src, Config.ItemBasedSettings.vehicleKeysItem, 1, slot, nil)
end)

RegisterNetEvent("MrNewbVehicleKeys_v2:Server:RenameKeyring", function(slot, newlabel)
    local src = source
    local slotData = Bridge.Inventory.GetItemBySlot(src, slot)
    if type(slotData) ~= "table" then return end
    slotData.metadata.label = newlabel
    Bridge.Inventory.SetMetadata(src, slotData.name, slot, slotData.metadata)
end)