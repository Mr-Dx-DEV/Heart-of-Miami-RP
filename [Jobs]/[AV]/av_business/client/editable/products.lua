RegisterNetEvent("av_business:products", function(data)
    local type = data['zoneType']
    if not type then warn("av_business:products received null instead of type") return end
    local job = data['zoneJob']
    if not job then warn("av_business:products received null instead of job") return end
    local products = lib.callback.await('av_business:getProducts', false, type, job)
    local inventory = exports['av_laptop']:getInventoryPath()
    local options = {}
    for _, v in pairs(products) do
        local ingredientsLabel = ""
        if v['ingredients'] and v['ingredients'][1] then
            for k, ingredient in pairs(v['ingredients']) do
                if tonumber(k) == 1 then
                    ingredientsLabel = getItemLabel(ingredient)
                else
                    ingredientsLabel = ingredientsLabel.." | "..getItemLabel(ingredient)
                end
            end
        end
        local description = v['description']
        if string.len(ingredientsLabel) > 1 then
            description = Lang['ingredients']..": "..ingredientsLabel
        end
        local image = (v['image'] and string.len(v['image']) > 1 and v['image']) or ("https://cfx-nui-"..inventory..v['name']..".png") or false
        dbug("Item, image", v['name'], image)
        options[#options+1] = {
            title = v['label'],
            description = description,
            event = "av_business:craft",
            image = image,
            args = {
                item = v['name'],
                job = job,
                type = type,
                ingredients = v['ingredients'],
                label = v['label'],
                prop = v['prop'],
                description = v['description'],
            }
        }
    end
    exports['av_laptop']:registerContext({
        id = 'products',
        title = data['label'] or "Products",
        options = options,
    })
    exports['av_laptop']:showContext('products')
end)

function getItemLabel(name)
    if not name then return '' end
    local label = name
    for i = 1, #Config.Ingredients do
        local ingredient = Config.Ingredients[i]
        if name == ingredient.value then
            label = ingredient.label
            break
        end
    end
    return label:gsub("^%l", string.upper)
end