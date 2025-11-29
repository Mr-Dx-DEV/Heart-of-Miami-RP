Logs = Logs or {}

Logs = {
    Enable = false, -- Enable or disable the logs system.
    Service = "discord", -- Choose the logging service: "discord" or "fivemerr" or "fivemanage" or "custom" and edit opensource/server/server.lua

    -- API Keys
    APIKey = "", -- Your discord webhook url or Fivemerr/Fivemanage API key.




    --------------------------------------------------------------------------------------------------------------
    --- IF YOU DONT USE FIVEMANAGE, OR YOU DONT KNOW WHAT YOU ARE DOING, LEAVE THE SETTINGS BELOW AS THEY ARE. ---
    --------------------------------------------------------------------------------------------------------------
    
    -- Fivemanage Settings
    FivemanageDataset = "default", -- The dataset you want to use for Fivemanage.
}