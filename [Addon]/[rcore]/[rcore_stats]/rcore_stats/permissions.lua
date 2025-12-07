PermissionMap = {
    ['group.superadmin'] = {
        -- Can reset player's stats (keep only for higher roles as this will completely reset all statistics and achievements of a player)
        Permissions.RESET_PLAYERS_STATS,
    },
    ['group.admin'] = {
        Permissions.OPEN_CONTROL,           -- Can open control panel to see all stat types
        Permissions.TOGGLE_STAT_TYPE,       -- Can turn on and off stat types
        Permissions.SEE_OTHER_PLAYER_STATS, -- Can see other player stats
        Permissions.SEE_SERVER_STATS,       -- Can see server stats
    },
    ['builtin.everyone'] = {                --Everyone
        Permissions.OPEN_UI,                -- Can open the UI
    }
}
