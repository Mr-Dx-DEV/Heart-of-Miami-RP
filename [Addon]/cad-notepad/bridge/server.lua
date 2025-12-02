if Config.Inventory == 'ox_inventory' then

    local ox_inventory = exports.ox_inventory

    exports('useItem', function(event, item, inventory, slot, _)
        if event == 'usingItem' then
            if item.name == 'notepad' or item.name == 'notepad_slip' then
                local metadata = ox_inventory:GetSlot(inventory.id, slot)?.metadata
                UseItem(inventory.id, metadata)
                return false
            end
        end
    end)

    function AddNote(source, data)
        ox_inventory:AddItem(source, 'notepad_slip', 1, data)
    end

elseif Config.Inventory == 'qb-inventory' or Config.Inventory == 'ps-inventory' or Config.Inventory == 'lj-inventory' then

    local QBCore = exports['qb-core']
    local qbinventory = exports[Config.Inventory]

    QBCore.Functions.CreateUseableItem('notepad', function(source, item)
        local metadata = item.info
        metadata.slot = item.slot
        UseItem(source, metadata)
    end)

    QBCore.Functions.CreateUseableItem('notepad_slip', function(source, item)
        local metadata = item.info
        metadata.slot = item.slot
        UseItem(source, metadata)
    end)

    function AddNote(source, data)
        qbinventory:AddItem(source, 'notepad_slip', 1, nil, data)
    end

elseif Config.Inventory == 'qs-inventory' then

    local qsinventory = exports['qs-inventory']

    qsinventory:CreateUseableItem('notepad', function(source, item)
        local metadata = item.info or item.metadata
        metadata.slot = item.slot
        UseItem(source, metadata)
    end)

    qsinventory:CreateUseableItem('notepad_slip', function(source, item)
        local metadata = item.info or item.metadata
        metadata.slot = item.slot
        UseItem(source, metadata)
    end)

    function AddNote(source, data)
        qsinventory:AddItem(source, 'notepad_slip', 1, nil, data)
    end

else
    print('This inventory is not supported, you can add support for it in `bridge/server.lua`')
end

function Logger(source, name, message, data)
    local webhook = ""
    local title = ('[%d] - %s - %s'):format(source, GetPlayerName(source), name)
    local headers = { ['Content-Type'] = 'application/json' }
    local _data = json.encode({
        username = "Cad Notepad",
        embeds = {
            {
                title = title,
                color = 10650848,
                author = {
                    name = "cadburry",
                },
                description = "\n** Message :** "..message.." \n **Data : ** "..json.encode(data).." ",
                footer = {
                    text = os.date('%c'),
                },
            }
        }
    })
    PerformHttpRequest(webhook, function() end, 'POST', _data, headers)
    if lib and lib.logger then lib.logger(source, name, message, data) end
end