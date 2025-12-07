if InventoryResource == Inventory.OX then
    Inventory.object = exports[InventoryResource]

    function Inventory.addItem(source, item, count)
        return Inventory.object:AddItem(source, item, count)
    end

    function Inventory.removeItem(source, item, count)
        return Inventory.object:RemoveItem(source, item, count)
    end

    function Inventory.addWeapon(source, item, ammo, ammoItemName)
        if ammoItemName == nil then
            print(string.format('^1[error] ^0Missing ammoItemName for weapon %s in config.lua', item))
            return false, nil, nil
        end

        local success, response = Inventory.addItem(source, item, 1)
        if not success then
            print(string.format('^1[error] ^0Failed to add weapon item %s to player %s with error: %s', item, source,
                response))
            return false, nil, nil
        end

        local firstItem = response[1]
        if firstItem == nil then
            firstItem = {}
        end

        local ammoSuccess, ammoResponse = Inventory.addItem(source, ammoItemName, ammo)
        if not ammoSuccess then
            print(string.format('^1[error] ^0Failed to add ammo item %s to player %s with error: %s', ammoItemName,
                source, ammoResponse))
            return false, firstItem.slot, nil
        end

        local firstAmmoItem = ammoResponse[1]
        if firstAmmoItem == nil then
            firstAmmoItem = {}
        end

        return true, firstItem.slot, firstAmmoItem.slot
        -- rentedWeapon(identifier, weaponName)
    end

    function Inventory.removeWeapon(source, item)
        return Inventory.object:RemoveItem(source, item, 1)
    end

    function Inventory.getLoadout(source)
        return Inventory.object:GetInventoryItems(source)
    end

    Citizen.CreateThread(function()
        Inventory.object:registerHook('openInventory', function(payload)
            if isPlayerShooting(payload.source) then
                return false
            end
        end)

        Inventory.object:registerHook('swapItems', function(payload)
            if isPlayerShooting(payload.source) then
                return false
            end
        end)
    end)

    AddEventHandler('onResourceStop', function(resource)
        if resource ~= GetCurrentResourceName() then return end
        Inventory.object:removeHooks()
    end)
end
