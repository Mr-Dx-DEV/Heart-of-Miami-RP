local NPC = nil
local blip = nil

CreateThread(function()
    while not Config.Target do Wait(50) dbug("Waiting for Config.Target") end
    dbug("Supplies loop...")
    local closeToNPC = false
    dbug("Supplies locations?", Config.SuppliesLocations and #Config.SuppliesLocations or "none")
    while true do
        local inZone = false
        if Config.SuppliesLocations and next(Config.SuppliesLocations) then
            local myCoords = GetEntityCoords(cache.ped)
            for _, v in pairs(Config.SuppliesLocations) do
                local npcCoords = #(myCoords - vector3(v['x'], v['y'], v['z']))
                if npcCoords < 50 then
                    inZone = true
                    dbug("Player is close to supplies NPC")
                    if not NPC then
                        dbug("Generating NPC, model", v['model'])
                        lib.requestModel(v['model'], 30000)
                        NPC = CreatePed(3, v['model'], v['x'], v['y'], v['z'], v['heading'], false, false)
                        SetBlockingOfNonTemporaryEvents(NPC, true)
                        local options = {
                            {
                                name = "supplies",
                                num = 1,
                                type = "client",
                                event = "av_business:supplies",
                                icon = "fas fa-comment",
                                label = Lang['supplies_npc'],
                                distance = 2
                            }
                        }
                        if Config.Target == "ox_target" then
                            exports[Config.Target]:addLocalEntity(NPC, options)
                        else
                            exports[Config.Target]:AddTargetEntity(NPC, {
                                options = options,
                                distance = 2.5
                            })
                        end
                    end
                end
                if inZone and not closeToNPC then
                    closeToNPC = true
                end
            end
        end
        if not inZone and closeToNPC then
            closeToNPC = false
            if NPC then
                for i = 255, 0, -51 do
                    Wait(50)
                    SetEntityAlpha(NPC, i, false)
                end
                SetEntityAsNoLongerNeeded(NPC)
                if Config.Target == "ox_target" then
                    exports[Config.Target]:removeLocalEntity(NPC, "supplies")
                else
                    exports[Config.Target]:RemoveTargetEntity(NPC, "supplies")
                end
                DeletePed(NPC)
            end
            NPC = nil
            dbug("Supplies NPC got removed.")
        end
        Wait(1000)
    end
end)

RegisterNetEvent('av_business:supplies', function()
    local permissions = getPermissions()
    if permissions['isBoss'] or permissions['supplies'] then
        removeBlip()
        local data = Config.SuppliesStash
        local myJob = exports['av_laptop']:getJob()
        local stashName = data['prefix']..myJob.name
        local label = data['label']
        local weight = data['weight']
        local slots = data['slots']
        dbug('supplies(stash,label,weight,slots)', stashName, label, weight, slots)
        if stashName and label then
            exports['av_laptop']:openStash(stashName, label, weight, slots)
        end
    else
        TriggerEvent('av_laptop:notification', Lang['app_title'], Lang['missing_permissions'], 'error')
    end
end)

function addBlip(x,y,z)
    blip = AddBlipForCoord(x,y,z)
    SetBlipSprite(blip, Config.SuppliesBlip['sprite'])
    SetBlipScale(blip, 0.7)
    SetBlipDisplay(blip, 4)
    SetBlipColour(blip, Config.SuppliesBlip['color'])
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.SuppliesBlip['label'])
    EndTextCommandSetBlipName(blip)
end

function removeBlip()
    if blip and DoesBlipExist(blip) then
        RemoveBlip(blip)
        blip = nil
    end
end