function BeginLockPickMiniGame(vehicle, advanced)
    R14EvidenceEvents(vehicle, "hotwiring")
    
    -- Randomly select a bl-ui minigame
    local blMinigames = {"progress", "keyspam", "circle"}
    local randomGame = blMinigames[math.random(#blMinigames)]
    
    if randomGame == "progress" then
        local success = exports.bl_ui:Progress(3, 50)
        return success
    elseif randomGame == "keyspam" then
        local success = exports.bl_ui:KeySpam(3, 50)
        return success
    elseif randomGame == "circle" then
        local success = exports.bl_ui:CircleProgress(3, 50)
        return success
    end
end

function BeginHotWireMiniGame(vehicle)
    if HijackImmune(vehicle) then return NotifyPlayer(locale("LockPick.VehicleIsHijackImmune"), "error") end
    R14EvidenceEvents(vehicle, "hotwiring")
    
    -- Randomly select a bl-ui minigame
    local blMinigames = {"progress", "keyspam", "circle"}
    local randomGame = blMinigames[math.random(#blMinigames)]
    
    if randomGame == "progress" then
        local success = exports.bl_ui:Progress(3, 50)
        return success
    elseif randomGame == "keyspam" then
        local success = exports.bl_ui:KeySpam(3, 50)
        return success
    elseif randomGame == "circle" then
        local success = exports.bl_ui:CircleProgress(3, 50)
        return success
    end
end

--[[

-- These are some example minigames, you can swap with the above

-------------------BaguscodeStudio-----------------
--https://github.com/baguscodestudio/lockpick
---
---
----------------------PS-UI MINIGAMES----------------------
---https://github.com/Project-Sloth/ps-ui
---
---
----------------------Byte-Labs--------------------------------
---https://github.com/Byte-Labs-Studio/bl_ui
---
---
----------------------T3Development--------------------------
--https://github.com/T3development/t3_lockpick

--]]