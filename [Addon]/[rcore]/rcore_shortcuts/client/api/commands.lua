RegisterCommand(Config.Commands.KEYBOARD, function()
    setIsKeyboardVisible(true)
end)
TriggerEvent('chat:addSuggestion', string.format('/%s', Config.Commands.KEYBOARD), 'Open Shortcuts Keyboard')

RegisterCommand(Config.Commands.OVERVIEW, function()
    setIsOverviewVisible(true)
end)
TriggerEvent('chat:addSuggestion', string.format('/%s', Config.Commands.OVERVIEW), 'Open Shortcuts Overview')

function registerAdminCommand()
    RegisterCommand(Config.Commands.ADMIN, function()
        if isAdmin then
            setIsAdminVisible(true)
        end
    end)
    TriggerEvent('chat:addSuggestion', string.format('/%s', Config.Commands.ADMIN), 'Open Shortcuts Admin Panel')
end

if Config.DefaultShortcutsKeyboardHotkey then
    RegisterKeyMapping(Config.Commands.KEYBOARD, 'Open Shortcuts Keyboard', 'keyboard', Config.DefaultShortcutsKeyboardHotkey)
end

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    TriggerEvent('chat:removeSuggestion', string.format('/%s', Config.Commands.KEYBOARD))
    TriggerEvent('chat:removeSuggestion', string.format('/%s', Config.Commands.OVERVIEW))
    TriggerEvent('chat:removeSuggestion', string.format('/%s', Config.Commands.ADMIN))
end)