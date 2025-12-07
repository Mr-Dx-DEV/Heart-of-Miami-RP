-- This is called when a player uses the item to check if he is allowed to place any boars from item
function canPlaceBoardFromItem(source)
    return true
end

-- This is called when a player tries to pick up the board to check if he is allowed to pick it up
function canPickupBoardAsItem(source)
    return true
end

-- This is also called when a player uses the item to check if he is allowed to place any boards from item
-- to allow you to split the logic who is allowed to and where he is allowed to place any boards
function canPlaceBoardInArea(source)
    return true
end

-- This is also called when a player tries to pick up the board to check if he is allowed to pick it up in the area
-- to allow you to split the logic who is allowed to and where he is allowed to pick up any boards
function canPickupBoardInArea(source)
    return true
end