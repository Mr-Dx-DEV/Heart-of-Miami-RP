Config = {}
Config.Framework = {
    ["Framework"] = "qbcore", -- esx, qbcore or qbox
    ["ResourceName"] = "qb-core", -- es_extended or qb-core or your resource name. If you using qbx you should write qb-core
    ["NewCore"] = true, -- If you use the new core, set this to true ( esx or qb ). If you are using the old one, make it false and edit the event below according to yourself.
    ["SharedEvent"] = "esx:getSharedObject" -- Event name for old cores.
}

Config.Studios = {
    ["green_studio"] = {
        ["debug"] = false,
        ["forall"] = false,
        ["blips"] = {
            ["coords"] = vec3(-993.21, -69.50, -99.00),
            ["sprite"] = 136,
            ["color"] = 18,
            ["scale"] = 0.8,
            ["label"] = "Green Studio",
            ["show"] = true
        },
        ["zones"] = {
            ["studio"] = {
                ["height"] = 10.0,
                ["polyzones"] = {
                    vec(-1005.21, -62.59, -99.00),
                    vec(-1007.00, -65.55, -99.00),
                    vec(-1006.45, -68.90, -99.00),
                    vec(-1005.07, -70.23, -99.00),
                    vec(-1002.70, -70.69, -99.00),
                    vec(-997.05, -72.68, -99.00),
                    vec(-995.83, -76.67, -99.00),
                    vec(-989.00, -78.50, -99.00),
                    vec(-982.29, -77.39, -99.00),
                    vec(-980.59, -76.15, -99.00),
                    vec(-977.85, -71.64, -99.00),
                    vec(-978.03, -68.78, -99.00),
                    vec(-985.45, -64.90, -99.00),
                    vec(-986.33, -62.95, -99.00),
                    vec(-986.48, -61.35, -99.00),
                    vec(-997.01, -55.07, -99.00),
                    vec(-997.01, -57.84, -99.00),
                    vec(-1001.21, -58.53, -99.00),
                    vec(-1003.59, -59.70, -99.00),
                }
            },
            ["computer"] = {
                ["radius"] = 1.5,
                ["coords"] = vec3(-996.17, -68.56, -98.80),
                ["max_vol_distance"] = 100.0, -- The maximum distance the player can be from the computer. Since this distance is used in a calculation, it plays an important role in things like increasing or decreasing the volume.
            },
            ["microphone"] = {
                ["radius"] = 0.5,
                ["coords"] = vec3(-979.82, -69.68, -98.60),
            },
            ["television"] = {
                ["model"] = "prop_tv_flat_michael",
                ["create"] = true,
                ["coords"] = vector3(-994.681335, -68.940659, -98.559692),
                ["rotation"] = vector3(0.0, 0.0, -120.0),
                ["distance"] = 1.0
            }
        },
    }
}

