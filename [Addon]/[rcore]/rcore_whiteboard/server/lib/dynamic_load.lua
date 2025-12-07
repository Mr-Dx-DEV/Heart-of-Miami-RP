local loadedBoards = {}

if Config.DynamicLoading then
    CreateThread(function()
        while true do
            Wait(2000)
            for _, plId in pairs(GetPlayers()) do
                local ped = GetPlayerPed(plId)
                local coords = GetEntityCoords(ped)

                for _, board in pairs(_whiteboardsConfig) do
                    if loadedBoards[plId] == nil then
                        loadedBoards[plId] = {}
                    end

                    if not loadedBoards[plId][board.id] then
                        local dist = #(coords - board.pos)
                        if dist < Config.DynamicLoadingDistance then
                            local boardData = getWhiteboardById(board.id)
                            if boardData then
                                loadedBoards[plId][board.id] = true
                                dbg.debug('Loading board %s for player %s', board.id, plId)
                                TriggerClientEvent(triggerName('setWhiteboardLoadingState'), plId, board.id)
                                TriggerLatentClientEvent(triggerName('load'), plId, Config.BPS, board.id, boardData.data)

                                Wait(SConfig.BoardDataLoadWait or 20)
                            end
                        end
                    end
                end
            end
        end
    end)
end

function unloadBoardId(boardId)
    for playerId, _ in pairs(loadedBoards) do
        loadedBoards[playerId][boardId] = nil
    end
end