function getJob(id)
    if Config.Framework == Frameworks.ESX then
        if FrameworkObject then
            local xPlayer = FrameworkObject.GetPlayerFromId(id)
            if xPlayer then
                return xPlayer.job.name, xPlayer.job.grade_name
            else
                dbg.critical("Empty xPlayer variable!")
            end
        else
            dbg.critical("Empty FrameworkObject variable!")
        end
    elseif Config.Framework == Frameworks.QBCORE then
        if FrameworkObject then
            local qbCore = FrameworkObject.Functions.GetPlayer(id)
            if qbCore then
                return qbCore.PlayerData.job.name, qbCore.PlayerData.job.grade and qbCore.PlayerData.job.grade.name or nil
            else
                dbg.critical("Empty qbCore variable!")
            end
        else
            dbg.critical("Empty FrameworkObject variable!")
        end
    end

    return nil, nil
end