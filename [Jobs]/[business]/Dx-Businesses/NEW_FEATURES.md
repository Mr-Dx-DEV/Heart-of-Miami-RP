# VL-Businesses - New Features Guide

## Overview
This business system now includes three powerful new features:
- 🌟 **Customer Rating System**
- 📋 **Customer Ordering Menu**
- 💻 **Business Management Laptop**

---

## 🌟 Customer Rating System

### Description
Allows customers to rate businesses and leave reviews. Business owners can view ratings through the management laptop.

### Configuration
Add to your business config file (e.g., `businesses/burgershot.lua`):

```lua
ratingStation = {
    enabled = true,
    coords = vector4(-1182.89, -885.36, 13.79, 300.0), -- x, y, z, heading
    ped = 'a_f_y_business_01', -- Ped model for the rating station
}
```

### Features
- **Submit Ratings**: Customers can rate businesses from 1-5 stars
- **Leave Comments**: Optional text feedback for each rating
- **View Ratings**: See average rating and recent reviews
- **Real-time Updates**: Ratings update immediately for management

### Usage
1. Walk up to the rating station NPC
2. Select "Submit Rating" to leave a review
3. Select "View Ratings" to see what others think

---

## 📋 Customer Ordering Menu

### Description
A comprehensive ordering system where customers can browse menus, place orders, and track their order status.

### Configuration
Add to your business config file:

```lua
orderingMenu = {
    enabled = true,
    coords = vector4(-1184.31, -884.29, 13.79, 305.0), -- x, y, z, heading
    ped = 's_f_y_airhostess_01', -- Ped model for the ordering station
    menu = {
        {
            categoryName = "Burgers",
            icon = "hamburger",
            items = {
                { item = "moneyshot", price = 150, description = "Classic burger with special sauce" },
                { item = "torpedo", price = 175, description = "Spicy burger with jalapeños" },
                { item = "rexmeatfree", price = 160, description = "Vegetarian burger option" },
            }
        },
        {
            categoryName = "Drinks",
            icon = "glass",
            items = {
                { item = "glass_apple", price = 80, description = "Fresh apple juice" },
                { item = "glass_banana", price = 80, description = "Banana smoothie" },
            }
        }
    }
}
```

### Features
- **Menu Categories**: Organize items into categories (Burgers, Drinks, etc.)
- **Item Descriptions**: Show detailed descriptions and prices
- **Quantity Selection**: Order multiple items at once
- **Special Instructions**: Customers can add special requests
- **Order Tracking**: View active orders and their status
- **Payment System**: Automatically charges customer (cash or bank)
- **Order Status**: Tracks pending → preparing → ready → completed

### Customer Usage
1. Walk up to the ordering station NPC
2. Select "View Menu" to browse items
3. Click on an item to order it
4. Enter quantity and special instructions
5. Confirm the order and payment will be processed
6. Select "My Orders" to track your orders

### Employee Usage
- Orders are managed through the Business Management Laptop
- Employees receive notifications when new orders arrive
- Can update order status and complete orders

---

## 💻 Business Management Laptop

### Description
A comprehensive management interface for business owners and employees to manage orders, view ratings, and access business analytics.

### Configuration
Add to your business config file:

```lua
managementLaptop = {
    enabled = true,
    coords = {
        vector3(-1176.14, -897.67, 14.10), -- Laptop location 1
        vector3(-1180.00, -900.00, 14.10), -- Laptop location 2 (optional)
    }
}
```

### Features
- **📦 View Active Orders**: See all pending orders
  - View order details (customer, items, quantity, price)
  - Update order status (Pending → Preparing → Ready → Completed)
  - Give items directly to customers
  - Cancel orders if needed

- **⭐ View Ratings & Reviews**: See customer feedback
  - Average rating display
  - Total number of reviews
  - Recent reviews with comments and timestamps

- **📊 Business Analytics**: (Coming Soon)
  - Sales statistics
  - Popular items
  - Peak hours

- **⚙️ Business Settings**: (Coming Soon)
  - Menu management
  - Pricing adjustments
  - Employee management

### Usage (Employees Only)
1. Must be clocked in (on duty) for the business
2. Walk up to any laptop location
3. Press `E` to access the management interface
4. Navigate through the menu to manage orders and view ratings

