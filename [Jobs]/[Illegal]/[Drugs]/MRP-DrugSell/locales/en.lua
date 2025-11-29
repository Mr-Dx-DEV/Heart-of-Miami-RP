-- GM_DrugSell Localization (English)
-- All player-facing messages and notifications

local Locale = {}

-- ============================================================================
-- DEALER MENU
-- ============================================================================
Locale.DealerGreeting = "Hey, looking to make some money?"
Locale.MenuBulkSell = "Bulk Sell"
Locale.MenuSingleSell = "Single Sell"

-- ============================================================================
-- BULK SELLING
-- ============================================================================
Locale.BulkSellStarted = "You accepted a bulk job. Head to %s"
Locale.BulkJobAssigned = "Bulk Job Assigned\nLocation: %s\nItems: %d x %s\nTime: %d min"
Locale.BulkNoJobsAvailable = "No jobs available right now. Try again later."
Locale.BulkJobOnCooldown = "Dealer is busy. Come back in %d seconds."
Locale.BulkAlreadyHasJob = "You already have an active job!"
Locale.BulkNotEnoughItems = "You don't have the required items!"
Locale.BulkReachedLocation = "You've reached the location. Wait for the dealer."
Locale.BulkTimeExpired = "You took too long! Job failed."
Locale.BulkJobFailed = "Bulk job failed!"
Locale.BulkJobSuccess = "Bulk job complete! +$%d"
Locale.BulkNPCHostile = "The dealer turned hostile!"
Locale.BulkNPCStole = "The dealer stole your items!"
Locale.BulkPlayerKilled = "You were killed. Items stolen."

-- ============================================================================
-- SINGLE SELLING
-- ============================================================================
Locale.SingleSellJobAssigned = "Single Sale\nItem: %d x %s\nTime: %d min"
Locale.SingleSellOnCooldown = "Dealer is busy. Come back in %d seconds."
Locale.SingleSellTimeExpired = "You took too long! Sale failed."
Locale.SingleSellFailed = "Single sale failed!"
Locale.SingleSellSuccess = "Sale complete! +$%d"

-- ============================================================================
-- ERRORS & VALIDATION
-- ============================================================================
Locale.ErrorRateLimited = "Wait before trying again!"

-- ============================================================================
-- HELPER FUNCTION
-- ============================================================================
function GetLocale(key, ...)
    local message = Locale[key] or key
    if select('#', ...) > 0 then
        return string.format(message, ...)
    end
    return message
end

-- Export for use in other scripts
exports('GetLocale', GetLocale)

return Locale

