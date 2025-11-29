
local zones = {}

if Config.Framework == "qb-core" or Config.Framework == "qbox" then
    local QBCore = exports[Config.Core.resource]:GetCoreObject()

    function Notification(notification, notificationType, duration)
        if Config.Notification == "ox" then
            lib.notify({
                description = notification,
                type = notificationType,
                position = 'center-right',
            })
        else
            TriggerEvent(Config.Core.name..':Notify', notification, notificationType, duration)
        end
    end
    
    function HasItem(item)
        if Config.Inventory == "ox" then
            return exports.ox_inventory:GetItemCount(item) > 0
        elseif Config.Inventory == "origen" then
            return exports.origen_inventory:HasItem(item)
        elseif Config.Inventory == "qs" then
            return exports['qs-inventory']:Search(item) > 0
        elseif Config.Inventory == "tgiann" then
            return exports["tgiann-inventory"]:HasItem(item, 1)
        else
            return QBCore.Functions.HasItem(item)
        end
    end
    
    function Progressbar(name, label, duration, success, fail, icon)
        if Config.Progressbar == "ox" then
            if lib.progressCircle({
                duration = duration,
                position = 'bottom',
                useWhileDead = false,
                label = label,
                canCancel = false,
                disable = {car = true},
                anim = {},
                prop = {},
            }) then success() end
        else
            QBCore.Functions.Progressbar(name, label, duration, false, false, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true
            }, {}, {}, {}, success, fail, icon)
        end
    end
    
    RegisterNetEvent(Config.Core.name..':Client:OnPlayerUnload', function()
        TriggerEvent('projectx-ammunationrobbery-gabz:client:Logout')
    end)
elseif Config.Framework == "esx" then
    function Notification(notification, notificationType, duration)
        if Config.Notification == "ox" then
            lib.notify({
                description = notification,
                type = notificationType,
                position = 'center-right',
            })
        else
            TriggerEvent('esx:showNotification', notification, notificationType, duration)
        end
    end
    
    function HasItem(item)
        local p = promise.new()
        if Config.Inventory == "ox" then return exports.ox_inventory:GetItemCount(item) > 0 end
        lib.callback('projectx-ammunationrobbery-gabz:server:hasitem', false, function(name)
            p:resolve(name)
        end, item)
        return Citizen.Await(p)
    end
    
    function Progressbar(name, label, duration, success, fail, icon)
        if lib.progressCircle({
            duration = duration,
            position = 'bottom',
            useWhileDead = false,
            label = label,
            canCancel = false,
            disable = {car = true},
            anim = {},
            prop = {},
        }) then success() end
    end
    
    RegisterNetEvent('projectx-ammunationrobbery-gabz:client:PdNotify', function(coords)
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 364)
        SetBlipScale(blip, 1.0)
        SetBlipColour(blip, 59)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Ammunation Robbery")
        EndTextCommandSetBlipName(blip)
        SetTimeout(120000, function()
            RemoveBlip(blip)
        end)
    end)

    RegisterNetEvent('esx:onPlayerLogout', function()
        TriggerEvent('projectx-ammunationrobbery-gabz:client:Logout')
    end)
else

end

function CreateCircleZones(name, coords, size, event, icon, label, distance, param, param2)
    if not Config.WorldInteract then
        if Config.Target == "ox_target" then
            exports.ox_target:addSphereZone({
                name = name,
                coords = coords,
                radius = size,
                debug = Config.debug,
                drawSprite = true,
                options =
                {{
                    icon = icon,
                    label = label,
                    distance = distance,
                    onSelect = event,
                }}
            })
        else
            exports[Config.Target]:AddCircleZone(name, coords, size, {name = name, debugPoly = Config.debug, useZ=true},
                {
                options = {
                    {
                        name = name,
                        type = "client",
                        action = event,
                        icon = icon,
                        label = label,
                        coords = coords,
                    }
                },
                distance = distance
            })
        end
    else
        exports.interact:AddInteraction({
            coords = coords,
            distance = 3.5,
            interactDst = distance, -- optional
            id = name, -- needed for removing interactions
            name = name, -- optional
            options = {
                {
                    label = label,
                    action = function()
                        TriggerEvent(event, param, param2)
                    end,
                },
            }
        })
    end
end

function CircleZoneDestroy(name)
    if Config.WorldInteract then return exports.interact:RemoveInteraction(name) end
    if Config.Target == "ox_target" then exports.ox_target:removeZone(name) else exports[Config.Target]:RemoveZone(name) end
end

