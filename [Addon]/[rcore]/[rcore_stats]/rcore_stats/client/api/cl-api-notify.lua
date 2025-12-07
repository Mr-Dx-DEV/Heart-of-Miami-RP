local function UINotify(title, message, isError)
    SendReactMessage('notify', {
        title = title,
        message = message,
        isError = isError
    })
end

RegisterNUICallback('notify', function(data, cb)
    if Config.UseFrameworkNotify and (Config.Framework == 1 or Config.Framework == 2) then
        ShowNotification(data.message, data.isError and "error" or nil)
    else
        UINotify(data.title, data.message, data.isError)
    end

    cb({})
end)

function NativeNotify(message, error)
    if Config.UseFrameworkNotify and (Config.Framework == 1 or Config.Framework == 2) then
        ShowNotification(message, error and "error" or nil)
    else
        BeginTextCommandThefeedPost("STRING")
        AddTextComponentSubstringPlayerName(message)
        EndTextCommandThefeedPostTicker(true, true)
    end
end
