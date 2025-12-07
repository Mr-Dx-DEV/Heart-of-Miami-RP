function canChangeWhiteboard(playerId, boardId)
    local board = findWhiteboardById(boardId)

    if board then
        if board.readOnly then
            dbg.security('Board %s is readonly %s tried to edit it', playerId)
            return false
        end

        --For admins
        if Ace.Can(playerId, Permissions.EDIT_ALL) then
            dbg.security('Override permission for %s - has EDIT_ALL permission', playerId)
            return true
        end

        --Default behaviour for standalone framework
        --If you want to change this into your own job system delete this part and change getJob function
        if Config.Framework == Frameworks.STANDALONE and not board.ace then
            dbg.security('Override permission for %s - has STANDALONE framework and board does not have ACE permissions', playerId)
            return true
        end

        if board.ace then
            if Ace.Can(playerId, whiteboardEditAce(boardId)) then
                dbg.security('Override permission for %s - has %s permission', playerId, whiteboardEditAce(boardId))
                return true
            end
        end

        local job, gradeName, grade = getJob(playerId)

        if job and gradeName then
            if board.jobs and type(board.jobs) == "table" and table.len(board.jobs) > 0 then
                if table.contains(board.jobs, job) then
                    if board.grades and type(board.grades) == "table" and table.len(board.grades) > 0 then
                        if table.contains(board.grades, gradeName) or table.contains(board.grades, tostring(grade)) then
                            return true
                        end
                    else
                        --Has no grades parameter or its empty
                        return true
                    end
                end
            else
                --Has no jobs parameter or its empty
                return true
            end

        else
            dbg.critical('Cannot find job for %s', playerId)
        end
    else
        dbg.critical('Cannot find whiteboard %s', boardId)
    end

    return false
end

RegisterNetEvent(triggerName('can'), function(boardId)
    local playerId = source
    local can = canChangeWhiteboard(playerId, boardId)
    dbg.debug('Can change whiteboard %s %s', boardId, can)
    TriggerClientEvent(triggerName('can'), playerId, boardId, can)
end)