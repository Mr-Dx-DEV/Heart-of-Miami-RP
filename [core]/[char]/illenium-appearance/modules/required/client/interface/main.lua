-- main.lua (refonte)
-- Auteur : Quantom (refonte par assistance)
-- Objet  : Gestion centralisée de l'interface NUI (messages, états, callbacks)
-- Dépendances globales attendues :
--   - Locales (table)
--   - client (avec getAppearance, setPedTattoos)
--   - game.bridge (require 'game.bridge')
--   - shared.theme (require 'shared.theme')
--   - natives FiveM (SendNUIMessage, SetNuiFocus, DisplayRadar, etc.)

local logger = require('modules.utility.shared.logger')
local info, infof, warnf, verbosef, debugf = logger.info, logger.infof, logger.warningf, logger.verbosef, logger.debugf

-- Compatibilité: certaines bases utilisent RegisterNuiCallback (camel) vs RegisterNUICallback (FiveM)
local RegisterNUICB = rawget(_G, 'RegisterNuiCallback') or rawget(_G, 'RegisterNUICallback')
assert(RegisterNUICB, '(interface) RegisterNUICallback/RegisterNuiCallback introuvable')

-- Classe Interface -------------------------------------------------------------
local Interface = {}
Interface.__index = Interface

-- État interne (store)
Interface.store = {
  status = {
    app = {
      loaded = false,
      dataLoaded = false,
    }
  },
  visibility = {
    app = false,
    loadingScreen = false,
    exportPanel = false,
  },
  callbacks = {}, -- map<string, function[]|false>
}

-- Construction ----------------------------------------------------------------
function Interface.new()
  info('(modules/interface) _G.Interface non présent, création de la première instance globale')

  local self = setmetatable({}, Interface)
  self:registerInitialCallbacks()

  -- Export pratique (état de visibilité)
  exports('getInterfaceVisibilityState', function()
    return self.store.visibility
  end)

  return self
end

-- Envoi d’un message à la NUI -------------------------------------------------
function Interface:message(action, data)
  assert(action, '(interface:message) `action` est nil')
  SendNUIMessage({ action = action, data = data })
end

-- Activer / désactiver l’app (et focus, sauf si désactivé explicitement) ------
function Interface:toggle(newState, affectInputFocus)
  local nextState = not self.store.visibility.app
  if type(newState) == 'boolean' then nextState = newState end

  info('(interface:toggle) newState: ', nextState)

  if nextState and self.store.visibility.loadingScreen then
    verbosef('[client][interface/toggle] Loading screen actif → on le masque')
    self:setLoadingState(false)
  end

  self:message('state::visibility::app::set', nextState)

  if type(affectInputFocus) == 'boolean' and affectInputFocus == false then
    return info('(interface:toggle) focus NUI non modifié (affectInputFocus=false)')
  end

  SetNuiFocus(nextState, nextState)
end

-- Écouteurs initiaux (sync depuis la NUI vers le client) ----------------------
function Interface:registerInitialCallbacks()
  -- Sync visibilité app
  self:on('state::visibility::app::sync', function(visible, cb)
    self.store.visibility.app = visible
    SetNuiFocus(visible, visible)
    cb(200)
  end)

  -- Sync loading screen
  self:on('state::visibility::loading_screen::sync', function(visible, cb)
    self.store.visibility.loadingScreen = visible
    cb(200)
  end)

  -- Sync export panel
  self:on('state::visibility::export_panel::sync', function(visible, cb)
    self.store.visibility.exportPanel = visible
    cb(200)
  end)

  -- App prête
  self:on('APP_LOADED', function(_, cb)
    self.store.status.app.loaded = true
    cb(200)
  end)
end

