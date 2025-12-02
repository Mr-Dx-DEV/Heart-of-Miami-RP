StoredPlayerPed = nil

function PreventActionRiding()
	if StoredPlayerPed then
		Notify(L("ActionImpossibleRiding"))
		return true
	end
	return false
end

function StopRiding(pet)
	if not StoredPlayerPed then
		return
	end

	local prePedHealth = GetEntityHealth(StoredPlayerPed)
	local prePedArmour = GetPedArmour(StoredPlayerPed)

	pet.action = ""
	pet.petId = PlayerPedId()

	local index = GetIndexByPetId(pet.petId)

	DetachEntity(StoredPlayerPed, true, true)
	ChangePlayerPed(PlayerId(), StoredPlayerPed, true, false)

	CreateThread(function()
		Wait(1000)
		SetEntityHealth(PlayerPedId(), prePedHealth)
		SetPedArmour(PlayerPedId(), prePedArmour)
	end)

	ClearPedTasksImmediately(StoredPlayerPed)
	ClearPedTasksImmediately(PlayerPedId())

	SetPedFleeAttributes(pet.petId, 0, false)
	SetPedFleeAttributes(StoredPlayerPed, 0, false)

	SetBlockingOfNonTemporaryEvents(pet.petId, true)
	SetBlockingOfNonTemporaryEvents(StoredPlayerPed, true)

	ReloadPed()

	if Config.TargetSystem ~= "none" then
		exports[Config.TargetSystem]:RemoveTargetEntity(pet.petId)
	end

	HideHelpText()

	DeletePet(pet)
	StoredPlayerPed = nil
	SpawnPet(pet)
end

local stopRiding = false

local stopRidingKey = lib.addKeybind({
	name = "stop_riding",
	description = "Stop Riding",
	defaultKey = Config.KeyActions.stopRiding,
	onPressed = function(self)
		stopRiding = true
	end,
	onReleased = function(self)
		stopRiding = false
	end,
})

function StartRiding(pet)
	if Config.EnableControlledRiding then
		return StartRidingControlling(pet)
	end

	local variation = pet.variation
	local prePedHealth = GetEntityHealth(PlayerPedId())

	RequestModel(pet.model)
	while not HasModelLoaded(pet.model) do
		Wait(10)
	end

	RequestAnimDict("rcmjosh2")
	while not HasAnimDictLoaded("rcmjosh2") do
		Wait(0)
	end

	local ped = PlayerPedId()
	local playerPed = ClonePed(ped, true, true, false)

	DeleteEntity(pet.petId)
	SetPlayerModel(PlayerId(), GetHashKey(pet.model)) -- Set the player model to the pet model

	SetModelAsNoLongerNeeded(pet.model)
	SetEntityAsMissionEntity(playerPed, true, true)

	SetBlockingOfNonTemporaryEvents(PlayerPedId(), true)
	TaskSetBlockingOfNonTemporaryEvents(PlayerPedId(), true)
	SetPedKeepTask(PlayerPedId(), true)
	SetPedFleeAttributes(PlayerPedId(), 0, false)
	NetworkRegisterEntityAsNetworked(PlayerId())
	SetPedComponentVariation(PlayerPedId(), variation.componentId, 0, variation.textureId, 0)

	local ridingOffsets = Config.RidingOffsets[pet.model]
		or { offset = vector3(-0.3, 0.0, 0.3), rot = vector3(0.0, 0.0, 90.0) }

	AttachEntityToEntity(
		playerPed,
		PlayerPedId(),
		GetPedBoneIndex(PlayerPedId(), 24816),
		ridingOffsets.offset,
		ridingOffsets.rot,
		false,
		false,
		false,
		true,
		2,
		true
	)

	TaskPlayAnim(playerPed, "rcmjosh2", "josh_sitting_loop", 8.0, 1, -1, 2, 1.0, false, false, false)

	pet.action = "riding"
	StoredPlayerPed = playerPed

	SetEntityAsMissionEntity(playerPed, true, true)
	SetBlockingOfNonTemporaryEvents(playerPed, true)
	SetPedFleeAttributes(playerPed, 0, false)
	NetworkRegisterEntityAsNetworked(PlayerId())

	SetEntityHealth(playerPed, prePedHealth)

	CreateThread(function()
		local fallingOffTimer = 0

		HelpText(L("toStopRiding", { key = Config.KeyActions.stopRiding }))

		while pet.action == "riding" do
			Wait(0)
			if pet then
				DisableControlAction(0, 23, true)
				DisableControlAction(0, 24, true)
				DisableControlAction(0, 25, true)

				if Config.RidingClearEveryFrame then
					ClearPedTasks(PlayerPedId())
				else
					if
						GetScriptTaskStatus(PlayerPedId(), 0x87B9A382) ~= 7
						or GetScriptTaskStatus(PlayerPedId(), "SCRIPT_TASK_START_SCENARIO_IN_PLACE") ~= 7
						or GetScriptTaskStatus(PlayerPedId(), 0x8ECCBFB3) ~= 7
					then
						ClearPedTasksImmediately(PlayerPedId())
					end
				end

				if stopRiding then
					stopRiding = false
					StopRiding(pet)
					break
				end

				if pet.skills.obedience < 5 and (GetGameTimer() - fallingOffTimer) > 240 * 1000 then
					local rand = math.random(1, 100)
					local val = (5 - pet.skills.obedience) * 10
					fallingOffTimer = GetGameTimer()

					if rand < val then
						HideHelpText()
						Notify(L("youGotKickedOff"))
						StopRiding(pet)
						SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
						break
					end
				end

				if IsPedRagdoll(pet.petId) then
					StopRiding(pet)
					SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
					break
				end
			end
		end

		StopRiding(pet)

		for i = 1, #CurrentPets do
			Follow(CurrentPets[i])
		end
	end)
