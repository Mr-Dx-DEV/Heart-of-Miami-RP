-- If you need to change to different notification system, you can replace content of the function below to anything else.
-- `text` is the notification string being displayed
function Notify(text)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(text or 'No text')
    EndTextCommandThefeedPostTicker(true, true)
end
