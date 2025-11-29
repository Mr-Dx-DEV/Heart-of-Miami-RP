Utils.FormatMoney = function(amount)
    amount = math.abs(amount)
    local formatted = tostring(amount)
    local k = 0

    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')
        if k == 0 then break end
        Wait(0)
    end

    formatted = "$" .. formatted

    return formatted
end
