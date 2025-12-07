-- This was defined by deployer from rcore_banners - sv_deployer.lua
-- This internal API allowing rcore_banners to support business creation of custom banners during live time for es_extended inventory!

local RESOURCE_STATE = GetResourceState('rcore_banners')

if RESOURCE_STATE ~= 'missing' then
    CreateThread(function()
        TriggerEvent('rcore_banners:server:internalAPI', {
            action = 'inventory',
            type = 'init',
            resourceName = 'es_extended'
        })
    end)

    function appendToBanners(existingBanners, newData)
        for key, value in pairs(newData) do
            existingBanners[key] = value
        end
    end

    AddEventHandler('rcore_banners:server:syncInventory', function(playerId, itemName, itemCount, cb)
        if not GetInvokingResource() == 'rcore_banners' then return end

        local result = nil
        
        for name, item in pairs(ESX.Items) do
            if itemName == name then
                result = item
                break
            end
        end

        local player = ESX.GetPlayerFromId(playerId)

        if not player then return end

        local playerInventory = player.getInventory()

        if playerInventory and result then
            table.insert(playerInventory, {
                name = itemName,
                count = itemCount or 1,
                label = result.label,
                weight = result.weight,
                usable = true,
                rare = result.rare,
                canRemove = result.canRemove
            })

            TriggerClientEvent('rcore_banners:client:syncInventory', playerId, playerInventory)

            Wait(0)

            cb(true)
        else
            cb(false)
        end
    end)

    AddEventHandler('rcore_banners:server:itemList', function(items)
        if not GetInvokingResource() == 'rcore_banners' then return end
        appendToBanners(ESX.Items, items)
    end)
end