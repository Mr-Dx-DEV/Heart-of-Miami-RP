# 🎯 Quick Reference Card - Jim-Consumables

## Most Used Props

### Food Props
```lua
"prop_cs_burger_01"          -- Burger
"prop_sandwich_01"           -- Sandwich
"prop_cs_hotdog_02"          -- Hotdog
"prop_food_bs_chips"         -- Fries/chips
"bzzz_food_dessert_a"        -- Dessert/cake
"prop_taco_01"               -- Taco
```

### Drink Props
```lua
"p_amb_coffeecup_01"         -- Coffee cup
"beanmachine_cup"            -- Latte/specialty coffee
"brum_cherryshake_vanilla"   -- Milkshake (vanilla)
"brum_cherryshake_strawberry" -- Milkshake (strawberry)
"brum_cherryshake_chocolate" -- Milkshake (chocolate)
"prop_rpemotes_soda01"       -- Soda cup (Sprunk)
"prop_rpemotes_soda03"       -- Soda cup (eCola)
"prop_drink_whisky"          -- Whiskey glass
"prop_drink_champ"           -- Champagne glass
"prop_amb_beer_bottle"       -- Beer bottle
```

### Restaurant Props (Fancy)
```lua
"bzzz_restaurant_food_a"     -- Schnitzel with fries
"bzzz_restaurant_food_d"     -- Grilled fish
"bzzz_restaurant_food_j"     -- Shrimp platter
"bzzz_restaurant_food_k"     -- Chicken with potatoes
"bzzz_restaurant_fork_d"     -- Fork (pair with plate)
```

---

## Copy-Paste Templates

### Template: Food Item (Eating)
```lua
-- In emotes.lua
your_food_item = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Eat Your Food",
    AnimationOptions = {
        Prop = "prop_cs_burger_01",
        PropBone = 18905,
        PropPlacement = {0.12, 0.06, 0.01, -52.0, 14.0, 58.0},
        EmoteMoving = true,
        EmoteLoop = false
    }
},

-- In consumables.lua
your_food_item = {
    emote = "your_food_item",
    canRun = false,
    time = math.random(5000, 6000),
    stress = 0,
    heal = 0,
    armor = 0,
    type = "food",
    stats = { hunger = math.random(40, 50) }
},
```

### Template: Drink Item (Sipping)
```lua
-- In emotes.lua
your_drink_item = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Drink Your Drink",
    AnimationOptions = {
        Prop = "p_amb_coffeecup_01",
        PropBone = 28422,
        PropPlacement = {0.01, 0.0, 0.01, 5.0, 2.0, -3.0},
        EmoteLoop = true,
        EmoteMoving = true
    }
},

-- In consumables.lua
your_drink_item = {
    emote = "your_drink_item",
    canRun = false,
    time = math.random(5000, 6000),
    stress = 0,
    heal = 0,
    armor = 0,
    type = "drink",
    stats = { thirst = math.random(40, 50) }
},
```

### Template: Alcoholic Drink
```lua
-- In emotes.lua
your_alcohol = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Drink Your Alcohol",
    AnimationOptions = {
        Prop = "prop_drink_whisky",
        PropBone = 28422,
        PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true
    }
},

-- In consumables.lua
your_alcohol = {
    emote = "your_alcohol",
    canRun = false,
    disableWalk = false,
    time = math.random(5000, 6000),
    stress = 25,
    heal = 0,
    armor = 10,
    type = "alcohol",
    stats = {
        thirst = math.random(5, 10),
        screen = "focus",
        widepupils = true,
        canOD = true
    }
},
```

