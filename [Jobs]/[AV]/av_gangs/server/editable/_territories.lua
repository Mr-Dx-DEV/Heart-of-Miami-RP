Config = Config or {}

-- Points from this config are NOT linked to gang XP
-- These points are applied to the zone where the action is performed

Config.KillPoints = {
    enabled = true, -- give points when killing another gang member?
    toAdd = 10, -- points to add to killer gang
    toRemove = 5, -- points to remove to victims gang
    friendly = 15, -- points to remove to killer if the victim was on the same gang (friendly fire lul)
}

Config.GraffitiPoints = {
    enabled = true, -- add points when placing/removing graffitis
    placing = 10, -- points to add when placing a graffiti
    removing = 10, -- points to add when removing an enemy gang graffiti
    removed = 10, -- points to remove when your graffiti gets removed
}

Config.RobNPC = {
    enabled = true, -- add/remove points when a gang npc gets robbed by a rival gang
    toAdd = 2, -- points to add to the gang performing the robbery
    toRemove = 2, -- points to remove from the NPC gang
}

-- List of blacklisted territories, territories from this list CANT be captured
-- Map with zones label: https://www.reddit.com/r/GTAV/comments/6qc22x/map_of_neighborhoods_in_san_andreas/#lightbox
-- Zone names: https://docs.fivem.net/natives/?_0xCD90657D4C30E1CA
Config.BlacklistedTerritories = {
    ['SKID'] = true, -- Mission row
    ['PBOX'] = true, -- Pillbox hills
    ['LEGSQU'] = true, -- Legion square
}