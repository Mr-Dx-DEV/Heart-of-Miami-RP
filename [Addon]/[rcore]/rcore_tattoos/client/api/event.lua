if Framework == Frameworks.ESX then
    AddEventHandler(Config.Events["esx:playerSpawned"], function()
        resetPedDecorations()
    end)
else
    AddEventHandler('playerSpawned', function()
        resetPedDecorations()
    end)
end

RegisterNetEvent(triggerName('setPedTattoos'))
AddEventHandler(triggerName('setPedTattoos'), function(ped, tattoos, disableClearCurrentTattoos)
    if not ped or not tattoos then
        dbg.critical('setPedTattoos called with invalid parameters: ped=%s, tattoos=%s', tostring(ped), tostring(tattoos))
        return
    end

    if type(tattoos) ~= 'table' then
        dbg.critical('setPedTattoos called with tattoos that is not a table: %s', tostring(tattoos))
        return
    end

    if not disableClearCurrentTattoos then
        ClearPedDecorations(ped)
    end

    for _, tattoo in pairs(tattoos) do
        local tData = getTattooData(tattoo.identifier, ped)

        if tData then
            local opacity = 1

            if Config.UseOpacity then
                opacity = tattoo.opacity or Config.DefaultOpacity
            end

            for i = 1, (opacity) do
                if tData.CollectionHash and tData.NameHash then
                    AddPedDecorationFromHashes(ped, tData.CollectionHash, tData.NameHash)
                end
            end
        end
    end
end)
