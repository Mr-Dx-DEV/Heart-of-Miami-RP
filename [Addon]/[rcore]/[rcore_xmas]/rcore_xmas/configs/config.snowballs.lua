Config.Snowballs = {        -- [table] - Snowballs
    Pickup = {
        Enabled = true,     -- [true/false] - Enables snowball pickup.
        Bind = {
            Controls = 'keyboard',
            Key = 'k',
        },
        Animation = {
            Dict = 'anim@mp_snowball',     -- [string] - Animation dictionary.
            Name = 'pickup_snowball',      -- [string] - Animation name.
        },
        Receive = {
            Item = 'WEAPON_SNOWBALL',
            -- Weapon = `WEAPON_SNOWBALL`,
            Amount = 2,
        },
    }
}
