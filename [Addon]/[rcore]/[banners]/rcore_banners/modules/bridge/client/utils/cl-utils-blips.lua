function CreateBlip(data)
    if not data.coords then
        return
    end

    local scale = data.scale or 1.0
    local color = data.color or 1
    local sprite = data.sprite or 1
    local blipIdx = data.name or 'point'
    local name = data.name or 'Mission point'
    local blipType = data.type

    local blip = AddBlipForCoord(data.coords.x, data.coords.y, data.coords.z)

    if not Blips[blipIdx] then
        Blips[blipIdx] = {
            type = data.type or 'unk',
            blip = blip
        }
    end

    if blipType == 'owned_billboard' then
        SetBlipCategory(blip, 10)
        SetBlipAsShortRange(blip, true)
    elseif blipType == 'business_blip' then
        SetBlipAsShortRange(blip, true)
    else
        SetBlipDisplay(blip, 2)
        SetBlipAsShortRange(blip, true)
    end

    SetBlipDisplay(blip, 2)

    SetBlipSprite(blip, sprite)
    SetBlipScale(blip, scale)
    SetBlipColour(blip, color)

    SetTextFont(1)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(name)
    EndTextCommandSetBlipName(blip)

    return blip
end