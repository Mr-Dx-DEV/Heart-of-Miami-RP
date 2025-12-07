Locales["it"] = {
    -- Titles in result screen
    your_score = 'Il tuo punteggio',
    win_label = 'Hai vinto!',
    lose_label = 'Hai perso!',
    highest_combo = 'Combo più alta',

    start_in = 'Inizia tra', -- text in countdown timer, example: Start in 3, 2, 1
    init_loading = "❗ Attendi il caricamento dello script prima di avviare il minigioco. (+-5sec)",

    notifications = {
        session_invited = 'Sei stato invitato a una sfida di ballo! Usa ~g~/%s ~s~o ~r~/%s',
        invitation_expired = 'Invito scaduto.',
        wait_for_host = "Preparati! Attendi l'avvio dell'host.",          -- notification to wait for the session host to start minigame
        url_invalid = "Questo link non può essere riprodotto, inseriscine uno nuovo.", -- song from chosen url can't be played
        too_far = "Il giocatore che stai tentando di invitare è troppo lontano.",
        session_not_exists = "Questa sfida di ballo non esiste o è terminata.",
        dancing_interrupted = "Sessione di ballo interrotta.",
        url_validation_timeout = "La convalida dell'URL del brano è scaduta, riprova.",
        not_in_dance_zone = "❗ Non sei in una zona di ballo.",
        open_session_invite_again = "Usa ~g~/%s ~s~di nuovo per tornare al menu."
    },

    difficulty_names = {
        easy = 'Facile',
        normal = 'Normale',
        pro = 'Maestro di danza',
    },

    difficulty_descriptions = {
        -- keys = keyboard keys; the harded a difficulty is the more keys you have to press (chosen from arrow up, down, left, right)
        easy = 'Facile - premere solo la metà dei tasti, velocità lenta.',
        normal = 'Normale - 3/4 dei tasti da premere, velocità normale.',
        pro = 'Maestro - tutti i tasti da premere, velocità molto elevata.',
    },

    dance_mat_colors = {
        blue = 'Blu',
        green = 'Verde',
        red = 'Rosso',
        yellow = 'Giallo',
        purple = 'Viola',
        pink = 'Rosa',
        orange = 'Arancione',
    },

    -- -------------------------------------
    -- Minigame menu texts
    -- - menus use similar texts sometimes, repeating translations will only be described once
    -- -------------------------------------

    -- Settings menu for solo (Rhythm mastery) minigame type
    minigame_menu = {
        header = 'Impostazioni',      -- Menu header (large text at top)
        title = 'Impostazioni danza', -- Menu title
        difficulty_label = 'Difficoltà',
        difficulty_description = 'Seleziona la difficoltà del minigioco.',
        use_dance_mat_label = 'Usa il tappetino da ballo', -- whether to use dancing mat (the one with arrows you stand on and dance)
        use_dance_mat_description = 'Stendi il tappetino da ballo.',
        dance_mat_color_label = 'Colore tappetino da ballo',
        dance_mat_color_description = 'Seleziona il colore del tappeto da ballo.',
        song_url_label = 'URL del brano', -- direct link to the song you want to play
        song_url_description = "Premi Invio per inserire l'URL del brano da ballare.",
        song_url_input_title = "Inserisci l'URL di un brano",
        song_url_invalid = "❗ Impossibile riprodurre il brano. Inseriscine uno nuovo.",
        start_dancing_label = 'Inizia a ballare',
        start_dancing_description = '💃 Inizia a ballare 💃',
        menu_loading_label = "Caricamento in corso...",
    },

    -- Settings menu to choose which minigame type you want to play
    minigame_type_menu = {
        header = 'Tipo di minigioco',
        title = 'Seleziona il tipo di minigioco',
        solo_label = '🎵 Padronanza del ritmo', -- name of solo dancing minigame type with score
        solo_description = 'Balla da solo al ritmo della musica desiderata mentre guadagni punteggio premendo le frecce della tastiera.',
        battle_label = '👯‍♂️ Beat', -- name of multiplayer session dancing minigame type
        battle_description = 'Ballo multigiocatore, come in solitario, ma vince il punteggio più alto! 1-8 giocatori',
        freestyle_label = '🕺 Freestyle', -- name of freestyle minigame type
        freestyle_description = 'Goditi tutte le funzionalità in modalità freestyle senza musica (freccette opzionali).',
    },

    -- Settings menu for multiplayer (Beat battle) minigame type
    minigame_battle_menu = {
        header = 'Impostazioni',
        title = 'Impostazioni battaglia',
        difficulty_label = 'Difficoltà',
        difficulty_description = 'Seleziona la difficoltà del minigioco.',
        use_dance_mat_label = 'Usa il tappetino da ballo', -- whether to use dancing mat (the one with arrows you stand on and dance)
        use_dance_mat_description = 'Stendi il tappetino da ballo.',
        dance_mat_color_label = 'Colore tappetino da ballo',
        dance_mat_color_description = 'Seleziona il colore del tappeto da ballo.',
        num_of_players_label = 'Numero di giocatori',
        num_of_players_description = 'Seleziona il numero di giocatori.',
        song_url_label = 'URL del brano', -- direct link to the song you want to play
        song_url_description = "Premi Invio per inserire l'URL del brano da ballare.",
        song_url_input_title = "Inserisci l'URL di un brano",
        song_url_invalid = "❗ Impossibile riprodurre il brano. Inseriscine uno nuovo.",
        invite_players_label = 'Invita giocatori',
        invite_players_description = '💃 Invita giocatori alla battaglia 💃',
        menu_loading_label = "Caricamento in corso...",
    },

    -- Settings menu for beat battle that you see as invited player
    minigame_battle_player_menu = {
        header = 'Battaglia',
        title = 'Preparati!',
        dance_mat_color_label = 'Colore tappetino da ballo',
        dance_mat_color_description = 'Seleziona il colore del tappeto da ballo.',
        ready_button_label = 'Preparati',
        ready_button_description = '💃 Pronto a ballare 💃',
        menu_loading_label = "Caricamento in corso...",
    },

    -- Settings menu for freestyle (Freestyle fiesta) minigame type
    minigame_freestyle_menu = {
        header = 'Impostazioni',
        title = 'Impostazioni Freestyle',
        difficulty_label = 'Difficoltà',
        difficulty_description = 'Seleziona la difficoltà del minigioco.',
        use_dance_mat_label = 'Usa il tappetino da ballo',
        use_dance_mat_description = 'Stendi il tappetino da ballo.',
        use_arrow_keys_label = 'Usa le frecce della tastiera',
        use_arrow_keys_description = "Abbina i tasti freccia per aumentare la velocità della danza. Se abilitato, non sarai in grado di modificare la velocità manualmente.",
        dance_mat_color_label = 'Colore tappetino da ballo',
        dance_mat_color_description = 'Seleziona il colore del tappeto da ballo.',
        menu_loading_label = "Caricamento in corso...",
        start_dancing_label = 'Inizia a ballare',
        start_dancing_description = '💃 Inizia a ballare 💃',
    },

    -- Menu where you can invite nearby players to session
    player_list_menu = {
        header = 'Invita',
        title = 'Invita giocatori',
        no_players = 'Nessun giocatore trovato vicino a te.',
        refresh_list_label = 'Aggiorna lista', -- refresh list of nearby players
        refresh_list_description = "Aggiorna l'elenco dei giocatori vicini.",
        confirm_label = 'Inizia battaglia',
        confirm_description = 'Inizia la battaglia con i giocatori invitati.',
        menu_loading_label = "In attesa di conferma degli inviti...",
        invite_description = 'Invita il giocatore alla battaglia.',
        invited_description = "In attesa che il giocatore confermi l'invito. \n❌ Premi %s per annullare l'invito.",
        confirmed_description = "Il giocatore ha confermato l'invito e si sta preparando.",
        ready_description = 'Il giocatore è pronto per ballare.',
    },

    -- Scoreboard at the end of beat battle
    scoreboard = {
        title = 'Classifica',
        rank = '🏆', -- rank column icon
        name = 'Nome', -- name column title
        score = 'Punteggio', -- score column title
        max_combo = 'Combo più alta', -- max combo achieved column title
    },

    difficulty = "Difficoltà",

    -- Messages that pop-up as you click arrow keys to song to show how accurate you were
    accuracy_messages = {
        message1 = 'Mancato',   -- when you miss an arrow entirely
        message2 = 'Buono',   -- when you barely make it
        message3 = 'Grande',  -- when you accurately press it
        message4 = 'Perfetto' -- when the key press is within minimal distance from the center box
    },

    -- Key bind labels in help keys menu
    keys = {
        move = "Move",
        input_value = "Conferma/Apri input",
        cancel_input = "Annulla input",
        change_value = "Cambia valore",
        leave_menu = "Torna indietro/Chiudi",
        end_minigame = "Esci dal minigioco",
        change_dance_style = "Cambia stile di danza",
        change_dance_speed = "Cambia la velocità della danza",
        change_dance_move = "Cambia movimento di danza",
        increase_volume = "Alza il volume",
        decrease_volume = "Abbassa il volume",
    }
}
