local function HandleRingUse_OxInventory(source, itemName, slot)
    local hasItem = Inventory.GetItemCount(source, itemName)
    
    if not hasItem or hasItem < 1 then
        return
    end

    local success = lib.callback.await('dynyx-rings:client:useRing', source, itemName)
    
    if success then
        local removed = Inventory.RemoveItem(source, itemName, 1, slot)
        if removed then
            TriggerClientEvent('dynyx-rings:client:applyBuff', source, itemName)
        end
    end
end

local function HandleRingUse_Standard(source, item)
    local itemName = item.name
    local slot = item.slot
    local hasItem = Inventory.GetItemCount(source, itemName)
    
    if not hasItem or hasItem < 1 then
        return
    end

    local success = lib.callback.await('dynyx-rings:client:useRing', source, itemName)
    
    if success then
        local removed = Inventory.RemoveItem(source, itemName, 1, slot)
        if removed then
            TriggerClientEvent('dynyx-rings:client:applyBuff', source, itemName)
        end
    end
end

for itemName, ringData in pairs(Config.Rings) do
    if Inventory.Name == 'ox_inventory' then
        Inventory.RegisterUsableItem(itemName, function(event, item, inventory, slot, data)
            local source = nil
            if inventory and inventory.id then
                source = inventory.id
            elseif type(event) == 'number' then
                source = event
            end
            
            if source then 
                HandleRingUse_OxInventory(source, itemName, slot)
            end
        end)
    else
        Inventory.RegisterUsableItem(itemName, function(source, item)
            HandleRingUse_Standard(source, item)
        end)
    end
end