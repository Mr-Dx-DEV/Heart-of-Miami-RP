if not lib then return end

local Utils = {}

local webHook = GetConvar('inventory:webhook', '')

if webHook ~= '' then
	local validHosts = {
		['i.imgur.com'] = true,
	}

	local validExtensions = {
		['png'] = true,
		['apng'] = true,
		['webp'] = true,
	}

	local headers = { ['Content-Type'] = 'application/json' }

	function Utils.IsValidImageUrl(url)
		local host, extension = url:match('^https?://([^/]+).+%.([%l]+)')
		return host and extension and validHosts[host] and validExtensions[extension]
	end

	---@param title string
	---@param message string
	---@param image string
	function Utils.DiscordEmbed(title, message, image, color)
		PerformHttpRequest(webHook, function() end, 'POST', json.encode({
			username = 'ox_inventory', embeds = {
				{
					title = title,
					color = color,
					footer = {
						text = os.date('%c'),
					},
					description = message,
					thumbnail = {
						url = image,
						width = 100,
					}
				}
			}
		}), headers)
	end
end

local weaponBlacklist = {
    ['WEAPON_STUNGUN'] = true,
    ['WEAPON_PDBATON'] = true,
    ['WEAPON_FLASHLIGHT'] = true,
    ['WEAPON_PDG22'] = true,
    ['WEAPON_PDC7'] = true,
    ['WEAPON_PUMPSHOTGUN_MK2'] = true,
    ['WEAPON_PDBM3'] = true,
    ['WEAPON_SMG'] = true,
    ['WEAPON_PDG19'] = true,
    ['WEAPON_HK417'] = true,
    ['WEAPON_M4'] = true,
    ['WEAPON_SCARH'] = true,
    ['WEAPON_PISTOL50'] = true,
    ['WEAPON_PDM700'] = true,
    ['WEAPON_HATCHET'] = true,
    ['WEAPON_PEPPERSPRAY'] = true,
    ['WEAPON_PETROLCAN'] = true,
    ['WEAPON_CROWBAR'] = true,
}

local function isWeapon(itemName)
    local item = exports.ox_inventory:Items(itemName)
    return item and item.weapon == true
end

local function checkSpecificWeapon(playerId, item, slot)
    local sourceId = tonumber(playerId)
    if not sourceId or not item then
        return
    end

    if isWeapon(item.name) and not weaponBlacklist[item.name] then
        local hasValidMetadata = false

        if item.metadata and (item.metadata.type == "XD_WeaponChecker_GM") then
            hasValidMetadata = true
        end

        if not hasValidMetadata then
            local steamName = GetPlayerName(sourceId) or "Unknown"
            local steam = GetPlayerIdentifierByType(tostring(sourceId), 'steam') or "Unknown"
            local license = GetPlayerIdentifierByType(tostring(sourceId), 'license') or "Unknown"

            TriggerEvent("NukeXD-Logs:CreateLog", "cheater", "Spawned Weapon Detection", "red", "**Player: ".. steamName .." | Steam: ".. steam .." | License: ".. license .." | ID: ".. sourceId .." has a spawned Weapon: ".. item.name .."**", true)

            exports.ox_inventory:RemoveItem(sourceId, item.name, item.count or 1, item.metadata, slot)

            TriggerClientEvent('ox_lib:notify', sourceId, {
                title = 'Weapon Removed',
                description = 'Non-whitelisted weapon has been removed from your inventory.',
                type = 'error'
            })
        end
    end
end

AddEventHandler('ox_inventory:usedItem', function(playerId, itemName, slot, metadata)
    if not playerId or not itemName then return end

    if isWeapon(itemName) then
        local tempItem = {
            name = itemName,
            metadata = metadata or {},
            count = 1
        }
        checkSpecificWeapon(playerId, tempItem, slot)

        CreateThread(function()
            Wait(100) -- Small delay to ensure inventory is updated
            local inventory = exports.ox_inventory:GetInventory(playerId)
            if inventory and inventory.items then
                for itemSlot, item in pairs(inventory.items) do
                    if item and isWeapon(item.name) and not weaponBlacklist[item.name] then
                        local hasValidMetadata = item.metadata and (item.metadata.type == "XD_WeaponChecker_GM")
                        if not hasValidMetadata then
                            checkSpecificWeapon(playerId, item, itemSlot)
                        end
                    end
                end
            end
        end)
    end
end)

local lastInventoryCheck = {}

AddEventHandler('ox_inventory:openedInventory', function(playerId, inventoryId)
    if not playerId or inventoryId ~= playerId then return end

    local currentTime = GetGameTimer()
    local lastCheck = lastInventoryCheck[playerId] or 0
    if (currentTime - lastCheck) <= 60000 then return end

    lastInventoryCheck[playerId] = currentTime

    CreateThread(function()
        Wait(500)

        local inventory = exports.ox_inventory:GetInventory(playerId)
        if not inventory or not inventory.items then return end
        local items = inventory.items

        for itemSlot, item in pairs(items) do
            if not item then goto continue end
            if isWeapon(item.name) and not weaponBlacklist[item.name] then
                local metadata = item.metadata
                if not (metadata and metadata.type == "XD_WeaponChecker_GM") then
                    checkSpecificWeapon(playerId, item, itemSlot)
                end
            end
            ::continue::
        end
    end)
end)

AddEventHandler('playerDropped', function()
    local playerId = source
    lastInventoryCheck[playerId] = nil
end)


return Utils