### Template: Fancy Restaurant Meal
```lua
-- In emotes.lua (dual prop - plate + fork)
fancy_meal = { "bzzz@restaurant@eat", "bzzz_restaurant_eat", "Eat Fancy Meal",
    AnimationOptions = {
        Prop = "bzzz_restaurant_food_a",
        PropBone = 60309,
        PropPlacement = {0.08, -0.04, 0.07, -30.0, 10.0, 0.0},
        PropTwo = "bzzz_restaurant_fork_a",
        PropTwoBone = 28422,
        PropTwoPlacement = {0.07, 0.05, -0.03, -100.0, 24.0, -86.0},
        EmoteMoving = true,
        EmoteLoop = true
    }
},

-- In consumables.lua
fancy_meal = {
    emote = "fancy_meal",
    canRun = false,
    time = math.random(16000, 18000),  -- Longer for fancy meals
    stress = 0,
    heal = 0,
    armor = 0,
    type = "food",
    stats = { hunger = math.random(40, 50) }
},
```

---

## 🎨 Prop Placement Starting Points

### Food (Right Hand - Bone 18905)
```lua
PropPlacement = {0.12, 0.06, 0.01, -52.0, 14.0, 58.0}
--              X     Y     Z     RotX   RotY  RotZ
```

### Drinks (Left Hand - Bone 28422)
```lua
PropPlacement = {0.01, 0.0, 0.01, 5.0, 2.0, -3.0}
--              X    Y    Z    RotX RotY RotZ
```

### Fancy Plate (Mouth - Bone 60309)
```lua
PropPlacement = {0.08, -0.04, 0.07, -30.0, 10.0, 0.0}
--              X     Y      Z      RotX   RotY  RotZ
```

---

## ⚡ Quick Adjustment Cheat Sheet

| Problem | Solution |
|---------|----------|
| Item too far forward | **X -= 0.02** |
| Item too far back | **X += 0.02** |
| Item too high | **Z -= 0.01** |
| Item too low | **Z += 0.01** |
| Item too left | **Y += 0.01** |
| Item too right | **Y -= 0.01** |
| Item tilted wrong | **RotX ±10** |
| Item upside down | **RotY += 180** |
| Item sideways | **RotZ ±10** |

---

## 🎭 Animation Dictionary Cheat Sheet

| Type | Animation Dict | Animation Name | Use For |
|------|---------------|----------------|---------|
| **Burger/Food** | mp_player_inteat@burger | mp_player_int_eat_burger | Burgers, sandwiches, most food |
| **Coffee** | amb@world_human_drinking@coffee@male@idle_a | idle_c | Coffee cups, hot drinks |
| **Milkshake** | smo@milkshake_idle | milkshake_idle_clip | Milkshakes, smoothies, iced drinks with straw |
| **Bottle** | mp_player_intdrink | loop_bottle | Beer, soda bottles, liquor bottles |
| **Cocktail** | anim@heists@humane_labs@finale@keycards | ped_a_enter_loop | Champagne, cocktails, wine |
| **Fine Dining** | bzzz@restaurant@eat | bzzz_restaurant_eat | Restaurant meals, plates with fork |
| **Candy/Bar** | mp_player_inteat@burger | mp_player_int_eat_burger | Chocolate bars, candy |
| **Soda Cup** | smo@milkshake_idle | milkshake_idle_clip | Fountain drinks, soda cups |

---

## 💡 Pro Tips

1. **Always test with both male & female peds** - placements may differ slightly
2. **Start with existing similar item** - copy its placement as a baseline
3. **Make small changes** - increment by 0.01 or ±5 degrees
4. **Use EmoteLoop wisely:**
   - `true` = Continuous sipping/eating (drinks)
   - `false` = One-time bite/eat (food)
5. **Set realistic times:**
   - Quick snacks: 3-5 seconds
   - Meals: 5-6 seconds
   - Fine dining: 16-18 seconds
   - Drinks: 6-8 seconds

---

## 🔄 Quick Restart
```bash
restart jim-consumables
```

---

## 📱 Support Commands (In-Game)

Test any emote:
```
/e emotename
```

Cancel emote:
```
/c
```

---

**Need Help?** Check `CUSTOMIZATION_GUIDE.md` for detailed instructions!
