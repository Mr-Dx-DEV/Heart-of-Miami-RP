local QBCore = exports['qb-core']:GetCoreObject()

function GetBongConfigByItem(usedItem)
    for _, business in pairs(Businesses) do
        if business.bong and business.bong.enabled and business.bong.item then
            if business.bong.item == usedItem then
                return business.bong
            end
        end
    end
    return nil
end

function BongEffect()
    ExecuteCommand("walk drunk5")
    StartScreenEffect("DrugsMichaelAliensFight", 0, false)
    Wait(25000)  -- Duration in milliseconds
    StopScreenEffect("DrugsMichaelAliensFight")
    ResetPedMovementClipset(PlayerPedId())
end


function ApplyBongEffects(strainItem)
    local strainData = nil
    for k, v in pairs(Config.Bongs) do
        if v.Name == strainItem then
            strainData = v
            break
        end
    end
    if strainData then
        local ped = PlayerPedId()
        local newHealth = math.min(200, GetEntityHealth(ped) + (strainData.Health or 0))
        SetEntityHealth(ped, newHealth)
        AddArmourToPed(ped, GetPedArmour(ped) + (strainData.Armour or 0))
        TriggerServerEvent('hud:server:RelieveStress', strainData.Stress)
    end
end



RegisterNetEvent("vl_businesses:openBongMenu", function(bongItem)
    local bongConfig = GetBongConfigByItem(bongItem)
    if not bongConfig then
        QBCore.Functions.Notify("Bong configuration not found for item: " .. tostring(bongItem), "error")
        return
    end

    local menuOptions = {}
    for _, option in ipairs(bongConfig.menu.options) do
        local hasAllIngredients = true
        for ing, qty in pairs(option.ingredients) do
            local required = (qty == 0 and 1 or qty)
            if exports.ox_inventory:GetItemCount(ing) < required then
                hasAllIngredients = false
                break
            end
        end

        table.insert(menuOptions, {
            title = option.label,
            description = "Requires: " .. (function()
                local parts = {}
                for ing, qty in pairs(option.ingredients) do
                    table.insert(parts, ing .. " x" .. qty)
                end
                return table.concat(parts, ", ")
            end)(),
            disabled = not hasAllIngredients,
            onSelect = function()
                if not hasAllIngredients then
                    QBCore.Functions.Notify("You do not have the required ingredients.", "error")
                    return
                end
                -- Start the bong animation
                ExecuteCommand("e bong2")
                local success = lib.progressCircle({
                    duration = tonumber(bongConfig.craftingTime),
                    label = bongConfig.progressBarLabel,
                    useWhileDead = false,
                    canCancel = true,
                    position = 'bottom',
                    disable = {
                        move = false,
                        car = true,
                        mouse = false,
                        combat = true,
                    },
                })
                if success then
                    lib.callback.await("vl_businesses:craftBong", false, option.item, option.ingredients)
                    ExecuteCommand("e c") -- End the animation
                    if option.effects then
                        local ped = PlayerPedId()
                        local newHealth = math.min(200, GetEntityHealth(ped) + (option.effects.Health or 0))
                        SetEntityHealth(ped, newHealth)
                        AddArmourToPed(ped, GetPedArmour(ped) + (option.effects.Armour or 0))
                        TriggerServerEvent('hud:server:RelieveStress', option.effects.Stress or 0)
                    end
                    BongEffect()
                else
                    ExecuteCommand("e c")
                end
            end
        })
    end

    lib.registerContext({
        id = "bongMenu",
        title = bongConfig.menu.header,
        options = menuOptions,
    })
    lib.showContext("bongMenu")
end)



