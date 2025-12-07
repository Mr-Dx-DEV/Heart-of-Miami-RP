OX_LIB_INIT_FILE = 'init.lua'

if isResourceLoaded('ox_lib') then
    local import = LoadResourceFile('ox_lib', OX_LIB_INIT_FILE)
    local chunk = assert(load(import, ('@@ox_lib/%s'):format(OX_LIB_INIT_FILE)))
    chunk()

    Citizen.CreateThread(function()
        log.debug('ox_lib emulated into resource.')
    end)
end
