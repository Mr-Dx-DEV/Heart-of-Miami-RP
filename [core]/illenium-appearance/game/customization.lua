-- customization.lua (refonte)
-- Auteur: Quantom (refonte par assistance)
-- Objet: Gestion caméra / cycle de customisation / tenues / helpers
-- Dépendances globales attendues: client, Interface, constants, Config, lib, cache, BackupPlayerStats, RestorePlayerStats

local log    = require('modules.utility.shared.logger')
local bridge = require('game.bridge')

-- État interne
local cachedAppearance          = nil      -- apparence snapshot entrée custom
local startCallback             = nil      -- callback appelé à la sortie
local startConfig               = nil      -- config UI (options)
local currentCameraKey          = nil      -- ex: "default", "head", ...
local activeCam                 = nil      -- cam actuelle
local isCamInterpolating        = false
local invertSide                = false    -- inversion gauche/droite (rotation latérale)
local savedHeading              = nil      -- heading avant custom
local savedCoords               = nil      -- coords avant custom

---------------------------------------------------------------------
-- APPEARANCE (getter cache)
---------------------------------------------------------------------
local function getAppearance()
    if not cachedAppearance then
        log.debugf('[appearance][customization] getAppearance() était nil, lecture en direct')
        cachedAppearance = client.getPedAppearance(cache.ped)
    end
    return cachedAppearance
end
client.getAppearance = getAppearance

---------------------------------------------------------------------
-- CONFIG (getter)
---------------------------------------------------------------------
function client.getConfig()
    return startConfig
end

---------------------------------------------------------------------
-- CAMÉRA: ciblage principal
---------------------------------------------------------------------
local function setCamera(camKey)
    if isCamInterpolating then
        return log.infof('[appearance][camera] Interpolation en cours, skip. key=(%s)', tostring(camKey))
    end

    if camKey ~= 'current' then
        currentCameraKey = camKey
    end

    local fromOffset, toOffset = table.unpack(constants.CAMERAS[currentCameraKey])
    local invert = invertSide and -1 or 1

    -- Première initialisation
    if not activeCam then
        local from = GetOffsetFromEntityInWorldCoords(cache.ped, fromOffset.x, fromOffset.y, fromOffset.z)
        local to   = GetOffsetFromEntityInWorldCoords(cache.ped, toOffset.x,   toOffset.y,   toOffset.z)
        activeCam  = CreateCameraWithParams('DEFAULT_SCRIPTED_CAMERA', from.x, from.y, from.z, 0.0, 0.0, 0.0, 49.0, false, 0)
        PointCamAtCoord(activeCam, to.x, to.y, to.z)
        SetCamActive(activeCam, true)
        return
    end

    -- Interpolation
    local from = GetOffsetFromEntityInWorldCoords(cache.ped, fromOffset.x * invert, fromOffset.y * invert, fromOffset.z * invert)
    local to   = GetOffsetFromEntityInWorldCoords(cache.ped, toOffset.x,           toOffset.y,           toOffset.z)

    local nextCam = CreateCameraWithParams('DEFAULT_SCRIPTED_CAMERA', from.x, from.y, from.z, 0.0, 0.0, 0.0, 49.0, false, 0)
    PointCamAtCoord(nextCam, to.x, to.y, to.z)
    SetCamActiveWithInterp(nextCam, activeCam, 1000, 1, 1)

    isCamInterpolating = true
    CreateThread(function()
        repeat
            Wait(500)
        until not IsCamInterpolating(activeCam) and IsCamActive(nextCam)

        DestroyCam(activeCam, false)
        activeCam = nextCam
        isCamInterpolating = false
    end)
end
client.setCamera = setCamera

---------------------------------------------------------------------
-- CAMÉRA: rotation latérale (gauche/droite de la vue)
---------------------------------------------------------------------
function client.rotateCamera(side)
    if isCamInterpolating then return end

    local fromOffset, toOffset = table.unpack(constants.CAMERAS[currentCameraKey])
    local offsets = constants.OFFSETS[currentCameraKey]
    local sign = (side == 'left') and 1 or -1
    local invert = invertSide and -1 or 1

    local from = GetOffsetFromEntityInWorldCoords(
        cache.ped,
        (fromOffset.x + offsets.x) * sign * invert,
        (fromOffset.y + offsets.y) * invert,
        fromOffset.z
    )
    local to = GetOffsetFromEntityInWorldCoords(cache.ped, toOffset.x, toOffset.y, toOffset.z)

    local nextCam = CreateCameraWithParams('DEFAULT_SCRIPTED_CAMERA', from.x, from.y, from.z, 0.0, 0.0, 0.0, 49.0, false, 0)
    PointCamAtCoord(nextCam, to.x, to.y, to.z)
    SetCamActiveWithInterp(nextCam, activeCam, 1000, 1, 1)

    isCamInterpolating = true
    CreateThread(function()
        repeat
            Wait(500)
        until not IsCamInterpolating(activeCam) and IsCamActive(nextCam)

        DestroyCam(activeCam, false)
        activeCam = nextCam
        isCamInterpolating = false
    end)
end

