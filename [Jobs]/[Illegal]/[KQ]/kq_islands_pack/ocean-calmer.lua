local islands = {
    { coords = vec3(4278.63, 7718.0, 7.46), radius = 350 },
    { coords = vec3(-6351.0, 2807.7, 5.1), radius = 400 },
    { coords = vec3(5140.782, -1121.04517, -25), radius = 400},
    
    -- Cayo Perico scalar fix
    { coords = vec3(4840.571, -5174.425, 2.0), radius = 2000 },
}

local scalarSet = false

Citizen.CreateThread(function()
    while true do
        local sleep = 5000
        local playerCoords = GetEntityCoords(PlayerPedId())
        local withinIsland = false
        
        for _, island in ipairs(islands) do
            if #(playerCoords - island.coords) <= island.radius then
                withinIsland = true
                break
            end
        end
        
        if withinIsland then
            SetDeepOceanScaler(0.0)
            scalarSet = true
        elseif not withinIsland and scalarSet then
            ResetDeepOceanScaler()
            scalarSet = false
        end
        
        Citizen.Wait(sleep)
    end
end)
