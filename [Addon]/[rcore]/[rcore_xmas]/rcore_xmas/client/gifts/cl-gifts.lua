if not Config.Gifts.Enabled then return end

log.debug('Gifts enabled!')

RegisterNetEvent('rcore_xmas:gifts:openUnpacked', function()
    local stashId = string.format(GIFT_UNPACKED_INVENTORY_ID, getLocalIdentifier())
    Inventory.openInventory('stash', stashId, Config.Gifts.Inventory.Slots, Config.Gifts.Inventory.MaxWeight)
end)

RegisterNetEvent('rcore_xmas:gifts:packSlot', function(slot)
    log.error('Deprecated event rcore_xmas:gifts:packSlot called! Use rcore_xmas:gifts:pack instead.')
end)

RegisterCommand(Config.Gifts.Command, function(client, args)
    local nametag = table.concat(args, ' ')
    TriggerServerEvent('rcore_xmas:gifts:pack', nametag)
end, false)

RegisterNetEvent('rcore_xmas:gifts:nametag', function(slot)
    local input = lib.inputDialog(Locales.translate('GIFTS_NAMETAG_INPUT_OX'), {
        { type = 'input', label = Locales.translate('GIFTS_NAMETAG_TITLE'), description = Locales.translate('GIFTS_NAMETAG_DESCRIPTION') }
    })

    if isBridgeLoaded('Inventory', Inventory.OX) then
        exports[Inventory.OX]:closeInventory()
        Citizen.Wait(500)
    end

    TriggerServerEvent('rcore_xmas:gifts:pack', input[1], slot)
end)
