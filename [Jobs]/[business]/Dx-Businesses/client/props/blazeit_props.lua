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

local BlazeIt_Props = {}

BlazeIt_Props[#BlazeIt_Props+1] = CreateBusinessProp({prop = 'xm3_prop_xm3_lab_tray_01b', coords = vector4(368.7, -1268.47, 33.50, 230.50) }, true, false)
BlazeIt_Props[#BlazeIt_Props+1] = CreateBusinessProp({prop = 'xm3_prop_xm3_lab_tray_01b', coords = vector4(367.7, -1267.64, 33.50, 230.50) }, true, false)

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() or not LocalPlayer.state.isLoggedIn then return end
    for _, v in pairs(BlazeIt_Props) do SetModelAsNoLongerNeeded(GetEntityModel(v)) DeleteObject(v) end
end)