end

function StartRidingControlling(pet)
	local ridingOffsets = Config.RidingOffsets[pet.model]
		or { offset = vector3(-0.3, 0.0, 0.3), rot = vector3(0.0, 0.0, 90.0) }

	RequestAnimDict("rcmjosh2")
	while not HasAnimDictLoaded("rcmjosh2") do
		Wait(0)
	end

	AttachEntityToEntity(
		PlayerPedId(),
		pet.petId,
		GetPedBoneIndex(pet.petId, 24816),
		ridingOffsets.offset,
		ridingOffsets.rot,
		false,
		false,
		false,
		true,
		2,
		true
	)
	TaskPlayAnim(PlayerPedId(), "rcmjosh2", "josh_sitting_loop", 8.0, 1, -1, 2, 1.0, false, false, false)
	SetPedKeepTask(PlayerPedId(), true)

	pet.action = "riding"

	CreateThread(function()
		local fallingOffTimer = 0
		HelpText(L("toStopRiding", { key = Config.KeyActions.stopRiding }))

		while pet.action == "riding" do
			Wait(0)
			if pet then
				local xNormal, yNormal = GetControlNormal(2, 218), GetControlNormal(2, 219)
				local speed, range = 2.0, 4.0

				if IsControlPressed(0, 21) then
					speed = 3.0
					range = 8.0
				end

				if stopRiding then
					stopRiding = false
					StopRidingControlling(pet)
					break
				end

				if pet.skills.obedience < 5 and (GetGameTimer() - fallingOffTimer) > 240 * 1000 then
					fallingOffTimer = GetGameTimer()

					local rand = math.random(1, 100)
					local val = (5 - pet.skills.obedience) * 10

					if rand < val then
						HideHelpText()
						Notify(L("youGotKickedOff"))
						StopRidingControlling(pet)
						SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
						break
					end
				end

				if IsPedRagdoll(pet.petId) then
					StopRidingControlling(pet)
					SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
					break
				end

				local offset = GetOffsetFromEntityInWorldCoords(pet.petId, xNormal * range, yNormal * -1.0 * range, 0.0)

				TaskLookAtCoord(pet.petId, offset.x, offset.y, offset.z, 0, 0, 2)
				TaskGoStraightToCoord(pet.petId, offset.x, offset.y, offset.z, speed, 20000, 40000.0, 0.5)
			end
		end
		StopRidingControlling(pet)
	end)
end

function StopRidingControlling(pet)
	pet.action = "follow"

	HideHelpText()
	ClearPedTasksImmediately(PlayerPedId())
	DetachEntity(PlayerPedId(), true, true)
end