Config.Languages = {
    ["open_computer"] = "Open Computer",
    ["nui_not_ready"] = "NUI is not ready yet. Please wait a few seconds.",
    ["take_record"] = "Take/Stop record",
    ["unauthorized"] = "Unauthorized access request.",

    ["studio_not_found"] = {
        ["time"] = 5000,
        ["type"] = "error",
        ["text"] = "No studios found for processing",
    },
    ["file_deleted"] = {
        ["time"] = 5000,
        ["type"] = "success",
        ["text"] = "File deleted successfully.",
    },
    ["computer_busy"] = {
        ["time"] = 5000,
        ["type"] = "error",
        ["text"] = "Computer is busy.",
    },
    ["microhpone_busy"] = {
        ["time"] = 5000,
        ["type"] = "error",
        ["text"] = "Microphone is busy.",
    },
    ["microphone_empty"] = {
        ["time"] = 5000,
        ["type"] = "error",
        ["text"] = "Microphone is empty.",
    },
    ["recording_started"] = {
        ["time"] = 5000,
        ["type"] = "success",
        ["text"] = "Voice recording started!",
    },
    ["recording_stopped_with_upload"] = {
        ["time"] = 10 * 1000,
        ["type"] = "success",
        ["text"] = "Audio recording stopped. It will be available after a while!",
    },
    ["recording_stopped"] = {
        ["time"] = 10 * 1000,
        ["type"] = "success",
        ["text"] = "Microphone recording is over. The sound will not be recorded because the record button was not pressed",
    },
    ["wrong_place"] = {
        ["time"] = 5000,
        ["type"] = "error",
        ["text"] = "You're not in the studio area.",
    },
    ["went_wrong"] = {
        ["time"] = 5000,
        ["type"] = "error",
        ["text"] = "Something went wrong",
    },
    ["went_wrong_delete"] = {
        ["time"] = 5000,
        ["type"] = "error",
        ["text"] = "There was a problem deleting the file",
    },
    ["went_wrong_rename"] = {
        ["time"] = 5000,
        ["type"] = "error",
        ["text"] = "An error occurred while changing the file name.",
    },
    ["file_renamed"] = {
        ["time"] = 5000,
        ["type"] = "success",
        ["text"] = "File name changed successfully.",
    },
    ["sound_played"] = {
        ["time"] = 5000,
        ["type"] = "success",
        ["text"] = "The song is heard in the studio.",
    },
    ["stream_auth_not_found"] = {
        ["time"] = 10 * 1000,
        ["type"] = "error",
        ["text"] = "Attempted to access a stream, but things like the stream key are missing or incorrect.",
    },
    ["multitrack_share_started"] = {
        ["time"] = 5000,
        ["type"] = "success",
        ["text"] = "The studio sound has been broadcast.",
    },
    ["multitrack_share_stopped"] = {
        ["time"] = 5000,
        ["type"] = "success",
        ["text"] = "Studio sounds are no longer broadcast.",
    },
    ["record_uploading_wait"] = {
        ["time"] = 5000,
        ["type"] = "inform",
        ["text"] = "A recording is being uploaded to the computer, please wait a moment."
    },
    ["on_mic"] = {
        ["time"] = 5000,
        ["type"] = "success",
        ["text"] = "You're on the microphone.",
    },
    ["out_mic"] = {
        ["time"] = 5000,
        ["type"] = "inform",
        ["text"] = "You have left the microphone.",
    },
    ["computer_not_ready"] = {
        ["time"] = 5000,
        ["type"] = "inform",
        ["text"] = "The computer is not yet ready for use.",
    }
}

Config.Notification = GetResourceState("es_extended") == "started" and "esx" or GetResourceState("qb-core") == "started" and "qbcore" or GetResourceState("okokNotify") == "started" and "okokNotify" or false
Config.SendNotify = function(title, formatVal)
    local n = formatVal ~= nil and {text = Config.Languages[title].text:format(formatVal),type = Config.Languages[title].type} or Config.Languages[title]
    if n == nil then return print(("^1[ERROR] ^7Notification with the name ^1%s ^7could not be found."):format(title)) end
    Config.SendNotification(n.text, n.type, n.time)
end

Config.LaptopNotification = function(message)
    Config.SendNotification(message, "inform", 5000)
end

Config.SendNotification = function(text, type, time)
    if Config.Notification == "qbcore" then
        TriggerEvent('QBCore:Notify', text, type, time)
    elseif Config.Notification == "esx" then
        TriggerEvent('esx:showNotification', text)
        lib.notify({
            title = "Studio",
            type = type,
            duration = time,
            description = text,
            iconAnimation = "spin"
        })
    elseif Config.Notification == "okokNotify" then
        exports['okokNotify']:Alert('Studio', text, time, type, true)
    elseif Config.Framework.Framework == "qbox" then
        lib.notify({
            title = "Studio",
            type = type,
            duration = time,
            description = text,
            iconAnimation = "spin"
        })
    end
end

Config.Debug = function(...)
    print(...)
end