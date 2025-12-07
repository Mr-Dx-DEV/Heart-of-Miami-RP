Locales["tr"] = {
    -- Titles in result screen
    your_score = 'Skorun',
    win_label = 'Kazandın!',
    lose_label = 'Kaybettin!',
    highest_combo = 'En Yüksek Kombo',

    start_in = 'Başlıyor', -- text in countdown timer, example: Start in 3, 2, 1
    init_loading = "❗ Minigame'i başlatmadan önce lütfen scriptin yüklenmesini bekle. (+-5saniye)",

    notifications = {
        session_invited = 'Dans savaşına davet edildin! Bas ~g~/%s ~s~veya ~r~/%s',
        invitation_expired = 'Dans savaşı davetinin süresi bitti.',
        wait_for_host = 'Hazır ol! Oyunu kuran kişinin başlatması bekleniyor.', -- notification to wait for the session host to start minigame
        url_invalid = "Bu link oynatılamaz, lütfen yeni bir tane girin.", -- song from chosen url can't be played
        too_far = "Davet etmeye çalıştığın kişi çok uzakta.",
        session_not_exists = "Bu dans savaşı mevcut değil veya sona ermiş.",
        dancing_interrupted = "Dans oyunu kesintiye uğradı.",
        url_validation_timeout = "Şarkı link kontorlü zaman aşımına uğradı. Lütfen tekrar dene.",
        not_in_dance_zone = "❗ Dans bölgesinde değilsin.",
        open_session_invite_again = "Menüye dönmek için tekrar ~g~/%s ~s~tuşuna bas."
    },

    difficulty_names = {
        easy = 'Kolay',
        normal = 'Normal',
        pro = 'Dans Ustası',
    },

    difficulty_descriptions = {
        -- keys = keyboard keys; the harded a difficulty is the more keys you have to press (chosen from arrow up, down, left, right)
        easy = 'Kolay - mevcut tuşların sadece yarısı, yavaş hızda.',
        normal = 'Normal - mevcut tuşların sadece 3/4ü , normal hızda.',
        pro = 'Usta Modu - bütün tuşlara basman gerek, aşırı hızda.',
    },

    dance_mat_colors = {
        blue = 'Mavi',
        green = 'Yeşil',
        red = 'Kırmızı',
        yellow = 'Sarı',
        purple = 'Mor',
        pink = 'Pembe',
        orange = 'Turuncu',
    },

    -- -------------------------------------
    -- Minigame menu texts
    -- - menus use similar texts sometimes, repeating translations will only be described once
    -- -------------------------------------

    -- Settings menu for solo (Rhythm mastery) minigame type
    minigame_menu = {
        header = 'Ayarlar', -- Menu header (large text at top)
        title = 'Dans Ayarları', -- Menu title
        difficulty_label = 'Zorluk',
        difficulty_description = 'Minigame için zorluk seçin.',
        use_dance_mat_label = 'Dans matı kullan', -- whether to use dancing mat (the one with arrows you stand on and dance)
        use_dance_mat_description = 'Dans matını yere ser.',
        dance_mat_color_label = 'Dans matı rengi',
        dance_mat_color_description = 'Dans matının rengini seçin.',
        song_url_label = 'Şarkı Linki', -- direct link to the song you want to play
        song_url_description = 'Dans edeceğin şarkı linkini girip enter tuşuna bas.',
        song_url_input_title = 'Şarkı linki girin',
        song_url_invalid = "❗ Şarkı linki çalınamıyor. Yeni bir tane girin.",
        start_dancing_label = 'Dans Etmeye Başla',
        start_dancing_description = '💃 Dans Etmeye Başla 💃',
        menu_loading_label = "Yükleniyor, lütfen bekleyin...",
    },

    -- Settings menu to choose which minigame type you want to play
    minigame_type_menu = {
        header = 'Minigame Türü',
        title = 'Minigame Tipi Seç',
        solo_label = '🎵 Ritim Uzmanı', -- name of solo dancing minigame type with score
        solo_description = 'Ok tuşlarına basarak tek başına istediğin müzikle dans et ve skor kazan.',
        battle_label = '👯‍♂️ Ritim Savaşı', -- name of multiplayer session dancing minigame type
        battle_description =
        'Çok oyunculu dans savaşı. Solo gibi fakat en yüksek skora ulaşan kazanır. 1-8 oyuncu kapasiteli.',
        freestyle_label = '🕺 Serbest Stil Partisi', -- name of freestyle minigame type
        freestyle_description =
        'Serbest stil modundaki bütün özellikleri müziksiz bir şekilde kullanın. (ok tuşları opsiyonel).',
    },

    -- Settings menu for multiplayer (Beat battle) minigame type
    minigame_battle_menu = {
        header = 'Ayarlar',
        title = 'Savaş Ayarları',
        difficulty_label = 'Zorluk',
        difficulty_description = 'Minigame zorluğu seçin.',
        use_dance_mat_label = 'Dans matı kullan',
        use_dance_mat_description = 'Dans matını ser.',
        dance_mat_color_label = 'Dans matı rengi',
        dance_mat_color_description = 'Dans matı rengini seçin.',
        num_of_players_label = 'Oyuncu Sayısı',
        num_of_players_description = 'Oyuncu sayısını seçin.',
        song_url_label = 'Şarkı Linki',
        song_url_description = '<Enter> dans etmek istediğiniz şarkı linkini girin.',
        song_url_input_title = 'Şarkı linki girin',
        song_url_invalid = "❗ Şarkı linki çalınamıyor. Yeni bir tane girin.",
        invite_players_label = 'Oyuncuları Davet Et',
        invite_players_description = '💃 Savaşa oyuncuları davet et 💃',
        menu_loading_label = "Yükleniyor, lütfen bekleyin...",
    },

    -- Settings menu for beat battle that you see as invited player
    minigame_battle_player_menu = {
        header = 'Savaşa',
        title = 'Hazır ol!',
        dance_mat_color_label = 'Dans matı rengi',
        dance_mat_color_description = 'Dans matı rengini seçin.',
        ready_button_label = 'Hazır ol!',
        ready_button_description = '💃 Dans etmeye hazır ol 💃',
        menu_loading_label = "Yükleniyor, lütfen bekleyin...",
    },

    -- Settings menu for freestyle (Freestyle fiesta) minigame type
    minigame_freestyle_menu = {
        header = 'Ayarlar',
        title = 'Serbest Stil Ayarları',
        difficulty_label = 'Zorluk',
        difficulty_description = "Minigame'in zorluğunu seçin.",
        use_dance_mat_label = 'Dans matı kullan',
        use_dance_mat_description = 'Dans matını ser.',
        use_arrow_keys_label = 'Ok tuşlarını kullan',
        use_arrow_keys_description =
        "Dans hızını arttırmak için ok tuşlarını eşleştir. Eğer bu özellik açıksa, dans hızını kendiniz değiştiremeyeceksiniz.",
        dance_mat_color_label = 'Dans matı rengi',
        dance_mat_color_description = 'Dans matı rengini seçin.',
        menu_loading_label = "Yükleniyor, lütfen bekleyin...",
        start_dancing_label = 'Dans etmeye başla',
        start_dancing_description = '💃 Dans etmeye başla 💃',
    },

    -- Menu where you can invite nearby players to session
    player_list_menu = {
        header = 'Davet',
        title = 'Oyuncuları Davet Et',
        no_players = 'Yakınında oyuncu yok.',
        refresh_list_label = 'Listeyi yenile', -- refresh list of nearby players
        refresh_list_description = 'Yakınındaki oyuncuların listesini yenile.',
        confirm_label = 'Savaşı başlat',
        confirm_description = 'Davet edilen oyuncularla birlikte savaşı başlat.',
        menu_loading_label = "Davetlerin onaylanması bekleniyor...",
        invite_description = 'Dans savaşına oyuncu davet et.',
        invited_description = 'Oyuncunun daveti kabul etmesi bekleniyor. \n❌ Daveti iptal etmek için %s tuşuna bas.',
        confirmed_description = 'Oyuncu daveti kabul etti ve hazırlanıyor.',
        ready_description = 'Oyuncu dans etmeye hazır.',
    },

    -- Scoreboard at the end of beat battle
    scoreboard = {
        title = 'Sıralama',
        rank = '🏆', -- rank column icon
        name = 'İsim', -- name column title
        score = 'Skor', -- score column title
        max_combo = 'Maksimum Kombo', -- max combo achieved column title
    },

    difficulty = "Zorluk",

    -- Messages that pop-up as you click arrow keys to song to show how accurate you were
    accuracy_messages = {
        message1 = 'Iska', -- when you miss an arrow entirely
        message2 = 'İyi', -- when you barely make it
        message3 = 'Harika', -- when you accurately press it
        message4 = 'Mükemmel' -- when the key press is within minimal distance from the center box
    },

    -- Key bind labels in help keys menu
    keys = {
        move = "Hareket",
        input_value = "Onayla/Aç girdisi",
        cancel_input = "İptal girdisi",
        change_value = "Değeri değiştir",
        leave_menu = "Geri/Kapat",
        end_minigame = "Minigame'i bitir",
        change_dance_style = "Dans stilini değiştir",
        change_dance_speed = "Dans hızını değiştir",
        change_dance_move = "Dans hareketlerini değiştir",
        increase_volume = "Sesi aç",
        decrease_volume = "Sesi kıs",
    }
}
