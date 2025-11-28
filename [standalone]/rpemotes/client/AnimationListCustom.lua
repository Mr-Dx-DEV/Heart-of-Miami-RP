-- Emotes you add in the file will automatically be added to AnimationList.lua
-- If you have multiple custom list files they MUST be added between AnimationList.lua and Emote.lua in fxmanifest.lua!
-- Don't change 'CustomDP' it is local to this file!

-- Remove the } from the = {} then enter your own animation code ---
-- Don't forget to close the tables.

---@type AnimationListConfig?
---@diagnostic disable-next-line: missing-fields
local CustomDP = {}

CustomDP.Expressions = {}
CustomDP.Walks = {}
CustomDP.Shared = {}
CustomDP.Dances = {} -- All dance emotes moved to CustomEmotes section
CustomDP.CustomEmotes = {
    ["gangsign4"] = {
        "qpacc@gangsign4",
        "gangsign4_clip",
        "Gang Sign 4",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gangsign5"] = {
        "qpacc@gangsign5",
        "gangsign5_clip",
        "Gang Sign 5",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gangsign6"] = {
        "qpacc@gangsign6",
        "gangsign6_clip",
        "Gang Sign 6",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gangsign7"] = {
        "qpacc@gangsign7",
        "gangsign7_clip",
        "Gang Sign 7",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gangsign8"] = {
        "qpacc@gangsign8",
        "gangsign8_clip",
        "Gang Sign 8",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },

    ["gsign1"] = {
        "custom@gsign_01",
        "gsign_01",
        "Gang Sign 1",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign2"] = {
        "custom@gsign_02",
        "gsign_02",
        "Gang Sign 2",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign3"] = {
        "custom@gsign_03",
        "gsign_03",
        "Gang Sign 3",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign4"] = {
        "custom@gsign_04",
        "gsign_04",
        "Gang Sign 4",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign5"] = {
        "custom@gsign_05",
        "gsign_05",
        "Gang Sign 5",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign6"] = {
        "custom@gsign_06",
        "gsign_06",
        "Gang Sign 6",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign7"] = {
        "custom@gsign_07",
        "gsign_07",
        "Gang Sign 7",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign8"] = {
        "custom@gsign_08",
        "gsign_08",
        "Gang Sign 8",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign9"] = {
        "custom@gsign_09",
        "gsign_09",
        "Gang Sign 9",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign10"] = {
        "custom@gsign_10",
        "gsign_10",
        "Gang Sign 10",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign11"] = {
        "custom@gsign_11",
        "gsign_11",
        "Gang Sign 11",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign12"] = {
        "custom@gsign_12",
        "gsign_12",
        "Gang Sign 12",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign13"] = {
        "custom@gsign_13",
        "gsign_13",
        "Gang Sign 13",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign14"] = {
        "custom@gsign_14",
        "gsign_14",
        "Gang Sign 14",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign15"] = {
        "custom@mgsign_01",
        "mgsign_01",
        "Gang Sign 15",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign16"] = {
        "custom@mgsign_02",
        "mgsign_02",
        "Gang Sign 16",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign17"] = {
        "custom@mgsign_03",
        "mgsign_03",
        "Gang Sign 17",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign18"] = {
        "custom@mgsign_04",
        "mgsign_04",
        "Crip Sign",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign19"] = {
        "custom@gsign_26",
        "gsign_26",
        "Gang Sign 19",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign20"] = {
        "custom@gsign_27",
        "gsign_27",
        "Gang Sign 20",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign21"] = {
        "custom@gsign_28",
        "gsign_28",
        "Gang Sign 21",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign22"] = {
        "custom@gsign_29",
        "gsign_29",
        "Gang Sign 22",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gsign23"] = {
        "custom@gsign_30",
        "gsign_30",
        "Gang Sign 23",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["gsign24"] = {
        "custom@gsign_31",
        "gsign_31",
        "Gang Sign 24",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gsign25"] = {
        "custom@gsign_32",
        "gsign_32",
        "Gang Sign 25",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gsign26"] = {
        "custom@gsign_33",
        "gsign_33",
        "Gang Sign 26",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gsign27"] = {
        "custom@gsign_34",
        "gsign_34",
        "Gang Sign 27",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gsign28"] = {
        "custom@gsign_35",
        "gsign_35",
        "Gang Sign 28",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gsign29"] = {
        "custom@gsign_36",
        "gsign_36",
        "Gang Sign 29",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gsign30"] = {
        "custom@gsign_37",
        "gsign_37",
        "Gang Sign 30",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },

    ["fsign"] = {
        "custom@fsign_1",
        "fsign_1",
        "Female Sign 1",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["cane"] = {
        "missheistdocksprep1hold_cellphone",
        "static",
        "Cane",
        AnimationOptions =
        {
            Prop = "prop_cs_walking_stick",
            PropBone = 57005,
            PropPlacement = { 0.15, 0.05, -0.03, 0.0, 266.0, 180.0 },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["handspocket"] = {
        "custom@handsinpockets_1",
        "handsinpockets_1",
        "Hands in Pocket",
        AnimationOptions =
        {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },

    
    ["jpbox"] = {
        "mp_am_hold_up",
        "purchase_beerbox_shopkeeper",
        "Purchase Box",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jch"] = {
        "amb@code_human_police_investigate@idle_b",
        "idle_f",
        "Cop Search",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 7000,
        }
    },
    ["jgangsign5"] = {
        "anim@mp_player_intupperdock",
        "idle_a",
        "Gang Sign",
        AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 2500,
        }
    },
    ["jcheckwatch"] = {
        "amb@code_human_wander_idles_fat@male@idle_a",
        "idle_a_wristwatch",
        "Check Watch · Male",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 5000,
        }
    },
    ["jpicking"] = {
        "amb@prop_human_movie_bulb@idle_a",
        "idle_a",
        "Picking",
        AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 2500,
        }
    },
    ["jgangaim"] = {
        "combat@aim_variations@1h@gang",
        "aim_variation_b",
        "Gang Aim",
        AnimationOptions =
        {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["jshowboobs"] = {
        "mini@strip_club@backroom@",
        "stripper_b_backroom_idle_b",
        "Show Boobs",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 6000,
        }
    },
    ["jcleanleg"] = {
        "mini@strip_club@backroom@",
        "stripper_c_leadin_backroom_idle_a",
        "Clean Legs",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 6000,
        }
    },
    ["jshowboobs2"] = {
        "mini@strip_club@idles@stripper",
        "stripper_idle_05",
        "Show Boobs 2",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 6000,
        }
    },
    ["jlockcar"] = {
        "anim@mp_player_intmenu@key_fob@",
        "fob_click",
        "Lock Car",
        AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 2500,
        }
    },
    ["jselfie5"] = {
        "cellphone@self",
        "selfie",
        "Selfie 3",
        AnimationOptions =
        {
            EmoteMoving = false,
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
            EmoteLoop = true
        }
    },
    ["jselfiewc"] = {
        "cellphone@self@franklin@",
        "west_coast",
        "Selfie West Coast",
        AnimationOptions =
        {
            EmoteMoving = false,
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
            EmoteLoop = true
        }
    },
    ["jselfie3"] = {
        "cellphone@self@michael@",
        "finger_point",
        "Selfie Finger",
        AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ["jselfie4"] = {
        "cellphone@self@franklin@",
        "chest_bump",
        "Selfie Chest Bump",
        AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ["jselfie1"] = {
        "cellphone@self@trevor@",
        "throat_slit",
        "Selfie",
        AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ["jselfie2"] = {
        "cellphone@self@trevor@",
        "proud_finger",
        "Selfie2",
        AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ["jkhaby"] = {
        "missarmenian3@simeon_tauntsidle_b",
        "areyounotman",
        "Khaby · Special",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jdepressed"] = {
        "oddjobs@bailbond_hobodepressed",
        "base",
        "Depressed",
        AnimationOptions =
        {
            EmoteMoving = true,
        }
    },
    ["jcarsign"] = {
        "amb@code_human_in_car_mp_actions@gang_sign_a@bodhi@rds@base",
        "idle_a",
        "Gang Sign · Car",
        AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 2500,
        }
    },
    ["jcarsign2"] = {
        "amb@code_human_in_car_mp_actions@gang_sign_a@low@ds@base",
        "idle_a",
        "Gang Signs 2 · Car",
        AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 2500,
        }
    },
    ["jcarlowrider"] = {
        "anim@veh@lowrider@low@front_ds@arm@base",
        "sit",
        "Lowrider Style · Car",
        AnimationOptions =
        {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["jcarlowrider2"] = {
        "anim@veh@lowrider@std@ds@arm@music@mexicanidle_a",
        "idle",
        "Lowrider Mexican Style · Car",
        AnimationOptions =
        {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["jleaningwallback"] = {
        "anim@amb@casino@peds@",
        "amb_world_human_leaning_male_wall_back_mobile_idle_a",
        "Leaning Wall Back · Male",
        AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["jreactiona"] = {
        "random@shop_robbery_reactions@",
        "absolutely",
        "Reaction Absolutely",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jreactanger"] = {
        "random@shop_robbery_reactions@",
        "anger_a",
        "Reaction Anger",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jreactwhy"] = {
        "random@shop_robbery_reactions@",
        "is_this_it",
        "Reaction Why",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jreactscrew"] = {
        "random@shop_robbery_reactions@",
        "screw_you",
        "Reaction Screw You",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jreactshock"] = {
        "random@shop_robbery_reactions@",
        "shock",
        "Reaction Shock",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jreactgoodc"] = {
        "missclothing",
        "good_choice_storeclerk",
        "Reaction Good Choice",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jtrynewc"] = {
        "clothingtie",
        "try_tie_neutral_c",
        "Try New Clothes",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jtrynewc2"] = {
        "clothingtie",
        "try_tie_neutral_d",
        "Try New Clothes 2",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jreacteasy"] = {
        "gestures@m@car@std@casual@ds",
        "gesture_easy_now",
        "Reaction Easy Now",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jreactıwill"] = {
        "gestures@m@car@std@casual@ds",
        "gesture_i_will",
        "Reaction I will",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jreactnoway"] = {
        "gestures@m@car@std@casual@ds",
        "gesture_no_way",
        "Reaction No Way",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jreactbye"] = {
        "gestures@f@standing@casual",
        "gesture_bye_hard",
        "Reaction Bye Hard",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jreacthello"] = {
        "gestures@f@standing@casual",
        "gesture_hello",
        "Reaction Hello",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jlookatplayer"] = {
        "friends@frl@ig_1",
        "look_lamar",
        "Look At Player",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jreactgreat"] = {
        "mp_cp_welcome_tutgreet",
        "greet",
        "Great",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jfakepunch"] = {
        "missarmenian2",
        "fake_punch_walk_by_lamar",
        "Fake Punch",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 5000,
        }
    },
    ["jreactdamn"] = {
        "missheist_jewel",
        "damn",
        "Reaction Damn",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jimtellingyou"] = {
        "missheist_jewel",
        "im_telling_you",
        "I'm telling you",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jreactno"] = {
        "missheist_jewel",
        "despair",
        "Reaction No",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jdontkillme"] = {
        "missheist_jewel",
        "manageress_kneel_loop",
        "Dont Kill Me",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jbangbang"] = {
        "anim@mp_player_intcelebrationfemale@bang_bang",
        "bang_bang",
        "Bang Bang",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jtryshirtn"] = {
        "clothingshirt",
        "try_shirt_negative_a",
        "Try Shirt Negative",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jtryshirtp"] = {
        "clothingshirt",
        "try_shirt_positive_a",
        "Try Shirt Positive",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jtryshoes"] = {
        "clothingshoes",
        "try_shoes_positive_d",
        "Try Shoes",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jtryshoes2"] = {
        "clothingshoes",
        "try_shoes_positive_c",
        "Try Shoes 2",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["joverhere"] = {
        "friends@fra@ig_1",
        "over_here_idle_a",
        "Over Here",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jwashingface"] = {
        "missmic2_washing_face",
        "michael_washing_face",
        "Washing Face",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 5000,
        }
    },
    ["jlastday"] = {
        "misstrevor1",
        "ortega_outro_loop_ort",
        "Last Day",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jtryg"] = {
        "mp_clothing@female@glasses",
        "try_glasses_positive_a",
        "Try Glasses · Female",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jpickup"] = {
        "pickup_object",
        "pickup_low",
        "Pick Up",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jstretchl"] = {
        "switch@franklin@bed",
        "stretch_long",
        "Stretch Long",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jhos"] = {
        "amb@world_human_hang_out_street@male_a@idle_a",
        "idle_a",
        "Hang Out Street · Male",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jhos2"] = {
        "amb@world_human_hang_out_street@male_c@base",
        "base",
        "Hang Out Street 2 · Male",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jguardaim"] = {
        "guard_reactions",
        "1hand_aiming_cycle",
        "Guard Aim",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jgready"] = {
        "switch@franklin@getting_ready",
        "002334_02_fras_v2_11_getting_dressed_exit",
        "Getting Ready",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jlao"] = {
        "move_clown@p_m_two_idles@",
        "fidget_look_at_outfit",
        "Look At Outfits",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 6000,
        }
    },
    ["jtoilet"] = {
        "switch@trevor@on_toilet",
        "trev_on_toilet_loop",
        "Have A Shit",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 5000,
        }
    },
    ["jtoilet2"] = {
        "timetable@trevor@on_the_toilet",
        "trevonlav_struggleloop",
        "Have A Shit 2",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 5000,
        }
    },
    ["jcovermale2"] = {
        "amb@code_human_cower@male@base",
        "base",
        "Cover · Male",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jvalet"] = {
        "anim@amb@world_human_valet@normal@base@",
        "base_a_m_y_vinewood_01",
        "Valet",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jvalet2"] = {
        "anim@amb@world_human_valet@formal_right@base@",
        "base_a_m_y_vinewood_01",
        "Valet 2",
        AnimationOptions =
        {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["jsunbathem"] = {
        "amb@world_human_sunbathe@male@back@idle_a",
        "idle_c",
        "Sunbathe · Male",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ["jsunbathem2"] = {
        "amb@world_human_sunbathe@male@front@base",
        "base",
        "Sunbathe 2 · Male",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jleancar"] = {
        "anim@scripted@carmeet@tun_meet_ig2_race@",
        "base",
        "Lean Car",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["jcheckout2"] = {
        "anim@amb@carmeet@checkout_car@male_c@idles",
        "idle_a",
        "Check Out 2 · Male",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jcheckout"] = {
        "anim@amb@carmeet@checkout_car@female_d@base",
        "base",
        "Check Out 3 · Female",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jreadmessages"] = {
        "anim@amb@carmeet@take_photos@male_a@base",
        "base",
        "Read Messages · Male",
        AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ["jreadmessages2"] = {
        "anim@amb@carmeet@take_photos@female_b@base",
        "base",
        "Read Messages 2 · Female",
        AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ["jlistenmusic"] = {
        "anim@amb@carmeet@listen_music@male_a@trans",
        "a_trans_d",
        "Listen Music",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 5000,
        }
    },
    ["jogger"] = {
        "move_f@jogger",
        "idle",
        "Jogger · Female",
        AnimationOptions =
        {
            EmoteDuration = 2500,
            EmoteMoving = true,
        }
    },
    ["jogger2"] = {
        "move_m@jogger",
        "idle",
        "Jogger · Male",
        AnimationOptions =
        {
            EmoteDuration = 2500,
            EmoteMoving = true,
        }
    },
    ["jwtf"] = {
        "mini@triathlon",
        "wot_the_fuck",
        "Wot The Fuck",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jucdt"] = {
        "mini@triathlon",
        "u_cant_do_that",
        "U Cant Do That",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jwarmup"] = {
        "mini@triathlon",
        "ig_2_gen_warmup_01",
        "Warmup",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 5000,
        }
    },
    ["jwarmup2"] = {
        "mini@triathlon",
        "ig_2_gen_warmup_02",
        "Warmup 2",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 5000,
        }
    },
    ["jwarmup3"] = {
        "mini@triathlon",
        "jog_idle_f",
        "Warmup 3",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 5000,
        }
    },
    ["jwarmup4"] = {
        "mini@triathlon",
        "jog_idle_e",
        "Warmup 4",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 5000,
        }
    },
    ["jhmassage"] = {
        "missheistfbi3b_ig8_2",
        "cpr_loop_paramedic",
        "Heart Massage",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jpassout"] = {
        "missheistfbi3b_ig8_2",
        "cower_loop_victim",
        "Pass Out",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jddealer"] = {
        "amb@world_human_drug_dealer_hard@male@base",
        "base",
        "Drug Dealer · Male",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jswatch"] = {
        "amb@world_human_strip_watch_stand@male_c@idle_a",
        "idle_b",
        "Watch Strip · Male",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jcheckw"] = {
        "amb@world_human_bum_wash@male@high@base",
        "base",
        "Check Water",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 5000,
        }
    },
    ["jwaitt"] = {
        "oddjobs@taxi@",
        "idle_a",
        "Wait Taxi",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 5000,
        }
    },
    ["jnoway"] = {
        "oddjobs@towingpleadingbase",
        "base",
        "No Way",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jtsomething"] = {
        "oddjobs@bailbond_hobohang_out_street_c",
        "idle_c",
        "Tell Something",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jlfh"] = {
        "oddjobs@assassinate@old_lady",
        "looking_for_help",
        "Looking For Help",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 5000,
        }
    },
    ["jmstretch"] = {
        "oddjobs@assassinate@multi@",
        "idle_a",
        "Muscle Stretch",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 5000,
        }
    },
    
    ["jlmic"] = {
        "anim@veh@lowrider@std@ds@arm@music@hiphopidle_a",
        "idle",
        "Listen Music In Car",
        AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 2500,
        }
    },
    ["jgotc"] = {
        "random@getawaydriver@thugs",
        "base_a",
        "Get Off The Car",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["jvsad"] = {
        "anim@amb@business@bgen@bgen_no_work@",
        "sit_phone_phoneputdown_sleeping-noworkfemale",
        "Very Sad",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jdgrave"] = {
        "anim@amb@drug_field_workers@rake@male_a@base",
        "base",
        "Digging Grave",
        AnimationOptions =
        {
            Prop = 'prop_tool_shovel006',
            PropBone = 28422,
            PropPlacement = { 0.0, 0.1, -0.6, 0.0, 0.0, 180.0 },
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ["jbow3"] = {
        "missheistdockssetup1ig_10@base",
        "talk_pipe_base_worker1",
        "Bend Over Wait",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 2500,
        }
    },
    ["jweeding"] = {
        "anim@amb@drug_field_workers@weeding@male_a@base",
        "base",
        "Weeding · Male",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jlookplan"] = {
        "missheist_agency2aig_4",
        "look_plan_c_worker2",
        "Look Plan",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 5000,
        }
    },
    ["jgangdrink"] = {
        "amb@world_human_drinking_fat@beer@male@idle_a",
        "idle_b",
        "Gang Drink 2",
        AnimationOptions =
        {
            Prop = 'prop_cs_beer_bot_40oz_03',
            PropBone = 28422,
            PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["jmleaning"] = {
        "amb@world_human_leaning@male@wall@back@mobile@base",
        "base",
        "Mobile Leaning · Male",
        AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    ["jthanks"] = {
        "random@arrests",
        "thanks_male_05",
        "Thanks",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jtextingmale"] = {
        "amb@world_human_stand_mobile_fat@male@text@base",
        "base",
        "Texting · Male",
        AnimationOptions =
        {
            Prop = "prop_npc_phone_02",
            PropBone = 28422,
            PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 },
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["jsitchair7"] = {
        "timetable@reunited@ig_10",
        "isthisthebest_jimmy",
        "Sit Chair 7",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jsitchair8"] = {
        "timetable@michael@on_sofabase",
        "sit_sofa_base",
        "Sit Chair 8",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jsitchair9"] = {
        "timetable@trevor@smoking_meth@base",
        "base",
        "Sit Chair 9",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jsitchair10"] = {
        "timetable@tracy@ig_7@base",
        "base",
        "Sit Chair 10",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jstandingt"] = {
        "amb@world_human_bum_standing@twitchy@base",
        "base",
        "Standing Twitchy",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jstandingfit"] = {
        "amb@world_human_jog_standing@male@fitbase",
        "base",
        "Standing Fit",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jstandingm"] = {
        "anim@amb@casino@hangout@ped_male@stand@03b@base",
        "base",
        "Standing · Male",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jstandingf"] = {
        "anim@amb@casino@hangout@ped_female@stand@02a@base",
        "base",
        "Standing · Female",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jgabgtaunt"] = {
        "switch@franklin@gang_taunt_p1",
        "gang_taunt_loop_lamar",
        "Gang Taunt",
        AnimationOptions =
        {
            EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["jdj5"] = {
        "mini@strip_club@idles@dj@base",
        "base",
        "DJ 5",
        AnimationOptions = {
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
    -- Other
    ["renegade"] = {
        "custom@renegade",
        "renegade",
        "Renegade",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["savage"] = {
        "custom@savage",
        "savage",
        "Savage",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["sayso"] = {
        "custom@sayso",
        "sayso",
        "Say So",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["tslide"] = {
        "custom@toosie_slide",
        "toosie_slide",
        "Tootsie Slide",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },

    ["defaultdance"] = {
        "custom@dancemoves",
        "dancemoves",
        "Default Dance",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },

    ["discodance"] = {
        "custom@disco_dance",
        "disco_dance",
        "Disco Dance",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },

    ["electroshuffle"] = {
        "custom@electroshuffle_original",
        "electroshuffle_original",
        "Electro Shuffle",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },

    ["electroshuffle2"] = {
        "custom@electroshuffle",
        "electroshuffle",
        "Electro Shuffle 2",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },

    ["hitit"] = {
        "custom@hitit",
        "hitit",
        "Hit It",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },

    ["floss"] = {
        "custom@floss",
        "floss",
        "Floss",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },

    ["orangejustice"] = {
        "custom@orangejustice",
        "orangejustice",
        "Orange Justice",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },

    ["takel"] = {
        "custom@take_l",
        "take_l",
        "Take the L",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },

    ["dab"] = {
        "custom@dab",
        "dab",
        "Dab",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["cantsee"] = {
        "custom@cant_see",
        "cant_see",
        "Can't See",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["sheesh"] = {
        "custom@sheeeeesh",
        "sheeeeesh",
        "Sheesh",
        AnimationOptions =
        {
            EmoteMoving = true,
            EmoteDuration = 8000,
        }
    },
    ["copsearch"] = {
        "custom@police",
        "police",
        "Cop Search",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 8000,
        }
    },
    ["sus"] = {
        "custom@suspect",
        "suspect",
        "Suspect",
        AnimationOptions =
        {
            EmoteMoving = false,
        }
    },
    ["cdig"] = {
        "custom@dig",
        "dig",
        "Custom Dig",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteDuration = 8000,
        }
    },
    ["armswirl"] = {
        "custom@armswirl",
        "armswirl",
        "Arm Swirl",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["woowalk"] = {
        "div@woowalk@test",
        "woowalk",
        "Woo Walk",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["drilldance"] = {
        "div@woowalk@test",
        "drilldance",
        "Drill Dance",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["cripwalk2"] = {
        "div@woowalk@test",
        "cripwalk2",
        "Crip Walk",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["sturdy2"] = {
        "div@woowalk@test",
        "sturdy2",
        "Get Sturdy",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["bloodwalk2"] = {
        "div@woowalk@test",
        "bloodwalk2",
        "Blood Walk",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["blixkytwirl2"] = {
        "div@woowalk@test",
        "blixkytwirl2",
        "Blixky Twirl",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["armwave"] = {
        "custom@armwave",
        "armwave",
        "Arm Wave",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["circlecrunch"] = {
        "custom@circle_crunch",
        "circle_crunch",
        "Circle Crunch",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["whatidk"] = {
        "custom@what_idk",
        "what_idk",
        "What? Don't Know",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["pickfromground"] = {
        "custom@pickfromground",
        "pickfromground",
        "Pick From Ground",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = false,
        }
    },
    ["bellydance"] = {
        "custom@bellydance",
        "bellydance",
        "Belly Dance",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["convulsion"] = {
        "custom@convulsion",
        "convulsion",
        "Convulsion",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["pose1"] = {
        "custom@female_pose_1",
        "female_pose_1",
        "Pose 1",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["pose2"] = {
        "custom@female_pose_2",
        "female_pose_2",
        "Pose 2",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["pose3"] = {
        "custom@female_pose_3",
        "female_pose_3",
        "Pose 3",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["hiphopslide"] = {
        "custom@hiphop_slide",
        "hiphop_slide",
        "HipHop Slide",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["hiphop1"] = {
        "custom@hiphop1",
        "hiphop1",
        "HipHop 1",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["hiphop2"] = {
        "custom@hiphop2",
        "hiphop2",
        "HipHop 2",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["hiphop3"] = {
        "custom@hiphop3",
        "hiphop3",
        "HipHop 3",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = false,
        }
    },
    ["hiphopold"] = {
        "custom@hiphop90s",
        "hiphop90s",
        "HipHop Old",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["pose4"] = {
        "custom@male_pose_1",
        "male_pose_1",
        "Pose 4",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["pose5"] = {
        "custom@male_pose_2",
        "male_pose_2",
        "Pose 5",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["pose6"] = {
        "custom@male_pose_3",
        "male_pose_3",
        "Pose 6",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["pluck"] = {
        "custom@pluck_fruits",
        "pluck_fruits",
        "Pluck Fruits",
        AnimationOptions =
        {
            EmoteMoving = false,
            EmoteLoop = true,
        }
    },
    ["waiter"] = {
        "custom@waiter",
        "waiter",
        "Waiter",
        AnimationOptions =
        {
            EmoteMoving = true,
            EmoteLoop = true,
        }
    },

    ["breakdance"] = {
        "export@breakdance",
        "breakdance",
        "Break Dance",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["gangnamstyle"] = {
        "custom@gangnamstyle",
        "gangnamstyle",
        "Gangnam Style",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["macarena"] = {
        "custom@makarena",
        "makarena",
        "Macarena",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["maraschino"] = {
        "custom@maraschino",
        "maraschino",
        "Maraschino",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },

    -- Custom Dances: Divine
    ["ddance1"] = {
        "divined@dances@new",
        "ddance1",
        "Divined Dance 1",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["ddance2"] = {
        "divined@dances@new",
        "ddance2",
        "Divined Dance 2",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["ddance3"] = {
        "divined@dances@new",
        "ddance3",
        "Divined Dance 3",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["ddance4"] = {
        "divined@dances@new",
        "ddance4",
        "Divined Dance 4",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["ddance5"] = {
        "divined@dances@new",
        "ddance5",
        "Divined Dance 5",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["ddance6"] = {
        "divined@dances@new",
        "ddance6",
        "Divined Dance 6",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["ddance7"] = {
        "divined@dances@new",
        "ddance7",
        "Divined Dance 7",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["ddance8"] = {
        "divined@dances@new",
        "ddance8",
        "Divined Dance 8",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["ddance9"] = {
        "divined@dances@new",
        "ddance9",
        "Divined Dance 9",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["ddance10"] = {
        "divined@dances@new",
        "ddance10",
        "Divined Dance 10",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["ddance11"] = {
        "divined@dances@new",
        "ddance11",
        "Divined Dance 11",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["ddance12"] = {
        "divined@dances@new",
        "ddance12",
        "Divined Dance 12",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["ddance13"] = {
        "divined@dances@new",
        "ddance13",
        "Divined Dance 13",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },

    -- Version Two
    ["divdance1"] = {
        "divined@dancesv2@new",
        "divdance1",
        "Divined Dance 1",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divdance2"] = {
        "divined@dancesv2@new",
        "divdance2",
        "Divined Dance 2",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divdance3"] = {
        "divined@dancesv2@new",
        "divdance3",
        "Divined Dance 3",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divdance4"] = {
        "divined@dancesv2@new",
        "divdance4",
        "Divined Dance 4",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divdance5"] = {
        "divined@dancesv2@new",
        "divdance5",
        "Divined Dance 5",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divdance6"] = {
        "divined@dancesv2@new",
        "divdance6",
        "Divined Dance 6",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divdance7"] = {
        "divined@dancesv2@new",
        "divdance7",
        "Divined Dance 7",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divdance8"] = {
        "divined@dancesv2@new",
        "divdance8",
        "Divined Dance 8",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divdance9"] = {
        "divined@dancesv2@new",
        "divdance9",
        "Divined Dance 9",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divdance10"] = {
        "divined@dancesv2@new",
        "divdance10",
        "Divined Dance 10",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divdance11"] = {
        "divined@dancesv2@new",
        "divdance11",
        "Divined Dance 11",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divdance12"] = {
        "divined@dancesv2@new",
        "divdance12",
        "Divined Dance 12",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divdance13"] = {
        "divined@dancesv2@new",
        "divdance13",
        "Divined Dance 13",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divdance14"] = {
        "divined@dancesv2@new",
        "divdance14",
        "Divined Dance 14",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    -- Divine Breakdance
    ["divbdance1"] = {
        "divined@breakdances@new",
        "divbdance1",
        "Divined Break Dance 1",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divbdance2"] = {
        "divined@breakdances@new",
        "divbdance2",
        "Divined Break Dance 2",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divbdance3"] = {
        "divined@breakdances@new",
        "divbdance3",
        "Divined Break Dance 3",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divbdance4"] = {
        "divined@breakdances@new",
        "divbdance4",
        "Divined Break Dance 4",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divbdance5"] = {
        "divined@breakdances@new",
        "divbdance5",
        "Divined Break Dance 5",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divbdance6"] = {
        "divined@breakdances@new",
        "divbdance6",
        "Divined Break Dance 6",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divbdance7"] = {
        "divined@breakdances@new",
        "divbdance7",
        "Divined Break Dance 7",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divbdance8"] = {
        "divined@breakdances@new",
        "divbdance8",
        "Divined Break Dance 8",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divbdance9"] = {
        "divined@breakdances@new",
        "divbdance9",
        "Divined Break Dance 9",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divbdance10"] = {
        "divined@breakdances@new",
        "divbdance10",
        "Divined Break Dance 10",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divbdance11"] = {
        "divined@breakdances@new",
        "divbdance11",
        "Divined Break Dance 11",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divbdance12"] = {
        "divined@breakdances@new",
        "divbdance12",
        "Divined Break Dance 12",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divbdance13"] = {
        "divined@breakdances@new",
        "divbdance13",
        "Divined Break Dance 13",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divbdance14"] = {
        "divined@breakdances@new",
        "divbdance14",
        "Divined Break Dance 14",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["divbdance15"] = {
        "divined@breakdances@new",
        "divbdance14",
        "Divined Break Dance 15",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },

    -- Divine Breakdance v3
    ["dbrdance1"] = {
        "divined@brdancesv2@new",
        "dbrdance1",
        "Divined Dance 1",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["dbrdance2"] = {
        "divined@brdancesv2@new",
        "dbrdance2",
        "Divined Dance 2",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["dbrdance3"] = {
        "divined@brdancesv2@new",
        "dbrdance3",
        "Divined Dance 3",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["dbrdance4"] = {
        "divined@brdancesv2@new",
        "dbrdance4",
        "Divined Dance 4",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["dbrdance5"] = {
        "divined@brdancesv2@new",
        "dbrdance5",
        "Divined Dance 5",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["dbrdance6"] = {
        "divined@brdancesv2@new",
        "dbrdance6",
        "Divined Dance 6",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["dbrdance7"] = {
        "divined@brdancesv2@new",
        "dbrdance7",
        "Divined Dance 7",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["dbrdance8"] = {
        "divined@brdancesv2@new",
        "dbrdance8",
        "Divined Dance 8",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["dbrdance9"] = {
        "divined@brdancesv2@new",
        "dbrdance9",
        "Divined Dance 9",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["dbrdance10"] = {
        "divined@brdancesv2@new",
        "dbrdance10",
        "Divined Dance 10",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["dbrdance11"] = {
        "divined@brdancesv2@new",
        "dbrdance11",
        "Divined Dance 11",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["dbrdance12"] = {
        "divined@brdancesv2@new",
        "dbrdance12",
        "Divined Dance 12",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },

    -- Divine: Trendy
    ["banddance"] = {
        "divined@tdances@new",
        "dtdance1",
        "Band Dance",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["bopdance"] = {
        "divined@tdances@new",
        "dtdance2",
        "Bop",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["bboydance"] = {
        "divined@tdances@new",
        "dtdance3",
        "BBoy Dance",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["capoeiramove"] = {
        "divined@tdances@new",
        "dtdance4",
        "Capoeira Move",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["hiphopdance"] = {
        "divined@tdances@new",
        "dtdance5",
        "Hip Hop Dance",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["hipsterdance"] = {
        "divined@tdances@new",
        "dtdance6",
        "Hipster Dance",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["hippiedance"] = {
        "divined@tdances@new",
        "dtdance7",
        "Hippie Dance",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["hiphoptaunt"] = {
        "divined@tdances@new",
        "dtdance8",
        "Hip Hop Taunt",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["hilowave"] = {
        "divined@tdances@new",
        "dtdance9",
        "Hi Lo Wave",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["squaredance"] = {
        "divined@tdances@new",
        "dtdance10",
        "Square Dance",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["hotdance"] = {
        "divined@tdances@new",
        "dtdance11",
        "Hot Dance",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["hulahula"] = {
        "divined@tdances@new",
        "dtdance12",
        "Hula-Hula",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["dabloop"] = {
        "divined@tdances@new",
        "dtdance13",
        "Dab Loop",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["kingdance"] = {
        "divined@tdances@new",
        "dtdance14",
        "The King's Dance",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["linedance"] = {
        "divined@tdances@new",
        "dtdance15",
        "Dance Line",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["magicman"] = {
        "divined@tdances@new",
        "dtdance16",
        "Magic Man",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["marat"] = {
        "divined@tdances@new",
        "dtdance17",
        "Marat",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["maskoff"] = {
        "divined@tdances@new",
        "dtdance18",
        "Mask Off",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["mellow"] = {
        "divined@tdances@new",
        "dtdance19",
        "Mellow",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["showroomdance"] = {
        "divined@tdances@new",
        "dtdance20",
        "Showroom Dance",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["windmillfloss"] = {
        "divined@tdances@new",
        "dtdance21",
        "Windmill Floss",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },
    ["woahdance"] = {
        "divined@tdances@new",
        "dtdance22",
        "Woah",
        AnimationOptions =
        {
            EmoteLoop = true,
        }
    },

    ["smokecigar"] = {
        "amb@world_human_aa_smoke@male@idle_a",
        "idle_b",
        "Smoke Cigar",
        AnimationOptions =
        {
            Prop = 'prop_cigar_02',
            PropBone = 28422,
            PropPlacement = { 0.0, 0.0, 0.0, 0.0, 180.0, 0.0 },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },

    ["smokecigar2"] = {
        "amb@world_human_smoking@female@idle_a",
        "idle_b",
        "Smoke Cigar 2",
        AnimationOptions =
        {
            Prop = 'prop_cigar_02',
            PropBone = 28422,
            PropPlacement = { 0.0, 0.0, 0.0, 0.0, 180.0, 0.0 },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },

    ["whiskeybottle"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Whiskey",
        AnimationOptions =
        {
            Prop = 'p_whiskey_notop',
            PropBone = 28422,
            PropPlacement = { 0.01, -0.01, -0.06, 0.0, 0.0, 0.0 },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["vodka"] = {
        "amb@world_human_drinking@coffee@male@idle_a",
        "idle_c",
        "Vodka Bottle",
        AnimationOptions =
        {
            Prop = 'prop_vodka_bottle',
            PropBone = 28422,
            PropPlacement = { 0.01, -0.01, -0.06, 0.0, 0.0, 0.0 },
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["psnow1"] = {
        "psnow1@animations",
        "psnow1clip",
        "Snow Angels 1",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["psnow2"] = {
        "psnow2@animations",
        "psnow2clip",
        "Snow Angels 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["psnow3"] = {
        "psnow3@animations",
        "psnow3clip",
        "Snow Angels 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["psnow4"] = {
        "psnow4@animations",
        "psnow4clip",
        "Snow Crawl 1",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["psnow5"] = {
        "psnow5@animations",
        "psnow5clip",
        "Snow Crawl 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["psnow6"] = {
        "psnow6@animations",
        "psnow6clip",
        "Snow Feel",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["psnow7"] = {
        "psnow7@animations",
        "psnow7clip",
        "Snow Buried 1",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["psnow8"] = {
        "psnow8@animations",
        "psnow8clip",
        "Snow Buried 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["psnow9"] = {
        "psnow9@animations",
        "psnow9clip",
        "Snow Buried 3",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["psnow10"] = {
        "psnow10@animations",
        "psnow10clip",
        "Snow Buried 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    -- ["psnow11"] = {
    --     "psnow11@animations",
    --     "psnow11clip",
    --     "Snow Sliding 1",
    --     AnimationOptions = {
    --         EmoteLoop = true
    --     }
    -- },
    -- ["psnow12"] = {
    --     "psnow12@animations",
    --     "psnow12clip",
    --     "Snow Sliding 2",
    --     AnimationOptions = {
    --         EmoteLoop = true
    --     }
    -- },
    -- ["psnow13"] = {
    --     "psnow13@animations",
    --     "psnow13clip",
    --     "Snow Sliding 3",
    --     AnimationOptions = {
    --         EmoteLoop = true
    --     }
    -- },
    -- ["psnow14"] = {
    --     "psnow14@animations",
    --     "psnow14clip",
    --     "Snow Sliding 4",
    --     AnimationOptions = {
    --         EmoteLoop = true
    --     }
    -- },
    -- ["psnow15"] = {
    --     "psnow15@animations",
    --     "psnow15clip",
    --     "Snow Sliding 5",
    --     AnimationOptions = {
    --         EmoteLoop = true
    --     }
    -- },
    ["psnow7female"] = {
        "psnow7b@animations",
        "psnow7bclip",
        "Snow Buried 1 Female",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["psnow8female"] = {
        "psnow8b@animations",
        "psnow8bclip",
        "Snow Buried 2 Female",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["psnow9female"] = {
        "psnow9b@animations",
        "psnow9bclip",
        "Snow Buried 3 Female",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["psnow10female"] = {
        "psnow10b@animations",
        "psnow10bclip",
        "Snow Buried 4 Female",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["hidef"] = {
        "hidef@animations",
        "hidefclip",
        "Hide Forward",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["hideb"] = {
        "hideb@animations",
        "hidebclip",
        "Hide Backward",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["hider"] = {
        "hider@animations",
        "hiderclip",
        "Hide Right",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["hidel"] = {
        "hidel@animations",
        "hidelclip",
        "Hide Left",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["hidecarf"] = {
        "hidecarf@animations",
        "hidecarfclip",
        "Hide Car Forward",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["hidecarb"] = {
        "hidecarb@animations",
        "hidecarbclip",
        "Hide Car Backward",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["hidecarr"] = {
        "hidecarr@animations",
        "hidecarrclip",
        "Hide Car Right",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["hidecarl"] = {
        "hidecarl@animations",
        "hidecarlclip",
        "Hide Car Left",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["hidepole"] = {
        "hidepole@animations",
        "hidepoleclip",
        "Hide Pole",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["hidepolehigh"] = {
        "hidepolehigh@animations",
        "hidepolehighclip",
        "Hide Pole High",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["hidepolehigh2"] = {
        "hidepolehigh2@animations",
        "hidepolehigh2clip",
        "Hide Pole High 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["hidepoleveryhigh"] = {
        "hidepoleveryhigh@animations",
        "hidepoleveryhighclip",
        "Hide Pole Very High",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["hidepoleveryhigh2"] = {
        "hidepoleveryhigh2@animations",
        "hidepoleveryhigh2clip",
        "Hide Pole Very High 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["bigdawgs"] = {
        "bigdawgs@animations",
        "bigdawgsclip",
        "Big Dawgs",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["cr7siu"] = {
        "cr7siu@animations",
        "cr7siu_clip",
        "Cristiano Ronaldo Siuuu",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["pavehcar1l"] = {
        "pavehcar1l@animations",
        "pavehcar1lclip",
        "Veh Sit-Up Left",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pavehcar1r"] = {
        "pavehcar1r@animations",
        "pavehcar1rclip",
        "Veh Sit-Up Right",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pavehcar2r"] = {
        "pavehcar2r@animations",
        "pavehcar2rclip",
        "Veh Hold On Tight Right",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pavehcar2l"] = {
        "pavehcar2l@animations",
        "pavehcar2lclip",
        "Veh Hold On Tight Left",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pavehcar3r"] = {
        "pavehcar3r@animations",
        "pavehcar3rclip",
        "Veh Sit Relaxs Right",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pavehcar3l"] = {
        "pavehcar3l@animations",
        "pavehcar3lclip",
        "Veh Sit Relaxs Left",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pavehcar4r"] = {
        "pavehcar4r@animations",
        "pavehcar4rclip",
        "Veh Sit and Wave Right",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pavehcar4l"] = {
        "pavehcar4l@animations",
        "pavehcar4lclip",
        "Veh Sit Cool Left",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pavehcar5r"] = {
        "pavehcar5r@animations",
        "pavehcar5rclip",
        "Veh Rock And Roll Right",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pavehcar5l"] = {
        "pavehcar5l@animations",
        "pavehcar5lclip",
        "Veh Rock And Roll Left",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pavehcar6r"] = {
        "pavehcar6r@animations",
        "pavehcar6rclip",
        "Veh Sit Relaxs Roof Right",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pavehcar6l"] = {
        "pavehcar6l@animations",
        "pavehcar6lclip",
        "Veh Sit Relaxs Roof Left",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
	["pavehcar7r"] = {
        "pavehcar7r@animations",
        "pavehcar7rclip",
        "Veh Sit Happy Right",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pavehcar7l"] = {
        "pavehcar7l@animations",
        "pavehcar7lclip",
        "Veh Sit Happy Left",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pavehcar8r"] = {
        "pavehcar8r@animations",
        "pavehcar8rclip",
        "Veh Sleep Right",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pavehcar8l"] = {
        "pavehcar8l@animations",
        "pavehcar8lclip",
        "Veh Sleep Left",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pavehcar9r"] = {
        "pavehcar9r@animations",
        "pavehcar9rclip",
        "Veh Take Video Right",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 28422,
            PropPlacement = {
                0.05,
                0.0100,
                0.060,
                -174.961,
                149.618,
                8.649,
            },
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pavehcar9l"] = {
        "pavehcar9l@animations",
        "pavehcar9lclip",
        "Veh Take Video Left",
        AnimationOptions = {
            Prop = "prop_phone_ing",
            PropBone = 58866,
            PropPlacement = {
                0.07,
                -0.0500,
                0.010,
                -105.33,
                -168.30,
                48.97,
            },
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pavehcar10"] = {
        "pavehcar10@animations",
        "pavehcar10clip",
        "Veh Sit Enjoy Lucia",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pbvehcar1"] = {
        "pbvehcar1@animations",
        "pbvehcar1clip",
        "Veh Sit Here I Am",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pbvehcar2"] = {
        "pbvehcar2@animations",
        "pbvehcar2clip",
        "Veh Sit Enjoy The Wind",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pbvehcar3r"] = {
        "pbvehcar3r@animations",
        "pbvehcar3rclip",
        "Veh Sit Enjoy The Ride Right",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pbvehcar3l"] = {
        "pbvehcar3l@animations",
        "pbvehcar3lclip",
        "Veh Sit Enjoy The Ride Left",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pbvehcar4r"] = {
        "pbvehcar4r@animations",
        "pbvehcar4rclip",
        "Veh Sit Enjoy The Ride 2 Right",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pbvehcar4l"] = {
        "pbvehcar4l@animations",
        "pbvehcar4lclip",
        "Veh Sit Enjoy The Ride 2 Left",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pbvehcar5r"] = {
        "pbvehcar5r@animations",
        "pbvehcar5rclip",
        "Veh Sit Looking The View Right",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pbvehcar5l"] = {
        "pbvehcar5l@animations",
        "pbvehcar5lclip",
        "Veh Sit Looking The View Left",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pbvehcar6r"] = {
        "pbvehcar6r@animations",
        "pbvehcar6rclip",
        "Veh Twerk Right",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pbvehcar6l"] = {
        "pbvehcar6l@animations",
        "pbvehcar6lclip",
        "Veh Twerk Left",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
	["pbvehcar7l"] = {
        "pbvehcar7l@animations",
        "pbvehcar7lclip",
        "Veh Standing At The Driver Left",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pbvehcar8"] = {
        "pbvehcar8@animations",
        "pbvehcar8clip",
        "Veh Sleep On The Roof",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pbvehcar9"] = {
        "pbvehcar9@animations",
        "pbvehcar9clip",
        "Veh Sit Relaxs On The Roof",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pbvehcar10"] = {
        "pbvehcar10@animations",
        "pbvehcar10clip",
        "Veh Relaxs On The Roof",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pcvehcar1"] = {
        "pcvehcar1@animations",
        "pcvehcar1clip",
        "Veh Sit Enjoy On The Roof",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pcvehcar2r"] = {
        "pcvehcar2r@animations",
        "pcvehcar2rclip",
        "Veh Sit Trunk Right",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pcvehcar2l"] = {
        "pcvehcar2l@animations",
        "pcvehcar2lclip",
        "Veh Sit Trunk Left",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pcvehcar3r"] = {
        "pcvehcar3r@animations",
        "pcvehcar3rclip",
        "Veh Sit Trunk Lower Right",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pcvehcar3l"] = {
        "pcvehcar3l@animations",
        "pcvehcar3lclip",
        "Veh Sit Trunk Lower Left",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pcvehcar4r"] = {
        "pcvehcar4r@animations",
        "pcvehcar4rclip",
        "Veh Fly Right",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pcvehcar4l"] = {
        "pcvehcar4l@animations",
        "pcvehcar4lclip",
        "Veh Fly Left",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pcvehcar5"] = {
        "pcvehcar5@animations",
        "pcvehcar5clip",
        "Veh Fly Random",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pcvehcar6"] = {
        "pcvehcar6@animations",
        "pcvehcar6clip",
        "Veh Fly Higher",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pcvehcar7"] = {
        "pcvehcar7@animations",
        "pcvehcar7clip",
        "Veh Motorcycle Hold On Tight",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pcvehcar8"] = {
        "pcvehcar8@animations",
        "pcvehcar8clip",
        "Veh Motorcycle Two Gun",
        AnimationOptions = {
            Prop = 'w_pi_pistol',
            PropBone = 26611,
            PropPlacement = {
                0.07,
                -.01,
                0.01,
                -29.999,
                0.0,
                10.000
            },
            SecondProp = 'w_pi_pistol',
            SecondPropBone = 58867,
            SecondPropPlacement = {
                0.07,
                0.01,
                0.01,
                29.999,
                0.0,
                -10.000
            },
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["pcvehcar9"] = {
        "pcvehcar9@animations",
        "pcvehcar9clip",
        "Veh Motorcycle Sit Facing Back",
        AnimationOptions = {
            EmoteLoop = true,
            EmoteMoving = false,
			FullBody = true
        }
    },
    ["ptrashcana"] = {
        "ptrashcana@animations",
        "ptrashcanaclip",
        "Trash Can Hide A Loop",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 52301,
            PropPlacement = {
                0.08,
                -0.0900,
               -0.10,
                -90,
                0,
                20.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanb"] = {
        "ptrashcanb@animations",
        "ptrashcanbclip",
        "Trash Can Hide A Look & Peek",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 52301,
            PropPlacement = {
                0.06,
                -0.1170,
               -0.090,
                -90,
                0,
                18.00,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanc"] = {
        "ptrashcanc@animations",
        "ptrashcancclip",
        "Trash Can Hide A Peek",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 52301,
            PropPlacement = {
                0.08,
                -0.0900,
               -0.10,
                -90,
                0,
                20.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcand"] = {
        "ptrashcand@animations",
        "ptrashcandclip",
        "Trash Can Stuck Struggle",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 0,
            PropPlacement = {
                -0.02,
                -0.5900,
               0.030,
                -88.000,
                0,
                0,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcane"] = {
        "ptrashcane@animations",
        "ptrashcaneclip",
        "Trash Can Stuck Upside Down",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 39317,
            PropPlacement = {
                0,
                -0.100,
               0.0,
                -90.000,
                0,
                -20,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanf"] = {
        "ptrashcanf@animations",
        "ptrashcanfclip",
        "Trash Can Stuck Flip",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 18905,
            PropPlacement = {
                0.15,
                0.100,
                0.050,
                -9.400,
                -160.280,
                -3.40,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcang"] = {
        "ptrashcang@animations",
        "ptrashcangclip",
        "Trash Can Full Stuck Upside Down",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 18905,
            PropPlacement = {
                0.13,
                0.1100,
                0.050,
                -9.51,
                -162.25,
                -3.0,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanh"] = {
        "ptrashcanh@animations",
        "ptrashcanhclip",
        "Trash Can Hide B Loop",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 0,
            PropPlacement = {
                0.0,
                0.100,
                0.725,
                0.000,
                180,
                0,
            },
            EmoteLoop = true
			
        }
    },
    ["ptrashcani"] = {
        "ptrashcani@animations",
        "ptrashcaniclip",
        "Trash Can Hide B Sneaky",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 0,
            PropPlacement = {
                0.0,
                0.100,
                0.80,
                0.000,
                180,
                0,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanj"] = {
        "ptrashcanj@animations",
        "ptrashcanjclip",
        "Trash Can Hide B Walk",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 0,
            PropPlacement = {
                0.005,
                0.125,
                0.780,
                0.000,
                180,
                0,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcank"] = {
        "ptrashcank@animations",
        "ptrashcankclip",
        "Trash Can Hide B Panic",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 0,
            PropPlacement = {
                0.005,
                0.125,
                0.780,
                0.000,
                180,
                0,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanl"] = {
        "ptrashcanl@animations",
        "ptrashcanlclip",
        "Trash Can Hide B Run For Your Lifeee",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 24817,
            PropPlacement = {
                0.580,
                0.1500,
                0,
                10.000,
                -90,
                0,
            },
            EmoteMoving = true,
            EmoteLoop = true
			
        }
    },
    ["ptrashcanm"] = {
        "ptrashcanm@animations",
        "ptrashcanmclip",
        "Trash Can Dance Happy 1",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 24817,
            PropPlacement = {
                0.70,
                0.175,
                0,
                10.000,
                -90,
                0,
            },
            EmoteLoop = true
			
        }
    },
    ["ptrashcann"] = {
        "ptrashcann@animations",
        "ptrashcannclip",
        "Trash Can Dance Happy 2",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 24817,
            PropPlacement = {
                0.70,
                0.175,
                0,
                10.000,
                -90,
                0,
            },
            EmoteLoop = true
			
        }
    },
    ["ptrashcano"] = {
        "ptrashcano@animations",
        "ptrashcanoclip",
        "Trash Can Dance Happy 3",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 24817,
            PropPlacement = {
                0.70,
                0.175,
                0,
                10.000,
                -90,
                0,
            },
            EmoteLoop = true
			
        }
    },
    ["ptrashcanp"] = {
        "ptrashcanp@animations",
        "ptrashcanpclip",
        "Trash Can Cool Lean",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 52301,
            PropPlacement = {
                0.08,
                -0.0900,
               -0.10,
                -90,
                0,
                20.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanq"] = {
        "ptrashcanq@animations",
        "ptrashcanqclip",
        "Trash Can Jump Slow",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 52301,
            PropPlacement = {
                0.08,
                -0.0900,
               -0.10,
                -90,
                0,
                20.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanr"] = {
        "ptrashcanr@animations",
        "ptrashcanrclip",
        "Trash Can Jump Fast",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 52301,
            PropPlacement = {
                0.08,
                -0.0900,
               -0.10,
                -90,
                0,
                20.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcans"] = {
        "ptrashcans@animations",
        "ptrashcansclip",
        "Trash Can Jump Long",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 52301,
            PropPlacement = {
                0.08,
                -0.0900,
               -0.10,
                -90,
                0,
                20.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcant"] = {
        "ptrashcant@animations",
        "ptrashcantclip",
        "Trash Can Turtle Stuck",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 0,
            PropPlacement = {
                0.0,
                -0.4100,
               -0.340,
                -40,
                0,
                0.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanu"] = {
        "ptrashcanu@animations",
        "ptrashcanuclip",
        "Trash Can Turtle Enjoy",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 0,
            PropPlacement = {
                0.0,
                -0.4100,
               -0.340,
                -40,
                0,
                0.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanv"] = {
        "ptrashcanv@animations",
        "ptrashcanvclip",
        "Trash Can Turtle Walk Struggle",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 0,
            PropPlacement = {
                0.0,
                -0.470,
               -0.390,
                -40,
                0,
                0.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanw"] = {
        "ptrashcanw@animations",
        "ptrashcanwclip",
        "Trash Can Turtle Walk Normal",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 0,
            PropPlacement = {
                0.0,
                -0.400,
               -0.440,
                -35,
                0,
                0.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanx"] = {
        "ptrashcanx@animations",
        "ptrashcanxclip",
        "Trash Can Turtle Walk Panic",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 0,
            PropPlacement = {
                0.0,
                -0.400,
               -0.440,
                -35,
                0,
                0.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcany"] = {
        "ptrashcany@animations",
        "ptrashcanyclip",
        "Trash Can Hide C Look Around",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 0,
            PropPlacement = {
                0.0,
                -0.0600,
               -0.230,
                -35,
                0,
                0.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanz"] = {
        "ptrashcanz@animations",
        "ptrashcanzclip",
        "Trash Can Hide C Loop",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 52301,
            PropPlacement = {
                0.03,
                -0.1300,
                0.02,
                -98,
                0,
                20.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanza"] = {
        "ptrashcanza@animations",
        "ptrashcanzaclip",
        "Trash Can Spin",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 52301,
            PropPlacement = {
                0.03,
                -0.1300,
                0.02,
                -98,
                0,
                20.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanzb"] = {
        "ptrashcanzb@animations",
        "ptrashcanzbclip",
        "Trash Can Spin Fast",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 52301,
            PropPlacement = {
                0.03,
                -0.1300,
                0.02,
                -98,
                0,
                20.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanzc"] = {
        "ptrashcanzc@animations",
        "ptrashcanzcclip",
        "Trash Can Roll Slow",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 0,
            PropPlacement = {
                0.0,
                -0.0600,
               -0.230,
                -35,
                0,
                0.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanzd"] = {
        "ptrashcanzd@animations",
        "ptrashcanzdclip",
        "Trash Can Roll Fast",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 0,
            PropPlacement = {
                0.0,
                -0.0600,
               -0.230,
                -35,
                0,
                0.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanze"] = {
        "ptrashcanze@animations",
        "ptrashcanzeclip",
        "Trash Can Roll Out Of Control",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 0,
            PropPlacement = {
                0.0,
                -0.0600,
               -0.230,
                -35,
                0,
                0.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanzf"] = {
        "ptrashcanzf@animations",
        "ptrashcanzfclip",
        "Trash Can Cool Sit 1",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 0,
            PropPlacement = {
                0.0,
                0.10,
               -0.150,
                164.9,
                0,
                0.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanzg"] = {
        "ptrashcanzg@animations",
        "ptrashcanzgclip",
        "Trash Can Cool Sit 2",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 0,
            PropPlacement = {
                0.0,
                0.10,
               -0.150,
                169.9,
                0,
                0.000,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanzh"] = {
        "ptrashcanzh@animations",
        "ptrashcanzhclip",
        "Trash Can Impossible Pose 1",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 52301,
            PropPlacement = {
                0.120,
                -0.980,
                00,
                -90,
                0,
                -20.000,
            },
            SecondProp = 'prop_recyclebin_03_a',
            SecondPropBone = 64097,
            SecondPropPlacement = {
                0.20,
                -0.20,
                0.000,
              -38.255,
               74.42,
                12.700,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanzi"] = {
        "ptrashcanzi@animations",
        "ptrashcanziclip",
        "Trash Can Impossible Pose 2",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 14201,
            PropPlacement = {
                0.10,
                -0.050,
                0.0,
                90,
                0,
                20,
            },
            SecondProp = 'prop_recyclebin_03_a',
            SecondPropBone = 31086,
            SecondPropPlacement = {
                0.140,
                0.10,
                0.000,
                -90,
                0,
                -40,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanzj"] = {
        "ptrashcanzj@animations",
        "ptrashcanzjclip",
        "Trash Can Impossible Pose 3",
        AnimationOptions = {
            Prop = "prop_recyclebin_03_a",
            PropBone = 52301,
            PropPlacement = {
                0.110,
                -0.050,
                -0.150,
                90,
                0,
                20.000,
            },
            SecondProp = 'prop_recyclebin_03_a',
            SecondPropBone = 24817,
            SecondPropPlacement = {
                0.09,
                -0.10,
                0.000,
                90,
                0,
                5.0,
            },
            EmoteLoop = true
        }
    },
    ["ptrashcanzk"] = {
        "ptrashcanzk@animations",
        "ptrashcanzkclip",
        "Trash Can Carry 1",
        AnimationOptions = {
            Prop = "prop_bin_07d",
            PropBone = 57005,
            PropPlacement = {
                0.090,
                -0.640,
                -0.37,
                -85.076,
                -0.867,
                -0.037,
            },
			EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["ptrashcanzl"] = {
        "ptrashcanzl@animations",
        "ptrashcanzlclip",
        "Trash Can Carry 2",
        AnimationOptions = {
            Prop = "prop_bin_07d",
            PropBone = 57005,
            PropPlacement = {
                -0.17,
                -0.370,
                -0.370,
                -79.372,
                3.616,
                -19.683,
            },
            SecondProp = 'prop_bin_07d',
            SecondPropBone = 18905,
            SecondPropPlacement = {
                -0.15,
                -0.34,
                0.370,
                -100.62,
                -3.616,
                -19.683,
            },
			EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["ptrashcanzm"] = {
        "ptrashcanzm@animations",
        "ptrashcanzmclip",
        "Trash Can Carry Overhead",
        AnimationOptions = {
            Prop = "prop_bin_07d",
            PropBone = 57005,
            PropPlacement = {
                -0.090,
                0.060,
                -0.31,
                0,
                79.999,
                0,
            },
			EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["ptrashcanzn"] = {
        "ptrashcanzn@animations",
        "ptrashcanznclip",
        "Trash Can I Can't See",
        AnimationOptions = {
            Prop = "prop_bin_07d",
            PropBone = 24818,
            PropPlacement = {
                1.04,
                0.10,
                0.0,
                0,
                -90,
                -10,
            },
			EmoteMoving = true,
            EmoteLoop = true
        }
    },
    ["ptrophy"] = {
        "ptrophy@animations",
        "ptrophyclip",
        "Hold Trophy",
        AnimationOptions = {
            Prop = "xs_prop_trophy_cup_01a",
            PropBone = 57005,
            PropPlacement = {
                0.010,
                -0.080,
                -0.1,
                -43.583,
                54.555,
                15.5168,
            },
            EmoteLoop = true
        }
    },
    ["ptrophyrun"] = {
        "ptrophyrun@animations",
        "ptrophyrunclip",
        "Hold Trophy Run",
        AnimationOptions = {
            Prop = "xs_prop_trophy_cup_01a",
            PropBone = 57005,
            PropPlacement = {
                0.010,
                -0.080,
                -0.1,
                -43.583,
                54.555,
                15.5168,
            },
            EmoteLoop = true,
			EmoteMoving = true
        }
    },
    ["jdrill"] = {
        "anim@amb@nightclub_island@dancers@crowddance_single_props@",
        "mi_dance_prop_13_v1_male^3",
        "Drill · Male",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jdrill2"] = {
        "anim@amb@nightclub_island@dancers@crowddance_groups@groupd@",
        "mi_dance_crowd_13_v2_male^1",
        "Drill · Male 2",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jdrill3"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "mi_dance_facedj_17_v2_male^4",
        "Drill · Male 3",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jdrill4"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "mi_dance_facedj_15_v2_male^4",
        "Drill · Male 4",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jdrill5"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "hi_dance_facedj_hu_15_v2_male^5",
        "Drill · Male 5",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jdrill6"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj@",
        "hi_dance_facedj_hu_17_male^5",
        "Drill · Male 6",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jdrill7"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_right_up",
        "Drill · Solo 1",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jdrill8"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "med_center",
        "Drill · Solo 2",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jdrill9"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_right_down",
        "Drill · Solo 3",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jdrill10"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_center",
        "Drill · Solo 4",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jdrill11"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@shuffle@",
        "high_left_down",
        "Drill · Solo 5",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jmonkey1"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@",
        "high_center",
        "Monkey Dance",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jmonkeyd2"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@",
        "high_center_down",
        "Monkey Dance 2",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jmonkeyd3"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@techno_monkey@",
        "med_center_down",
        "Monkey Dance 3",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jrightdown"] = {
        "anim@amb@nightclub@mini@dance@dance_solo@beach_boxing@",
        "med_right_down",
        "Boxing Dance Solo",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jlowdance"] = {
        "anim@amb@casino@mini@dance@dance_solo@female@var_a@",
        "low_center",
        "Low Dance · Female ",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jlowdance2"] = {
        "anim@amb@casino@mini@dance@dance_solo@female@var_a@",
        "high_center",
        "Low Dance · Female",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jhiphop"] = {
        "anim@amb@nightclub@mini@dance@dance_paired@dance_d@",
        "ped_a_dance_idle",
        "Hip Hop Dance",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jhiphop2"] = {
        "anim@amb@nightclub@mini@dance@dance_paired@dance_b@",
        "ped_a_dance_idle",
        "Hip Hop Dance 2",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jhiphop3"] = {
        "anim@amb@nightclub@mini@dance@dance_paired@dance_a@",
        "ped_a_dance_idle",
        "Hip Hop Dance 3",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jdj"] = {
        "anim@mp_player_intcelebrationmale@dj",
        "dj",
        "DJ",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jdj2"] = {
        "anim@scripted@nightclub@dj@dj_moodm@",
        "moodm_cdj_left_a_12",
        "DJ 2",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jdj3"] = {
        "anim@amb@nightclub@djs@switch@dixn_djset_switchover@",
        "dix_end_bg_female1",
        "DJ 3",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    ["jdj4"] = {
        "anim@amb@nightclub_island@dancers@crowddance_facedj_transitions@from_low_intensity",
        "trans_dance_facedj_li_to_mi_11_v1_male^3",
        "DJ 4",
        AnimationOptions =
        {
            EmoteLoop = true
        }
    },
    -- Sample emotes moved from Emotes section for testing
    ["gangsign11"] = {
        "qpacc@gangsign1",
        "gangsign1_clip",
        "Gang Sign 1",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gangsign2"] = {
        "qpacc@gangsign2",
        "gangsign2_clip",
        "Gang Sign 2",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["gangsign3"] = {
        "qpacc@gangsign3",
        "gangsign3_clip",
        "Gang Sign 3",
        AnimationOptions =
        {
            EmoteLoop = true,
            EmoteMoving = true,
        }
    },
    ["zdance1"] = {
        "zdance1@animations",
        "zdance1_clip",
        "ZDance 1",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance2"] = {
        "zdance2@animations",
        "zdance2_clip",
        "ZDance 2",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance3"] = {
        "zdance3@animations",
        "zdance3_clip",
        "ZDance 3",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance4"] = {
        "zdance4@animations",
        "zdance4_clip",
        "ZDance 4",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance5"] = {
        "zdance5@animations",
        "zdance5_clip",
        "ZDance 5",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance6"] = {
        "zdance6@animations",
        "zdance6_clip",
        "ZDance 6",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance7"] = {
        "zdance7@animations",
        "zdance7_clip",
        "ZDance 7",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance8"] = {
        "zdance8@animations",
        "zdance8_clip",
        "ZDance 8",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance9"] = {
        "zdance9@animations",
        "zdance9_clip",
        "ZDance 9",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance10"] = {
        "zdance10@animations",
        "zdance10_clip",
        "ZDance 10",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance11"] = {
        "zdance11@animations",
        "zdance11_clip",
        "ZDance 11",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance12"] = {
        "zdance12@animations",
        "zdance12_clip",
        "ZDance 12",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance13"] = {
        "zdance13@animations",
        "zdance13_clip",
        "ZDance 13",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance14"] = {
        "zdance14@animations",
        "zdance14_clip",
        "ZDance 14",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance15"] = {
        "zdance15@animations",
        "zdance15_clip",
        "ZDance 15",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance16"] = {
        "zdance16@animations",
        "zdance16_clip",
        "ZDance 16",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance17"] = {
        "zdance17@animations",
        "zdance17_clip",
        "ZDance 17",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance18"] = {
        "zdance18@animations",
        "zdance18_clip",
        "ZDance 18",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance19"] = {
        "zdance19@animations",
        "zdance19_clip",
        "ZDance 19",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance20"] = {
        "zdance20@animations",
        "zdance20_clip",
        "ZDance 20",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance21"] = {
        "zdance21@animations",
        "zdance21_clip",
        "ZDance 21",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["zdance22"] = {
        "zdance22@animations",
        "zdance22_clip",
        "ZDance 22",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["waitdance"] = {
        "waitdance@animations",
        "waitdanceclip",
        "Wait Dance Trend",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["terminatordance"] = {
        "terminatordance@animations",
        "terminatordanceclip",
        "Terminator Dance",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["segadance"] = {
        "segadance@animations",
        "segadance_clip",
        "Sega Dance",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["robloxardance"] = {
        "robloxardance@animations",
        "robloxardanceclip",
        "Roblox Ar Dance",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["pubghaidilaodance"] = {
        "pubghaidilaodance@animations",
        "pubghaidilaodance_clip",
        "PUBG Haidilao Dance",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["danceitsmylife"] = {
        "danceitsmylife@animations",
        "danceitsmylife_clip",
        "PUBG It's My Life Dance",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["pubgnastygirl"] = {
        "nastygirl@animations",
        "nastygirlclip",
        "PUBG Nasty Girl",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["ptrompetraka"] = {
        "ptrompetraka@animations",
        "ptrompetrakaclip",
        "PUBG 146 Trompet Raka Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pkdapopstars"] = {
        "pkdapopstars@animations",
        "pkdapopstarsclip",
        "KDA Pop Stars Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["psadbor1"] = {
        "psadbor1@animations",
        "psadbor1clip",
        "Joget Sadbor",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["psadbor2"] = {
        "psadbor2@animations",
        "psadbor2clip",
        "Joget Sadbor Awal",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfriches"] = {
        "pfriches@animations",
        "pfrichesclip",
        "Fortnite Riches",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfdesirable"] = {
        "pfdesirable@animations",
        "pfdesirableclip",
        "Fortnite Desirable",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pftakeitslow"] = {
        "pftakeitslow@animations",
        "pftakeitslowclip",
        "Fortnite Take It Slow",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfthedog"] = {
        "pfthedog@animations",
        "pfthedogclip",
        "Fortnite The Dog",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfsnoopswalk"] = {
        "pfsnoopswalk@animations",
        "pfsnoopswalkclip",
        "Fortnite Snoop's Walk",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfrhythmofchaos"] = {
        "pfrhythmofchaos@animations",
        "pfrhythmofchaosclip",
        "Fortnite Rhythm of Chaos",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfmoongazer"] = {
        "pfmoongazer@animations",
        "pfmoongazerclip",
        "Fortnite Moongazer",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfcaffeinated"] = {
        "pfcaffeinated@animations",
        "pfcaffeinatedclip",
        "Fortnite Caffeinated",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfcaffeinatedold"] = {
        "pfcaffeinatedold@animations",
        "pfcaffeinatedoldclip",
        "Fortnite Caffeinated Old",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfcommitted"] = {
        "pfcommitted@animations",
        "pfcommittedclip",
        "Fortnite Committed",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfdimensional"] = {
        "pfdimensional@animations",
        "pfdimensionalclip",
        "Fortnite Dimensional",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfflytotokyo"] = {
        "pfflytotokyo@animations",
        "pfflytotokyoclip",
        "Fortnite Fly To Tokyo",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfattraction"] = {
        "pfattraction@animations",
        "pfattractionclip",
        "Fortnite Attraction",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfluciddreams"] = {
        "pfluciddreams@animations",
        "pfluciddreamsclip",
        "Fortnite Lucid Dreams",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfskeledance"] = {
        "pfskeledance@animations",
        "pfskeledanceclip",
        "Fortnite Skele Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pftheviper"] = {
        "pftheviper@animations",
        "pftheviperclip",
        "Fortnite The Viper",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfgethot"] = {
        "pfgethot@animations",
        "pfgethotclip",
        "Fortnite Get Hot",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfemptyoutyourpockets"] = {
        "pfemptyoutyourpockets@animations",
        "pfemptyoutyourpocketsclip",
        "Fortnite Empty Out Your Pockets",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfrapmonster"] = {
        "pfrapmonster@animations",
        "pfrapmonsterclip",
        "Fortnite Rap Monster",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfmaskoff"] = {
        "pfmaskoff@animations",
        "pfmaskoffclip",
        "Fortnite Mask Off",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfnuthinbutagthang"] = {
        "pfnuthinbutagthang@animations",
        "pfnuthinbutagthangclip",
        "Fortnite Nuthin' But A G Thang",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfcoffin"] = {
        "pfcoffin@animations",
        "pfcoffinclip",
        "Fortnite Coffin",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfcoffinmove"] = {
        "pfcoffinmove@animations",
        "pfcoffinmoveclip",
        "Fortnite Coffin Move",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfcalifornialove"] = {
        "pfcalifornialove@animations",
        "pfcalifornialoveclip",
        "Fortnite California Love",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfbyebyebye"] = {
        "pfbyebyebye@animations",
        "pfbyebyebyeclip",
        "Fortnite Bye Bye Bye",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfsoarabove"] = {
        "pfsoarabove@animations",
        "pfsoaraboveclip",
        "Fortnite Soar Above",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfalliwantforchristmas"] = {
        "pfalliwantforchristmas@animations",
        "pfalliwantforchristmasclip",
        "Fortnite All I Want For Christmas",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["ptrump"] = {
        "ptrump@animations",
        "ptrumpclip",
        "Trump Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["ptrumpsup"] = {
        "ptrumpsup@animations",
        "ptrumpsupclip",
        "Trump Supporters Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["jktdance"] = {
        "jktdance@animations",
        "jktdance_clip",
        "JKT48 Hisatsu Teleport Dance",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["jktdance2"] = {
        "jktdance2@animations",
        "jktdance2_clip",
        "JKT48 Heavy Rotation Dance",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["jktdance3"] = {
        "jktdance3@animations",
        "jktdance3_clip",
        "JKT48 Fortune Cookie Dance",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["dancepaham"] = {
        "dancepaham@animations",
        "dancepaham_clip",
        "Kak Gem Paham",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["danceshikanoko"] = {
        "danceshikanoko@animations",
        "danceshikanoko_clip",
        "Shikanoko Dance",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["njditto"] = {
        "njditto@animations",
        "njdittoclip",
        "New Jeans Ditto Dance",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["letmeseedance"] = {
        "letmeseedance@animations",
        "letmeseedanceclip",
        "NBA 2K25 Let Me See Dance",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["lolidanceslow"] = {
        "lolidanceslow@animations",
        "lolidanceslow",
        "Loli Dance Slow",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["lolidancefast"] = {
        "lolidancefast@animations",
        "lolidancefast",
        "Loli Dance Fast",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["thickofit"] = {
        "thickofitdance@animations",
        "thickofitdanceclip",
        "Thick Of It 1950s Dance",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["ishowspeeddance"] = {
        "ishowspeedcrispeyspraydance@animations",
        "ishowspeedcrispeyspraydanceclip",
        "IShowSpeed Dance",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["ifyoudance1"] = {
        "ifyoudancep1@animations",
        "ifyoudancep1_clip",
        "If You Dance Player 1",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["ifyoudance2"] = {
        "ifyoudancep2@animations",
        "ifyoudancep2_clip",
        "If You Dance Player 2",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["plingaguliguli"] = {
        "plingaguliguli@animations",
        "plingaguliguliclip",
        "Linga Guli Guli Dance Doodle",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["plumbairibilangbos"] = {
        "plumbairibilangbos@animations",
        "plumbairibilangbosclip",
        "Goyang Lumba Iri Bilang Bos",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["plumbalumbajoget"] = {
        "plumbalumbajoget@animations",
        "plumbalumbajogetclip",
        "Goyang Lumba Lumba Joget",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["ppokedance"] = {
        "ppokedance@animations",
        "ppokedanceclip",
        "Poke Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pkawaikutegomen"] = {
        "pkawaikutegomen@animations",
        "pkawaikutegomenclip",
        "Kawaikute Gomen Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["chipichapa"] = {
        "chipichapa@animations",
        "chipichapaclip",
        "Chipi Chipi Chapa Chapa Dance",
        AnimationOptions = {
            EmoteLoop = true,
        }
    },
    ["pfmikulive"] = {
        "pfmikulive@animations",
        "pfmikuliveclip",
        "Fortnite Miku Live",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pffeelit"] = {
        "pffeelit@animations",
        "pffeelitclip",
        "Fortnite Feel It",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfstartingprance"] = {
        "pfstartingprance@animations",
        "pfstartingpranceclip",
        "Fortnite Starting Prance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfskyward"] = {
        "pfskyward@animations",
        "pfskywardclip",
        "Fortnite Skyward",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfsmoothoperator"] = {
        "pfsmoothoperator@animations",
        "pfsmoothoperatorclip",
        "Fortnite Smooth Operator",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfbratty"] = {
        "pfbratty@animations",
        "pfbrattyclip",
        "Fortnite Bratty",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfinhamood"] = {
        "pfinhamood@animations",
        "pfinhamoodclip",
        "Fortnite In Ha Mood",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfspicystart"] = {
        "pfspicystart@animations",
        "pfspicystartclip",
        "Fortnite Spicy Start",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfdeepexplorer"] = {
        "pfdeepexplorer@animations",
        "pfdeepexplorerclip",
        "Fortnite Deep Explorer",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfwhatyouwant"] = {
        "pfwhatyouwant@animations",
        "pfwhatyouwantclip",
        "Fortnite What You Want",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pflinedancin"] = {
        "pflinedancin@animations",
        "pflinedancinclip",
        "Fortnite Line Dancin",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfindependence"] = {
        "pfindependence@animations",
        "pfindependenceclip",
        "Fortnite Independence",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfcairo"] = {
        "pfcairo@animations",
        "pfcairoclip",
        "Fortnite Cairo",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfokidoki"] = {
        "pfokidoki@animations",
        "pfokidokiclip",
        "Fortnite Oki Doki",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfoutlaw"] = {
        "pfoutlaw@animations",
        "pfoutlawclip",
        "Fortnite Outlaw",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfnotears"] = {
        "pfnotears@animations",
        "pfnotearsclip",
        "Fortnite No Tears",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfmine"] = {
        "pfmine@animations",
        "pfmineclip",
        "Fortnite Mine",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pflookinggood"] = {
        "pflookinggood@animations",
        "pflookinggoodclip",
        "Fortnite Looking Good",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfheelclickbreakdown"] = {
        "pfheelclickbreakdown@animations",
        "pfheelclickbreakdownclip",
        "Fortnite Heel Click Breakdown",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfentranced"] = {
        "pfentranced@animations",
        "pfentrancedclip",
        "Fortnite Entranced",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pffeelitfly"] = {
        "pffeelitfly@animations",
        "pffeelitflyclip",
        "Fortnite Feel It Fly",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["psquidgameround"] = {
        "psquidgameround@animations",
        "psquidgameroundclip",
        "Squid Game Round and Round",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pcatui"] = {
        "pcatui@animations",
        "pcatuiclip",
        "Meme Cat UI Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pcatuai1"] = {
        "pcatuai1@animations",
        "pcatuai1clip",
        "Meme Cat UAI Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pcatuai2"] = {
        "pcatuai2@animations",
        "pcatuai2clip",
        "Meme Cat UAI Dance Fast",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pgaramdanmadu"] = {
        "pgaramdanmadu@animations",
        "pgaramdanmaduclip",
        "Garam Dan Madu Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pratdance"] = {
        "pratdance@animations",
        "pratdanceclip",
        "Rat Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pmeninadojob"] = {
        "pmeninadojob@animations",
        "pmeninadojobclip",
        "PUBG Menina Do Job Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["ponthefloordance"] = {
        "ponthefloordance@animations",
        "ponthefloordanceclip",
        "PUBG On The Floor Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["plangit"] = {
        "pazeeetembaklangit@animations",
        "pazeeetembaklangitclip",
        "Tembak Langit Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pparjamban1"] = {
        "pazeeeparjamban1@animations",
        "pazeeeparjamban1clip",
        "Parjamban Emote",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pparjamban2"] = {
        "pazeeeparjamban2@animations",
        "pazeeeparjamban2clip",
        "Parjamban Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pparjamban3"] = {
        "pazeeeparjamban3@animations",
        "pazeeeparjamban3clip",
        "Parjamban Dance Motorcycle",
        AnimationOptions = {
            EmoteLoop = true,
			FullBody = true
        }
    },
    ["pparjamban4"] = {
        "pazeeeparjamban4@animations",
        "pazeeeparjamban4clip",
        "Parjamban Dance Car",
        AnimationOptions = {
            EmoteLoop = true,
			FullBody = true
        }
    },
    ["pkendrick1"] = {
        "pazeeekendrick1@animations",
        "pazeeekendrick1clip",
        "Kendrick Lamar Dance",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pkendrick2"] = {
        "pazeeekendrick2@animations",
        "pazeeekendrick2clip",
        "Kendrick Lamar Dance Move",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfstarlit"] = {
        "pazeeefortnitestarlit@animations",
        "pazeeefortnitestarlitclip",
        "Fortnite Starlit",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfboneybounce"] = {
        "pazeeefortniteboneybounce@animations",
        "pazeeefortniteboneybounceclip",
        "Fortnite Boney Bounce",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfevilplan"] = {
        "pazeeefortniteevilplan@animations",
        "pazeeefortniteevilplanclip",
        "Fortnite Evil Plan",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfdancindomino"] = {
        "pazeeefortnitedancindomino@animations",
        "pazeeefortnitedancindominoclip",
        "Fortnite Dancin' Domino",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfpointandstrut"] = {
        "pazeeefortnitepointandstrut@animations",
        "pazeeefortnitepointandstrutclip",
        "Fortnite Point And Strut",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfthedancelaroi"] = {
        "pazeeefortnitethedancelaroi@animations",
        "pazeeefortnitethedancelaroiclip",
        "Fortnite The Dance Laroi",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfcopines"] = {
        "pazeeefortnitecopines@animations",
        "pazeeefortnitecopinesclip",
        "Fortnite Copines",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfmikubeam"] = {
        "pazeeefortnitemikubeam@animations",
        "pazeeefortnitemikubeamclip",
        "Fortnite Miku Miku Beam",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfitstrue"] = {
        "pazeeefortniteitstrue@animations",
        "pazeeefortniteitstrueclip",
        "Fortnite It's True",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfimout"] = {
        "pazeeefortniteimout@animations",
        "pazeeefortniteimoutclip",
        "Fortnite I'm Out",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfscenario"] = {
        "pazeeefortnitescenario@animations",
        "pazeeefortnitescenarioclip",
        "Fortnite Scenario",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfjabbaswitchway"] = {
        "pazeeefortnitejabbaswitchway@animations",
        "pazeeefortnitejabbaswitchwayclip",
        "Fortnite Jabba Switchway",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfgomufasa"] = {
        "pazeeefortnitegomufasa@animations",
        "pazeeefortnitegomufasaclip",
        "Fortnite Go Mufasa",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfgomufasamove"] = {
        "pazeeefortnitegomufasamove@animations",
        "pazeeefortnitegomufasamoveclip",
        "Fortnite Go Mufasa Move",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfeverybodylovesme"] = {
        "pazeeefortniteeverybodylovesme@animations",
        "pazeeefortniteeverybodylovesmeclip",
        "Fortnite Everybody Loves Me",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfgetgriddy"] = {
        "pazeeefortnitegetgriddy@animations",
        "pazeeefortnitegetgriddyclip",
        "Fortnite Get Griddy",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfgetgriddymove"] = {
        "pazeeefortnitegetgriddymove@animations",
        "pazeeefortnitegetgriddymoveclip",
        "Fortnite Get Griddy Move",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pflofiheadbang"] = {
        "pazeeefortnitelofiheadbang@animations",
        "pazeeefortnitelofiheadbangclip",
        "Fortnite Lo-Fi Headbang",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfrebellious"] = {
        "pazeeefortniterebellious@animations",
        "pazeeefortniterebelliousclip",
        "Fortnite Rebellious",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfbackon74"] = {
        "pazeeefortnitebackon74@animations",
        "pazeeefortnitebackon74clip",
        "Fortnite Back On 74",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
    ["pfbackon74move"] = {
        "pazeeefortnitebackon74move@animations",
        "pazeeefortnitebackon74moveclip",
        "Fortnite Back On 74 Move",
        AnimationOptions = {
            EmoteLoop = true
        }
    },
}
CustomDP.AnimalEmotes = {}
CustomDP.Exits = {}
CustomDP.Emotes = {}
CustomDP.PropEmotes = {}

-----------------------------------------------------------------------------------------
--| I don't think you should change the code below unless you know what you are doing |--
-----------------------------------------------------------------------------------------

function LoadAddonEmotes()
    local prefixes = {
        Shared = '🤼 ',
        AnimalEmotes = '🐶 ',
        PropEmotes = '📦 ',
        CustomEmotes = '⭐ '
    }

    assert(CustomDP ~= nil, 'Addon emotes can only be loaded once')
    for arrayName, array in pairs(CustomDP) do
        if arrayName == 'CustomEmotes' then
            -- Handle custom emotes separately - they go to their own category
            if not RP.CustomEmotes then
                RP.CustomEmotes = {}
            end
            for emoteName, emoteData in pairs(array) do
                -- Don't add prefix for custom emotes as they already have ⭐ in the menu
                RP.CustomEmotes[emoteName] = emoteData
            end
        elseif RP[arrayName] then
            -- Handle regular categories (but skip Dances and Emotes if they're empty)
            if arrayName == 'Dances' or arrayName == 'Emotes' then
                -- Skip these as they should now be empty (moved to CustomEmotes)
                if next(array) ~= nil then
                    print("Warning: Found emotes in " .. arrayName .. " section. These should be moved to CustomEmotes.")
                end
            else
                local prefix = prefixes[arrayName]
                for emoteName, emoteData in pairs(array) do
                    if prefix then
                        emoteData[3] = prefix .. emoteData[3]
                    end
                    RP[arrayName][emoteName] = emoteData
                end
            end
        end
    end
    -- Free memory
    CustomDP = nil
end
