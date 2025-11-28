QBCore = exports['qb-core']:GetCoreObject()

-- Initialize ratings storage (you can replace this with database storage)
local businessRatings = {}

-- Function to load ratings from database (example - implement with your database)
local function LoadRatingsFromDB()
    -- TODO: Implement database loading
    -- Example: MySQL.Async.fetchAll('SELECT * FROM business_ratings', {}, function(result)
    --     for _, rating in ipairs(result) do
    --         if not businessRatings[rating.business] then
    --             businessRatings[rating.business] = {}
    --         end
    --         table.insert(businessRatings[rating.business], {
    --             playerName = rating.playerName,
    --             citizenid = rating.citizenid,
    --             rating = rating.rating,
    --             comment = rating.comment,
    --             timestamp = rating.timestamp
    --         })
    --     end
    -- end)
end

-- Function to save rating to database (example - implement with your database)
local function SaveRatingToDB(business, citizenid, playerName, rating, comment)
    -- TODO: Implement database saving
    -- Example: MySQL.Async.execute('INSERT INTO business_ratings (business, citizenid, playerName, rating, comment, timestamp) VALUES (@business, @citizenid, @playerName, @rating, @comment, @timestamp)', {
    --     ['@business'] = business,
    --     ['@citizenid'] = citizenid,
    --     ['@playerName'] = playerName,
    --     ['@rating'] = rating,
    --     ['@comment'] = comment,
    --     ['@timestamp'] = os.time()
    -- })
end

-- Calculate average rating for a business
local function CalculateAverageRating(business)
    if not businessRatings[business] or #businessRatings[business] == 0 then
        return 0, 0
    end

    local total = 0
    local count = #businessRatings[business]

    for _, rating in ipairs(businessRatings[business]) do
        total = total + rating.rating
    end

    return total / count, count
end

-- Submit rating callback
lib.callback.register('vl_businesses:submitRating', function(source, businessName, rating, comment)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return false end

    local citizenid = Player.PlayerData.citizenid
    local playerName = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname

    -- Initialize business ratings if not exists
    if not businessRatings[businessName] then
        businessRatings[businessName] = {}
    end

    -- Check if player already rated (optional - remove to allow multiple ratings)
    -- for i, existingRating in ipairs(businessRatings[businessName]) do
    --     if existingRating.citizenid == citizenid then
    --         -- Update existing rating
    --         businessRatings[businessName][i] = {
    --             playerName = playerName,
    --             citizenid = citizenid,
    --             rating = rating,
    --             comment = comment,
    --             timestamp = os.time()
    --         }
    --         SaveRatingToDB(businessName, citizenid, playerName, rating, comment)
    --         return true
    --     end
    -- end

    -- Add new rating
    table.insert(businessRatings[businessName], {
        playerName = playerName,
        citizenid = citizenid,
        rating = rating,
        comment = comment,
        timestamp = os.time()
    })

    -- Save to database
    SaveRatingToDB(businessName, citizenid, playerName, rating, comment)

    -- Log rating
    print(string.format('[Business Ratings] %s rated %s: %d stars', playerName, businessName, rating))

    return true
end)

-- Get ratings callback
lib.callback.register('vl_businesses:getRatings', function(source, businessName)
    if not businessRatings[businessName] or #businessRatings[businessName] == 0 then
        return nil
    end

    local average, total = CalculateAverageRating(businessName)

    -- Get recent ratings (last 10)
    local recentRatings = {}
    local startIndex = math.max(1, #businessRatings[businessName] - 9)
    for i = #businessRatings[businessName], startIndex, -1 do
        table.insert(recentRatings, businessRatings[businessName][i])
    end

    local data = {
        average = average,
        total = total,
        recent = recentRatings
    }

    return data
end)

-- Get ratings for management laptop
RegisterNetEvent('vl_businesses:getBusinessRatings', function(businessName)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end

    local average, total = CalculateAverageRating(businessName)
    local recentRatings = {}

    if businessRatings[businessName] then
        local startIndex = math.max(1, #businessRatings[businessName] - 19)
        for i = #businessRatings[businessName], startIndex, -1 do
            table.insert(recentRatings, businessRatings[businessName][i])
        end
    end

    TriggerClientEvent('vl_businesses:receiveBusinessRatings', source, {
        average = average,
        total = total,
        recent = recentRatings
    })
end)

-- Load ratings on resource start
CreateThread(function()
    LoadRatingsFromDB()
    print('[VL-Businesses] Rating system initialized')
end)

-- Export function to get ratings (can be used by other resources)
exports('GetBusinessRatings', function(businessName)
    local average, total = CalculateAverageRating(businessName)
    return {
        average = average,
        total = total,
        ratings = businessRatings[businessName] or {}
    }
end)
