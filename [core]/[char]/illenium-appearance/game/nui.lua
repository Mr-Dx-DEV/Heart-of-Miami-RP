-- nui.lua (refonte)
-- Auteur: Quantom (refonte par assistance)
-- Objet: Callbacks NUI pour l’éditeur d’apparence/tenues/tatouages + caméra
-- Dépendances globales attendues: client, Interface, Locales, Config, constants, lib, cache, game.bridge

local bridge = require('game.bridge')
local log    = require('modules.utility.shared.logger')

-- Helpers
local function ack(cb, ms)
    -- par convention: 1 pour OK immédiat / 200 pour opération brève
    cb(ms or 1)
end

---------------------------------------------------------------------
-- ROTATION DU PERSONNAGE DEPUIS L'UI
---------------------------------------------------------------------
Interface:on('callback::function::character::rotate', function(payload, cb)
    local ped = PlayerPedId()
    local delta = (payload and payload.deltaX) or 0.0
    local newHeading = GetEntityHeading(ped) + (delta * 0.2)
    SetEntityHeading(ped, newHeading)
    ack(cb, 200)
end)

---------------------------------------------------------------------
-- LOCALES UI
---------------------------------------------------------------------
Interface:on('callback::function::locales::get', function(_, cb)
    local locale = GetConvar('illenium-appearance:locale', 'en')
    local ui = (Locales[locale] and Locales[locale].UI) or {}
    cb(ui)
end)

---------------------------------------------------------------------
-- CAMÉRA
---------------------------------------------------------------------
Interface:on('callback::function::camera::set', function(key, cb)
    ack(cb, 1)
    client.setCamera(key) -- défini côté customization.lua
end)

---------------------------------------------------------------------
-- CHANGEMENT DE MODÈLE
---------------------------------------------------------------------
Interface:on('callback::function::model::change', function(modelHash, cb)
    local newPed = client.setPlayerModel(modelHash)
    -- Repositionnement sur le heading sauvegardé par le module customization
    SetEntityHeading(cache.ped, (client.getHeading() or GetEntityHeading(cache.ped)))
    SetEntityInvincible(newPed, true)
    TaskStandStill(newPed, -1)

    cb({
        new_character_appearance = client.getPedAppearance(newPed),
        new_game_appearance_data = bridge:getAppearanceSettings(),
    })
end)

---------------------------------------------------------------------
-- COMPOSANTS (Vêtements “components”)
---------------------------------------------------------------------
Interface:on('callback::function::component::change', function(data, cb)
    client.setPedComponent(cache.ped, data)
    bridge:onComponentChange(data)
    local compSettings, maxDrawable, maxTexture, palettes = bridge:getComponentSettings(cache.ped, data.component_id)
    cb(compSettings, maxDrawable, maxTexture, palettes)
end)

---------------------------------------------------------------------
-- PROPS (Chapeaux, lunettes, etc.)
---------------------------------------------------------------------
Interface:on('callback::function::prop::change', function(data, cb)
    client.setPedProp(cache.ped, data)
    bridge:onPropChange(data)
    local propSettings, maxDrawable, maxTexture, palettes = bridge:getPropSettings(cache.ped, data.prop_id)
    cb(propSettings, maxDrawable, maxTexture, palettes)
end)

---------------------------------------------------------------------
-- HEAD BLEND / FACE FEATURES / OVERLAYS / HAIR / EYE COLOR
---------------------------------------------------------------------
Interface:on('callback::function::head_blend::change', function(data, cb)
    ack(cb, 1)
    client.setPedHeadBlend(cache.ped, data)
end)

Interface:on('callback::function::face_feature::change', function(data, cb)
    ack(cb, 1)
    client.setPedFaceFeatures(cache.ped, data)
end)

Interface:on('callback::function::head_overlay::change', function(data, cb)
    ack(cb, 200)
    client.setPedHeadOverlays(cache.ped, data)
end)

Interface:on('callback::function::hair::change', function(data, cb)
    client.setPedHair(cache.ped, data)
    local hair, maxDrawable, maxTexture = bridge:getHairSettings(cache.ped)
    cb(hair, maxDrawable, maxTexture)
end)

Interface:on('callback::function::eye_color::change', function(data, cb)
    ack(cb, 1)
    client.setPedEyeColor(cache.ped, data)
end)

---------------------------------------------------------------------
-- TATOUAGES
---------------------------------------------------------------------
Interface:on('callback::function::tattoo::preview', function(payload, cb)
    client.setPreviewTattoo(cache.ped, payload.data, payload.tattoo)
    ack(cb, 200)
end)

Interface:on('callback::function::tattoo::opacity::set', function(payload, cb)
    ack(cb, 1)
    client.addPedTattoo(cache.ped, payload.updatedTattoos or payload)
end)

Interface:on('callback::function::tattoo::delete', function(data, cb)
    ack(cb, 1)
    client.removePedTattoo(cache.ped, data)
end)

Interface:on('callback::function::tattoo::apply', function(payload, cb)
    local shouldCharge = (Config.ChargePerTattoo == true)
    local success = true

    if shouldCharge then
        success = lib.callback.await('illenium-appearance:server:payForTattoo', false, payload.tattoo) == true
    end

    if success then
        log.verbosef('[appearance][nui][tattoo] Paiement OK (ou gratuit). Application du tattoo.')
        client.addPedTattoo(cache.ped, payload.updatedTattoos or payload)
    else
        log.warnf('[appearance][nui][tattoo] Paiement KO. Tattoo non appliqué.')
    end

    cb(success)
end)

---------------------------------------------------------------------
-- TENUES: PORTER / ENLEVER / SAUVER (et quitter)
---------------------------------------------------------------------
Interface:on('callback::function::wear_clothes', function(payload, cb)
    ack(cb, 1)
    client.wearClothes(payload.data, payload.key) -- “head”, “body”, “bottom”
end)

Interface:on('callback::function::remove_clothes', function(key, cb)
    ack(cb, 1)
    client.removeClothes(key) -- “head”, “body”, “bottom”
end)

Interface:on('callback::function::save', function(apparenceData, cb)
    ack(cb, 1)
    client.wearClothes(apparenceData, 'head')
    client.wearClothes(apparenceData, 'body')
    client.wearClothes(apparenceData, 'bottom')
    client.exitPlayerCustomization(apparenceData)
end)

Interface:on('callback::function::exit', function(_, cb)
    ack(cb, 1)
    client.exitPlayerCustomization()
end)

---------------------------------------------------------------------
-- Intégration ox_inventory (client): porter une tenue depuis un item
-- A câbler côté serveur avec ox_inventory:useItem pour envoyer 'data' (metadata tenue)
---------------------------------------------------------------------
RegisterNetEvent('illenium-appearance:client:wearClothesFromItem', function(data, slotKey)
    -- data: { components = {...}, props = {...} } + éventuels champs métiers
    client.wearClothes(data, slotKey or 'body')
end)

-- Export simple si un autre script client veut appliquer une tenue issue d’un item
exports('WearClothesFromItem', function(data, slotKey)
    client.wearClothes(data, slotKey or 'body')
end)
