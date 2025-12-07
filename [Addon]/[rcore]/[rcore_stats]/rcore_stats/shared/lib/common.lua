--Taken from ESX
function tprint(table)
    print(DumpTable(table))
end

function DumpTable(table, nb)
    if nb == nil then
        nb = 0
    end

    if type(table) == 'table' then
        local s = ''
        for i = 1, nb + 1, 1 do
            s = s .. "    "
        end

        s = '{\n'
        for k, v in pairs(table) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            for i = 1, nb, 1 do
                s = s .. "    "
            end
            s = s .. '[' .. k .. '] = ' .. DumpTable(v, nb + 1) .. ',\n'
        end

        for i = 1, nb, 1 do
            s = s .. "    "
        end

        return s .. '}'
    else
        return tostring(table)
    end
end

--- @param table table
--- @return boolean
function IsTable(table)
    if table ~= nil then
        if type(table) == "table" then
            return true
        end
        return false
    else
        return false
    end
end

exports('IsTable', IsTable)

function RoundToDecimals(num, numOfDecimals)
    local mult = 10 ^ (numOfDecimals or 0)
    return math.floor(num * mult + 0.5) / mult
end

function TriggerName(event)
    return string.format('%s:%s', GetCurrentResourceName(), event)
end

function CTriggerName(event)
    return TriggerName("client:" .. event)
end

function STriggerName(event)
    return TriggerName("server:" .. event)
end

function Clamp(value, min, max)
    return math.max(min, math.min(value, max))
end
