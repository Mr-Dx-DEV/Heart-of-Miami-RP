function DisplayText(msg,type)
    if type == "close" then
        exports['av_laptop']:hideTextUI()
    else
        exports['av_laptop']:showTextUI(msg)
    end
end