RegisterNetEvent('av_business:consumable', function(metadata, itemName) -- consumable items like drinks, joints, food
    local type = metadata['type']
    local ingredients = metadata['ingredients']
    local prop = metadata['prop']
    dbug("av_business:consumable", itemName, type, prop, json.encode(ingredients))
    local completed = doAnimation(prop)
    if completed and type then
        useEffects(ingredients, type, itemName)
    end
end)

RegisterNetEvent("av_business:box", function(metadata) -- boxes
    if not metadata or (not metadata.serial) then
        dbug("av_business:box received null instead of serial, make sure to craft the boxes using the business zones.")
        return
    end
    local name = metadata.serial
    local label = metadata.description or metadata.serial
    exports['av_laptop']:openStash(name, label, Config.Boxes['weight'], Config.Boxes['slots'])
end)