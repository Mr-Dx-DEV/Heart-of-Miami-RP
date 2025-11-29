Config.TargetSystem = nil

if GetResourceState("qb-target") ~= "missing" then
    Config.TargetSystem = "qb-target"
elseif GetResourceState("qtarget") ~= "missing" then
    Config.TargetSystem = "qtarget"
elseif GetResourceState("ox_target") ~= "missing" then
    Config.TargetSystem = "qtarget" -- OX_Target have a backward compability to qtarget
end

Utils.AddEntityToTarget = function(entity)
    exports[Config.TargetSystem]:AddTargetEntity(entity, {
        options = {
            {
                icon = "fas fa-briefcase",
                label = _L("Interaction.Open"),
                action = function()
                    Utils.ToggleNUI(true)
                end,
            },
        },
        distance = 4
    })
end
