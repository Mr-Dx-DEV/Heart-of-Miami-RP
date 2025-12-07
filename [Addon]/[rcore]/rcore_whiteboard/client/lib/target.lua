ENTITY_TYPE_OBJECT = 3
ENTITY_TYPE_VEHICLE = 2
ENTITY_TYPE_PED = 1

RAYCAST_FLAG_ALL = -1
RAYCAST_FLAG_MAP = 1
RAYCAST_FLAG_VEHICLES = 2
RAYCAST_FLAG_PEDS = 8
RAYCAST_FLAG_OBJECTS = 16

--TODO: Register ox_target, qb-target
--TODO: Create standalone raycast

function registerEntity(entity, whiteboardData)
    local options = {}
    if Config.TargetSystem == Targets.OX_TARGET then
        if whiteboardData.whiteboard.readOnly or whiteboardData.whiteboard.url then
            options = {
                {
                    name = 'readonly',
                    event = 'rcore_whiteboard:readonly',
                    icon = 'fa fa-xmark',
                    label = _U('read_only'),
                },
            }
        else
            options = {
                {
                    name = 'edit',
                    event = 'rcore_whiteboard:editWhiteboard',
                    icon = 'fa fa-pencil',
                    label = _U('edit_content'),
                }
            }
            if whiteboardData.whiteboard.pickable then
                options[#options + 1] = {
                    name = 'rotate_drawing',
                    icon = 'fa fa-rotate',
                    label = _U('rotate_drawing'),
                    event = 'rcore_whiteboard:editWhiteboardScaleformRotation',
                }
                options[#options + 1] = {
                    name = 'pick_up',
                    icon = 'fa fa-trash',
                    label = _U('pick_up_board'),
                    onSelect = function()
                        TriggerServerEvent(triggerName('onBoardPickup'), whiteboardData.whiteboard.databaseId)
                    end
                }
            end
        end

        exports.ox_target:addLocalEntity(entity, options)
    elseif Config.TargetSystem == Targets.QB_TARGET then
        if whiteboardData.whiteboard.readOnly or whiteboardData.whiteboard.url then
            options = {
                {
                    type = 'client',
                    event = 'rcore_whiteboard:readonly',
                    icon = 'fa fa-xmark',
                    label = _U('read_only'),
                },
            }
        else
            options = {
                {
                    event = 'rcore_whiteboard:editWhiteboard',
                    icon = 'fa fa-pencil',
                    label = _U('edit_content'),
                    type = "client",
                }
            }
            if whiteboardData.whiteboard.pickable then
                options[#options + 1] = {
                    name = 'rotate_drawing',
                    icon = 'fa fa-rotate',
                    label = _U('rotate_drawing'),
                    event = 'rcore_whiteboard:editWhiteboardScaleformRotation',
                }
                options[#options + 1] = {
                    name = 'pick_up',
                    icon = 'fa fa-trash',
                    label = _U('pick_up_board'),
                    action = function()
                        TriggerServerEvent(triggerName('onBoardPickup'), whiteboardData.whiteboard.databaseId)
                    end
                }
            end
        end

        exports['qb-target']:AddTargetEntity(entity, {
            options = options,
            distance = 3.0
        })
    elseif Config.TargetSystem == Targets.STANDALONE then
        
    end
end

function unregisterEntity(entity)
    if Config.TargetSystem == Targets.OX_TARGET then
        exports.ox_target:removeLocalEntity(entity)
    elseif Config.TargetSystem == Targets.QB_TARGET then
        exports['qb-target']:RemoveTargetEntity(entity, {
            _U('edit_content'),
            _U('rotate_drawing'),
            _U('pick_up_board'),
            _U('read_only')
        })
    elseif Config.TargetSystem == Targets.STANDALONE then

    end
end

AddEventHandler(triggerName('spawned'), function(index)
    local entityData = getSpawnedWhiteboardByIndex(index)
    if entityData then
        registerEntity(entityData.object, entityData)
    end
    dbg.debug('Register spawned whiteboard %s (obj.%s)', index, entityData.object)
end)

AddEventHandler(triggerName('destroyed'), function(index)
    local entityData = getSpawnedWhiteboardByIndex(index)
    if entityData then
        unregisterEntity(entityData.object)
    end
    dbg.debug('Unregister spawned whiteboard %s (obj.%s)', index, entityData.object)
end)
