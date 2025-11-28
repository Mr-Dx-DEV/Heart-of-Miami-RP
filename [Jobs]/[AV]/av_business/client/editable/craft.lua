
RegisterNetEvent("av_business:craft", function(data)
    local ingredients = false
    if data['ingredients'] and data['ingredients'][1] then
        ingredients = {}
        for _, v in pairs(data['ingredients']) do
            ingredients[#ingredients+1] = {
                value = v,
                label = getItemLabel(v)
            }
        end
    end
    local max = Config.MaxItemsPerCraft[data['type']]
    local options = {{type = 'number', label = Lang['craft_amount'], required = true, max = max}}
    if ingredients then
        options[2] = {
           type = "multi-select",
           label = Lang['ingredients'],
           options = ingredients,
           searchable = true,
           required = true
        }
    end
    local input = exports['av_laptop']:inputDialog(data['label'], options)
    if input and input[1] > 0 then
        local continue = true
        if input[2] and Config.NeedsAllItems then
            continue = #ingredients == #input[2]
        end
        if continue then
            local canCook = lib.callback.await('av_business:hasItems', false, input[1], input[2], data['item'])
            if input[2] then
                if canCook then
                    startCrafting(data, input[1], input[2])
                else
                    TriggerEvent("av_laptop:notification", Lang['app_title'], Lang['missing_ingredients'], "error")
                    return
                end
            else
                startCrafting(data, input[1])
            end
        else
            TriggerEvent('av_laptop:notification', Lang['app_title'], Lang['missing_ingredients'], 'error')
        end
    end
end)

function startCrafting(data, amount, ingredients)
    local type = data['type']
    local settings = Config.Crafting[type] or {}
    if exports['av_laptop']:progressBar({
        duration = settings['duration'] or Config.CraftingTime,
        label = settings['label'] or Config.CraftingLabel,
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
        },
        anim = {
            dict = settings['dict'] or Config.CraftingDict,
            clip = settings['animation'] or Config.CraftAnimation
        },
        prop = {},
    }) then
        TriggerServerEvent("av_business:addItem", data, amount, ingredients)
    end
end