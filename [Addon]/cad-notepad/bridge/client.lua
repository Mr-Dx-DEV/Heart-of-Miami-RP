if Config.Framework == 'qb' then

    local QBCore = exports['qb-core']:GetCoreObject()

    function GetCharName()
        local data = QBCore.Functions.GetPlayerData()
        return (data.charinfo.firstname .. ' '.. data.charinfo.lastname)
    end

elseif Config.Framework == 'qbx' then

    local QBOX = exports['qbx_core']

    function GetCharName()
        local data = QBOX:GetPlayerData()
        return (data.charinfo.firstname .. ' '.. data.charinfo.lastname)
    end

elseif Config.Framework == 'esx' then

    local ESX = exports.es_extended:getSharedObject()

    function GetCharName()
        local data = ESX.GetPlayerData()
        return data.name
    end

end

function ShowMarker(coords)
    DrawMarker(27, coords.x, coords.y, coords.z-0.98, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 255, 155, false, false, 0, false, nil, nil, false)
end

function HelpMsg()
    AddTextEntry("cadHelpNotification", 'Press ~INPUT_DETONATE~ to open note')
    DisplayHelpTextThisFrame("cadHelpNotification", false)
end

function PlayAnimation()
    local player = PlayerPedId()
    local ad = "missheistdockssetup1clipboard@base"
    local prop_name = 'prop_notepad_01'
    local secondaryprop_name = 'prop_pencil_01'
    if not exports['cad-notepad']:IsOpen() then return end
    while not HasAnimDictLoaded(ad) do
        RequestAnimDict(ad)
        Wait(5)
    end
    local x,y,z = table.unpack(GetEntityCoords(player))
    Prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
    Secondaryprop = CreateObject(GetHashKey(secondaryprop_name), x, y, z+0.2,  true,  true, true)
    AttachEntityToEntity(Prop, player, GetPedBoneIndex(player, 18905), 0.1, 0.02, 0.05, 10.0, 0.0, 0.0, true, true, false, true, 1, true) -- lkrp_notepadpad
    AttachEntityToEntity(Secondaryprop, player, GetPedBoneIndex(player, 58866), 0.12, 0.0, 0.001, -150.0, 0.0, 0.0, true, true, false, true, 1, true) -- pencil
    TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
    CreateThread(function()
        while exports['cad-notepad']:IsOpen() do
            Wait(0)
            if not IsEntityPlayingAnim(player, ad, "base", 3) then
                TaskPlayAnim(player, ad, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
            end
        end
        TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
        Wait(100)
        ClearPedSecondaryTask(player)
        DetachEntity(Prop, 1, 1)
        DeleteObject(Prop)
        DetachEntity(Secondaryprop, 1, 1)
        DeleteObject(Secondaryprop)
    end)
end

CreateThread(function()
    while Config.DropNote do
        local sleep = 500
        if next(DropNotes) then
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            for id, data in pairs(DropNotes) do
                local distance = #(data.coords - coords)
                if distance < 6 then
                    sleep = 4
                    ShowMarker(data.coords)
                end
                if distance < 1.5 then
                    HelpMsg()
                    if IsControlJustPressed(0, 47) then
                        PickUpNote(id, data)
                    end
                end
            end
        end
        Wait(sleep)
    end
end)