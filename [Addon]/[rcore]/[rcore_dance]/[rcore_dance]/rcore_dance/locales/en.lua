Locales["en"] = {
    -- Titles in result screen
    your_score = 'Your score',
    win_label = 'You win!',
    lose_label = 'You lose!',
    highest_combo = 'Highest combo',

    start_in = 'Start in', -- text in countdown timer, example: Start in 3, 2, 1
    init_loading = "❗ Please wait for the script to load before starting minigame. (+-5sec)",

    notifications = {
        session_invited = 'You were invited to a dance battle! Use ~g~/%s ~s~or ~r~/%s',
        invitation_expired = 'Invitation to dance battle expired.',
        wait_for_host = 'Get Ready! Wait for the host to start.',          -- notification to wait for the session host to start minigame
        url_invalid = "This link can't be played, input new one, please.", -- song from chosen url can't be played
        too_far = "The user you are trying to invite is too far.",
        session_not_exists = "This dance battle does not exist or has ended.",
        dancing_interrupted = "Dancing session interrupted.",
        url_validation_timeout = "Song URL validation timed out. Try again, please.",
        not_in_dance_zone = "❗ You are not in a dance zone.",
        open_session_invite_again = "Use ~g~/%s ~s~again to go back to the menu."
    },

    difficulty_names = {
        easy = 'Easy',
        normal = 'Normal',
        pro = 'Dance master',
    },

    difficulty_descriptions = {
        -- keys = keyboard keys; the harded a difficulty is the more keys you have to press (chosen from arrow up, down, left, right)
        easy = 'Easy - only half the keys to press, slow speed.',
        normal = 'Normal - 3/4 of the keys to press, normal speed.',
        pro = 'Master mode - all keys to press, very fast speed.',
    },

    dance_mat_colors = {
        blue = 'Blue',
        green = 'Green',
        red = 'Red',
        yellow = 'Yellow',
        purple = 'Purple',
        pink = 'Pink',
        orange = 'Orange',
    },

    -- -------------------------------------
    -- Minigame menu texts
    -- - menus use similar texts sometimes, repeating translations will only be described once
    -- -------------------------------------

    -- Settings menu for solo (Rhythm mastery) minigame type
    minigame_menu = {
        header = 'Settings',      -- Menu header (large text at top)
        title = 'Dance Settings', -- Menu title
        difficulty_label = 'Difficulty',
        difficulty_description = 'Select the difficulty of the minigame.',
        use_dance_mat_label = 'Use dance mat', -- whether to use dancing mat (the one with arrows you stand on and dance)
        use_dance_mat_description = 'Roll out the dance mat.',
        dance_mat_color_label = 'Dance mat color',
        dance_mat_color_description = 'Select the color of the dance mat.',
        song_url_label = 'Song URL', -- direct link to the song you want to play
        song_url_description = 'Press enter to input a song URL to dance to.',
        song_url_input_title = 'Enter a song URL',
        song_url_invalid = "❗ Song URL can't be played. Enter new one.",
        start_dancing_label = 'Start Dancing',
        start_dancing_description = '💃 Start dancing 💃',
        menu_loading_label = "Loading, please wait...",
    },

    -- Settings menu to choose which minigame type you want to play
    minigame_type_menu = {
        header = 'Minigame type',
        title = 'Select Minigame type',
        solo_label = '🎵 Rhythm Mastery', -- name of solo dancing minigame type with score
        solo_description = 'Solo dance to desired music while gaining score by pressing arrow keys.',
        battle_label = '👯‍♂️ Beat Battle', -- name of multiplayer session dancing minigame type
        battle_description = 'Multiplayer dance-off, same as solo, but highest score wins! 1-8 players',
        freestyle_label = '🕺 Freestyle Fiesta', -- name of freestyle minigame type
        freestyle_description = 'Enjoy all the features in freestyle mode without music (arrow keys optional).',
    },

    -- Settings menu for multiplayer (Beat battle) minigame type
    minigame_battle_menu = {
        header = 'Settings',
        title = 'Battle Settings',
        difficulty_label = 'Difficulty',
        difficulty_description = 'Select the difficulty of the minigame.',
        use_dance_mat_label = 'Use dance mat',
        use_dance_mat_description = 'Roll out the dance mat.',
        dance_mat_color_label = 'Dance mat color',
        dance_mat_color_description = 'Select the color of the dance mat.',
        num_of_players_label = 'Number of players',
        num_of_players_description = 'Select the number of players.',
        song_url_label = 'Song URL',
        song_url_description = '<Enter> a song URL to dance to.',
        song_url_input_title = 'Enter a song URL',
        song_url_invalid = "❗ Song URL can't be played. Enter new one.",
        invite_players_label = 'Invite players',
        invite_players_description = '💃 Invite players to battle 💃',
        menu_loading_label = "Loading, please wait...",
    },

    -- Settings menu for beat battle that you see as invited player
    minigame_battle_player_menu = {
        header = 'Battle',
        title = 'Get ready!',
        dance_mat_color_label = 'Dance mat color',
        dance_mat_color_description = 'Select the color of the dance mat.',
        ready_button_label = 'Get Ready',
        ready_button_description = '💃 Ready to dance 💃',
        menu_loading_label = "Loading, please wait...",
    },

    -- Settings menu for freestyle (Freestyle fiesta) minigame type
    minigame_freestyle_menu = {
        header = 'Settings',
        title = 'Freestyle Settings',
        difficulty_label = 'Difficulty',
        difficulty_description = 'Select the difficulty of the minigame.',
        use_dance_mat_label = 'Use dance mat',
        use_dance_mat_description = 'Roll out the dance mat.',
        use_arrow_keys_label = 'Use arrow keys',
        use_arrow_keys_description =
        "Match arrow keys to build up dance speed. If enabled, you won't be able to change speed manually.",
        dance_mat_color_label = 'Dance mat color',
        dance_mat_color_description = 'Select the color of the dance mat.',
        menu_loading_label = "Loading, please wait...",
        start_dancing_label = 'Start Dancing',
        start_dancing_description = '💃 Start dancing 💃',
    },

    -- Menu where you can invite nearby players to session
    player_list_menu = {
        header = 'Invite',
        title = 'Invite players',
        no_players = 'No players found close to you.',
        refresh_list_label = 'Refresh list', -- refresh list of nearby players
        refresh_list_description = 'Refresh list of players in the area.',
        confirm_label = 'Start battle',
        confirm_description = 'Start battle with invited players.',
        menu_loading_label = "Waiting for invitations confirmation...",
        invite_description = 'Invite player to dance battle.',
        invited_description = 'Waiting for player to confirm invitation. \n❌ Press %s to cancel invitation.',
        confirmed_description = 'Player has confirmed invitation and is getting ready.',
        ready_description = 'Player is ready to dance.',
    },

    -- Scoreboard at the end of beat battle
    scoreboard = {
        title = 'Ranking',
        rank = '🏆', -- rank column icon
        name = 'Name', -- name column title
        score = 'Score', -- score column title
        max_combo = 'Max combo', -- max combo achieved column title
    },

    difficulty = "Difficulty",

    -- Messages that pop-up as you click arrow keys to song to show how accurate you were
    accuracy_messages = {
        message1 = 'Miss',   -- when you miss an arrow entirely
        message2 = 'Good',   -- when you barely make it
        message3 = 'Great',  -- when you accurately press it
        message4 = 'Perfect' -- when the key press is within minimal distance from the center box
    },

    -- Key bind labels in help keys menu
    keys = {
        move = "Move",
        input_value = "Confirm/Open input",
        cancel_input = "Cancel input",
        change_value = "Change value",
        leave_menu = "Go back/Close",
        end_minigame = "End minigame",
        change_dance_style = "Change dance style",
        change_dance_speed = "Change dance speed",
        change_dance_move = "Change dance move",
        increase_volume = "Increase volume",
        decrease_volume = "Decrease volume",
    }
}