function drawTextUi(bool, text)
    if Config.Drawtext == "OX" then
        if bool then lib.showTextUI(text) else lib.hideTextUI() end
    elseif Config.Drawtext == "QB" then
        if bool then exports[Config.Core.abbrev..'-core']:DrawText(text) else exports[Config.Core.abbrev..'-core']:HideText() end
    elseif Config.Drawtext == "OLDQB" then
        if bool then exports[Config.Core.abbrev..'-drawtext']:DrawText(text) else exports[Config.Core.abbrev..'-drawtext']:HideText() end    
    end
end

function zoneDestroy(name)
    for k, v in pairs(zones) do
        if v.name == name then
            zones[k]:remove()
            table.remove(zones, k)
        end
    end
end

function zoneCreate(name, coords, size, rotation, onEnter, onExit)
    zones[#zones + 1] = lib.zones.box({
        name = name,
        coords = coords,
        size = size,
        rotation = rotation,
        debug = Config.debug,
        onEnter = onEnter,
        onExit = onExit,
    })
end

function OnEvidence(pos, chance)
    if math.random(1, 100) > chance or IsWearingHandshoes() then return end
    TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
end

function Stress(chance)
    TriggerServerEvent('hud:server:GainStress', chance)
end

function Dispatch()
    local coords = GetEntityCoords(PlayerPedId())
    local PoliceJobs = {}
    for k, v in pairs(Config.PoliceJobs) do table.insert(PoliceJobs, k) end
    if Config.Dispatch == "cd" then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {'police'},
            coords = data.coords,
            title = '10-15 - Ammunation Robbery',
            message = 'A '..data.sex..' robbing a store at '..data.street,
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 431,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = '911 - Ammunation Robbery',
                time = 5,
                radius = 0,
            }
        })
    elseif Config.Dispatch == "origen" then
        TriggerServerEvent("SendAlert:police", {
            coords = coords,
            title = 'Ammunation Robbery',
            type = 'GENERAL',
            message = 'An Ammunation store is being robbed',
            job = PoliceJobs,
        })
    elseif Config.Dispatch == "tk" then
        exports['tk_dispatch']:addCall({
            title = 'Ammunation Robbery',
            code = '10-58',
            priority = 'Priority 3',
            showLocation = true,
            showGender = true,
            playSound = true,
            blip = {
                color = 3,
                sprite = 357,
                scale = 1.0,
            },
            jobs = PoliceJobs
        })
    elseif Config.Dispatch == "rcore" then
        local player_data = exports['rcore_dispatch']:GetPlayerData()
        local data = {
            code = '10-35 Ammunation Robbery',
            default_priority = 'medium',
            coords = player_data.coords,
            job = PoliceJobs,
            text = 'Ammunation Robbery!',
            type = 'alert',
            blip_time = 5,
            blip = {
                sprite = 272,
                colour = 3,
                scale = 0.7,
                text = 'Ammunation Robbery',
                flashes = false,
                radius = 0,
            }
        }
        TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
    elseif Config.Dispatch == "outlaw" then
        local data = {displayCode = '211', description = 'Robbery', isImportant = 0, recipientList = PoliceJobs, length = '10000', infoM = 'fa-info-circle', info = 'Ammunation Robbery'}
        local dispatchData = {dispatchData = data, caller = 'Alarm', coords = coords}
        TriggerEvent('wf-alerts:svNotify', dispatchData)
    elseif Config.Dispatch == "codem" then
        local Data = {
            type = 'Robbery',
            header = 'Robbery in progress',
            text = 'Ammunation Robbery in progress',
            code = '10-54',
        }
        exports['codem-dispatch']:CustomDispatch(Data)
    elseif Config.Dispatch == "lb" then
        TriggerServerEvent('Shop:lb-tablet:Dispatch', {
            priority = 'high',
            code = '10-31',
            title = "Ammunation Robbery",
            description = 'Ammunation store is being robbed',
            location = {label = "Ammunation Robbery", coords = { x = coords.x, y = coords.y}},
            time = 100,
            image = 'https://www.alibirp.com/image/imgtransparant.png',
            job = PoliceJobs,
        })
    elseif Config.Dispatch == "redutzu" then
        TriggerServerEvent('redutzu-mdt:server:addDispatchToMDT', {code = '10-31', title = 'Ammunation Robbery', gender = 'Male', duration = 100000, coords = coords})
    elseif Config.Dispatch == "l2s" then
        local playerData = exports['l2s-dispatch']:GetPlayerData()
        TriggerServerEvent('l2s-dispatch:server:AddNotification', {
            departments = {'police'},
            title = 'Ammunation Robbery',
            message = 'Ammunation store is being robbed',
            coords = vec2(playerData.coords.x, playerData.coords.y),
            priority = 1,
            sound = 1,
            street = playerData.street,
            reply = playerData.source,
            anonymous = false,
            blip = {
                sprite = 52,
                colour = 1,
                scale = 1.0,
                text = '10-31 - Ammunation Robbery',
            },
            info = {
                {icon = 'video', text = 'first'},
                {icon = 'person', text = playerData.sex},
            },
        })
    elseif Config.Dispatch == "sonoran" then
        local Zone = GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z))
        local Street = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
        TriggerServerEvent('projectx-ammunationrobbery-gabz:server:Sonoran', Street, Zone)
    elseif Config.Dispatch == "qs" then
        local playerData = exports['qs-dispatch']:GetPlayerInfo()
        TriggerServerEvent('qs-dispatch:server:CreateDispatchCall', {
            job = PoliceJobs,
            callLocation = playerData.coords,
            callCode = { code = 'Ammunation Robbery', snippet = 'Robbery' },
            message = "Ammunation Robbery",
            flashes = false,
            image = nil,
            blip = {
                sprite = 150,
                scale = 1.5,
                colour = 1,
                flashes = true,
                text = 'Ammunation Robbery',
                time = (20 * 1000),     --20 secs
            },
        })
    elseif Config.Dispatch == "ps" then
        exports["ps-dispatch"]:CustomAlert({
            coords = coords,
            message = "Ammunation Robbery",
            dispatchCode = "10-35",
            description = "Ammunation store is being robbed",
            radius = 0,
            sprite = 150,
            color = 1,
            scale = 1.0,
            length = 3,
        })
    else
        if Config.Framework == "esx" then
            TriggerServerEvent('projectx-ammunationrobbery-gabz:server:PdNotify')
            -- (ESX) Add your disptach script here if it's none of the above and remove the line above this one
        else
            -- (Qbcore) Add your disptach script here if it's none of the above
        end
    end
