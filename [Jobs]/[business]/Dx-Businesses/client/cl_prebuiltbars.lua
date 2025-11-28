local spawnedEntity = {}

local function OpenStore(label)
    exports.ox_inventory:openInventory('shop', { type = label, id = 1 })
end


local function SpawnPed(data)
    lib.requestModel(data.ped.ped)
    local entity = CreatePed(0, GetHashKey(data.ped.ped), data.coords.x, data.coords.y, data.coords.z - 1.0, data.coords.w,  false, false)
    FreezeEntityPosition(entity, true)
    SetEntityInvincible(entity, true)
    SetBlockingOfNonTemporaryEvents(entity, true)
    SetEntityHeading(entity, data.coords.w)
    exports['qb-target']:AddTargetEntity(entity, { 
    options = { 
        { 
            action = function ()
                OpenStore(data.name)
            end,
            icon = data.target.targetIcon,
            label = data.target.targetLabel,
            canInteract = data.target.canInteract,
            job = data.job or nil,
        }
        },
        distance = 2.5, 
    })
    return entity
end

local function onEnter(self)
    if spawnedEntity[self.shopData.name] == nil or not DoesEntityExist(spawnedEntity[self.shopData.name]) then
        spawnedEntity[self.shopData.name] = SpawnPed(self.shopData)
    end
end

local function onExit(self)
    if spawnedEntity[self.shopData.name] ~= nil and DoesEntityExist(spawnedEntity[self.shopData.name]) then
        DeleteEntity(spawnedEntity[self.shopData.name])
    end
end

Citizen.CreateThread(function()

    for k, v in pairs(prebuiltbars) do
        if v.enabled and v.shop then
            lib.points.new({
                coords = v.shop.coords,
                distance = 50.0,
                shopData = {
                    name = v.shop.name,
                    ped = v.shop.ped,
                    target = v.shop.target,
                    items = v.shop.items,
                    label = v.shop.label,
                    coords = v.shop.coords,
                    job = v.job,
                },
                onEnter = onEnter,
                onExit = onExit,
            })
        end
    end
end)