-- S’abonner à un événement NUI ------------------------------------------------
-- Retourne l’index du callback pour remove ultérieur.
function Interface:on(event, callback)
  assert(event, '[Interface][on] param `event` nil')
  assert(callback, '[Interface][on] param `callback` nil')

  if not self.store.callbacks[event] then
    self.store.callbacks[event] = {}

    -- Un seul RegisterNUICallback par event ; on fan-out vers tous les handlers stockés
    RegisterNUICB(event, function(payload, cb)
      local list = self.store.callbacks[event]
      local count = list and #list or 0
      for i = 1, count do
        local fn = list[i]
        if not fn then
          debugf('[Interface][on] skip callback nil, event=(%s) index=(%s)', event, i)
        else
          local ok, err = pcall(fn, payload, cb)
          if not ok then
            warnf('[Interface][on] erreur (%s) event=(%s) index=(%s)', err, event, i)
          end
        end
      end
    end)
  end

  local idx = #self.store.callbacks[event] + 1
  self.store.callbacks[event][idx] = (type(callback) == 'function') and callback or false
  return idx
end

-- Désabonnement ---------------------------------------------------------------
function Interface:removeCallback(event, cbIndex)
  assert(event,   '[Interface][removeCallback] `event` nil')
  assert(cbIndex, '[Interface][removeCallback] `callback` nil')
  assert(self.store.callbacks[event], '[Interface][removeCallback] Événement inconnu: '..tostring(event))
  assert(self.store.callbacks[event][cbIndex], ('[Interface][removeCallback] Callback nil, event: %s index: %s'):format(event, cbIndex))

  infof('[Interface][removeCallback] Suppression callback event=(%s), index=(%s)', event, cbIndex)
  self.store.callbacks[event][cbIndex] = false
end

-- Loading screen --------------------------------------------------------------
function Interface:setLoadingState(state)
  local nextState = (type(state) == 'boolean') and state or (not self.store.visibility.loadingScreen)
  self:message('state::visibility::loading_screen::set', nextState)
end

-- Sync des données apparence & config vers l’UI -------------------------------
--   - Charge locales & thème si pas déjà fait
--   - Pousse settings du bridge, appearance courante, et applique tattoos s’il y en a
function Interface:syncCharacterAppearanceStateAndSettingsState(config)
  assert(config, '[Interface][syncCharacterAppearanceStateAndSettingsState] `config` nil')

  -- Affiche le loading screen pendant le chargement des données
  self:setLoadingState(true)

  local bridge = require('game.bridge')

  if not self.store.status.app.dataLoaded then
    -- Locales
    local locale = GetConvar('illenium-appearance:locale', 'en')
    local loc = (Locales and Locales[locale]) or (Locales and Locales.en) or { UI = {} }

    -- Thème
    local theme = require('shared.theme')

    -- Alimente l’UI
    self:message('state::locales::set', loc.UI)
    -- NB: ID de frame conservé pour compatibilité (hérité du code d’origine)
    self:message('state::visibility::frame::set', '5j15hmhm4-kk7dd--k1-86b5-36nb1d131efe76f829')
    self:message('state::theme::set', theme)

    self.store.status.app.dataLoaded = true
    verbosef('[interface/sync] Données locales & thème chargées.')
  end

  -- Données de jeu
  local appearance = client.getAppearance()
  local gameAppearanceData = bridge:getAppearanceSettings()

  -- Pousse config + stores
  self:message('state::script::config::set', config)
  self:message('state::game::store::appearance::data::set', gameAppearanceData)
  self:message('state::character::appearance::set', appearance)

  -- Applique les tattoos si présents (pour la préview immédiate côté client)
  if appearance and appearance.tattoos then
    client.setPedTattoos(cache.ped, appearance.tattoos)
  end
end

-- Sécurité focus quand la ressource stop -------------------------------------
AddEventHandler('onResourceStop', function(res)
  if res == GetCurrentResourceName() then
    SetNuiFocus(false, false)
    -- Évite de laisser un écran bloqué si la ressource s’arrête
    -- (pas d’envoi NUI si l’UI n’existe plus)
  end
end)

-- Instanciation globale unique ------------------------------------------------
if not rawget(_G, 'Interface') or type(_G.Interface) ~= 'table' then
  _G.Interface = Interface.new()
else
  info('(modules/interface) _G.Interface déjà présent, réutilisation de l’instance existante')
end
