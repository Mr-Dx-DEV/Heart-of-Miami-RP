lib.callback.register("vl_businesses:craft", function(source, item, ingredients, amount)
    local itemsRemoved = {}
    local allItemsRemoved = true
    if not next(ingredients) then
        exports.ox_inventory:AddItem(source, item, amount)
        return true
    end
    for k, v in pairs(ingredients) do
        if v > 0 then
            if exports.ox_inventory:RemoveItem(source, k, (v * amount)) then
                itemsRemoved[k] = v * amount
            else
                allItemsRemoved = false
                break
            end
        end
    end

    if allItemsRemoved then
        -- Add the crafted item to the player's inventory
        if exports.ox_inventory:AddItem(source, item, amount) then
            return true
        else
            -- If the crafted item could not be added, add back the items that were removed
            for k, v in pairs(itemsRemoved) do
                exports.ox_inventory:AddItem(source, k, v)
            end
            return false
        end
    else
        -- If not all items were removed, add back the items that were removed
        for k, v in pairs(itemsRemoved) do
            exports.ox_inventory:AddItem(source, k, v)
        end
        return false
    end
end)