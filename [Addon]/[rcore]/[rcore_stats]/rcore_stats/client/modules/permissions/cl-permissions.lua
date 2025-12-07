function CanOpenUI()
    return MyPermissions[Permissions.OPEN_UI]
end

function CanOpenControl()
    return MyPermissions[Permissions.OPEN_CONTROL]
end

function CanToggleStatTypes()
    return MyPermissions[Permissions.TOGGLE_STAT_TYPE]
end

function CanSeeOtherPlayerStats()
    return MyPermissions[Permissions.SEE_OTHER_PLAYER_STATS]
end

function CanSeeServerStats()
    return MyPermissions[Permissions.SEE_SERVER_STATS]
end

function CanResetPlayersStats()
    return MyPermissions[Permissions.RESET_PLAYERS_STATS]
end

function GetMyPermissions()
    return MyPermissions
end
