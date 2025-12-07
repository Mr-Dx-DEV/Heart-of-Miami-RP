function CheckIfGameInCoordsExist(coords)
    for k, v in pairs(DRTS.Variables.AwaitingGames) do
        if v.coords == coords then
            return true
        end
    end
    return false
end

if CConfig.UsingOxMenu then
    local gametype, numbertoreach, gameMulti, bets = 1, CConfig.ValuesToHit[1], 1, false
    local startnumber                              = CConfig.Reach0Start[1]
    local index1, index2                           = 1, 1
    local gameTypeMulti                            = { _U("ALONE"), _U("TW_PLYS") }
    local posibleOnes                              = { _U("REACH_0"), _U("MX_NUM") }
    local fistTime                                 = false
    local coordsGetter                             = vector3(0, 0, 0)
    local menuOptions                              = {
        {
            label = _U("GM_INFO"),
            values = posibleOnes,
            defaultIndex = gametype,
            args = 'info'
        },
        {
            label = _U("MODE"),
            values = gameTypeMulti,
            defaultIndex = gameMulti,
            args = 'mode'
        },
        {
            label = _U("BETS_OPT"),
            checked = bets,
            args = 'bets'
        },
        {
            label = (_U("NUM_TO_REA")):format(numbertoreach),
            values = CConfig.ValuesToHit,
            defaultIndex = index1,
            args = 'num_to_reach'
        },
        {
            label = (_U("START_NUM")):format(startnumber),
            values = CConfig.Reach0Start,
            defaultIndex = index2,
            args = 'start_num'
        },
        {
            label = _U("CN_AND_ST"),
            args = { isConfirm = true },
        },
    }

    CreateThread(function()
        lib.hideMenu()
        function RegisterMenu()
            lib.registerMenu({
                id = 'gameselection',
                title = _U("CR_GAME"),
                position = 'top-right',
                options = menuOptions,
                onSideScroll = function(selected, scrollIndex, args)
                    if args == 'info' then
                        gametype = scrollIndex
                    elseif args == 'mode' then
                        gameMulti = scrollIndex
                        if gameMulti == 1 then
                            bets = false
                        end
                    elseif args == 'num_to_reach' then
                        index1 = scrollIndex
                        numbertoreach = CConfig.ValuesToHit[scrollIndex]
                    elseif args == 'start_num' then
                        index2 = scrollIndex
                        startnumber = CConfig.Reach0Start[scrollIndex]
                    end
                end,
                onCheck = function(selected, checked, args)
                    if args == 'bets' then
                        bets = not bets
                    end
                end,
                onClose = function(keyPressed)
                    DRTS.Variables.MenuOpened                = false
                    bets                                     = false
                    gametype, numbertoreach, gameMulti, bets = 1, CConfig.ValuesToHit[1], 1, false
                    startnumber                              = CConfig.Reach0Start[1]
                    index1, index2                           = 1, 1
                end,
            }, function(selected, scrollIndex, args)
                if args.isConfirm then
                    local PlyName = lib.inputDialog(_U("YOUR_NAME"), { _U("YOUR_NAME") })
                    if PlyName[1] and PlyName[1] ~= "" then
                        if bets and gameMulti == 2 then
                            local bet = lib.inputDialog(_U("YOUR_BET"), { _U("YOUR_BET") })
                            if tonumber(bet[1]) then
                                if not CheckBet(tonumber(bet[1])) then
                                    DRTS.Variables.MenuOpened                = false
                                    bets                                     = false
                                    gametype, numbertoreach, gameMulti, bets = 1, CConfig.ValuesToHit[1], 1, false
                                    startnumber                              = CConfig.Reach0Start[1]
                                    index1, index2                           = 1, 1
                                    lib.hideMenu()
                                    return
                                end
                                if gametype == 2 then
                                    TriggerServerEvent("rcore_darts:server:newGame", gametype, numbertoreach,
                                        { coords = coordsGetter, name = PlyName[1] }, false, false, false, false,
                                        gameMulti, bets,
                                        { tonumber(bet[1]) })
                                else
                                    TriggerServerEvent("rcore_darts:server:newGame", gametype, startnumber,
                                        { coords = coordsGetter, name = PlyName[1] }, false, false, false, false,
                                        gameMulti, bets,
                                        { tonumber(bet[1]) })
                                end
                                if gameMulti == 2 then
                                    Notify(_U("NEW_GAME_CR"))
                                end
                                DRTS.Variables.MenuOpened = false
                            else
                                Notify(_U("BET_MUST_BE_NUM"))
                            end
                        else
                            if gametype == 2 then
                                TriggerServerEvent("rcore_darts:server:newGame", gametype, numbertoreach,
                                    { coords = coordsGetter, name = PlyName[1] }, false, false, false, false,
                                    gameMulti, false)
                            else
                                TriggerServerEvent("rcore_darts:server:newGame", gametype, startnumber,
                                    { coords = coordsGetter, name = PlyName[1] }, false, false, false, false,
                                    gameMulti, false)
                            end
                            if gameMulti == 2 then
                                Notify(_U("NEW_GAME_CR"))
                            end
                            DRTS.Variables.MenuOpened = false
                        end
                    else
                        Notify(_U("VALID_NAME"))
                    end
                    bets                                     = false
                    gametype, numbertoreach, gameMulti, bets = 1, CConfig.ValuesToHit[1], 1, false
                    startnumber                              = CConfig.Reach0Start[1]
                    index1, index2                           = 1, 1
                    lib.hideMenu()
                end
                DRTS.Variables.MenuOpened                = false
                bets                                     = false
                gametype, numbertoreach, gameMulti, bets = 1, CConfig.ValuesToHit[1], 1, false
                startnumber                              = CConfig.Reach0Start[1]
                index1, index2                           = 1, 1
            end)
        end

        if Config.Framework == 'standalone' then
            menuOptions = {
                {
                    label = _U("GM_INFO"),
                    values = posibleOnes,
                    defaultIndex = gametype,
                    args = 'info'
                },
                {
                    label = _U("MODE"),
                    values = gameTypeMulti,
                    defaultIndex = gameMulti,
                    args = 'mode'
                },
                {
                    label = (_U("NUM_TO_REA")):format(numbertoreach),
                    values = CConfig.ValuesToHit,
                    defaultIndex = index1,
                    args = 'num_to_reach'
                },
                {
                    label = (_U("START_NUM")):format(startnumber),
                    values = CConfig.Reach0Start,
                    defaultIndex = index2,
                    args = 'start_num'
                },
                {
                    label = _U("CN_AND_ST"),
                    args = { isConfirm = true },
                },
            }
        end
        RegisterMenu()
    end)



    function OpenGameCreation(coords)
        coordsGetter = coords
        if CheckIfGameInCoordsExist(coords) then
            return Notify('')
        end
        if not DRTS.Variables.MenuOpened then
            DRTS.Variables.MenuOpened = true
            lib.showMenu('gameselection')
        end
    end
