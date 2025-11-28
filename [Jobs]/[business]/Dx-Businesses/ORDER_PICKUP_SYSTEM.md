# 📦 Order Pickup System - Documentation

## Overview
The order system has been updated to be more realistic and immersive. Instead of automatically giving items to customers, employees must:
1. **Have the item** in their inventory
2. **Place it** in the pickup tray
3. **Customer collects** from the pickup counter

## 🔄 How It Works

### Customer Side

#### 1. Place Order
- Go to the ordering station NPC
- Browse menu and select items
- Confirm order and pay

#### 2. Wait for Preparation
You'll receive notifications:
- **⏳ Order Placed** - Order received by staff
- **👨‍🍳 Preparing** - Staff is making your order
- **🎉 Order Ready** - Your order is ready for pickup!

#### 3. Collect Order
When you see "Order Ready" notification:
1. Go to the **Order Pickup Counter**
2. Look for the box zone (shopping bag icon)
3. Press the interaction key to **Collect Order**
4. Open the tray inventory
5. Take your items

### Employee Side

#### 1. Receive Order
- You'll get a notification when a new order arrives
- Sound alert plays

#### 2. View Orders (Laptop)
- Go to any management laptop
- Press `E` to open
- Select "View Active Orders"
- See all pending orders

#### 3. Prepare Order
1. **Mark as Preparing** - Let customer know you're working on it
2. **Craft/Cook the item** - Use crafting stations to make the food
3. **Ensure item is in YOUR inventory** - Very important!

#### 4. Complete Order
1. Click on the order in laptop
2. Select **"Complete & Place in Pickup"**
3. System checks:
   - ✅ Do you have the item?
   - ✅ Correct quantity?
   - ✅ Is pickup tray full?

4. If successful:
   - Item removed from YOUR inventory
   - Item placed in pickup tray
   - Customer gets notification
   - Order marked as "Ready"

5. If failed:
   - ❌ **Missing Items**: "You need 2x Burger to complete this order. You only have 0."
   - ❌ **Tray Full**: "Pickup tray is full. Items returned to your inventory."

## 🎯 Configuration

### Adding Pickup Tray to Business

In your business config file (e.g., `businesses/burgershot.lua`):

```lua
-- 📦 Order Pickup Tray (for customer orders)
pickupTray = {
    enabled = true,
    id = "burgershot_pickup",              -- Must match business name + "_pickup"
    label = "Order Pickup Counter",
    slots = '50',                          -- Number of inventory slots
    weight = '100000',                     -- Weight limit (100kg = 100000g)
    coords = { vector3(x, y, z) },        -- Location of pickup counter
    size = vec3(1.5, 0.8, 0.5),           -- Size of interaction box
    rotation = 0,                          -- Rotation angle
    icon = 'fa-solid fa-bag-shopping',     -- Icon shown
},
```

### Important Notes

1. **ID Format**: The `id` field MUST be `businessname_pickup`
   - For "burgershot" → `burgershot_pickup`
   - For "catcafe" → `catcafe_pickup`

2. **Coordinates**: Place the pickup counter where customers can easily access it
   - Usually near the front counter
   - Away from employee-only areas

3. **Capacity**:
   - `slots = '50'` - Can hold 50 different item stacks
   - `weight = '100000'` - 100kg total weight

## 📋 Workflow Example

### Complete Order Flow

**Customer "John Doe" orders 2x Burgers:**

1. **Customer**: Places order at ordering station
   - Pays $300
   - Gets notification: "Order placed!"

2. **Employee "Jane"**: Receives notification
   - Opens laptop
   - Sees: "Order #1001 - John Doe - 2x Burger"
   - Clicks "Mark as Preparing"

3. **Customer**: Gets update
   - "Your order of Burger is being prepared!"

4. **Employee**: Makes the burgers
   - Goes to Grill Station
   - Crafts 2x Burger
   - Burgers go to Jane's inventory

5. **Employee**: Completes order
   - Opens laptop
   - Clicks "Complete & Place in Pickup"
   - System checks: ✅ Jane has 2x Burger
   - 2x Burger removed from Jane's inventory
   - 2x Burger added to pickup tray

6. **Customer**: Gets notification
   - "🎉 Order Ready!"
   - "Your order of Burger is ready for pickup at the counter!"
   - Sound plays

7. **Customer**: Collects order
   - Goes to pickup counter
   - Opens pickup tray
   - Takes 2x Burger

## 🔧 Troubleshooting

### "Missing Items" Error

**Error**: "You need 2x Burger to complete this order. You only have 0."

**Solutions**:
1. Craft/cook the items first
2. Make sure items are in YOUR inventory (not stash/tray)
3. Check you have the EXACT quantity needed

### "Pickup tray is full"

**Error**: "Pickup tray is full. Items returned to your inventory."

**Solutions**:
1. Tell customers to collect their orders
2. Clean old items from pickup tray
3. Increase tray capacity in config:
   ```lua
   slots = '100',  -- Increase slots
   weight = '200000',  -- Increase weight
   ```

### "Not Authorized" Error

See `DEBUG_ORDERS.md` for authorization troubleshooting.

### Orders Not Showing in Laptop

**Fixes**:
1. Make sure you're clocked in
2. Restart resource after config changes
3. Place NEW order after restart (orders are in memory)
4. Check server console for errors

### Customer Can't Find Pickup Tray

**Fixes**:
1. Check coordinates are correct in config
2. Make sure `enabled = true`
3. Look for the shopping bag icon
4. Stand close to the counter

## 💡 Tips & Best Practices

### For Employees

1. **Prepare Ahead**: Craft popular items in advance
2. **Check Orders Regularly**: Open laptop frequently
3. **Communicate**: Use /me or chat to tell customers their order is ready
4. **Keep Tray Clean**: Remove old unclaimed items periodically

### For Server Owners

1. **Place Pickup Tray Strategically**:
   - Visible from ordering station
   - Easy customer access
   - Close to but separate from employee trays

2. **Adjust Capacity Based on Traffic**:
   - Low traffic: 30 slots, 50kg
   - Medium traffic: 50 slots, 100kg
   - High traffic: 100 slots, 200kg

3. **Train Employees**:
   - Show them the workflow
   - Explain they need items in inventory
   - Demonstrate laptop usage

## 🆕 New Features Summary

### What Changed?

**Before**:
- Click button → Item magically appears in customer inventory
- No item requirement for employees
- Unrealistic instant delivery

**After**:
- Employee must craft item first ✅
- Item checked in employee inventory ✅
- Item removed from employee ✅
- Item placed in physical pickup tray ✅
- Customer collects manually ✅
- More realistic and immersive ✅

### Benefits

1. **Realism**: Employees actually handle food
2. **Inventory Management**: Encourages proper workflow
3. **Player Interaction**: Customers and employees interact more
4. **Resource Economy**: Items have real value and movement
5. **RP Quality**: Better roleplay scenarios

## 🔮 Future Enhancements

Possible additions:
- Order expiration (auto-cancel after 30 min)
- Tip system for employees
- Order receipt items
- Phone notifications via app
- Drive-thru pickup system
- Priority/express orders

---

**Questions or Issues?**
Check the main documentation in `NEW_FEATURES.md` or `DEBUG_ORDERS.md`
