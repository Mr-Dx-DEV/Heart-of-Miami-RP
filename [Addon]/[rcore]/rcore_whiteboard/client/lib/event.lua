AddEventHandler('rcore_whiteboard:editWhiteboard', function(entity)
    local whiteboard, index = getSpawnedWhiteboardByCoords(entity.coords or GetEntityCoords(entity.entity))

    local can = checkPermission(whiteboard.whiteboard.id)
    dbg.debug('Can edit whiteboard %s %s', whiteboard.whiteboard.id, can)
    if not can then
        showNotification(_U('non_permission'))
        return
    end

    editedWhiteboardIndex = index
    openEditor(getLoadedData(whiteboard.whiteboard.id))
end)

AddEventHandler('rcore_whiteboard:editWhiteboardScaleformRotation', function(entity)
    local whiteboard, index = getSpawnedWhiteboardByCoords(entity.coords or GetEntityCoords(entity.entity))

    if not whiteboard.whiteboard.pickable then
        return
    end

    setBoardForScaleformReposition(whiteboard.whiteboard.databaseId)
end)