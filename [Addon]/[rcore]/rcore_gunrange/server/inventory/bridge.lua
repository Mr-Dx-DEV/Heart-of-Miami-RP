InventoryResource = Config.Inventory

if InventoryResource == nil then
    for _, resource in pairs(Framework) do
        if isResourceLoaded(resource) then
            InventoryResource = resource
            break
        end
    end
end

if InventoryResource == nil or not isResourceLoaded(InventoryResource) then
    print(string.format('^1[error] ^0Inventory resource %s was not found!', InventoryResource))
    return
end

print(string.format('^2[info] ^0Using inventory resource %s', InventoryResource))
