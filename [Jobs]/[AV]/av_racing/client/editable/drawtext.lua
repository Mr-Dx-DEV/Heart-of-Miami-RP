local textUI = {}

function DrawTextLib()
    if exports['av_laptop']:getUI() == "ox_lib" then
        exports['av_laptop']:hideTextUI()
        ClearTextUI()
        textUI[#textUI + 1] = (Lang['checkpoint']..': %s  \n'):format(#CreatorData.Checkpoints)
        textUI[#textUI + 1] = Config.EditorKeys['add']['Label']
        textUI[#textUI + 1] = Config.EditorKeys['distance']['Label']
        textUI[#textUI + 1] = Config.EditorKeys['delete']['Label']
        textUI[#textUI + 1] = Config.EditorKeys['cancel']['Label']
        textUI[#textUI + 1] = Config.EditorKeys['save']['Label']
        textUI[#textUI + 1] = Config.EditorKeys['rotate']['Label']
        textUI[#textUI + 1] = Config.EditorKeys['reset']['Label']
        exports['av_laptop']:showTextUI(table.concat(textUI))
    else
        local labels = {"add", "distance", "delete", "cancel", "save", "rotate", "reset"}
        local controls = {}
        for i=1,#labels do
            local key, text = parseMenuItem(Config.EditorKeys[labels[i]]['Label'])
            controls[i] = {label = text, keybind = key}
        end
        exports['av_laptop']:showTextUI((Lang['checkpoint']..': %s'):format(#CreatorData.Checkpoints), {
            title = "Circuit Editor",
            options = controls
        })
    end
end

function ClearTextUI()
    textUI = {}
end

function clearAll()
    exports['av_laptop']:hideTextUI()
    redrawBlips()
end

function parseMenuItem(input)
    if not input then return nil, nil end
    local key, text = string.match(input, "^(%S+)%s*-%s*(.-)%s*$")
    if key and text then
        return key, text
    end
    return nil, input
end