local stats = nil
-- GTA V Weapons Name to Hash Mapping
local Weapons = {
    -- Base Weapons
    ["WEAPON_UNARMED"] = 2725352035,
    ["WEAPON_ANIMAL"] = 4194021054,
    ["WEAPON_COUGAR"] = 148160082,
    ["WEAPON_KNIFE"] = 2578778090,
    ["WEAPON_NIGHTSTICK"] = 1737195953,
    ["WEAPON_HAMMER"] = 1317494643,
    ["WEAPON_BAT"] = 2508868239,
    ["WEAPON_GOLFCLUB"] = 1141786504,
    ["WEAPON_CROWBAR"] = 2227010557,
    ["WEAPON_PISTOL"] = 453432689,
    ["WEAPON_COMBATPISTOL"] = 1593441988,
    ["WEAPON_APPISTOL"] = 584646201,
    ["WEAPON_PISTOL50"] = 2578377531,
    ["WEAPON_MICROSMG"] = 324215364,
    ["WEAPON_SMG"] = 736523883,
    ["WEAPON_ASSAULTSMG"] = 4024951519,
    ["WEAPON_ASSAULTRIFLE"] = 3220176749,
    ["WEAPON_CARBINERIFLE"] = 2210333304,
    ["WEAPON_ADVANCEDRIFLE"] = 2937143193,
    ["WEAPON_MG"] = 2634544996,
    ["WEAPON_COMBATMG"] = 2144741730,
    ["WEAPON_PUMPSHOTGUN"] = 487013001,
    ["WEAPON_SAWNOFFSHOTGUN"] = 2017895192,
    ["WEAPON_ASSAULTSHOTGUN"] = 3800352039,
    ["WEAPON_BULLPUPSHOTGUN"] = 2640438543,
    ["WEAPON_STUNGUN"] = 911657153,
    ["WEAPON_SNIPERRIFLE"] = 100416529,
    ["WEAPON_HEAVYSNIPER"] = 205991906,
    ["WEAPON_REMOTESNIPER"] = 856002082,
    ["WEAPON_GRENADELAUNCHER"] = 2726580491,
    ["WEAPON_GRENADELAUNCHER_SMOKE"] = 1305664598,
    ["WEAPON_RPG"] = 2982836145,
    ["WEAPON_PASSENGER_ROCKET"] = 375527679,
    ["WEAPON_AIRSTRIKE_ROCKET"] = 324506233,
    ["WEAPON_STINGER"] = 1752584910,
    ["WEAPON_MINIGUN"] = 1119849093,
    ["WEAPON_GRENADE"] = 2481070269,
    ["WEAPON_STICKYBOMB"] = 741814745,
    ["WEAPON_SMOKEGRENADE"] = 4256991824,
    ["WEAPON_BZGAS"] = 2694266206,
    ["WEAPON_MOLOTOV"] = 615608432,
    ["WEAPON_FIREEXTINGUISHER"] = 101631238,
    ["WEAPON_PETROLCAN"] = 883325847,
    ["WEAPON_DIGISCANNER"] = 4256881901,
    ["WEAPON_BRIEFCASE"] = 2294779575,
    ["WEAPON_BRIEFCASE_02"] = 28811031,
    ["WEAPON_BALL"] = 600439132,
    ["WEAPON_FLARE"] = 1233104067,
    ["WEAPON_VEHICLE_ROCKET"] = 3204302209,
    ["WEAPON_BARBED_WIRE"] = 1223143800,
    ["WEAPON_DROWNING"] = 4284007675,
    ["WEAPON_DROWNING_IN_VEHICLE"] = 1936677264,
    ["WEAPON_BLEEDING"] = 2339582971,
    ["WEAPON_ELECTRIC_FENCE"] = 2461879995,
    ["WEAPON_EXPLOSION"] = 539292904,
    ["WEAPON_FALL"] = 3452007600,
    ["WEAPON_EXHAUSTION"] = 910830060,
    ["WEAPON_HIT_BY_WATER_CANNON"] = 3425972830,
    ["WEAPON_RAMMED_BY_CAR"] = 133987706,
    ["WEAPON_RUN_OVER_BY_CAR"] = 2741846334,
    ["WEAPON_HELI_CRASH"] = 341774354,
    ["WEAPON_FIRE"] = 3750660587,
    
    -- DLC Weapons
    -- Beach Bum Update
    ["WEAPON_SNSPISTOL"] = 3218215474,
    ["WEAPON_BOTTLE"] = 4192643659,
    
    -- Valentines Day Massacre Special
    ["WEAPON_GUSENBERG"] = 1627465347,
    
    -- Business Update
    ["WEAPON_SPECIALCARBINE"] = 3231910285,
    ["WEAPON_HEAVYPISTOL"] = 3523564046,
    
    -- High Life Update
    ["WEAPON_BULLPUPRIFLE"] = 2132975508,
    
    -- "I'm Not a Hipster" Update
    ["WEAPON_DAGGER"] = 2460120199,
    ["WEAPON_VINTAGEPISTOL"] = 137902532,
    
    -- Independence Day Special
    ["WEAPON_FIREWORK"] = 2138347493,
    ["WEAPON_MUSKET"] = 2828843422,
    
    -- Last Team Standing Update
    ["WEAPON_HEAVYSHOTGUN"] = 984333226,
    ["WEAPON_MARKSMANRIFLE"] = 3342088282,
    
    -- Festive Surprise
    ["WEAPON_HOMINGLAUNCHER"] = 1672152130,
    ["WEAPON_PROXMINE"] = 2874559379,
    ["WEAPON_SNOWBALL"] = 126349499,
    
    -- Heists Update
    ["WEAPON_FLAREGUN"] = 1198879012,
    ["WEAPON_GARBAGEBAG"] = 3794977420,
    ["WEAPON_HANDCUFFS"] = 3494679629,
    
    -- Ill-Gotten Gains Part 1
    ["WEAPON_COMBATPDW"] = 171789620,
    
    -- Ill-Gotten Gains Part 2
    ["WEAPON_MARKSMANPISTOL"] = 3696079510,
    ["WEAPON_KNUCKLE"] = 3638508604,
    
    -- Enhanced edition
    ["WEAPON_HATCHET"] = 4191993645,
    ["WEAPON_RAILGUN"] = 1834241177,
    
    -- Lowriders
    ["WEAPON_MACHETE"] = 3713923289,
    ["WEAPON_MACHINEPISTOL"] = 3675956304,
    
    -- Executives and Other Criminals
    ["WEAPON_AIR_DEFENCE_GUN"] = 738733437,
    ["WEAPON_SWITCHBLADE"] = 3756226112,
    ["WEAPON_REVOLVER"] = 3249783761,
    
    -- Lowriders: Custom Classics
    ["WEAPON_DBSHOTGUN"] = 4019527611,
    ["WEAPON_COMPACTRIFLE"] = 1649403952,
    
    -- Bikers
    ["WEAPON_AUTOSHOTGUN"] = 317205821,
    ["WEAPON_BATTLEAXE"] = 3441901897,
    ["WEAPON_COMPACTLAUNCHER"] = 125959754,
    ["WEAPON_MINISMG"] = 3173288789,
    ["WEAPON_PIPEBOMB"] = 3125143736,
    ["WEAPON_POOLCUE"] = 2484171525,
    ["WEAPON_WRENCH"] = 419712736
}

