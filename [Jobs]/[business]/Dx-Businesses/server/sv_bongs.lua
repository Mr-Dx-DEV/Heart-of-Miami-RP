local QBCore = exports['qb-core']:GetCoreObject()

local useableBongItems = {"bong", "bong2", "bong3", "bong4" }  -- Add more if needed

for _, bongItem in ipairs(useableBongItems) do
    QBCore.Functions.CreateUseableItem(bongItem, function(source, item)
        TriggerClientEvent("vl_businesses:openBongMenu", source, item.name)
    end)
end


lib.callback.register("vl_businesses:craftBong", function(source, item, ingredients)
    if type(ingredients) ~= "table" then
        ingredients = {}
    end

    local itemsRemoved = {}
    local allRemoved = true

    if not next(ingredients) then
        return true
    end

    for k, v in pairs(ingredients) do
        if v > 0 then
            if exports.ox_inventory:RemoveItem(source, k, v) then
                itemsRemoved[k] = v
            else
                allRemoved = false
                break
            end
        end
    end

    if allRemoved then
        return true
    else
        for k, v in pairs(itemsRemoved) do
            exports.ox_inventory:AddItem(source, k, v)
        end
        return false
    end
end)

