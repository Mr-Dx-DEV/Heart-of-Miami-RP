Progress = {}

function Progress.Start(config, callback)
    if lib and lib.progressCircle then
        if lib.progressCircle({
            duration = config.duration,
            position = config.position or 'bottom',
            label = config.label,
            useWhileDead = config.useWhileDead or false,
            canCancel = config.canCancel or true,
            disable = {
                car = config.disableCar or false,
                move = config.disableMove or false,
                combat = config.disableCombat or true,
                mouse = config.disableMouse or false,
            },
            anim = config.animation and {
                dict = config.animation.dict,
                clip = config.animation.clip
            } or nil,
        }) then
            callback(true)
        else
            callback(false)
        end
    elseif Framework.Name == 'QB' or Framework.Name == 'QBX' then
        if Framework.Object and Framework.Object.Functions and Framework.Object.Functions.Progressbar then
            Framework.Object.Functions.Progressbar(
                "progress_action",
                config.label,
                config.duration,
                false,
                config.canCancel or true,
                {
                    disableMovement = config.disableMove or false,
                    disableCarMovement = config.disableCar or false,
                    disableMouse = config.disableMouse or false,
                    disableCombat = config.disableCombat or true,
                },
                config.animation and {
                    animDict = config.animation.dict,
                    anim = config.animation.clip,
                } or {},
                {}, {}, 
                function()
                    callback(true)
                end, 
                function()
                    callback(false)
                end
            )
        else
            Wait(config.duration)
            callback(true)
        end
    elseif Framework.Name == 'ESX' then
        if exports['esx_progressbar'] then
            exports['esx_progressbar']:Progressbar(config.label, config.duration, {
                FreezePlayer = config.disableMove or false,
                animation = config.animation and {
                    type = "anim",
                    dict = config.animation.dict,
                    lib = config.animation.clip,
                } or nil,
                onFinish = function()
                    callback(true)
                end,
                onCancel = function()
                    callback(false)
                end
            })
        else
            Wait(config.duration)
            callback(true)
        end
    else
        Wait(config.duration)
        callback(true)
    end
end

function Progress.Circle(config, callback)
    Progress.Start(config, callback)
end

function Progress.Bar(config, callback)
    if lib and lib.progressBar then
        if lib.progressBar({
            duration = config.duration,
            label = config.label,
            useWhileDead = config.useWhileDead or false,
            canCancel = config.canCancel or true,
            disable = {
                car = config.disableCar or false,
                move = config.disableMove or false,
                combat = config.disableCombat or true,
                mouse = config.disableMouse or false,
            },
            anim = config.animation and {
                dict = config.animation.dict,
                clip = config.animation.clip
            } or nil,
        }) then
            callback(true)
        else
            callback(false)
        end
    else
        Progress.Start(config, callback)
    end
end

