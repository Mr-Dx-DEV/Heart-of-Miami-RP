Locales["de"] = {
    -- Titles in result screen
    your_score = 'Deine Punkte',
    win_label = 'Gewonnen!',
    lose_label = 'Verloren',
    highest_combo = 'Höchste Kombi',

    start_in = 'Startet in', -- text in countdown timer, example: Start in 3, 2, 1
    init_loading = "❗ Bitte warte bis das Script geladen ist bevor du ein Minigame startest. (ca. 5 Sek.)",

    notifications = {
        session_invited = 'Du wurdest zu einem Tanzbattle eingeladen! Drücke ~g~/%s ~s~oder ~r~/%s',
        invitation_expired = 'Die Einladung zum Tanzbattle ist abgelaufen.',
        wait_for_host = 'Mach dich bereit. Warte auf Start durch den Host.',          -- notification to wait for the session host to start minigame
        url_invalid = "Der Link kann nicht abgespielt werden. Bitte nutze ein anderen.", -- song from chosen url can't be played
        too_far = "Der Spieler den du einladen möchtest ist zu weit weg.",
        session_not_exists = "Das Tanzbattle existiert nicht oder ist bereits beendet.",
        dancing_interrupted = "Tanzbattle unterbrochen.",
        url_validation_timeout = "Das Prüfen des Links hat eine Zeitüberschreitung. Bitte versuche es erneut.",
        not_in_dance_zone = "❗ Du befindest dich in keiner Tanzzone.",
        open_session_invite_again = "Drücke ~g~/%s ~s~erneut um ins Menü zu gehen."
    },

    difficulty_names = {
        easy = 'Einfach',
        normal = 'Normal',
        pro = 'Tanzgott',
    },

    difficulty_descriptions = {
        -- keys = keyboard keys; the harded a difficulty is the more keys you have to press (chosen from arrow up, down, left, right)
        easy = 'Einfach - 1/2 der Tasten, langsame Geschwindigkeit',
        normal = 'Normal - 3/4 Tasten, normale Geschwindigkeit',
        pro = 'Tanzgott - Alle Tasten, schnell Geschwindigkeit',
    },

    dance_mat_colors = {
        blue = 'Blau',
        green = 'Grün',
        red = 'Rot',
        yellow = 'Gelb',
        purple = 'Lila',
        pink = 'Pink',
        orange = 'Orange',
    },

    -- -------------------------------------
    -- Minigame menu texts
    -- - menus use similar texts sometimes, repeating translations will only be described once
    -- -------------------------------------

    -- Settings menu for solo (Rhythm mastery) minigame type
    minigame_menu = {
        header = 'Einstellungen',      -- Menu header (large text at top)
        title = 'Tanz Einstellungen', -- Menu title
        difficulty_label = 'Schwierigkeit',
        difficulty_description = 'Wähle einen Schwierigkeitsgrad aus',
        use_dance_mat_label = 'Tanzmatte benutzen', -- whether to use dancing mat (the one with arrows you stand on and dance)
        use_dance_mat_description = 'Tanzmatte ausrollen',
        dance_mat_color_label = 'Farbe der Tanzmatte',
        dance_mat_color_description = 'Wähle eine Farbe der Tanzmatte aus',
        song_url_label = 'Song-Link', -- direct link to the song you want to play
        song_url_description = 'Drücke Enter um einen Link zum Song einzufügen.',
        song_url_input_title = 'Song-Link einfügen',
        song_url_invalid = "❗ Der Song kann nicht gespielt werden. Versuch einen anderen.",
        start_dancing_label = 'Tanz starten',
        start_dancing_description = '💃 Tanz starten 💃',
        menu_loading_label = "Laden, bitte warten...",
    },

    -- Settings menu to choose which minigame type you want to play
    minigame_type_menu = {
        header = 'Minigame-Typ',
        title = 'Wähle einen Minigame-Typ',
        solo_label = '🎵 Rhythmusmaster', -- name of solo dancing minigame type with score
        solo_description = 'Solotanz bei dem du mit den Pfeiltasten Punkte sammelst.',
        battle_label = '👯‍♂️ Beatbattle', -- name of multiplayer session dancing minigame type
        battle_description = 'Multiplayer-Battle! Wie Rhythmusmaster, nur mit mehreren Leuten (1-8). Die Höchstpunktzahl gewinnt.',
        freestyle_label = '🕺 Freestyle-Fiesta', -- name of freestyle minigame type
        freestyle_description = 'Erlebe alle Features der Freestyle-Fiesta ohne Musik.',
    },

    -- Settings menu for multiplayer (Beat battle) minigame type
    minigame_battle_menu = {
        header = 'Einstellungen',
        title = 'Beatbattle Einstellungen',
        difficulty_label = 'Schwierigkeit',
        difficulty_description = 'Wähle einen Schwierigkeitsgrad aus',
        use_dance_mat_label = 'Tanzmatte benutzen', -- whether to use dancing mat (the one with arrows you stand on and dance)
        use_dance_mat_description = 'Tanzmatte ausrollen',
        dance_mat_color_label = 'Farbe der Tanzmatte',
        dance_mat_color_description = 'Wähle eine Farbe der Tanzmatte aus',
        num_of_players_label = 'Spieleranzahl',
        num_of_players_description = 'Wähle eine Spieleranzahl aus.',
        song_url_label = 'Song-Link', -- direct link to the song you want to play
        song_url_description = 'Drücke Enter um einen Link zum Song einzufügen.',
        song_url_input_title = 'Song-Link einfügen',
        song_url_invalid = "❗ Der Song kann nicht gespielt werden. Versuch einen anderen.",
        invite_players_label = 'Spieler einladen',
        invite_players_description = '💃 Lade Spieler zu einem Battle ein 💃',
        menu_loading_label = "Laden, bitte warten...",
    },

    -- Settings menu for beat battle that you see as invited player
    minigame_battle_player_menu = {
        header = 'Battle',
        title = 'Mach dich bereit.',
        dance_mat_color_label = 'Farbe der Tanzmatte',
        dance_mat_color_description = 'Wähle eine Farbe der Tanzmatte aus',
        ready_button_label = 'Bereit',
        ready_button_description = '💃 Bereit zum Tanzen 💃',
        menu_loading_label = "Laden, bitte warten...",
    },

    -- Settings menu for freestyle (Freestyle fiesta) minigame type
    minigame_freestyle_menu = {
        header = 'Einstellungen',
        title = 'Freestyle Einstellungen',
        difficulty_label = 'Schwierigkeit',
        difficulty_description = 'Wähle einen Schwierigkeitsgrad aus',
        use_dance_mat_label = 'Tanzmatte benutzen', -- whether to use dancing mat (the one with arrows you stand on and dance)
        use_dance_mat_description = 'Tanzmatte ausrollen',
        use_arrow_keys_label = 'Benutze die Pfeiltasten',
        use_arrow_keys_description =
        "Verwende die Pfeiltasten um die Tanzgeschwindigkeit zu erhöhen. Wenn diese Funktion aktiviert ist, kannst du die Geschwindigkeit nicht manuell anpassen.",
        dance_mat_color_label = 'Farbe der Tanzmatte',
        dance_mat_color_description = 'Wähle eine Farbe der Tanzmatte aus',
        menu_loading_label = "Laden, bitte warten...",
        start_dancing_label = 'Tanz starten',
        start_dancing_description = '💃 Tanz starten 💃',
    },

    -- Menu where you can invite nearby players to session
    player_list_menu = {
        header = 'Einladen',
        title = 'Spieler einladen',
        no_players = 'Es ist kein Spieler in der Nähe.',
        refresh_list_label = 'Liste aktualisieren', -- refresh list of nearby players
        refresh_list_description = 'Aktualisiere die Spielerliste in deiner Nähe.',
        confirm_label = 'Battle starten',
        confirm_description = 'Starte das Battle mit den eingeladenen Spielern.',
        menu_loading_label = "Warte auf das Akzeptieren der Einladungen...",
        invite_description = 'Spieler zum Battle einladen.',
        invited_description = 'Warte bis Spieler die Einladung akzeptiert. \n❌ Drücke %s um die Einladung zurückzuziehen.',
        confirmed_description = 'Der Spieler akzeptierte die Einladung und macht sich bereit.',
        ready_description = 'Der Spieler ist bereit zum Tanzen.',
    },

    -- Scoreboard at the end of beat battle
    scoreboard = {
        title = 'Ranking',
        rank = '🏆', -- rank column icon
        name = 'Name', -- name column title
        score = 'Punkte', -- score column title
        max_combo = 'Höchste Kombi', -- max combo achieved column title
    },

    difficulty = "Schwierigkeit",

    -- Messages that pop-up as you click arrow keys to song to show how accurate you were
    accuracy_messages = {
        message1 = 'Verfehlt',   -- when you miss an arrow entirely
        message2 = 'Gut',   -- when you barely make it
        message3 = 'Super',  -- when you accurately press it
        message4 = 'Perfekt' -- when the key press is within minimal distance from the center box
    },

    -- Key bind labels in help keys menu
    keys = {
        move = "Bewegen",
        input_value = "Bestätigen",
        cancel_input = "Eingabe abbrechen",
        change_value = "Eingabe anpassen",
        leave_menu = "Zurück / Schließen",
        end_minigame = "Minigame beenden",
        change_dance_style = "Tanzstil anpassen",
        change_dance_speed = "Geschwindigkeit anpassen",
        change_dance_move = "Tanzschritt anpassen",
        increase_volume = "Lautstärke erhöhen",
        decrease_volume = "Lautstärke verringern",
    }
}