local function ResetRechargeMultipliers()
    SetPlayerHealthRechargeMultiplier(cache.playerId, 0.0)
    SetPlayerHealthRechargeLimit(cache.playerId, 0.0)
end

function BackupPlayerStats()
    stats = {
        health = GetEntityHealth(cache.ped),
        armour = GetPedArmour(cache.ped),
        loadout = {}
    }
    if not Config.ForceLoadout then
        return
    end
    for k,v in pairs(Weapons) do
        local weaponHash = v
        if HasPedGotWeapon(cache.ped, weaponHash, false) then
            local _, ammo = GetAmmoInPedWeapon(cache.ped, weaponHash)
            stats.loadout[weaponHash] = ammo
        end
    end
end

function RestorePlayerStats()
    LocalPlayer.state.ResettingArmor = true
    if stats then
        SetEntityMaxHealth(cache.ped, 200)
        Wait(1000) -- Safety Delay
        SetEntityHealth(cache.ped, stats.health)
        SetPedArmour(cache.ped, stats.armour)
        ResetRechargeMultipliers()
        stats = nil
        return
    end
    -- If no stats are backed up, restore from the framework
    Framework.RestorePlayerArmour()
    LocalPlayer.state.ResettingArmor = false
    if Config.ForceLoadout then
        -- Clear current weapons
        RemoveAllPedWeapons(cache.ped, true, true)
        -- Restore loadout from framework
        for weaponHash, ammo in pairs(stats.loadout) do
            GiveWeaponToPed(cache.ped, weaponHash, ammo, false, false)
        end
    end
end