### Order Management Workflow
1. **New Order Arrives**: Employees receive a notification
2. **View Orders**: Access laptop and select "View Active Orders"
3. **Mark as Preparing**: Click on an order and mark it as preparing
4. **Mark as Ready**: When food is ready, mark order as ready
5. **Complete Order**: Give item to customer to complete the order

---

## Installation Instructions

### 1. Ensure Dependencies
Make sure you have these resources installed:
- QBCore Framework
- ox_lib
- ox_inventory
- qb-target

### 2. Database Setup (Optional)
If you want persistent ratings, implement the database functions in `server/sv_ratings.lua`:

```sql
CREATE TABLE IF NOT EXISTS `business_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business` varchar(50) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `playerName` varchar(100) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `business` (`business`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

### 3. Configure Your Businesses
Add the new sections to each business config file in the `businesses/` folder. See `businesses/burgershot.lua` for a complete example.

### 4. Restart Resource
```
ensure VL-Businesses
```

---

## Configuration Examples

### Complete Business Config
Here's a complete example with all three features:

```lua
Businesses["example_restaurant"] = {
    enabled = true,
    job = "example_restaurant",

    -- Existing configurations...
    dutyzone = { ... },
    blips = { ... },
    stash = { ... },
    trays = { ... },
    crafting = { ... },
    shop = { ... },

    -- 🌟 NEW: Customer Rating System
    ratingStation = {
        enabled = true,
        coords = vector4(100.0, 200.0, 20.0, 180.0),
        ped = 'a_f_y_business_01',
    },

    -- 📋 NEW: Customer Ordering Menu
    orderingMenu = {
        enabled = true,
        coords = vector4(105.0, 202.0, 20.0, 180.0),
        ped = 's_f_y_airhostess_01',
        menu = {
            {
                categoryName = "Main Dishes",
                icon = "utensils",
                items = {
                    { item = "burger", price = 150, description = "Delicious burger" },
                    { item = "pizza", price = 200, description = "Fresh pizza" },
                }
            },
            {
                categoryName = "Beverages",
                icon = "glass",
                items = {
                    { item = "cola", price = 50, description = "Ice cold cola" },
                    { item = "water", price = 30, description = "Bottled water" },
                }
            }
        }
    },

    -- 💻 NEW: Business Management Laptop
    managementLaptop = {
        enabled = true,
        coords = {
            vector3(110.0, 205.0, 21.0),
        }
    }
}
```

---

## Customization Tips

### Rating System
- Change the ped model to match your business theme
- Adjust coordinates to place the rating station in a convenient location
- Modify `server/sv_ratings.lua` to add database persistence

### Ordering Menu
- Create multiple categories to organize your menu
- Set competitive prices based on your server economy
- Add detailed descriptions to make items more appealing
- Use item names that exist in your ox_inventory

### Management Laptop
- Place laptops in manager offices or back rooms
- Add multiple laptop locations for larger businesses
- Only on-duty employees can access the laptop

---

## Troubleshooting

### "Rating station NPC not spawning"
- Check that coordinates are correct
- Ensure `enabled = true` in config
- Verify the ped model exists in your game

### "Orders not showing up"
- Make sure employees are on duty
- Check that job names match in config
- Restart the resource after config changes

### "Laptop not accessible"
- Verify you're on duty for the correct job
- Check coordinates are correct
- Make sure you're within interaction distance

### "Items not showing in menu"
- Ensure all items exist in ox_inventory
- Check that item names match exactly
- Verify images exist for items

---

## Support & Credits

### Files Added
- `client/cl_ratings.lua` - Customer rating system (client)
- `server/sv_ratings.lua` - Rating system backend
- `client/cl_ordering.lua` - Customer ordering menu (client)
- `server/sv_ordering.lua` - Order management backend
- `client/cl_laptop.lua` - Business management laptop (client)

### Framework
- Built for QBCore Framework
- Uses ox_lib for UI
- Integrates with ox_inventory
- Uses qb-target for interactions

### Version
- v1.0.0 - Initial release of new features

---

## Future Updates

Coming soon:
- 📊 Business analytics and statistics
- ⚙️ In-game menu editor
- 💰 Revenue tracking
- 📈 Sales reports
- 👥 Employee management
- 🎯 Loyalty rewards for customers
- 📱 Phone app integration

---

**Enjoy your enhanced business system!**
