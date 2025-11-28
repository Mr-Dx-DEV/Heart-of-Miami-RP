-- Business blips, players can toggle on/off their own blip to let know other players if the business is open/closed
Config = Config or {}
Config.Blips = {
    -- index key needs to be named exactly like the job name
    -- blips sprites and colors: https://docs.fivem.net/docs/game-references/blips/
    -- online means the blip will be enable/disable by default
    ['uwucafe'] = { x = -582.42, y = -1061.41, z = 22.34, label = "UwU Cafe", sprite = 59, color = 2, online = false },
    ['upnatom'] = { x = 91.1600, y = 292.135, z = 110.20, label = "Up n Atom", sprite = 59, color = 2, online = false },
}