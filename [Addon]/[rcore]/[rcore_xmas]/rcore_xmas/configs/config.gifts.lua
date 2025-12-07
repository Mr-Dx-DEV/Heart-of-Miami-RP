Config.Gifts = {
    Enabled = true,                      -- [true/false] - Enables gifts packaging
    Item = 'xmas_gift',                  -- [string] - Item to start packaging
    PackedItem = 'xmas_packed_gift',     -- [string] - Item to receive after packaging
    Command = 'packgift',                -- [string] - Command to start packaging
    Inventory = {
        Slots = 5,
        MaxWeight = 1000.0,
    },
    Unpack = {
        WaitForChristmas = true,     -- [true/false] - Players can open packed gifts only after specified date
        Date = {
            day = 24,
            month = 12,
        }
    },
}
