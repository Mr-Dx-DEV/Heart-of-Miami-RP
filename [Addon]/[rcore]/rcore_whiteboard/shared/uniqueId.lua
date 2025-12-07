function generateUniqueBoardId(playerId)
    local timestamp = math.floor(os.time() * 1000 + (os.clock() % 1) * 1000)
    return string.format("from_item_%d_%s", timestamp, tostring(playerId))
end