end

----- Client Side EXP Events (Only use this if Config.ServerSideEvents is false and your skill system has client sided functions)
RegisterNetEvent("projectx-ammunationrobbery-gabz:client:AddExperience", function(exp)
    -- add exp function here and insert exp as a parameter
end)

function CheckExpLevel()
    -- Add "return" then add your check exp level function here
end

--------------------- Minigames ---------------------
------ You can return true to skip a minigame -------
-----------------------------------------------------
function FuseboxMinigame()
    local p = promise.new()
    if not MinigameCheck("boii_minigames") then p:resolve(false) return Citizen.Await(p) end
    exports['boii_minigames']:wire_cut({style = 'default', timer = 60000}, function(success)
        if Config.SkillSystem then
            if success then TriggerServerEvent('projectx-ammunationrobbery-gabz:server:AddExperience', 1) end
        end
        p:resolve(success)
    end)
    return Citizen.Await(p)
end

function RegisterMinigame()
    local p = promise.new()
    if not MinigameCheck("bl_ui") then p:resolve(false) return Citizen.Await(p) end
    local success = exports["bl_ui"]:CircleShake(1, 50, 2)
    if Config.SkillSystem then
        if success then TriggerServerEvent('projectx-ammunationrobbery-gabz:server:AddExperience', 1) end
    end
    p:resolve(success)
    return Citizen.Await(p)
end

function Computer1Minigame()
    local p = promise.new()
    if not MinigameCheck("boii_minigames") then p:resolve(false) return Citizen.Await(p) end
    exports['boii_minigames']:chip_hack({style = 'default', loading_time = 8000, chips = 2, timer = 20000}, function(success)
        if Config.SkillSystem then
            if success then TriggerServerEvent('projectx-ammunationrobbery-gabz:server:AddExperience', 1) end
        end
        p:resolve(success)
    end)
    return Citizen.Await(p)
end

function Computer2Minigame()
    local p = promise.new()
    if not MinigameCheck("ps-ui") then p:resolve(false) return Citizen.Await(p) end
    exports['ps-ui']:Scrambler(function(success)
        if Config.SkillSystem then
            if success then TriggerServerEvent('projectx-ammunationrobbery-gabz:server:AddExperience', 1) end
        end
        p:resolve(success)
    end, "alphanumeric", 30, 0)
    return Citizen.Await(p)
end

