if Config.Prefrences.UseThirdPartyLockpick then return end

local runningRahe = GetResourceState('rahe-boosting') == 'started'

RegisterNetEvent('lockpicks:UseLockpick', function(advanced, slot)
	local coords = GetEntityCoords(cache.ped)
	--local vehicle = lib.getClosestVehicle(coords, 5, true)
	local vehicle = GetClosestVehicle(coords, 5, true)
	--if not vehicle then return NotifyPlayer(locale("LockPick.ToFarFromVehicle"), "error") end -- this should help with housing system overlap
    if cache.vehicle then return NotifyPlayer(locale("LockPick.InsideVehicle"), "error") end
	if not vehicle then return end
    if HijackImmune(vehicle) then return NotifyPlayer(locale("LockPick.VehicleIsHijackImmune"), "error") end
    if NetworkGetEntityIsNetworked(vehicle) and Entity(vehicle).state.ignoreLocks then return NotifyPlayer(locale("LockPick.VehicleIsLocked"), "error") end

    if CheckForBlackListedVehicles(vehicle) then return end

    if runningRahe then
        -- Based on Rahes docs, this should work. I dont own a copy to test it though.
        local identifier = Bridge.Framework.GetPlayerIdentifier()
        local boostingInfo = Entity(vehicle).state.boostingData
        if boostingInfo ~= nil and ((not boostingInfo.groupIdentifiers and boostingInfo.cid ~= identifier) or (boostingInfo.groupIdentifiers and not boostingInfo.groupIdentifiers[identifier])) then
            NotifyPlayer("This Vehicle Is not Meant For You", "error")
            return
        end

        if boostingInfo ~= nil and boostingInfo.advancedSystem then
            NotifyPlayer("This vehicle requires more advanced systems!", "error")
            return
        end
    end

    if HasKeysForVehicle(vehicle) then return NotifyPlayer(locale("LockPick.YouAlreadyHaveKeys"), "error") end

    local lockstatus = GetVehicleDoorLockStatus(vehicle)
    if not lockstatus == 2 then return NotifyPlayer(locale("LockPick.VehicleAlreadyUnlocked"), "error") end

	local distance = #(coords - GetEntityCoords(vehicle))
	if distance > 5 then return NotifyPlayer(locale("LockPick.ToFarFromVehicle"), "error") end
    local plate = GetVehicleNumberPlateText(vehicle)
    local trimmed = TrimString(plate)
    local chanceToAlert = Config.Prefrences.LockpickAlertChance
    local chanceToDispatch = math.random(1, 100)

    if chanceToAlert > chanceToDispatch then
        SendDispatchAlert(vehicle, "lockpick")
    end
    CreateThread(function()
        PlayLockpickingAnimation(vehicle)
    end)
    local minigame = BeginLockPickMiniGame(vehicle, advanced)
    if minigame then
        lib.callback.await('MrNewb_VehicleKeysV2:Server:LockPickedVehicle', false, NetworkGetNetworkIdFromEntity(vehicle), trimmed)
    else
        NotifyPlayer(locale("LockPick.Fail"), "error")
    end
    local animDict = Config.AnimationSettings.animDict
    local anim = Config.AnimationSettings.anim
    local isPlaying = IsEntityPlayingAnim(cache.ped, animDict, anim, 3)
	if isPlaying then
		StopEntityAnim(cache.ped, anim, animDict, 1.0)
		RemoveAnimDict(animDict)
	end
    local chanceToBreak = Config.Prefrences.LockpickBreakChance
    local chanceToBeat = math.random(1, 100)
    if chanceToBreak < chanceToBeat then
        TriggerServerEvent('MrNewb_VehicleKeysV2:Server:RemoveLockpick', advanced, slot)
    end
end)