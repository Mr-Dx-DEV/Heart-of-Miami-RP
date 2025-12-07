
-- This was defined by deployer from rcore_banners - sv_deployer.lua
-- This internal API allowing rcore_banners to support business creation of custom banners during live time for es_extended inventory!

RegisterNetEvent('rcore_banners:client:syncInventory', function(playerInventory)
    if not GetInvokingResource() == 'rcore_banners' then return end
    ESX.PlayerData.inventory = playerInventory
end)
