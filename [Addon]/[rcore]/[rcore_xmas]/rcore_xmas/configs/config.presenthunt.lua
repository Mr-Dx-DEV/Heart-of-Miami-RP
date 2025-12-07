Config.PresentHunt = {                       -- [table] - Present hunt
    Enabled = true,                          -- [true/false] - Enables present hunt.
    Model = `bzzz_xmas23_convert_tree_gift`, -- [hash] - Model of the present.
    DeleteAfterCollect = true,               -- [true/false] - Delete present after collecting.
    Collect = {
        Radius = 2.0,                        -- [float] - Radius of the collection area (Work only with Target.NONE)
        HelpText = {                         -- Works only with Target.NONE
            Enabled = true,                  -- [true/false] - Enables help text.
        },
        Target = {
            distance = 1.5,
            icon = 'fa-solid fa-gift' -- https://fontawesome.com/v5.15/icons?d=gallery&p=2&m=free
        },
        Animation = {
            Dict = 'anim@mp_snowball', -- [string] - Animation dictionary.
            Name = 'pickup_snowball',  -- [string] - Animation name.
        },
    },

    Rewards = {                                -- [table] - Loot table for rewards
        {
            item = 'cash',                     -- [string] - Item name.
            amount = { min = 100, max = 200 }, -- [int/table] - Amount of the item. If table is used, it will generate a random number between min and max.
            chance = 900,                      -- [int] - Chance of getting the item.
            label = 'Cash',                    -- [string] - Label of the item.
        },
        {
            item = 'pistol',
            amount = 1,
            chance = 10,
        },
        {
            item = 'meth',
            amount = { min = 1, max = 3 },
            chance = 20,
        },
        {
            item = 'weed',
            amount = { min = 3, max = 8 },
            chance = 10,
        }
    },

    Leaderboard = {
        TopN = 10,                -- [int] - Number of top players to show in the leaderboard.
        RefreshInterval = 600000, -- [int] - Interval in milliseconds to refresh the leaderboard. Default is 10 minutes.

        Command = 'hunt'
    },

    NearestBlips = {
        Enabled = false,
        Distance = 500,
        Blip = {
            Sprite = 568,
            Display = 2,
            Scale = 0.6,
            Color = 41,
            ShortRange = false,
            Alpha = 200,
            Label = 'Present'
        }
    }
}
