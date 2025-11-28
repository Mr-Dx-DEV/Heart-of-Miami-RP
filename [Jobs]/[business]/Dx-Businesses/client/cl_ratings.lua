QBCore = exports['qb-core']:GetCoreObject()
local spawnedRatingPeds = {}

-- Function to open rating menu
local function OpenRatingMenu(businessName, businessLabel)
    local input = lib.inputDialog('Rate '..businessLabel, {
        {
            type = 'slider',
            label = 'Rating (Stars)',
            description = 'Rate your experience from 1 to 5 stars',
            required = true,
            min = 1,
            max = 5,
            step = 1,
            default = 5
        },
        {
            type = 'textarea',
            label = 'Comment (Optional)',
            description = 'Leave a comment about your experience',
            placeholder = 'Tell us about your experience...',
            required = false,
            min = 0,
            max = 500
        }
    })

    if input then
        local rating = input[1]
        local comment = input[2] or ''

        -- Send rating to server
        lib.callback.await('vl_businesses:submitRating', false, businessName, rating, comment)

        lib.notify({
            title = 'Rating Submitted',
            description = 'Thank you for rating '..businessLabel..'!',
            type = 'success',
            duration = 5000
        })
    end
end

-- Function to view ratings
local function ViewRatings(businessName, businessLabel)
    local data = lib.callback.await('vl_businesses:getRatings', false, businessName)

    if not data then
        lib.notify({
            title = 'No Ratings',
            description = 'This business has no ratings yet.',
            type = 'info'
        })
        return
    end

    local avgRating = data.average or 0
    local totalRatings = data.total or 0
    local recentRatings = data.recent or {}

    local options = {
        {
            title = 'Average Rating',
            description = string.format('⭐ %.1f/5.0 (%d ratings)', avgRating, totalRatings),
            icon = 'star',
            disabled = true
        }
    }

    -- Add recent ratings
    if #recentRatings > 0 then
        options[#options + 1] = {
            title = '─────────────',
            disabled = true
        }

        for i, rating in ipairs(recentRatings) do
            if i <= 5 then -- Show only last 5 ratings
                local stars = string.rep('⭐', rating.rating)
                local description = rating.comment and rating.comment ~= '' and rating.comment or 'No comment'
                options[#options + 1] = {
                    title = stars .. ' - ' .. rating.playerName,
                    description = description,
                    icon = 'comment',
                    disabled = true
                }
            end
        end
    end

    lib.registerContext({
        id = 'business_ratings_view',
        title = businessLabel .. ' Ratings',
        options = options
    })
    lib.showContext('business_ratings_view')
end

-- Function to spawn rating ped
local function SpawnRatingPed(data)
    lib.requestModel(data.ratingStation.ped)
    local entity = CreatePed(0, GetHashKey(data.ratingStation.ped), data.ratingStation.coords.x, data.ratingStation.coords.y, data.ratingStation.coords.z - 1.0, data.ratingStation.coords.w, false, false)
    FreezeEntityPosition(entity, true)
    SetEntityInvincible(entity, true)
    SetBlockingOfNonTemporaryEvents(entity, true)
    SetEntityHeading(entity, data.ratingStation.coords.w)

    exports['qb-target']:AddTargetEntity(entity, {
        options = {
            {
                action = function()
                    local options = {
                        {
                            title = 'Submit Rating',
                            description = 'Rate your experience',
                            icon = 'star',
                            onSelect = function()
                                OpenRatingMenu(data.businessKey, data.blips.label or data.dutyzone.label)
                            end
                        },
                        {
                            title = 'View Ratings',
                            description = 'See what others think',
                            icon = 'eye',
                            onSelect = function()
                                ViewRatings(data.businessKey, data.blips.label or data.dutyzone.label)
                            end
                        }
                    }

                    lib.registerContext({
                        id = 'business_rating_main',
                        title = (data.blips.label or data.dutyzone.label) .. ' - Ratings',
                        options = options
                    })
                    lib.showContext('business_rating_main')
                end,
                icon = 'fa-solid fa-star',
                label = 'Customer Feedback',
            }
        },
        distance = 2.5,
    })
    return entity
end

-- Function to handle entering/exiting rating zones
local function onEnterRating(self)
    if spawnedRatingPeds[self.businessData.businessKey] == nil or not DoesEntityExist(spawnedRatingPeds[self.businessData.businessKey]) then
        spawnedRatingPeds[self.businessData.businessKey] = SpawnRatingPed(self.businessData)
    end
end

local function onExitRating(self)
    if spawnedRatingPeds[self.businessData.businessKey] ~= nil and DoesEntityExist(spawnedRatingPeds[self.businessData.businessKey]) then
        DeleteEntity(spawnedRatingPeds[self.businessData.businessKey])
        spawnedRatingPeds[self.businessData.businessKey] = nil
    end
end

-- Initialize rating stations
CreateThread(function()
    for k, v in pairs(Businesses) do
        if v.enabled and v.ratingStation and v.ratingStation.enabled then
            lib.points.new({
                coords = v.ratingStation.coords,
                distance = 50.0,
                businessData = {
                    businessKey = k,
                    ratingStation = v.ratingStation,
                    blips = v.blips,
                    dutyzone = v.dutyzone,
                },
                onEnter = onEnterRating,
                onExit = onExitRating,
            })
        end
    end
end)
