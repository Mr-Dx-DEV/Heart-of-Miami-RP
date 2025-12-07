if InventoryResource == Inventory.QB then
    if FrameworkResource ~= Framework.QBCore then
        print(string.format('^1[error] ^0Inventory resource %s requires framework %s (QBCore)!', InventoryResource,
            Framework.QBCore))
        return
    end

    function Inventory.addItem(source, item, count)
        local player = Framework.object.Functions.GetPlayer(source)
        if player == nil then return false end
        player.Functions.AddItem(item, count)
        return true
    end

    function Inventory.removeItem(source, item, count)
        local player = Framework.object.Functions.GetPlayer(source)
        if player == nil then return false end
        player.Functions.RemoveItem(item, count)
        return true
    end

    function Inventory.addWeapon(source, item, ammo, ammoitemName)
        local player = Framework.object.Functions.GetPlayer(source)
        if player == nil then
            return false, nil, nil
        end
        local success = Inventory.addItem(source, item, 1)
        if not success then
            print(string.format('^1[error] ^0Failed to add weapon item %s to player %s with error: player is nil', item,
                source))
            return false, nil, nil
        end

        local ammoSuccess = Inventory.addItem(source, ammoitemName, ammo)
        if not ammoSuccess then
            print(string.format('^1[error] ^0Failed to add ammo item %s to player %s with error: player is nil',
                ammoitemName, source))
            return false, nil, nil
        end

        return true, nil, nil
    end

    function Inventory.removeWeapon(source, item)
        return Inventory.removeItem(source, item, 1)
    end

    function Inventory.getLoadout(source)
        local player = Framework.object.Functions.GetPlayer(source)
        if player == nil then return nil end
        return player.PlayerData.items or {}
    end
end
