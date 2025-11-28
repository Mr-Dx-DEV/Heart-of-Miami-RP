# Debug Guide - Order Authorization Issue

## Issue
When employees try to update order status, they get "Not Authorized" error.

## Debug Steps

### 1. Restart the Resource
```
ensure VL-Businesses
```

### 2. Test the Order Flow

**As a Customer:**
1. Go to the ordering station at BurgerShot
2. Place an order (any item)
3. **Check server console** - You should see:
   ```
   [Order Created Debug] Business stored as: burgershot
   ```

**As an Employee:**
1. Make sure you have the job "burgershot"
2. **Clock in** using the duty zone (IMPORTANT!)
3. Go to the management laptop
4. Try to update an order status
5. **Check server console** - You should see:
   ```
   [Order Update Debug] Player Job: burgershot | Order Business: burgershot | On Duty: true
   ```

### 3. What to Check

#### If you see "Player Job: burgershot | Order Business: burgershot | On Duty: false"
**Problem:** You're not clocked in!
**Solution:** Go to the duty zone and clock in.

#### If you see "Player Job: police | Order Business: burgershot | On Duty: true"
**Problem:** Your job is not "burgershot"
**Solution:** Set your job correctly using `/setjob [id] burgershot [grade]`

#### If you see "Player Job: burgershot | Order Business: burgershot | On Duty: true"
**Problem:** Something else is wrong
**Solution:** The authorization should work. Check if there are any other errors in the console.

### 4. Common Issues

**Issue:** "Order not found"
- Orders are stored in memory (not database)
- Orders are cleared when the resource restarts
- Make sure to place a new order after restarting

**Issue:** Job name mismatch
- Make sure the job in the database matches "burgershot"
- Check with: `SELECT * FROM players WHERE citizenid = 'your_citizenid'`
- Look at the `job` field in the JSON data

**Issue:** Not on duty
- Use the duty zone to clock in
- Or use: `/duty` command if available
- Check duty status with: `print(QBCore.Functions.GetPlayerData().job.onduty)`

### 5. Manual Testing Commands

Run these in F8 console to debug:

```lua
-- Check your current job
local PlayerData = exports['qb-core']:GetCoreObject().Functions.GetPlayerData()
print("Job: " .. PlayerData.job.name)
print("On Duty: " .. tostring(PlayerData.job.onduty))

-- Force on duty (if needed for testing)
TriggerServerEvent("QBCore:ToggleDuty")
```

### 6. Check Business Config

Verify in `businesses/burgershot.lua`:
```lua
Businesses["burgershot"] = {  -- This key becomes the business name
    job = "burgershot",        -- This must match your player job
    ...
}
```

The key `"burgershot"` must match the `job` field!

### 7. Advanced Debug

If nothing works, add this to `server/sv_ordering.lua` at line 120:

```lua
print("=== FULL DEBUG ===")
print("Player Source:", source)
print("Player Name:", Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname)
print("Player Job Name:", Player.PlayerData.job.name)
print("Player Job Label:", Player.PlayerData.job.label)
print("Player Job On Duty:", tostring(Player.PlayerData.job.onduty))
print("Order ID:", orderId)
print("Order Business:", order.business)
print("Match:", Player.PlayerData.job.name == order.business)
print("=================")
```

## Quick Fix Checklist

- [ ] Resource restarted after code changes
- [ ] Player has correct job ("burgershot")
- [ ] Player is clocked in (on duty)
- [ ] Order was placed AFTER resource restart
- [ ] Config has matching key and job name
- [ ] No typos in business/job names

## Still Not Working?

Share the **exact output** from the server console when you try to update an order, including:
1. The `[Order Created Debug]` line
2. The `[Order Update Debug]` line
3. Any error messages

This will help identify the exact mismatch!
