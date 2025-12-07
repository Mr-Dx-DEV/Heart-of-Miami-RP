function DeepCopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end

--- @param table table
--- @return boolean
function table.isEmpty(table)
    if IsTable(table) then
        if next(table) == nil then
            return true
        else
            return false
        end
    else
        return true
    end
end

function table.len(table)
    local count = 0
    for _, _ in pairs(table) do
        count = count + 1
    end
    return count
end

function table.merge(t1, t2)
    local target = DeepCopy(t1)
    local source = DeepCopy(t2)
    for k, v in pairs(source) do
        if (type(v) == "table") and (type(target[k] or false) == "table") then
            table.merge(target[k], source[k])
        else
            target[k] = v
        end
    end
    return target
end
