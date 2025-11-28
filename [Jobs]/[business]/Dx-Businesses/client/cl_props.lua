function CreateBusinessProp(data, freeze, synced)
    local time = 1000
    if not HasModelLoaded(data.prop) then
	while not HasModelLoaded(data.prop) do
        if time > 0 then
            time = time - 1 RequestModel(data.prop) Wait(0)
		else
            time = 1000
            break
            end
		Wait(10)
        end
    end

    local prop = CreateObject(data.prop, data.coords.x, data.coords.y, data.coords.z-1.03, synced or false, synced or false, false)
    SetEntityHeading(prop, data.coords.w + 180.0)
    FreezeEntityPosition(prop, freeze and freeze or 0)
	SetModelAsNoLongerNeeded(data.prop)
	return prop
end

local Props = {}

for k, v in pairs(Businesses) do
    if v.enabled and v.props.enabled then
            for _, coords in pairs(v.props.coords) do
                Props[#Props+1] = CreateBusinessProp({prop = v.props.prop, coords = coords }, true, false)
            end
    end
end

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() or not LocalPlayer.state.isLoggedIn then return end
    for _, v in pairs(Props) do SetModelAsNoLongerNeeded(GetEntityModel(v)) DeleteObject(v) end
end)