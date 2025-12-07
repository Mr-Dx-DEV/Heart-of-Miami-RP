givenWeapons = {}
savedPlayerWeapons = {}
function returnInventory(playerId)
    local identifier = Framework.getIdentifier(playerId)
    givenWeapons[identifier] = nil
    if savedPlayerWeapons[playerId] == nil then
        return
    end

    if InventoryResource == Inventory.OX then
        Inventory.object:ClearInventory(playerId)
        Inventory.object:ReturnInventory(playerId)
        savedPlayerWeapons[playerId] = nil
        return
    end

    for _, weapon in pairs(savedPlayerWeapons[playerId]) do
        Inventory.addWeapon(playerId, weapon.name, weapon.ammo)
    end
    savedPlayerWeapons[playerId] = nil
end

RegisterNetEvent(triggerName('leaveLine'), function(bullets, gunrangeIndex, boxIndex, targetIndex)
    local _source = source
    local points = 0;
    for i, v in pairs(bullets) do
        points = points + tonumber(v.hitPoints)
    end

    if Config.Debug then
        print(string.format(
            'Player %s leave line with points %s and target distance %s  - YOU CAN EDIT THIS AT server/framework/events.lua',
            GetPlayerName(_source), points, targetIndex))
    end

    returnInventory(_source)
end)

AddEventHandler(triggerName('joinLine'),
    function(source, gunrangeIndex, boxIndex, distanceIndex, rentPrice, gunHash, gunAmmo)
        savedPlayerWeapons[source] = nil
        --For example add discord notifiaction or anything
        if Config.Debug then
            print(string.format(
                'Player %s enter line and start shooting - YOU CAN EDIT THIS AT server/framework/events.lua',
                GetPlayerName(source)))
        end
    end)

RegisterNetEvent(triggerName("ClearPedWeapons"), function()
    local source = source
    if not isPlayerShooting(source) then
        print("Player is not shooting: ClearPedWeapons")
        return
    end

    savedPlayerWeapons[source] = Inventory.getLoadout(source)

    if InventoryResource == Inventory.OX then
        Inventory.object:ConfiscateInventory(source)
        return
    end

    for _, weapon in pairs(savedPlayerWeapons[source]) do
        Inventory.removeWeapon(source, weapon.name)
    end
end)

RegisterNetEvent(triggerName("GiveWeaponToPed"), function(weaponName, ammo, ammoItemName)
    local source = source
    if not isPlayerShooting(source) then
        print("Player is not shooting: GiveWeaponToPed")
        return
    end

    local identifier = Framework.getIdentifier(source)
    if givenWeapons[identifier] ~= nil then
        print("Player already have weapon: GiveWeaponToPed")
        return
    end

    local success, weaponSlot, ammoSlot = Inventory.addWeapon(source, weaponName, ammo, ammoItemName)
    if not success then
        return
    end

    TriggerClientEvent(triggerName('useSlot'), source, weaponSlot, ammoSlot)

    givenWeapons[identifier] = weaponName
end)

AddEventHandler('onResourceStop', function(resName)
    if resName ~= GetCurrentResourceName() then return end
    for playerId, _ in pairs(savedPlayerWeapons) do
        returnInventory(playerId)
    end
end)
