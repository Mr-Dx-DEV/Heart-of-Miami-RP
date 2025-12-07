function loadAllWhiteboards()
    local output = {}
    local boards = MySQL.Sync.fetchAll('SELECT * FROM rcore_whiteboard_boards')
    for _, board in pairs(boards) do
        local nextIndex = #output + 1
        output[nextIndex] = board
        output[nextIndex].databaseId = board.id
        output[nextIndex].boardId = board.boardId
        output[nextIndex].id = board.boardId
    end
    return output
end
function loadAllWhiteboardsData()
    local output = {}
    local boards = MySQL.Sync.fetchAll('SELECT * FROM rcore_whiteboard')
    for _, board in pairs(boards) do
        output[board.id] = board
    end
    return output
end

function createWhiteboard(whiteboardData)
    local id = MySQL.Sync.insert('INSERT INTO rcore_whiteboard_boards (boardId, model, readOnly, url, position, rotation, rotationScaleform, ace, jobs, grades, interactionDistance, pickable) VALUES (@boardId, @model, @readOnly, @url, @position, @rotation, @rotationScaleform, @ace, @jobs, @grades, @interactionDistance, @pickable)', {
        ['@boardId'] = whiteboardData.id,
        ['@model'] = whiteboardData.model,
        ['@readOnly'] = whiteboardData.readOnly,
        ['@url'] = whiteboardData.url,
        ['@position'] = json.encode(whiteboardData.pos),
        ['@rotation'] = json.encode(whiteboardData.rotation),
        ['@rotationScaleform'] = json.encode(whiteboardData.rotationScaleform),
        ['@ace'] = whiteboardData.ace,
        ['@jobs'] = json.encode(whiteboardData.jobs),
        ['@grades'] = json.encode(whiteboardData.grades),
        ['@interactionDistance'] = whiteboardData.interactionDistance,
        ['@pickable'] = whiteboardData.pickable or false,
    })

    if not id then
        dbg.critical('Failed to create whiteboard %s', id)
        return false, nil
    end
    return true, id
end

function updateWhiteboard(whiteboardData)
    MySQL.Sync.execute('UPDATE rcore_whiteboard_boards SET boardId = @boardId, model = @model, readOnly = @readOnly, url = @url, position = @position, rotation = @rotation, rotationScaleform = @rotationScaleform, ace = @ace, jobs = @jobs, grades = @grades, interactionDistance = @interactionDistance, pickable = @pickable WHERE id = @id', {
        ['@id'] = whiteboardData.databaseId,
        ['@boardId'] = whiteboardData.id,
        ['@model'] = whiteboardData.model,
        ['@readOnly'] = whiteboardData.readOnly,
        ['@url'] = whiteboardData.url,
        ['@position'] = json.encode(whiteboardData.pos),
        ['@rotation'] = json.encode(whiteboardData.rotation),
        ['@rotationScaleform'] = json.encode(whiteboardData.rotationScaleform),
        ['@ace'] = whiteboardData.ace,
        ['@jobs'] = json.encode(whiteboardData.jobs),
        ['@grades'] = json.encode(whiteboardData.grades),
        ['@interactionDistance'] = whiteboardData.interactionDistance,
        ['@pickable'] = whiteboardData.pickable
    })

    if rowsChanged == 0 then
        dbg.critical('Failed to update whiteboard %s', id)
        return false
    end
    
    return true
end

function deleteWhiteboard(databaseId)
    MySQL.Async.execute('DELETE FROM `rcore_whiteboard_boards` WHERE `id` = @databaseId', {
        ['@databaseId'] = databaseId,
    })
end


function updateWhiteboardData(id, data)
    local rowsChanged = MySQL.Sync.execute('REPLACE INTO rcore_whiteboard (id, data) VALUES (@id, @data)', {
        ['@id'] = id,
        ['@data'] = data,
    })

    if rowsChanged == 0 then
        dbg.critical('Failed to update whiteboard data %s', id)
        return false
    end

    return {
        id = id,
        data = data,
    }
end

local function ensurePickableColumn(tableName)
    MySQL.Async.fetchAll("SHOW COLUMNS FROM " .. tableName .. " LIKE 'pickable';", {}, function(result)
        if #result == 0 then
            MySQL.Async.execute("ALTER TABLE " .. tableName .. " ADD COLUMN pickable TINYINT(1) DEFAULT 0;", {}, function()
            end)
        end
    end)
end

function deleteWhiteboardDataByBoardId(boardId)
    MySQL.Async.execute('DELETE FROM `rcore_whiteboard` WHERE `id` = @id', {
        ['@id'] = boardId,
    })
end

function createTableIfNotExist()
    MySQL.Sync.execute('CREATE TABLE IF NOT EXISTS rcore_whiteboard (id VARCHAR(255) NOT NULL, data LONGTEXT, PRIMARY KEY (id))', {}, function(rowsChanged)
    end)
    MySQL.Sync.execute('CREATE TABLE IF NOT EXISTS rcore_whiteboard_boards (id INT(11) NOT NULL AUTO_INCREMENT, boardId VARCHAR(255), model VARCHAR(255), readOnly TINYINT(1) DEFAULT "0", rotationScaleform VARCHAR(255), position VARCHAR(255), url VARCHAR(255), rotation VARCHAR(255), ace TINYINT(1) DEFAULT "0", grades TEXT, interactionDistance VARCHAR(5), pickable TINYINT(1) DEFAULT "0", jobs TEXT, PRIMARY KEY (id))', {}, function(rowsChanged)
    end)
    ensurePickableColumn('rcore_whiteboard_boards')
end