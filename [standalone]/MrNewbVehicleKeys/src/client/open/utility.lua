function RequestLoadModel(model)
    return Bridge.Utility.LoadModel(model)
end

function CheckForBlackListedVehicles(vehicle)
    vehicle = tonumber(vehicle)
    if not DoesEntityExist(vehicle) then return false end
    local model = GetEntityModel(vehicle)
    if NetworkGetEntityIsNetworked(vehicle) then
        if Entity(vehicle).state.ignoreLocks then return true end
    end
    return Nokeyvehicles[model] ~= nil
end

function CreateEntityBlip(entity, blipname, color, sprite)
    local blip = AddBlipForEntity(entity)
    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, false)
    SetBlipScale(blip, 1.0)
    SetBlipSprite(blip, sprite)
    ShowHeadingIndicatorOnBlip(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(blipname)
    EndTextCommandSetBlipName(blip)
    return blip
end

function RequestAnimDict(dict)
    return Bridge.Utility.RequestAnimDict(dict)
end

function NotifyPlayer(message, _type)
    return Bridge.Notify.SendNotify(message, _type, 6000)
end

function ShowHelpText(message)
    return Bridge.Notify.ShowHelpText(message, Config.Prefrences.HelpTextPostion)
end

function HideHelpText()
    return Bridge.Notify.HideHelpText()
end
















































---------------- This is here to simplify usage for r-14 evidence users, if you dont use it just ignore it ----------------
local runningR14 = GetResourceState('r14-evidence') == 'started'
function R14EvidenceEvents(vehicle, _type)
    if not runningR14 then return end
    local plate = GetVehicleNumberPlateText(vehicle)
    if _type == "lockpicking" then
        TriggerServerEvent('evidence:server:CreateCarFingerprint', plate, "Driver Door Scratched Up")
        TriggerServerEvent('evidence:server:SetExteriorTamper', true, plate)
    elseif _type == "hotwiring" then
        TriggerServerEvent('evidence:server:CreateCarFingerprint', plate, "Vehicle Ignition Tampered With")
        TriggerServerEvent('evidence:server:SetIgnitionTamper', true, plate)
    end
end