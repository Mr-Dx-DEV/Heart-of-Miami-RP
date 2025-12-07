RegisterCommand('admintreedelete', function()
    if ObjectPlacer.IsPlacing then
        Framework.sendNotification(Locales.translate('TREES_BUILDING'), 'error')
        return
    end

    startRaycastSelection(
        {
            Config.Trees.Build.Models.Undecored,
            Config.Trees.Build.Models.Decored
        },
        5.0,
        function(entity, model, endCoords, distance, correctModel)
            if not correctModel then
                Framework.sendNotification(Locales.translate('TREES_ARCHETYPE'), 'error')
                return
            end

            local id = Entity(entity).state[TREE_ID_STATE_KEY]
            if id == nil or tonumber(id) < 1 then
                Framework.sendNotification(Locales.translate('TREES_NO_TREE'), 'error')
                return
            end

            TriggerServerEvent('rcore_xmas:trees:adminDeleteTree', id)
        end,
        function()
            Framework.sendNotification(Locales.translate('TREES_ADMIN_CANCELLED'), 'error')
        end
    )
end, Config.AcePermsInsteadOfFramework)