---------------------------------------------------------------------
-- TOURNE LE PED (et inverse la latéralité caméra pour follow-up)
---------------------------------------------------------------------
function client.pedTurn(ped, degrees)
    invertSide = not invertSide

    local seq = OpenSequenceTask()
    if not seq then return end

    TaskGoStraightToCoord(0, savedCoords.x, savedCoords.y, savedCoords.z, 8.0, -1, GetEntityHeading(ped) - degrees, 0.1)
    TaskStandStill(0, -1)
    CloseSequenceTask(seq)

    ClearPedTasks(ped)
    TaskPerformSequence(ped, seq)
    ClearSequenceTask(seq)
end

---------------------------------------------------------------------
-- VÊTEMENTS (APPLICATION DEPUIS DATA)
-- data = { components = { {component_id, drawable, texture?}, ... }, props = { {prop_id, drawable, texture?}, ... } }
---------------------------------------------------------------------
function client.wearClothes(data, slotKey)
    local set = constants.DATA_CLOTHES[slotKey]
    if not set or not data then return end

    local compsSpec = set.components[ client.getPedDecorationType() ]
    local propsSpec = set.props[      client.getPedDecorationType() ]

    local comps = data.components or {}
    local props = data.props or {}

    -- Components ciblés par slot
    for i = 1, #compsSpec do
        local compId = compsSpec[i][1]
        for j = 1, #comps do
            local c = comps[j]
            if c.component_id == compId then
                SetPedComponentVariation(cache.ped, compId, c.drawable, c.texture or 0, 2)
            end
        end
    end

    -- Props ciblés par slot
    for i = 1, #propsSpec do
        local propId = propsSpec[i][1]
        for j = 1, #props do
            local p = props[j]
            if p.prop_id == propId then
                SetPedPropIndex(cache.ped, propId, p.drawable, p.texture or 0, true)
            end
        end
    end
end

function client.removeClothes(slotKey)
    local set = constants.DATA_CLOTHES[slotKey]
    if not set then return end

    local compsSpec = set.components[ client.getPedDecorationType() ]
    local propsSpec = set.props[      client.getPedDecorationType() ]

    -- Remet les defaults de slot
    for i = 1, #compsSpec do
        local comp = compsSpec[i]
        SetPedComponentVariation(cache.ped, comp[1], comp[2], 0, 2)
    end

    -- Clear props du slot
    for i = 1, #propsSpec do
        ClearPedProp(cache.ped, propsSpec[i][1])
    end
end

---------------------------------------------------------------------
-- MÉMO HEADING au moment de l’entrée en custom
---------------------------------------------------------------------
function client.getHeading()
    return savedHeading
end

---------------------------------------------------------------------
-- DÉMARRER / QUITTER CUSTOM
---------------------------------------------------------------------
function client.startPlayerCustomization(cb, cfg)
    -- attendre la stabilité (teleport/switch/fade)
    repeat Wait(0) until IsScreenFadedIn()
    while IsPlayerTeleportActive() do Wait(0) end
    while IsPlayerSwitchInProgress() do Wait(0) end

    cachedAppearance = client.getPedAppearance(cache.ped)
    savedCoords      = GetEntityCoords(cache.ped, true)
    savedHeading     = GetEntityHeading(cache.ped)

    BackupPlayerStats()

    startCallback    = cb
    startConfig      = cfg
    invertSide       = false
    isCamInterpolating = false

    setCamera('default')

    SetNuiFocus(true, true)
    SetNuiFocusKeepInput(false)

    RenderScriptCams(true, true, 250, true, true)

    SetEntityInvincible(cache.ped, Config.InvincibleDuringCustomization == true)
    TaskStandStill(cache.ped, -1)

    lib.hideTextUI()
    if Config.HideRadar then DisplayRadar(false) end

    bridge:onCustomizationStart()
    Interface:syncCharacterAppearanceStateAndSettingsState(cfg)
    Interface:toggle(true, true)
end

function client.exitPlayerCustomization(data)
    RenderScriptCams(false, true, 250, true, true)
    if activeCam then DestroyCam(activeCam, false) end

    if Config.HideRadar then DisplayRadar(true) end

    ClearPedTasksImmediately(cache.ped)
    SetEntityInvincible(cache.ped, false)

    Interface:toggle(false, true)

    if not data then
        -- Restaurer l’apparence initiale (aucune sauvegarde)
        client.setPlayerAppearance(getAppearance())
    else
        -- Cas particulier: tatouages uniquement renvoyés
        if data.tattoos then
            client.setPedTattoos(cache.ped, data.tattoos)
        end
    end

    RestorePlayerStats()
    bridge:onCustomizationExit()

    if startCallback then
        startCallback(data)
    end

    -- purge état local
    startCallback      = nil
    startConfig        = nil
    cachedAppearance   = nil
    savedCoords        = nil
    savedHeading       = nil
    activeCam          = nil
    currentCameraKey   = nil
    invertSide         = nil
    isCamInterpolating = nil
end

---------------------------------------------------------------------
-- SAUVEGARDE DU FOCUS NUI SI RESSOURCE STOP
---------------------------------------------------------------------
AddEventHandler('onResourceStop', function(res)
    if res == GetCurrentResourceName() then
        SetNuiFocus(false, false)
        SetNuiFocusKeepInput(false)
    end
end)

---------------------------------------------------------------------
-- EXPORT D’ENTRÉE EN CUSTOM
---------------------------------------------------------------------
exports('startPlayerCustomization', client.startPlayerCustomization)
