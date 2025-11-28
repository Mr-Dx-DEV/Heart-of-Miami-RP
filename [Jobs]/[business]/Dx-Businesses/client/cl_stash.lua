QBCore = exports['qb-core']:GetCoreObject()
local ox_inventory = exports.ox_inventory
zoneTable = {}
showingUIStash = false
PlayerJob = {}
PlayerJob = QBCore.Functions.GetPlayerData().job

local currentPointCoordsStash = nil
local canOpen = false

local function onEnterNearbyStash(point)
    if point.job ~= PlayerJob.name then
        return
    end
    if point.job == PlayerJob.name then
        canOpen = true
    end
    
    if point.drawmarker then
    DrawMarker(25, point.coords.x, point.coords.y, point.coords.z-0.95, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.45, 0.45, 0.45, 30, 150, 30, 222, false, false, 2, false, false, false, false)
    end

    if point.isClosest and point.currentDistance <= 0.7 and not showingUIStash then
        lib.showTextUI('[E] Open '..point.dataInfo.label)
        showingUIStash = true
        currentPointCoordsStash = point.coords
    elseif showingUIStash and point.currentDistance >= 0.7 and currentPointCoordsStash == point.coords then
        lib.hideTextUI()
        showingUIStash = false
        currentPointCoordsStash = nil
    end
    if point.isClosest and point.currentDistance <= 0.7 and IsControlJustReleased(0, 38) then
        if canOpen then
        if ox_inventory:openInventory('stash', point.dataInfo.label) == false then
            TriggerServerEvent('vl_businesses:registerstash', point.dataInfo.label, point.dataInfo.label, tonumber(point.dataInfo.slots), tonumber(point.dataInfo.weight), point.dataInfo.coords)
            ox_inventory:openInventory('stash', point.dataInfo.label)
        end
        else
            lib.notify({
                description = 'You do not have permission to this stash.',
                type = 'error'
            })
        end
    end
end

for k, v in pairs(Businesses) do
    if v.enabled and v.stash.enabled then
            for _, coords in pairs(v.stash.coords) do
                zoneTable[#zoneTable] =  lib.points.new({
                    coords = coords,
                    distance = 10.0,
                    nearby = onEnterNearbyStash,
                    dataInfo = v.stash,
                    job = v.job,
                    drawmarker = v.drawmarker,
                })
            end
    end
end