CreateThread(function()
    for k, v in pairs(Businesses) do
        if v.enabled and v.shop then
            exports.ox_inventory:RegisterShop(v.shop.name, {
                name =  v.shop.label,
                inventory = v.shop.items,
                locations = {
                    vec3(v.shop.coords.x, v.shop.coords.y, v.shop.coords.z)
                },
            })
        end
    end
end)