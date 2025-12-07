Config = Config or {}

Config.Performance = {
    SendToServerInterval = 1, -- interval in minutes to send stat updates from client to server, default 1
    SaveToDatabase = 1,       -- interval in minutes to save stat updates from server to database, default 1
    -- maximum number of updates to be sent to the database in one iteration, default 300
    -- 500 = 500 players will be updated in one iteration (if there are 500 players with stat updates at the time)
    -- everyone else will be updated in the next iteration
    -- ❗ edit only if you are having problems with large database updates
    MaxUpdatesPerIteration = 500,

    MonitorTiming = {                -- intervals in seconds to check/save values and stats
        MONEY = 10,                  -- each x seconds check difference in player money, default 10 sec
        DISTANCE_SAVE = 10,          -- each x seconds save distance traveled, default 10 sec
        SAVE_TO_KVP = 60,            -- each x seconds save player stats to KVP, default 60 sec
        CHECK_FAVORITE_CHANGE = 60,  -- each x seconds check if player's favorite vehicle/weapon changed, default 60 sec
        SAVE_SHOTS = 10,             -- each x seconds save shots fired stat, default 5 sec
        TIME_PLAYED_SAVE = 1,        -- each x minutes save time played stat, default 1 minutes
        CHECK_MONITOR_STATES = 5,    -- each x minutes check which monitors should be turned on and off depending on stat types, to not measure disabled stats
        CALCULATE_SERVER_STATS = 15, -- each x minutes calculate server stats, default 15 minutes as it is a heavy operation, recommended to leave at 15
    },
}

Config.Limits = {
    MAX_VEHICLE_DISTANCE = 1000,              -- maximum distance in meters a player can approximately take in 10 sec to prevent counting distance by teleport
    MAX_WALK_DISTANCE = 100,                  -- maximum distance in meters a player can approximately take in 10 sec to prevent counting distance by teleport
    MAX_ABOVE_GROUND = 5,                     -- maximum height in meters a player can be above ground to count speed in land vehicle (prevent counting speed while falling)
    MAX_FAVORITE_VEHICLES_LENGTH = 100,       -- maximum number of favorite vehicles to save, default 100
    MAX_FAVORITE_WEAPONS_LENGTH = 100,        -- maximum number of favorite weapons to save, default 100
    MIN_DISTANCE_TO_HANDLE_IN_FAVORITES = 50, -- minimum distance to count with in favorites table, anything less will not get compared, default 50
    MIN_SHOTS_TO_HANDLE_IN_FAVORITES = 5,     -- minimum shots to count with in favorites table, anything less will not get compared, default 5

    ADMIN_TOGGLE_STAT_TYPE_COOLDOWN_MINS = 1, -- cooldown in minutes for toggling stat types in admin panel, default 1
    ADMIN_REQUEST_STATS_COOLDOWN_SECS = 10,   -- cooldown in seconds for requesting stats of another player, default 10 seconds
}
