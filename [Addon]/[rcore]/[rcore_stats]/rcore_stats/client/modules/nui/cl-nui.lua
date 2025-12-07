IsUIOpened = false

function SendInitNUIConfig()
    local locale = Config.Locale
    local translations = Locales[locale]

    local data = {
        translations = translations,
        statTypeToggleCooldown = Config.Limits.ADMIN_TOGGLE_STAT_TYPE_COOLDOWN_MINS,
        requestStatsCooldown = Config.Limits.ADMIN_REQUEST_STATS_COOLDOWN_SECS,
        unitTypes = Config.Units,
        isImperialUnits = Config.UseImperialUnits,
        playerId = GetPlayerServerId(PlayerId()),
        permissions = {
            openControl = CanOpenControl(),
            toggleStatTypes = CanToggleStatTypes(),
            seeOtherPlayerStats = CanSeeOtherPlayerStats(),
            seeServerStats = CanSeeServerStats(),
            resetPlayersStats = CanResetPlayersStats(),
        },
        achievementPosition = Config.AchievementPosition,
    }

    SendReactMessage('setInitData', data)
    UISendAchievements()
    UISendStatTypes()
    UISendAchievements()
end

function OpenNUI()
    if not IsInitFinished then
        dbg.warning("Cannot open UI while script is not initialized.")
        NativeNotify(_U('initLoading'))
        return false
    end

    if IsUIOpened then
        dbg.warning("Cannot open UI while it's already opened.")
        return
    end

    if not CanOpenUI() then
        print("You don't have permissions to open the UI.")
        return
    end

    SetNUIVisibility(true)
    SetNUIFocus(true)

    IsUIOpened = true
    SendFrontendData()
    SendReactMessage('open')
end

function CloseNUI()
    SendReactMessage('close')
    Citizen.CreateThread(function()
        Wait(150)
        SendReactMessage('setVisible', false)
        SetNUIFocus(false)
    end)

    IsUIOpened = false
end
