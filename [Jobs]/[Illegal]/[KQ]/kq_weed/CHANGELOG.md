# Update 1.0.1
- Added official `vms_housing` property detection
- Added a `base_sql_import.sql` file to allow for manual import of the database when the automatic import fails (Very rare)
- Optimized the .net.dll initalization to hopefully make the resmon even lower
  - The "high" resmon of ~0.02 at idle is caused by simply having a C# (.net) script file loaded. The resource consumption is simply from having a .net process run, even when the script is not performing any active actions
  - We have put a portion of the code into C# as a safety measure to prevent our resource from being stolen (via Escrow exploit as mentioned by CFX today)
  - If this fix turns out not sufficient we will consider removing this safeguard and moving all the C# code to lua, which would make it run at 0.00 @ idle, at a cost of the safety of the resource. We will keep monitoring this issue. Thank you all for understanding 🙏

**⚙️ Updated files**
- `All non-editable .lua files`
- `server/editable/editable.lua`

___
# Update 1.1.0
- Added a max placement limit for pots, tables and presses
- Made the weed collection mini-game spawn a maximum of 20 buds per plant (even when player is set to receive more)
- Made the weed pressing mini-game spawn a maximum of 40 buds on the tray (even when more are required/taken from the player)
- Added an option to disable the entity outline or use an alternative system (glow or box outline)
  - This is especially useful for servers with many QuantV users. As QuantV crashes when the Native FiveM Entity Outline is used (Can be fixed by enabling the "Fix FiveM Outline crash" in Reshade)
- Added missing and new messages to locales (related to placement & vendors)

**⚙️ Updated files**
- All non-editable .lua files
- `server/editable/editable.lua`
- `config.lua` ⚠️
- `locales/en.json` ⚠️

___
# Update 1.2.0
- Added missing locale for the weed plant HUD (Config.misc.showPlantStatusUI)
- Added official `sn_properties` support
- Added a weather/rain disable while inside grow ops

**⚙️ Files to update**
- All non-editable .lua files
- `client/editable/editable.lua`
- `config.lua` ⚠️
- `locales/en.json` ⚠️

___
# Update 1.3.0 - Insect infestations 🦟
- Added insect infestations
- Each plant now has a chance of getting infested with insects
- When plants get infested bugs will fly around them and their color will change
- While plants are infested they'll lose health and eventually die
- Interact with the plants to spray them with Pesticide Spray (`kq_weed_pesticide_spray`)
- Brand-new Mini-game has been added for this action
- "Resistance" option in fertilizers now also affects the insect damage
- Few new `Config.misc` options have been added, so make sure to update your config.lua

Other changes
- Added `Config.misc.hudFontId`
- Added `Config.misc.hudScale`
- Fixed an issue where pickup up objects (pot, table, press) would allow for item dupe on servers with overloaded databases

**⚙️ Files to update**
- All non-editable .lua files
- `client/editable/editable.lua`
- `server/editable/editable.lua`
- `config.lua` ⚠️
- `config.strains.lua` ⚠️
- `locales/en.json` ⚠️

**Make sure to add the new item and item icon to your framework/inventory!**

___
# Update 1.3.1
- Fixed vms_housing integration issues
- Added `requiredItem` option to the grow ops and lockups
  - This allows you to require players to have an item in their inventory to open the doors

**⚙️ Files to update**
- All non-editable .lua files
- `server/editable/editable.lua`

___
# Update 1.3.2
- Added loaf_housing integration
- Fixed harmless errors which sometimes would occur on server join
- Fixed item icon naming `kq_weed_brick_blue_dream` (from `kq_weed_blue_dream`)

**⚙️ Files to update**
- All non-editable .lua files
- `server/editable/editable.lua`

___
# Update 1.4.0
- Added 8 new vibrant plant colors
- Improved object initalization for slow devices to get rid of the final (harmless) errors
- Fixed an issue when using whitelisted areas in combination with client-based housing systems

**⚙️ Files to update**
- All non-editable files
- `client/editable/editable.lua`
- `server/editable/editable.lua`
- `stream/[plants]/kq_weed_plants.ytd`
