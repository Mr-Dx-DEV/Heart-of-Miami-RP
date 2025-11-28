for k,v in pairs(Businesses) do
    if v.enabled and v.blips.enabled then
        local blip = AddBlipForCoord(v.blips.coords)
        SetBlipSprite(blip, v.blips.sprite)
        SetBlipColour(blip, v.blips.color)
        SetBlipScale(blip, v.blips.scale)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(v.blips.label)
        EndTextCommandSetBlipName(blip)
    end
end