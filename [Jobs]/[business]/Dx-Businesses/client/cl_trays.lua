QBCore = exports['qb-core']:GetCoreObject()
local ox_inventory = exports.ox_inventory

for k, v in pairs(Businesses) do
    if v.enabled and v.traysenabled then
        for tray, trayData in pairs(v.trays) do
            for _, coords in pairs(trayData.coords) do
                exports.ox_target:addBoxZone({
                    coords = coords,
                    size = trayData.size,
                    rotation = trayData.rotation,
                    debug = Config.Debug,
                    options = {
                        {
                            name = trayData.label,
                            event = 'vl_businesses:opentargetstash',
                            id = trayData.label,
                            icon = trayData.icon,
                            label = "Open Tray",
                        }
                    }
                })
            end
        end
    end
end

RegisterNetEvent('vl_businesses:opentargetstash', function(info)
    if info then
    if ox_inventory:openInventory('stash', info.id) == false then
        TriggerServerEvent('vl_businesses:registerstash', info.id, info.id, '20', '20000', info.coords)
        ox_inventory:openInventory('stash', info.id)
    end
    end
end)