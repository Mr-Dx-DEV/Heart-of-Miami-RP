# EF MultiJob System

## Overview
EF MultiJob is a comprehensive job management system for FiveM QBCore/QBox servers that allows players to hold and switch between multiple jobs. It provides an intuitive UI for job management, duty tracking, and boss menu functionality.

## Features

### Multiple Job Management
- Players can hold multiple jobs simultaneously
- Easy job switching with a simple UI interface
- VIP tier-based job limits
- Job cooldown system to prevent rapid switching
- Keep track of all jobs and their respective grades

### Duty System
- On/off duty functionality for supported jobs
- Automatic duty time tracking for employees
- Persistent storage of duty time data

### Boss Menu
- Hire new employees directly in-game
- Fire existing employees from your organization
- View all employees and their duty time statistics
- Management functions restricted to job bosses

### VIP Integration
- Discord role-based VIP tiers
- Different job limits based on VIP level
- Configurable tier permissions

### Debug System
- Configurable debug mode through config.lua
- Centralized debug printing utility
- Standardized log format with level prefixes
- Debug prints only appear when debug mode is enabled
- Support for different log levels (debug, info, warn, error)
- Helps with troubleshooting and development

## Configuration Options

### Duty-Enabled Jobs
Configure which jobs can toggle on/off duty status:
```
dutyEnabledJobs = {
    ["police"] = true,
    ["ambulance"] = true,
}
```

### Debug Settings
Configure debug mode:
```
-- Enable or disable debug messages
debug = true, -- Set to false in production
```

### VIP System
Configure VIP tiers and their corresponding max job limits:
```
vip = {
    roles = {
        member = "1347445310674178113",
        silver = "1347445310766452803", 
        gold = "1347445310766452805",
        platinum = "1347445310766452806",
        diamond = "1347445310766452807"
    },
    maxJobs = {
        member = 1, 
        silver = 2, 
        gold = 3,   
        platinum = 4, 
        diamond = 5   
    }
}
```

### Job Switching
Configure job switching settings:
```
jobSwitch = {
    cooldown = 300, -- Cooldown in seconds
    bypassCooldownRoles = {"1347445310871437340"}, -- Discord roles that bypass cooldown
    disabledJobs = {}, -- Jobs that cannot be selected
}
```

### Boss Menu
Configure boss menu functionality:
```
bossMenu = {
    maxDistance = 10.0, -- Maximum distance to detect nearby players for hiring
    disabledHiring = {}, -- Jobs that cannot hire players
}
```

## Debug Print Usage
The script uses a custom debug utility for logging with standardized prefixes:

- **DEBUG**: Only shows when `config.debug = true`
- **INFO**: Always visible, used for general information 
- **WARN**: Always visible, used for warnings
- **ERROR**: Always visible, used for error messages

Import and use the debug utility as follows:
```lua
local Debug = require('utils/debug')

-- Debug level message (only when debug=true)
Debug.debug('Started duty tracking for ' .. key)

-- Info level message (always shown)
Debug.info('Player switched jobs')

-- Warning level message (always shown)
Debug.warn('Invalid data provided')

-- Error level message (always shown)
Debug.error('Job not found, removing: ' .. job)
```

## Technical Components

### Client-Side
- Job UI management
- Interaction with server for job switching
- Boss menu interface
- Keybind support for toggling job menu (default: J)

### Server-Side
- Job validation and management
- VIP tier checking via Discord integration
- Duty time tracking and persistence
- Boss menu functionality (hiring/firing)

### Web UI
- React-based user interface
- Job selection, management and duty toggling
- Boss menu for employee management

## Dependencies
- QBX Core / QB Core
- ox_lib
- zdiscord (for VIP role checking)

## Commands
- `/toggleJobMenu` - Opens/closes the job management UI (default keybind: J)

## Installation
1. Place the resource in your server's resources folder
2. Ensure the dependencies are installed and working
3. Add `ensure ef_multijob` to your server.cfg
4. Configure the settings in config.lua to match your server setup

## Developer Information
This resource uses a combination of server-side Lua for job management and validation, client-side Lua for UI interaction, and a web-based UI for the frontend. All duty time data is stored in the `/data/duty_time.json` file and is automatically managed by the script. 