if InventoryResource == Inventory.ESX then
    if FrameworkResource ~= Framework.ESX then
        print(string.format('^1[error] ^0Inventory resource %s requires framework %s (ESX)!', InventoryResource,
            Framework.ESX))
        return
    end

    function Inventory.addWeapon(source, item, ammo)
        local player = Framework.object.GetPlayerFromId(source)
        if player == nil then return false, nil, nil end
        player.addWeapon(item, ammo)
        return true, nil, nil
    end

    function Inventory.removeWeapon(source, item)
        local player = Framework.object.GetPlayerFromId(source)
        if player == nil then return false end
        player.removeWeapon(item)
        return true
    end

    function Inventory.getLoadout(source)
        local player = Framework.object.GetPlayerFromId(source)
        if player == nil then return nil end
        return player.getLoadout()
    end
end
