Locales["es"] = {
    -- Títulos en la pantalla de resultados
    your_score = 'Tu puntuación',
    win_label = 'Ganaste',
    lose_label = 'Perdiste',
    highest_combo = 'Combo máximo',

    start_in = 'Comienza en', -- texto en la cuenta regresiva, ejemplo: Comienza en 3, 2, 1
    init_loading = "❗ Por favor, espera a que se cargue el script antes de comenzar el minijuego. (+-5 segundos)",

    notifications = {
        session_invited = 'Fuiste invitado a una batalla de baile. Usa ~g~/%s ~s~o ~r~/%s',
        invitation_expired = 'La invitación a la batalla de baile ha caducado.',
        wait_for_host = '¡Prepárate! Espera a que el anfitrión inicie.',          -- notificación para esperar a que el anfitrión de la sesión inicie el minijuego
        url_invalid = "Este enlace no se puede reproducir, ingresa uno nuevo, por favor.", -- la canción del enlace elegido no se puede reproducir
        too_far = "El usuario al que estás tratando de invitar está demasiado lejos.",
        session_not_exists = "Esta batalla de baile no existe o ha terminado.",
        dancing_interrupted = "Sesión de baile interrumpida.",
        url_validation_timeout = "El tiempo de validación del enlace de la canción ha expirado. Inténtalo de nuevo, por favor.",
        not_in_dance_zone = "❗ No estás en una zona de baile.",
        open_session_invite_again = "Usa ~g~/%s ~s~de nuevo para volver al menú."
    },

    difficulty_names = {
        easy = 'Fácil',
        normal = 'Normal',
        pro = 'Maestro del baile',
    },

    difficulty_descriptions = {
        easy = 'Fácil: solo la mitad de las teclas para presionar, velocidad lenta.',
        normal = 'Normal: 3/4 de las teclas para presionar, velocidad normal.',
        pro = 'Modo Maestro: todas las teclas para presionar, velocidad muy rápida.',
    },

    dance_mat_colors = {
        blue = 'Azul',
        green = 'Verde',
        red = 'Rojo',
        yellow = 'Amarillo',
        purple = 'Morado',
        pink = 'Rosa',
        orange = 'Naranja',
    },

    -- -------------------------------------
    -- Textos del menú de minijuegos
    -- - a veces los menús utilizan textos similares, las traducciones repetidas se describirán solo una vez
    -- -------------------------------------

    -- Menú de configuración para el tipo de minijuego en solitario (Mastría del ritmo)
    minigame_menu = {
        header = 'Configuración',      -- Encabezado del menú (texto grande en la parte superior)
        title = 'Configuración de baile', -- Título del menú
        difficulty_label = 'Dificultad',
        difficulty_description = 'Selecciona la dificultad del minijuego.',
        use_dance_mat_label = 'Usar tapete de baile', -- si se usará el tapete de baile (el que tiene flechas en el que te paras y bailas)
        use_dance_mat_description = 'Despliega el tapete de baile.',
        dance_mat_color_label = 'Color del tapete de baile',
        dance_mat_color_description = 'Selecciona el color del tapete de baile.',
        song_url_label = 'URL de la canción', -- enlace directo a la canción que deseas reproducir
        song_url_description = 'Presiona Enter para ingresar la URL de la canción a la que deseas bailar.',
        song_url_input_title = 'Ingresa una URL de canción',
        song_url_invalid = "❗ La URL de la canción no se puede reproducir. Ingresa una nueva.",
        start_dancing_label = 'Comenzar a bailar',
        start_dancing_description = '💃 Comenzar a bailar 💃',
        menu_loading_label = "Cargando, por favor espera...",
    },

    -- Menú de configuración para elegir el tipo de minijuego que deseas jugar
    minigame_type_menu = {
        header = 'Tipo de minijuego',
        title = 'Selecciona el tipo de minijuego',
        solo_label = '🎵 Maestría del Ritmo', -- nombre del tipo de minijuego de baile en solitario con puntuación
        solo_description = 'Baila en solitario al ritmo de la música deseada mientras ganas puntos al presionar las teclas de flecha.',
        battle_label = '👯‍♂️ Batalla de Ritmo', -- nombre del tipo de minijuego de baile en sesión multijugador
        battle_description = 'Duelo de baile multijugador, igual que en solitario, ¡pero gana el que obtenga la puntuación más alta! 1-8 jugadores',
        freestyle_label = '🕺 Fiesta Freestyle', -- nombre del tipo de minijuego de estilo libre
        freestyle_description = 'Disfruta de todas las funciones en modo libre sin música (teclas de flecha opcionales).',
    },

    -- Menú de configuración para el tipo de minijuego multijugador (Batalla de Ritmo)
    minigame_battle_menu = {
        header = 'Configuración',
        title = 'Configuración de la Batalla',
        difficulty_label = 'Dificultad',
        difficulty_description = 'Selecciona la dificultad del minijuego.',
        use_dance_mat_label = 'Usar tapete de baile',
        use_dance_mat_description = 'Despliega el tapete de baile.',
        dance_mat_color_label = 'Color del tapete de baile',
        dance_mat_color_description = 'Selecciona el color del tapete de baile.',
        num_of_players_label = 'Número de jugadores',
        num_of_players_description = 'Selecciona el número de jugadores.',
        song_url_label = 'URL de la canción',
        song_url_description = '<Enter> una URL de canción para bailar.',
        song_url_input_title = 'Ingresa una URL de canción',
        song_url_invalid = "❗ La URL de la canción no se puede reproducir. Ingresa una nueva.",
        invite_players_label = 'Invitar jugadores',
        invite_players_description = '💃 Invita a jugadores para la batalla 💃',
        menu_loading_label = "Cargando, por favor espera...",
    },

    -- Menú de configuración para la batalla de ritmo que ves como jugador invitado
    minigame_battle_player_menu = {
        header = 'Batalla',
        title = '¡Prepárate!',
        dance_mat_color_label = 'Color del tapete de baile',
        dance_mat_color_description = 'Selecciona el color del tapete de baile.',
        ready_button_label = 'Listo',
        ready_button_description = '💃 Listo para bailar 💃',
        menu_loading_label = "Cargando, por favor espera...",
    },

    -- Menú de configuración para el tipo de minijuego de estilo libre (Fiesta Freestyle)
    minigame_freestyle_menu = {
        header = 'Configuración',
        title = 'Configuración de la Fiesta Freestyle',
        difficulty_label = 'Dificultad',
        difficulty_description = 'Selecciona la dificultad del minijuego.',
        use_dance_mat_label = 'Usar tapete de baile',
        use_dance_mat_description = 'Despliega el tapete de baile.',
        use_arrow_keys_label = 'Usar teclas de flecha',
        use_arrow_keys_description =
        "Combina las teclas de flecha para aumentar la velocidad de baile. Si está habilitado, no podrás cambiar la velocidad manualmente.",
        dance_mat_color_label = 'Color del tapete de baile',
        dance_mat_color_description = 'Selecciona el color del tapete de baile.',
        menu_loading_label = "Cargando, por favor espera...",
        start_dancing_label = 'Comenzar a bailar',
        start_dancing_description = '💃 Comenzar a bailar 💃',
    },

    -- Menú donde puedes invitar a jugadores cercanos a la sesión
    player_list_menu = {
        header = 'Invitar',
        title = 'Invitar jugadores',
        no_players = 'No se encontraron jugadores cerca de ti.',
        refresh_list_label = 'Actualizar lista', -- actualizar la lista de jugadores cercanos
        refresh_list_description = 'Actualizar la lista de jugadores en la zona.',
        confirm_label = 'Iniciar batalla',
        confirm_description = 'Iniciar batalla con los jugadores invitados.',
        menu_loading_label = "Esperando confirmación de invitaciones...",
        invite_description = 'Invitar a un jugador a la batalla de baile.',
        invited_description = 'Esperando que el jugador confirme la invitación. \n❌ Presiona %s para cancelar la invitación.',
        confirmed_description = 'El jugador ha confirmado la invitación y se está preparando.',
        ready_description = 'El jugador está listo para bailar.',
    },

    -- Tablero de puntuación al final de la batalla de ritmo
    scoreboard = {
        title = 'Clasificación',
        rank = '🏆', -- icono de columna de clasificación
        name = 'Nombre', -- título de la columna de nombre
        score = 'Puntuación', -- título de la columna de puntuación
        max_combo = 'Combo máximo', -- título de la columna de combo máximo alcanzado
    },

    difficulty = "Dificultad",

    -- Mensajes que aparecen al presionar las teclas de flecha para mostrar qué tan preciso fuiste
    accuracy_messages = {
        message1 = 'Fallo',   -- cuando fallas una flecha por completo
        message2 = 'Bien',   -- cuando apenas lo logras
        message3 = 'Genial',  -- cuando presionas con precisión
        message4 = 'Perfecto' -- cuando la presión de la tecla está dentro de la distancia mínima desde el centro
    },

    -- Etiquetas de combinación de teclas en el menú de teclas de ayuda
    keys = {
        move = "Mover",
        input_value = "Confirmar/Abrir entrada",
        cancel_input = "Cancelar entrada",
        change_value = "Cambiar valor",
        leave_menu = "Volver/Cerrar",
        end_minigame = "Terminar minijuego",
        change_dance_style = "Cambiar estilo de baile",
        change_dance_speed = "Cambiar velocidad de baile",
        change_dance_move = "Cambiar movimiento de baile",
        increase_volume = "Aumentar volumen",
        decrease_volume = "Reducir volumen",
    }
}