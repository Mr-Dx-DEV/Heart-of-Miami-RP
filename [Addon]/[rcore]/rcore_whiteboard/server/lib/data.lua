function handleWhiteboardDataUpdate(boardId, data, plId)
    Citizen.CreateThread(function()
        local board = updateWhiteboardData(boardId, data)
        if board then
            _whiteboardData[boardId] = board
    
            if not Config.DynamicLoading then
                CreateThread(function()
                    for _, plId in pairs(GetPlayers()) do
                        TriggerLatentClientEvent(triggerName('load'), plId, Config.BPS, boardId, data)
                        Wait(SConfig.BoardDataLoadWait or 20)
                    end
                end)
            else
                unloadBoardId(boardId)
            end
    
            TriggerEvent(triggerName('updated'), boardId, plId)
        end
    end)
end

RegisterNetEvent(triggerName('save'), function(boardId, data)
    local plId = source
    dbg.info('Player %s saving whiteboard %s', plId, boardId)

    if not canChangeWhiteboard(plId, boardId) then
        return
    end

    handleWhiteboardDataUpdate(boardId, data, plId)
end)

RegisterNetEvent(triggerName('load'), function(boardId)
    local board = getWhiteboardById(boardId)
    if not board then
        dbg.critical('Player ask for whiteboard data that does not exist %s', boardId)
        return
    end

    dbg.debug('Loading board %s for player %s', boardId, source)
    TriggerClientEvent(triggerName('setWhiteboardLoadingState'), source, boardId)
    TriggerLatentClientEvent(triggerName('load'), source, Config.BPS, boardId, board.data)
end)