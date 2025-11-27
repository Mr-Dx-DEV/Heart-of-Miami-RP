Prism = {}

Prism.ProfileType = 'discord'-- ( 'discord', 'steam', 'mugshot' ) if mugshot you need to have a dependency installed https://github.com/BaziForYou/MugShotBase64
Prism.SteamApiKey = '' -- https://steamcommunity.com/dev/apikey (required for steam profile pictures)
Prism.DiscordBotToken = 'MTQwMjU0NTY1MDA2NjkxNTMyOA.GnC7LB.WPyuk-z-Q25D1jboC9x3GvvVc2S9BBvDJrWCJ4' -- https://discord.com/developers/applications (required for discord profile pictures)
Prism.UseCitizenId = true -- ( Use citizen id instead of player server id ( Only enable for QBcore or Qbox ))
Prism.mouseTrailActive = {
    enabled = true, -- Disabled for standard ox_inventory compatibility
    color = {
        r = 255,
        g = 0,
        b = 0,
    }
}

Prism.ThemeSettings = {
    PrimaryColor = '#1E90FF', -- Dodger Blue
    buttonGradients = {
        gradient = 'linear-gradient(135deg, #4DA6FF 0%, #0073E6 100%)',
        shadow = 'rgba(0, 115, 230, 0.4)',
        text = '#ffffff'
    }
}

Prism.ItemNotificationConfig = {
    position = 'top-center', -- 'top-left, top-center, top-right, left-center, left-bottom, bottom-center, right-bottom, right-center'
    duration = 2500
}

Prism.Texts = {
    Header = 'INVENTORY',
    Pockets = 'POCKETS',
    PocketsDescription = 'Items on your character',
    Hotbar = 'HOTBAR',
    HotbarDescription = 'Quickly equip your items',
    Secondary = 'SECONDARY',
    SecondaryDescription = 'Store necessary assets',
    Close_header_1 = 'Close',
    Close_header_2 = 'Inventory',
}