else
    -- Replace WarMenu UI with NUI (ui/index.html)
    local gametype, numbertoreach, gameMulti, bets = 1, CConfig.ValuesToHit[1], 1, false
    local startnumber = CConfig.Reach0Start[1]
    local index1, index2 = 1, 1
    local coordsGetter = vector3(0, 0, 0)

    -- Helper to map UI strings to internal numeric codes
    local function mapGameModeString(str)
        if str == 'reachmax' or str == 'MX_NUM' then
            return 2
        end
        return 1 -- reach0
    end

    local function mapModeString(str)
        if str == 'coop' or str == 'TW_PLYS' then
            return 2
        end
        return 1
    end

    -- Open the NUI game creation UI
    function OpenGameCreation(coords)
        coordsGetter = coords
        SetNuiFocus(true, true)
        if CheckIfGameInCoordsExist(coords) then
            return Notify('')
        end

        if DRTS.Variables.MenuOpened then
            return
        end

        DRTS.Variables.MenuOpened = true
        SendNUIMessage({ type = 'openUI', showName = false, strings = Locales[Config.Locale] or {} })
        SendNUIMessage({ type = 'enableBets', enable = (Config.Framework ~= "standalone") })
        SendNUIMessage({ type = 'setNumbers', numbers = CConfig.Reach0Start })
    end

    RegisterNUICallback('startGame', function(data, cb)
        SetNuiFocus(false, false)
        local playerName = data.playerName or ''
        local modeStr = data.mode or 'alone'
        local gamemodeStr = data.gamemode or 'reach0'
        local customNumber = tonumber(data.customNumber) or nil

        local sendGametype = mapGameModeString(gamemodeStr)
        local sendNumber = nil
        if sendGametype == 2 then
            sendNumber = customNumber or CConfig.ValuesToHit[1]
        else
            sendNumber = customNumber or CConfig.Reach0Start[1]
        end


        local sendGameMulti = mapModeString(modeStr)
        local sendBets = false
        local betPrice = { 0 }

        if type(data.bets) == 'boolean' and data.bets == true then
            local betAmount = tonumber(data.betAmount) or 0
            if not CheckBet(betAmount) then
                -- invalid bet; notify and keep UI open
                Notify(_U('BET_MUST_BE_NUM'))
                if cb then cb('invalid_bet') end
                return
            end
            sendBets = true
            betPrice = { betAmount }
        end

        TriggerServerEvent('rcore_darts:server:newGame', sendGametype, sendNumber,
            { coords = coordsGetter, name = playerName }, false, false, false, false, sendGameMulti, sendBets, betPrice)

        if sendGameMulti == 2 then
            Notify(_U('NEW_GAME_CR'))
        end

        DRTS.Variables.MenuOpened = false
        -- close the NUI
        SendNUIMessage({ type = 'closeUI' })

        if cb then cb('ok') end
    end)

    RegisterNUICallback('closeModal', function(data, cb)
        DRTS.Variables.MenuOpened = false
        SetNuiFocus(false, false)
        if cb then cb('ok') end
    end)

    SetTimeout(1000, function()
        SendNUIMessage({ type = 'setNumbers', numbers = CConfig.Reach0Start })
    end)

    RegisterNUICallback('requestStrings', function(data, cb)
        SendNUIMessage({ type = 'loadStrings', strings = Locales[Config.Locale] or {} })
        if cb then cb('ok') end
    end)

    RegisterNUICallback('requestNumbersReach', function(data, callback)
        SendNUIMessage({ type = 'setNumbers', numbers = CConfig.ValuesToHit })
        if callback then callback('ok') end
    end)

    RegisterNUICallback('requestNumbers0', function(data, callback)
        SendNUIMessage({ type = 'setNumbers', numbers = CConfig.Reach0Start })
        if callback then callback('ok') end
    end)
end

function CheckBet(num)
    if not (num >= CConfig.Bets.min_bet) then
        Notify((_U('MIN_BET'):format(CConfig.Bets.min_bet)))
        return false
    elseif not (num <= CConfig.Bets.max_bet) then
        Notify((_U('MAX_BET'):format(CConfig.Bets.max_bet)))
        return false
    end
    return true
end

function DisplayKeyboard(txt, t)
    local promptType = 'name'
    local promptText = tostring(txt or '')
    local lower = string.lower(promptText)
    promptType = t or 'name'

    KEYBOARD_RESULT = nil
    KEYBOARD_WAITING = true

    SendNUIMessage({
        type = 'openUI',
        showName = true,
        prompt = promptText,
        promptType = promptType,
        strings = Locales
            [Config.Locale] or {}
    })
    SetNuiFocus(true, true)

    local timeout = GetGameTimer() + 15000
    while KEYBOARD_WAITING do
        if GetGameTimer() > timeout then
            KEYBOARD_WAITING = false
            KEYBOARD_RESULT = nil
            break
        end
        Wait(0)
    end

    return KEYBOARD_RESULT
end
