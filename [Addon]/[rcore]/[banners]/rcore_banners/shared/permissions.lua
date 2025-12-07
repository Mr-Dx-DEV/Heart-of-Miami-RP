--- @return table
function FetchJobPermissionsByInteract(job, interactType)
    if not job then return nil end
    if not interactType then return nil end

    local jobName = job?.name
    local jobGradeName = job?.gradeName:lower()

    if Config.Business.List[jobName] and Config.Business.List[jobName].enabled then
        dbg.debug('1. FetchJobPermissionsByInteract > Job: %s | Job grade: %s | Interact type: %s', jobName, jobGradeName, interactType)

        if not Config.Business.Permissions[jobGradeName] then
            dbg.critical('2. FetchJobPermissionsByInteract - Warning > Define %s in configs/business.lua - Config.Business.Permisions[%s]', jobGradeName, jobGradeName)
            return nil
        end

        if Config.Business.Permissions[jobGradeName][interactType] then
            return Config.Business.Permissions[jobGradeName][interactType]
        else
            return nil
        end
    end

    return nil
end

function FetchPermissionsByGroup(groupName)
    if not groupName then
        return {}
    end

    local group = ('group.%s'):format(groupName)
    local perms = groupName and Config.Permissions and Config.Permissions[group] or {}

    return perms 
end

function GetPermissionToStation(playerId, businessName, interactType)
    if IsDuplicityVersion() then
        local retval = {}
        local job = FrameworkService.GetPlayerJob(playerId)

        if job and job?.name == businessName then
            retval = FetchJobPermissionsByInteract(job, interactType)

            if retval and next(retval) and interactType then
                retval[WORKSTATION_PERMS.CAN_PRODUCE_BANNER] = true
            else
                retval = {
                    [WORKSTATION_PERMS.CAN_PRODUCE_BANNER] = true,
                }
            end
        else
            retval = {
                [WORKSTATION_PERMS.CAN_SET_BANNER] = false,
                [WORKSTATION_PERMS.CAN_PRODUCE_BANNER] = false,
            }
        end

        return retval
    else
        local retval = {}
        local job = FrameworkService.GetPlayerJob(playerId)

        if job and job?.name == businessName then
            retval = FetchJobPermissionsByInteract(job, interactType)

            if retval and interactType then
                retval[WORKSTATION_PERMS.CAN_PRODUCE_BANNER] = true
            end
        else
            retval = {
                [WORKSTATION_PERMS.CAN_SET_BANNER] = false,
                [WORKSTATION_PERMS.CAN_PRODUCE_BANNER] = false,
            }
        end

        return retval
    end
end