QBCore = exports['qb-core']:GetCoreObject()
zoneTable = {}
showingUI = false
PlayerJob = {}
PlayerJob = QBCore.Functions.GetPlayerData().job

local items = exports.ox_inventory:Items()

local function GetIngredientsText(ingredients)
    if not next(ingredients) then  
        return ""
    end
    local text = ''
    for k, v in pairs(ingredients) do
        text = text .. items[k].label .. ' x' .. v .. '\n '
    end
    return text
end

local function CheckIfHasItems(ingredients, amount)
    if not next(ingredients) then return true end
    for k, v in pairs(ingredients) do
        local itemCount = exports.ox_inventory:GetItemCount(k)
        if v == 0 then
            if itemCount <= 0 then
                return false
            end
        elseif itemCount < (v * amount) then
            return false
        end
    end
    return true
end

function lookEnt(entity)
	if type(entity) == "vector3" then
		if not IsPedHeadingTowardsPosition(PlayerPedId(), entity, 10.0) then
			TaskTurnPedToFaceCoord(PlayerPedId(), entity, 1500)
		end
	else
		if DoesEntityExist(entity) then
			if not IsPedHeadingTowardsPosition(PlayerPedId(), GetEntityCoords(entity), 30.0) then
				TaskTurnPedToFaceCoord(PlayerPedId(), GetEntityCoords(entity), 1500)
			end
		end
	end
end

local function DoAction(dataInfo)
    local options = {}
    for k, v in pairs(dataInfo.items) do
        if CheckIfHasItems(v.ingredients, 1) then
            disabled = false
        else
            disabled = true
        end
        options[#options + 1] = {
            title = items[v.item].label,
            description = GetIngredientsText( v.ingredients ),
            image = items[v.item].client.image,
            disabled = disabled,
            onSelect = function()
                local input = lib.inputDialog('Crafting', {
                    { type = 'number', label = 'How many would you like to make?', default = 1, min = 1 },
                })
                if not input then return end
                if not input[1] then return end

                local hasItems = CheckIfHasItems(v.ingredients, input[1])
                if hasItems then
                    -- lib.callback.await('vl_businesses:craft', false, v.item, v.ingredients)
                    if lib.progressCircle({
                        duration = dataInfo.craftingtime * input[1],
                        label = ''..dataInfo.craftinglabel..' ' ..input[1].."x ".. items[v.item].label,
                        useWhileDead = false,
                        position = 'bottom',
                        canCancel = true,
                        anim = {
                            dict = dataInfo.anim.dict,
                            clip = dataInfo.anim.clip,
                            flaged = 49,
                        },
                        disable = {
                            move = true,
                            car = true,
                            mouse = false,
                        },
                    }) then
                        lib.callback.await('vl_businesses:craft', false, v.item, v.ingredients, input[1])
                    end
                else
                    lib.notify({
                        title = 'Not Enough Items',
                        description = 'You do not have enough items to craft this.',
                        type = 'error'
                    })
                end
            end
        }
    end
    lib.registerContext({
        id = 'crafting-businesses',
        title = dataInfo.label,
        options = options,
    })
    lib.showContext('crafting-businesses')
end

local currentPointCoords = nil

local function onEnterNearby(point)
    if point.job ~= PlayerJob.name then
        return
    end

    if point.isClosest and point.currentDistance < 0.7 and not showingUI then
        lib.showTextUI('[E] '..point.dataInfo.label)
        showingUI = true
        currentPointCoords = point.coords
    elseif showingUI and point.currentDistance > 0.7 and currentPointCoords == point.coords then
        lib.hideTextUI()
        showingUI = false
        currentPointCoords = nil
    end
    if point.isClosest and point.currentDistance < 0.7 and IsControlJustReleased(0, 38) then
        -- lookEnt(point.coords)
        DoAction(point.dataInfo)
    end
end

-- for k, v in pairs(Businesses) do
--     if v.enabled then
--         for station, stationData in pairs(v.crafting) do
--             for _, coords in pairs(stationData.coords) do
--                 zoneTable[#zoneTable] =  lib.points.new({
--                     coords = coords,
--                     distance = 10.0,
--                     nearby = onEnterNearby,
--                     dataInfo = stationData,
--                     job = v.job,
--                 })
--             end
--         end
--     end
-- end

for k, v in pairs(Businesses) do
    if v.enabled and v.crafting then
        for station, stationData in pairs(v.crafting) do
            if type(stationData) == "table" and stationData.coords then
                for _, coords in pairs(stationData.coords) do
                    zoneTable[#zoneTable + 1] = lib.points.new({
                        coords = coords,
                        distance = 10.0,
                        nearby = onEnterNearby,
                        dataInfo = stationData,
                        job = v.job,
                        drawmarker = v.drawmarker,
                    })
                end
            else
                print("❌ stationData is not a table for station:", station)
            end
        end
    end
end
