local Config = require('config')

--- Debug print function that only prints when debug mode is enabled
--- @param message string The message to print
--- @param level string The log level (debug, info, warn, error)
local function debugPrint(message, level)
    -- Skip all debug messages if debug mode is disabled
    if not Config.debug then
        return
    end
    
    -- Create a prefix with the log level
    local prefix = string.upper(level) .. ": "
    
    -- Standard print with prefix
    print(prefix .. message)
end

return {
    debug = function(message)
        debugPrint(message, 'debug')
    end,
    
    info = function(message)
        debugPrint(message, 'info')
    end,
    
    warn = function(message)
        debugPrint(message, 'warn')
    end,
    
    error = function(message)
        debugPrint(message, 'error')
    end
} 