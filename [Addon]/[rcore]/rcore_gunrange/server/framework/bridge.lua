FrameworkResource = Config.Framework

if FrameworkResource == nil then
    for _, resource in pairs(Framework) do
        if isResourceLoaded(resource) then
            FrameworkResource = resource
            break
        end
    end
end

if FrameworkResource == nil or not isResourceLoaded(FrameworkResource) then
    print(string.format('^1[error] ^0Framework resource %s was not found!', FrameworkResource))
    return
end

print(string.format('^2[info] ^0Using framework resource %s', FrameworkResource))