function GunCrateMinigame()
    local p = promise.new()
    if not MinigameCheck("bl_ui") then p:resolve(false) return Citizen.Await(p) end
    local success = exports["bl_ui"]:RapidLines(2, 50, 4)
    if Config.SkillSystem then
        if success then TriggerServerEvent('projectx-ammunationrobbery-gabz:server:AddExperience', 1) end
    end
    p:resolve(success)
    return Citizen.Await(p)
end

function ExplosiveCrateMinigame()
    local p = promise.new()
    if not MinigameCheck("boii_minigames") then p:resolve(false) return Citizen.Await(p) end
    exports['boii_minigames']:pincode({style = 'default', difficulty = 1, guesses = 10}, function(success)
        if Config.SkillSystem then
            if success then TriggerServerEvent('projectx-ammunationrobbery-gabz:server:AddExperience', 1) end
        end
        p:resolve(success)
    end)
    return Citizen.Await(p)
end

function ArmorCrateMinigame()
    local p = promise.new()
    if not MinigameCheck("bl_ui") then p:resolve(false) return Citizen.Await(p) end
    local success = exports["bl_ui"]:CircleProgress(3, 75)
    if Config.SkillSystem then
        if success then TriggerServerEvent('projectx-ammunationrobbery-gabz:server:AddExperience', 1) end
    end
    p:resolve(success)
    return Citizen.Await(p)
end

function TimerMinigame()
    local p = promise.new()
    if not MinigameCheck("boii_minigames") then p:resolve(false) return Citizen.Await(p) end
    exports['boii_minigames']:safe_crack({style = 'default', difficulty = 1}, function(success)
        if Config.SkillSystem then
            if success then TriggerServerEvent('projectx-ammunationrobbery-gabz:server:AddExperience', 1) end
        end
        p:resolve(success)
    end)
    return Citizen.Await(p)
end

function GunMinigame()
    local p = promise:new()
    local success = lib.skillCheck({'easy', 'easy', 'medium', 'hard'}, {'w', 'a', 's', 'd'})
    if Config.SkillSystem then
        if success then TriggerServerEvent('projectx-ammunationrobbery-gabz:server:AddExperience', 1) end
    end
    p:resolve(success)
    return Citizen.Await(p)
end

function ElectricBoxMinigame()
    local p = promise.new()
    if not MinigameCheck("ps-ui") then p:resolve(false) return Citizen.Await(p) end
    exports['ps-ui']:VarHack(function(success)
        if Config.SkillSystem then
            if success then TriggerServerEvent('projectx-ammunationrobbery-gabz:server:AddExperience', 1) end
        end
        p:resolve(success)
    end, 6, 25)
    return Citizen.Await(p)
end

function AmmoMinigame()
    local p = promise.new()
    if not MinigameCheck("bl_ui") then p:resolve(false) return Citizen.Await(p) end
    local success = exports["bl_ui"]:KeySpam(2, 50)
    if Config.SkillSystem then
        if success then TriggerServerEvent('projectx-ammunationrobbery-gabz:server:AddExperience', 1) end
    end
    p:resolve(success)
    return Citizen.Await(p)
end

function OfficeDoorMinigame()
    local p = promise.new()
    if not MinigameCheck("bl_ui") then p:resolve(false) return Citizen.Await(p) end
    local success = exports["bl_ui"]:CircleShake(1, 25, 1)
    if Config.SkillSystem then
        if success then TriggerServerEvent('projectx-ammunationrobbery-gabz:server:AddExperience', 1) end
    end
    p:resolve(success)
    return Citizen.Await(p)
end

function KeypadMinigame()
    local gameData = {totalNumbers = 20, seconds = 20, timesToChangeNumbers = 4, amountOfGames = 1, incrementByAmount = 5}
    local p = promise:new()
    if not MinigameCheck("pure-minigames") then p:resolve(false) return Citizen.Await(p) end
    local success = exports['pure-minigames']:numberCounter(gameData)
    if Config.SkillSystem then
        if success then TriggerServerEvent('projectx-ammunationrobbery-gabz:server:AddExperience', 1) end
    end
    p:resolve(success)
    return Citizen.Await(p)
end

function CodesMinigame()
    local p = promise.new()
    if not MinigameCheck("SN-Hacking") then p:resolve(false) return Citizen.Await(p) end
    local success = exports['SN-Hacking']:SkillBar({2000, 3000}, 10, 2)
    if Config.SkillSystem then
        if success then TriggerServerEvent('projectx-ammunationrobbery-gabz:server:AddExperience', 1) end
    end
    p:resolve(success)
    return Citizen.Await(p)
end