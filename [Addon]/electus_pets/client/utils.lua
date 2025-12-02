function GetClosestEntity(coords)
	local ped, dist = GetClosestPedDist(coords)
	local veh, vehDist = GetClosestVehicleDist(coords)
	local entity, realDist = nil, 0.0

	if veh and ped then
		if dist > vehDist then
			realDist = vehDist
			entity = veh
		else
			realDist = dist
			entity = ped
		end
	elseif veh then
		realDist = vehDist
		entity = veh
	elseif ped then
		realDist = dist
		entity = ped
	end

	return entity, realDist
end

function Notify(msg)
	lib.notify({ description = msg })
end

function GetClosePets(dist)
	local closePets = {}
	local pedCoords = GetEntityCoords(PlayerPedId())
	for i = 1, #CurrentPets do
		if #(GetEntityCoords(CurrentPets[i].petId) - pedCoords) < dist then
			closePets[#closePets + 1] = CurrentPets[i]
		end
	end
	return closePets
end

function GetClosestPet()
	local pet, closest = 0, 999
	for i = 1, #CurrentPets do
		local petCoords = GetEntityCoords(CurrentPets[i].petId)
		local pedCoords = GetEntityCoords(PlayerPedId())
		if #(petCoords - pedCoords) < closest then
			pet = i
			closest = #(petCoords - pedCoords)
		end
	end
	return closest, pet
end

function GetWorldCoordsFromScreen()
	local camCoords = GetFinalRenderedCamCoord()
	local rot = GetFinalRenderedCamRot(2)
	local dir = RotToDir(rot)
	local endPoint = camCoords + dir * 75
	local raycast = StartExpensiveSynchronousShapeTestLosProbe(
		camCoords.x,
		camCoords.y,
		camCoords.z,
		endPoint.x,
		endPoint.y,
		endPoint.z,
		1,
		PlayerPedId(),
		4
	)
	local result, hit, coords = GetShapeTestResult(raycast)

	return coords
end

function RotToDir(rot)
	return vector3(
		-math.sin((math.pi / 180) * rot.z) * math.abs(math.cos((math.pi / 180) * rot.x)),
		math.cos((math.pi / 180) * rot.z) * math.abs(math.cos((math.pi / 180) * rot.x)),
		math.sin((math.pi / 180) * rot.x)
	)
end

function GetClosestPedDist(coords)
	local closestPed, dist = 0, 0.0
	local peds = GetGamePool("CPed")

	for i = 1, #peds do
		local distanceCheck = #(coords - GetEntityCoords(peds[i]))
		if dist == 0.0 then
			dist = distanceCheck
		end
		if dist > distanceCheck then
			local found = false
			for j = 1, #CurrentPets do
				if CurrentPets[j].petId == peds[i] or peds[i] == PlayerPedId() then
					found = true
					break
				end
			end
			if found == false then
				closestPed = peds[i]
				dist = distanceCheck
			end
		end
	end
	return closestPed, dist
end

function GetClosestVehicleDist(coords)
	local closestVehicle, dist = 0, 0.0
	local vehicles = GetGamePool("CVehicle")

	for i = 1, #vehicles do
		local distanceCheck = #(coords - GetEntityCoords(vehicles[i]))
		if dist == 0.0 then
			closestVehicle = vehicles[i]
			dist = distanceCheck
		end
		if dist > distanceCheck then
			closestVehicle = vehicles[i]
			dist = distanceCheck
		end
	end
	return closestVehicle, dist
end

function trim(string)
	return (string:gsub("^%s*(.-)%s*$", "%1"))
end

function LoadModel(model)
	local hash = GetHashKey(model)

	RequestModel(hash)
	while not HasModelLoaded(hash) do
		Wait(0)
	end
end

function LoadDict(Dict)
	while not HasAnimDictLoaded(Dict) do
		Wait(0)
		RequestAnimDict(Dict)
	end

	return Dict
end

function LoadAnim(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Wait(0)
	end
end

function ToggleNuiFrame(shouldShow)
	SetNuiFocus(shouldShow, shouldShow)
	SetNuiFocusKeepInput(false)
	SendReactMessage("setVisible", shouldShow)
end

function SendReactMessage(action, data)
	SendNUIMessage({
		action = action,
		data = data,
	})
end

function HelpText(text, type)
	lib.showTextUI(text, type)
end

function HideHelpText()
	lib.hideTextUI()
end
