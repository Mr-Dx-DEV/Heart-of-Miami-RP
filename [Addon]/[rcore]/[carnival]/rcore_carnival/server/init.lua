SharedObject = GetSharedObject()

UsableItems = Config.UsableItems

RegisterNetEvent(TriggerName("loadPerms"), function()
    local source = source

    TriggerClientEvent(TriggerName("loadPerms"), source, "command.carnivaleditor", IsPlayerInGroup(source, Config.CommandPermissions["carnivaleditor"], "command.carnivaleditor"))

    TriggerClientEvent(TriggerName("blockEvent"), source)
end)

RegisterCommand("carnivalversion", function()
    print("Carnival version: ", GetResourceMetadata(GetCurrentResourceName(), "version"))
end, false)