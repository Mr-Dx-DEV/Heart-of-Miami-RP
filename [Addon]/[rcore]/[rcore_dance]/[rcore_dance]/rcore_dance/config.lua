Config = {
    Debug = false, -- turn this on if you are experiencing any issues and want to see more output in F8 console
    DebugLevel = {
        'INFO',
        'CRITICAL',
        'WARNING',
        'SUCCESS',
        'ERROR',
        'DEBUG',
        -- 'MENU', -- uncomment this if you want to also see debug output of the minigame menu
    },
    Locale = 'en', -- Available languages: en, de, es, it, tr

    Minigame = {
        StartCountdown = 3,         -- Countdown before starting minigame | in seconds, min 3, max 10, default = 3
        WalkBackDistance = 0.3,     -- Minimal distance player has to be away from dance mat to automatically walk back | in meters, min 0.3
        StopDistance = 3.0,         -- Distance player has to be from dance mat to stop minigame | in meters, min 0.1, default 3.0
        DanceMatCheckInterval = 2,  -- How often to check for other players' dance mats | in seconds, min 1, max 5, default = 2
        DanceMatCheckDistance = 30, -- Distance in which you will see other players' dance mats | in meters, min 5, max 300, default = 30
        DefaultVolume = 0.3,        -- Default song volume | min 0.1, max 1.0, default = 0.3
        BaseSpeed = 67,             -- Default speed of minigame | min 50, max 200, default = 67, recommended 60-90 for optimal experience
        UrlValidationTimeout = 10,  -- Timeout for validating song URL | in seconds, min 1, max 60, default = 10
        MusicBarBottomMargin = 0,   -- Indentaion of music bar from bottom of the screen (useful if you have UI covering it) | min 0, max 100, default = 0
    },

    Session = {
        MinPlayers = 2,                -- Min amount of players to start minigame | min 2, max 24; default = 2
        MaxPlayers = 8,                -- Max amount of players to start minigame | min 2, max 24; default = 8
        InviteTimeout = 30,            -- Time to cancel player's invite | in seconds, min 30; max: 300; default = 60
        InviteRadius = 10.0,           -- Radius in which other players need to be to get invited into dance battle | in meters, min 5.0; max 15.0; default = 5.0
        ShowPlayerId = true,           -- Show player's ID in session lists | default = true
        ShowPlayerInviteMarker = true, -- Show marker above player's head when they are invited | default = true
        PlayerInviteMarkerColor = {    -- Color of indicator above player when in invite menu | default = pink
            r = 209,
            g = 52,
            b = 180,
            a = 160
        },
    },

    Commands = {
        StartMinigame = 'dance',         -- Command to start minigame | default = 'dance'
        AcceptInvite = 'dance_accept',   -- Command to accept dance battle invite | default = 'dance_accept'
        DeclineInvite = 'dance_decline', -- Command to decline dance battle invite | default = 'dance_decline'
    },

    Animations = {
        EnabledAll = true, -- Enable all animations | default = true

        PutdownMat = {     -- Animation for putting down dance mat
            enabled = true,
            dict = 'pickup_object',
            name = 'pickup_low',
        },
        PickupMat = { -- Animation for picking up dance mat
            enabled = true,
            dict = 'pickup_object',
            name = 'pickup_low',
        },
    },

    Camera = {
        Shake = {                         -- Settings for shaking camera while dancing
            enabled = true,
            minShake = 0.1,               -- Minimal shake intensity | default = 0.1
            maxShake = 1.0,               -- Maximal shake intensity | default = 1.0
            increaseEffectEnabled = true, -- Enable screen effect that is shown after shake is increased
            increaseEffect = 'DefaultFlash',
            decreaseEffectEnabled = true, -- Enable screen effect that is shown after shake is decreased
            decreaseEffect = 'SwitchHUDMichaelOut',
        },
    },

    Thresholds = {
        Combo = {
            danceSpeedIncrease = 5,  -- Increase dance speed after reaching this combo | default = 5
            danceSpeedDecrease = 5,  -- Decrease dance speed after reaching this combo | default = 5
            danceMoveChange = 5,     -- Change dance move after reaching this combo | default = 5
            cameraShakeIncrease = 5, -- Increase camera shake after reaching this combo | default = 5
            cameraShakeDecrease = 3, -- Decrease camera shake after reaching this combo | default = 3
        },
    },

    Menu = {
        -- MENU POSITIONS: top-left | top-right | bottom-left | bottom-right
        -- HELPKEYS POSITIONS: top-left | top-right | bottom-left | bottom-right
        MinigameSettings = {
            menuPosition = 'top-left',     -- Minigame settings menu position
            helpKeysPosition = 'top-right' -- Help keys position for minigame settings menu
        },
        Minigame = {
            helpKeysPosition = 'bottom-left' -- Help keys position for minigame controls
        }
    },

    Keys = {
        -- ❗ All available keyNames can be found here (HTML keynames, not GTA!):
        -- https://developer.mozilla.org/en-US/docs/Web/API/UI_Events/Keyboard_event_key_values
        Minigame = {
            EndMinigame = {
                keyName = 'Backspace',
            },
            ChangeDanceStyle = {
                keyName = 'WheelUp',
            },
            IncreaseVolume = {
                keyName = '+',
            },
            DecreaseVolume = {
                keyName = '-',
            },
        },
        Freestyle = {
            ChangeDanceMove = {
                keyName = 'WheelDown',
            },
            ChangeDanceSpeed = {
                keyName = 'W',
            },
        }
    },

    DanceAnywhereWithDanceMat = true, -- Allow dancing anywhere with dance mat even if not in a dance zone | default = true
    DanceAllowedZones = {             -- Dance zones you can dance in (night club etc.), if empty, you can dance anywhere
        -- Example dance zone:
        -- {
        --     coords = vec3(-123.1, -123.2, 123.3),
        --     radius = 3.0,
        -- },
    },

    -- integration to statistics and achievements system https://store.rcore.cz/package/6273968
    RCoreStatsIntegration = GetResourceState('rcore_stats') ~= 'missing',
}
