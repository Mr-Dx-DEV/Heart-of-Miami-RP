Config.Trees = {                                          -- [table] - Christmas trees
    Persist = {                                           -- [table] - Persistent trees
        Enabled = true,                                   -- [true/false] - Enables if the trees should be persistent and be available after server restart AND is allowed to open GIFTS STASH.
        PerPlayerLimit = 2,                               -- [int/false] - How many trees can a player have at the same time (false = unlimited)
    },
    Build = {                                             -- [table] - Tree building
        Enabled = true,                                   -- [true/false] - Enables tree building / placing
        InteriorOnly = false,                             -- [true/false] - Enables tree building only in interiors
        Models = {                                        -- [table] - Tree models
            Undecored = `bzzz_xmas23_convert_tree_a`,     -- [hash] - Undecored tree model
            Decored = `bzzz_xmas23_convert_tree_b`        -- [hash] - Decored tree model
        },
        Command = 'tree',                                 -- [string] - Command to start building
        Item = 'xmas_tree',                               -- [string/nil] - Item to start building
    },
    Stash = {
        Enabled = true,                                       -- [true/false] - Enables gifts stash
        Slots = 10,                                           -- [int] - Slots of the stash
        MaxWeight = 1000.0,                                   -- [float] - Max weight of the stash
        OxInventoryHook = {
            OnlyGifts = true,                                 -- [true/false] - Enables only gift items in the stash
            GiftsOnGround = {
                Enabled = true,                               -- [true/false] - Enables gifts on the ground if something is in the stash
                Model = `bzzz_xmas23_convert_tree_gifts`,     -- [hash] - Model of the gift
            },
        }
    },
    Decorate = {
        ProgressTime = 5000,     -- [int] - Time of the progress bar
        Animation = {
            Dict = 'mp_car_bomb',
            Name = 'car_bomb_mechanic'
        },
        Required = {
            { item = 'xmas_star',  amount = 1 },     -- [table] - Required items to decorate the tree
            { item = 'xmas_decor', amount = 5 },
        }
    },
    Control = {
        Radius = 2.0,
        HelpText = {            -- Works only with Target.NONE
            Enabled = true,     -- [true/false] - Enables help text.
        },
        Decorate = {
            Target = {
                icon = 'fa-solid fa-paint-roller',     -- https://fontawesome.com/v5.15/icons?d=gallery&p=2&m=free
            },
        },
        GiftsStash = {
            Target = {
                icon = 'fa-solid fa-gifts',
            },
        },
        Delete = {
            Target = {
                icon = 'fa-solid fa-trash-alt',
            },
        },
    },
}
