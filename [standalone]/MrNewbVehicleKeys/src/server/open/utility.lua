RegisterNetEvent('MrNewbVehicleKeys:Server:SendLog', function(data)
	local src = source
	local identifier = Bridge.Framework.GetPlayerIdentifier(src)
	Bridge.Utility.SendLog(src, "Player:  | ID#" .. src .. " | "..identifier.." | ".. data)
end)

RegisterNetEvent("MrNewb_VehicleKeysV2:Server:RemoveLockpick", function(lockPickType, slot)
	local src = source
	if not src then return DoDebugPrint("ERROR: RemoveLockpick No Source") end
	--If you want the advanced lockpicks to remove then uncomment out this stuff
	--if lockPickType then
		--Bridge.Inventory.RemoveItem(src, Config.ItemBasedSettings.advancedlockpickItemName, 1, slot, nil)
	--else
		Bridge.Inventory.RemoveItem(src, Config.ItemBasedSettings.lockpickItemName, 1, slot, nil)
	--end
end)

function RemoveAccountBalance(src, account, price)
	return Bridge.Framework.RemoveAccountBalance(src, account, price)
end

function GetAccountBalance(src, account)
	return Bridge.Framework.GetAccountBalance(src, account)
end

function NotifyPlayer(src, message, _type)
    if not _type then _type = "success" end
	return Bridge.Notify.SendNotify(src, message, _type, 6000)
end

function GetPlayerIdentifier(src)
	return Bridge.Framework.GetPlayerIdentifier(src)
end