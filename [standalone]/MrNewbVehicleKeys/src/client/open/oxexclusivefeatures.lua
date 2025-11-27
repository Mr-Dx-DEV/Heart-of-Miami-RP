if GetResourceState("ox_inventory") ~= "started" then return end

function DestroyKey(slot)
    TriggerServerEvent("MrNewbVehicleKeys_v2:Server:DestroyKey", slot)
end

function RenameKeyRing(slot)
    exports.ox_inventory:closeInventory()
    local input = lib.inputDialog('KeyRing Label', {'Input New Label'})
    if not input then return end
    TriggerServerEvent("MrNewbVehicleKeys_v2:Server:RenameKeyring", slot, input[1])
end

exports('DestroyKey', DestroyKey)
exports('RenameKeyRing', RenameKeyRing)