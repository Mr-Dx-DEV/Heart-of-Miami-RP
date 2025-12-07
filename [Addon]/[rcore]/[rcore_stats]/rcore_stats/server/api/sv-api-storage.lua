-- Default database
local function insertCategoriesDatabase()
    -- create table rcore_stats_categories
    MySQL.Sync.execute([[
        create table rcore_stats_categories
        (
            id             int auto_increment,
            `key`           VARCHAR(255) not null,
            name          VARCHAR(255) not null,
            `type`        enum('player', 'server') not null,
            order_number   int default 1 null,
            updated_at  timestamp    not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
            attributes    json default '{}' null,
            constraint rcore_stats_categories_pk
                primary key (id),
            constraint rcore_stats_categories_key_uindex
                unique (`key`)
        )
        character set utf8mb4 collate utf8mb4_unicode_ci;
    ]], {})
end

local function insertStatTypesDatabase()
    -- create table rcore_stats_types
    MySQL.Sync.execute([[
        create table rcore_stats_types
        (
            id           int auto_increment,
            `key`           varchar(255) not null,
            name        varchar(255) not null,
            `type`        enum('player', 'server') not null,
            order_number int default 1 null,
            category_key  VARCHAR(255) not null,
            unit_type  VARCHAR(255),
            is_enabled   tinyint(1) default 1 null,
            updated_at  timestamp    not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
            calculated_from varchar(255) null,
            attributes    json default '{}' null,
            constraint rcore_stats_types_pk
                primary key (id),
            constraint rcore_stats_types_rcore_stats_categories_key_fk
                foreign key (category_key) references rcore_stats_categories (`key`),
            constraint rcore_stats_types_key_uindex
                unique (`key`)
        )
        character set utf8mb4 collate utf8mb4_unicode_ci;
    ]], {})
end

local function insertStatsDataDatabase()
    -- create table rcore_stats_data
    MySQL.Sync.execute([[
        create table rcore_stats_data
        (
            `identifier` varchar(255) not null,
            stats        json         not null,
            achievements json         not null,
            updated_at  timestamp    not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
            constraint rcore_stats_data_pk
                primary key (`identifier`),
            constraint rcore_stats_data_identifier_uindex
                unique (`identifier`)
        )
        character set utf8mb4 collate utf8mb4_unicode_ci;
    ]], {})
end

local function insertAchievementsDatabase()
    MySQL.Sync.execute([[
        create table rcore_stats_achievements
        (
            id           int auto_increment,
            `key`         varchar(255) not null,
            name        varchar(255) not null,
            description varchar(255) not null,
            icon        varchar(50) not null,
            stat_key    varchar(255) not null,
            threshold int not null,
            attributes    json default '{}' null,
            constraint rcore_stats_achievements_pk
                primary key (id),
            constraint rcore_stats_achievements_rcore_stats_types_key_fk
                foreign key (stat_key) references rcore_stats_types (`key`)
        )
        character set utf8mb4 collate utf8mb4_unicode_ci;
    ]])
end

local function insertDefaultCategories()
    -- insert default data
    MySQL.Sync.execute([[
        INSERT INTO rcore_stats_categories (name, `key`, `type`, order_number)
        VALUES  ('Distance', 'distance', 'player', 1),
                ('Finance', 'finance', 'player', 2),
                ('Speed', 'speed', 'player', 3),
                ('Favorite', 'favorite', 'player', 4),
                ('Combat', 'combat', 'player', 5),
                ('Other', 'other', 'player', 6);
    ]], {})
end

local function insertDefaultStatsData()
    local serverIdentifier = Config.SERVER_DATA_IDENTIFIER

    MySQL.Sync.execute(
        [[ INSERT INTO rcore_stats_data (`identifier`, stats, achievements) VALUES (@identifier, @stats, @achievements) ]],
        {
            ['@identifier'] = serverIdentifier,
            ['@stats'] = '{}',
            ['@achievements'] = '{}',
        })
end

local function insertDefaultStatTypes()
    MySQL.Sync.execute([[
        INSERT INTO rcore_stats_types (`key`, name, `type`, order_number, category_key, is_enabled, unit_type, calculated_from)
        VALUES
                ('distance_foot', 'Distance on foot', 'player', 1, 'distance', 1, 'distance', NULL),
                ('distance_car', 'Distance by car', 'player', 2, 'distance', 1, 'distance', NULL),
                ('distance_bike', 'Distance by bike', 'player', 3, 'distance', 1, 'distance', NULL),
                ('distance_heli', 'Distance by heli', 'player', 4, 'distance', 1, 'distance', NULL),
                ('distance_plane', 'Distance by plane', 'player', 5, 'distance', 1, 'distance', NULL),
                ('distance_boat', 'Distance by boat', 'player', 6, 'distance', 1, 'distance', NULL),
                ('distance_bicycle', 'Distance by bicycle', 'player', 7, 'distance', 1, 'distance', NULL),
                ('distance_other', 'Distance by other', 'player', 8, 'distance', 1, 'distance', NULL),
                ('money_earned', 'Money earned', 'player', 9, 'finance', 1, 'finance', NULL),
                ('money_spent', 'Money spent', 'player', 10, 'finance', 1, 'finance', NULL),
                ('max_speed_with', 'Max speed achieved with', 'player', 11, 'speed', 1, NULL, NULL),
                ('max_speed_car', 'Max speed in car', 'player', 12, 'speed', 1, 'speed', NULL),
                ('max_speed_bike', 'Max speed on bike', 'player', 13, 'speed', 1, 'speed', NULL),
                ('max_speed_heli', 'Max speed in heli', 'player', 14, 'speed', 1, 'speed', NULL),
                ('max_speed_plane', 'Max speed in plane', 'player', 15, 'speed', 1, 'speed', NULL),
                ('max_speed_boat', 'Max speed in boat', 'player', 16, 'speed', 1, 'speed', NULL),
                ('max_speed_bicycle', 'Max speed on bicycle', 'player', 17, 'speed', 1, 'speed', NULL),
                ('favorite_vehicle', 'Favorite vehicle', 'player', 18, 'favorite', 1, NULL, NULL),
                ('favorite_weapon', 'Favorite weapon', 'player', 19, 'favorite', 1, NULL, NULL),
                ('player_kills', 'Player kills', 'player', 20, 'combat', 1, NULL, NULL),
                ('entity_kills', 'Locals and animal kills', 'player', 21, 'combat', 1, NULL, NULL),
                ('vehicles_destroyed', 'Vehicles destroyed', 'player', 22, 'combat', 1, NULL, NULL),
                ('objects_destroyed', 'Objects destroyed', 'player', 23, 'combat', 1, NULL, NULL),
                ('deaths', 'Deaths', 'player', 24, 'combat', 1, NULL, NULL),
                ('death_by_weapon', 'Death by weapon', 'player', 25, 'combat', 1, NULL, NULL),
                ('death_by_animal', 'Death by animal', 'player', 26, 'combat', 1, NULL, NULL),
                ('death_by_fire', 'Death by fire', 'player', 27, 'combat', 1, NULL, NULL),
                ('death_by_suffocate', 'Death by suffocating', 'player', 28, 'combat', 1, NULL, NULL),
                ('death_by_vehicle', 'Death by vehicle', 'player', 29, 'combat', 1, NULL, NULL),
                ('death_by_fall', 'Death by fall', 'player', 30, 'combat', 1, NULL, NULL),
                ('death_by_suicide', 'Deat - suicide', 'player', 31, 'combat', 1, NULL, NULL),
                ('death_by_hand', 'Death by hand', 'player', 32, 'combat', 1, NULL, NULL),
                ('death_by_others', 'Death - other', 'player', 33, 'combat', 1, NULL, NULL),
                ('weapon_shots', 'Shot count', 'player', 34, 'combat', 1, NULL, NULL),
                ('weapon_hits', 'Hit count', 'player', 35, 'combat', 1, NULL, NULL),
                ('weapon_headshots', 'Headshots', 'player', 36, 'combat', 1, NULL, NULL),
                ('time_played', 'Time played', 'player', 37, 'other', 1, 'time', NULL),
                ('total_weapon_shots', 'Total bullets shot', 'server', 38, 'combat', 1, NULL, 'weapon_shots'),
                ('total_weapon_hits', 'Total bullet hits', 'server', 39, 'combat', 1, NULL, 'weapon_hits'),
                ('total_weapon_headshots', 'Total headshots', 'server', 40, 'combat', 1, NULL, 'weapon_headshots'),
                ('total_deaths', 'Total deaths', 'server', 41, 'combat', 1, NULL, 'deaths'),
                ('total_death_by_weapon', 'Total deaths by weapon', 'server', 42, 'combat', 1, NULL, 'death_by_weapon'),
                ('total_death_by_animal', 'Total deaths by animal', 'server', 43, 'combat', 1, NULL, 'death_by_animal'),
                ('total_death_by_fire', 'Total deaths by fire', 'server', 44, 'combat', 1, NULL, 'death_by_fire'),
                ('total_death_by_suffocate', 'Total deaths by suffocating', 'server', 45, 'combat', 1, NULL, 'death_by_suffocate'),
                ('total_death_by_vehicle', 'Total deaths by vehicle', 'server', 46, 'combat', 1, NULL, 'death_by_vehicle'),
                ('total_death_by_fall', 'Total deaths by fall', 'server', 47, 'combat', 1, NULL, 'death_by_fall'),
                ('total_death_by_suicide', 'Total deaths - suicide', 'server', 48, 'combat', 1, NULL, 'death_by_suicide'),
                ('total_death_by_hand', 'Total deaths by hand', 'server', 49, 'combat', 1, NULL, 'death_by_hand'),
                ('total_death_by_others', 'Total deaths - other', 'server', 50, 'combat', 1, NULL, 'death_by_others'),
                ('total_vehicles_destroyed', 'Total vehicles destroyed', 'server', 51, 'combat', 1, NULL, 'vehicles_destroyed'),
                ('total_objects_destroyed', 'Total objects destroyed', 'server', 52, 'combat', 1, NULL, 'objects_destroyed'),
                ('total_player_kills', 'Total players kills', 'server', 53, 'combat', 1, NULL, 'player_kills'),
                ('total_entity_kills', 'Total locals and animal kills', 'server', 54, 'combat', 1, NULL, 'entity_kills'),
                ('total_money_earned', 'Total money earned', 'server', 55, 'finance', 1, 'finance', 'money_earned'),
                ('total_money_spent', 'Total money spent', 'server', 56, 'finance', 1, 'finance', 'money_spent'),
                ('total_time_played', 'Total time played', 'server', 57, 'other', 1, 'time', 'time_played'),
                ('total_distance_foot', 'Total distance on foot', 'server', 58, 'distance', 1, 'distance', 'distance_foot'),
                ('total_distance_car', 'Total distance by car', 'server', 59, 'distance', 1, 'distance', 'distance_car'),
                ('total_distance_bike', 'Total distance by bike', 'server', 60, 'distance', 1, 'distance', 'distance_bike'),
                ('total_distance_heli', 'Total distance by heli', 'server', 61, 'distance', 1, 'distance', 'distance_heli'),
                ('total_distance_plane', 'Total distance by plane', 'server', 62, 'distance', 1, 'distance', 'distance_plane'),
                ('total_distance_boat', 'Total distance by boat', 'server', 63, 'distance', 1, 'distance', 'distance_boat'),
                ('total_distance_bicycle', 'Total distance by bicycle', 'server', 64, 'distance', 1, 'distance', 'distance_bicycle'),
                ('total_distance_other', 'Total distance by other', 'server', 65, 'distance', 1, 'distance', 'distance_other');
    ]], {})
end

local function insertDefaultAchievements()
    local defaultAchievements = {
        { key = 'deaths_1',               name = 'Introduction to the Afterlife',          description = 'You died! Surely not for the last time.',                         icon = 'skull',              stat_key = 'deaths',             threshold = 1 },
        { key = 'deaths_8',               name = 'One more left!',                         description = 'You died 8 times, lick some catnip to get back on your feet.',    icon = 'cat',                stat_key = 'deaths',             threshold = 8 },
        { key = 'deaths_20',              name = 'He then greeted death as an old friend', description = 'First death was a coincidence, 19 more is just bad luck.',        icon = 'skull',              stat_key = 'deaths',             threshold = 20 },
        { key = 'death_by_vehicle_1',     name = 'Roadkill',                               description = 'You got run over by a vehicle',                                   icon = 'car-front',          stat_key = 'death_by_vehicle',   threshold = 1 },
        { key = 'death_by_fall_1',        name = 'Gravity sucks',                          description = 'Die by falling for the first time.',                              icon = 'apple',              stat_key = 'death_by_fall',      threshold = 1 },
        { key = 'death_by_fall_10',       name = "I've fallen, and I can't get up!",       description = 'Die 10 times by falling',                                         icon = 'skull',              stat_key = 'death_by_fall',      threshold = 10 },
        { key = 'death_by_fall_50',       name = 'I believe I can fly',                    description = 'Die 50 times by falling',                                         icon = 'bird',               stat_key = 'death_by_fall',      threshold = 50 },
        { key = 'death_by_hand_1',        name = 'Beaten to death',                        description = 'Everybody has a plan until they get punched in the mouth',        icon = 'grab',               stat_key = 'death_by_hand',      threshold = 1 },
        { key = 'death_by_hand_5',        name = 'Fight Club',                             description = 'Die 5 times by hand',                                             icon = 'skull',              stat_key = 'death_by_hand',      threshold = 5 },
        { key = 'death_by_hand_20',       name = 'Punching bag',                           description = 'Die 20 times by hand',                                            icon = 'skull',              stat_key = 'death_by_hand',      threshold = 20 },
        { key = 'death_by_weapon_1',      name = "You can't dodge them all",               description = 'You were killed by a weapon',                                     icon = 'skull',              stat_key = 'death_by_weapon',    threshold = 1 },
        { key = 'death_by_weapon_5',      name = 'Bullet magnet',                          description = 'Die 5 times by weapon',                                           icon = 'skull',              stat_key = 'death_by_weapon',    threshold = 5 },
        { key = 'death_by_weapon_10',     name = 'Walking target',                         description = 'Die 10 times by weapon',                                          icon = 'skull',              stat_key = 'death_by_weapon',    threshold = 10 },
        { key = 'death_by_suffocate_1',   name = 'Death by Snu Snu',                       description = 'You suffocated to death',                                         icon = 'skull',              stat_key = 'death_by_suffocate', threshold = 1 },
        { key = 'death_by_suicide_1',     name = 'Call 988',                               description = 'You took your own life!',                                         icon = 'skull',              stat_key = 'death_by_suicide',   threshold = 1 },
        { key = 'distance_boat_10000',    name = 'Aye-aye, Captain!',                      description = "Drive a boat for 10km (6.2mi)",                                   icon = 'sailboat',           stat_key = 'distance_boat',      threshold = 10000 },
        { key = 'distance_boat_100000',   name = 'Yacht Master',                           description = 'Drive a boat for 100km (62mi)',                                   icon = 'sailboat',           stat_key = 'distance_boat',      threshold = 100000 },
        { key = 'distance_bicycle_1000',  name = 'Carl Johnson',                           description = 'Travel 1km (0.6mi) on a bike',                                    icon = 'bike',               stat_key = 'distance_bicycle',   threshold = 1000 },
        { key = 'distance_bicycle_5000',  name = 'Around the hood',                        description = 'Travel 5km (3.1mi) on a bike',                                    icon = 'bike',               stat_key = 'distance_bicycle',   threshold = 5000 },
        { key = 'distance_bicycle_20000', name = 'Tour de San Andreas',                    description = 'Travel 20km (12.4mi) on a bike',                                  icon = 'bike',               stat_key = 'distance_bicycle',   threshold = 20000 },
        { key = 'distance_bike_10000',    name = 'Easy Rider',                             description = 'Drive a motorcycle for 10km (6.2mi)',                             icon = 'motorcycle',         stat_key = 'distance_bike',      threshold = 10000 },
        { key = 'distance_bike_50000',    name = 'Biker Gang',                             description = 'Drive a motorcycle for 50km (31mi)',                              icon = 'motorcycle',         stat_key = 'distance_bike',      threshold = 50000 },
        { key = 'distance_bike_100000',   name = 'Born to Ride',                           description = 'Drive a motorcycle for 100km (62mi)',                             icon = 'motorcycle',         stat_key = 'distance_bike',      threshold = 100000 },
        { key = 'distance_car_42000',     name = "Could've been a marathon",               description = 'Travel the length of a marathon... in a car',                     icon = 'car-front',          stat_key = 'distance_car',       threshold = 42000 },
        { key = 'distance_car_100000',    name = "Roadtrip",                               description = 'Travel 100km (62mi) in a car',                                    icon = 'car-front',          stat_key = 'distance_car',       threshold = 100000 },
        { key = 'distance_car_1000000',   name = "Megameter",                              description = 'Travel 1000km (620mi) in a car',                                  icon = 'car-front',          stat_key = 'distance_car',       threshold = 1000000 },
        { key = 'distance_car_4846000',   name = 'Cannonball Run',                         description = 'Travel the distance from Liberty City to Los Santos',             icon = 'car-front',          stat_key = 'distance_car',       threshold = 4846000 },
        { key = 'distance_car_10000000',  name = "*Check engine light lit up*",            description = 'Travel 10000km (6200mi) in a car',                                icon = 'car-front',          stat_key = 'distance_car',       threshold = 10000000 },
        { key = 'distance_car_40000000',  name = 'Around the world',                       description = 'Travel 40 000 Km (24 800 mi) in a vehicle',                       icon = 'car-front',          stat_key = 'distance_car',       threshold = 40000000 },
        { key = 'distance_foot_5000',     name = '5K',                                     description = 'Travel 5km (3.1mi) on foot',                                      icon = 'footprints',         stat_key = 'distance_foot',      threshold = 5000 },
        { key = 'distance_foot_12800',    name = 'This looks like a job for me',           description = 'Travel 8 miles (12.8km) on foot',                                 icon = 'footprints',         stat_key = 'distance_foot',      threshold = 12800 },
        { key = 'distance_foot_21000',    name = 'Half marathon',                          description = 'Travel 21km (13.1mi) on foot',                                    icon = 'footprints',         stat_key = 'distance_foot',      threshold = 21000 },
        { key = 'distance_foot_42000',    name = 'Marathon',                               description = 'Travel 42km (26.2mi) on foot',                                    icon = 'footprints',         stat_key = 'distance_foot',      threshold = 42000 },
        { key = 'distance_plane_50000',   name = 'Flight School Graduate',                 description = 'Fly for 50km (31mi) with a plane',                                icon = 'plane',              stat_key = 'distance_plane',     threshold = 50000 },
        { key = 'distance_plane_100000',  name = 'Certified Pilot',                        description = 'Fly for 100km (62mi) with a plane',                               icon = 'plane',              stat_key = 'distance_plane',     threshold = 100000 },
        { key = 'distance_plane_500000',  name = 'Skydweller',                             description = 'Fly for 500km (310mi) with a plane',                              icon = 'plane',              stat_key = 'distance_plane',     threshold = 500000 },
        { key = 'entity_kills_10',        name = 'Hunter',                                 description = 'Murder 10 Locals or animals.',                                    icon = 'skull',              stat_key = 'entity_kills',       threshold = 10 },
        { key = 'entity_kills_50',        name = 'Punisher',                               description = 'Murder 50 Locals or animals.',                                    icon = 'skull',              stat_key = 'entity_kills',       threshold = 50 },
        { key = 'entity_kills_200',       name = 'Insane in the brain',                    description = 'Murder 200 Locals or animals with no remorse',                    icon = 'skull',              stat_key = 'entity_kills',       threshold = 200 },
        { key = 'max_speed_car_22_22',    name = 'Grand Theft Auto',                       description = "Drive 80km/h (49mph) in a car",                                   icon = 'gauge',              stat_key = 'max_speed_car',      threshold = 22.32 },
        { key = 'max_speed_car_39_33',    name = '88 miles per hour!',                     description = "Roads? Where we're going, we don't need roads.",                  icon = 'gauge',              stat_key = 'max_speed_car',      threshold = 39.33 },
        { key = 'max_speed_car_53_64',    name = 'Stanley Rocket',                         description = "You would've broken the land speed record merely 100 years ago!", icon = 'gauge',              stat_key = 'max_speed_car',      threshold = 53.64 },
        { key = 'money_earned_500',       name = "It ain't much, but it's honest work",    description = 'Earn your first $500',                                            icon = 'circle-dollar-sign', stat_key = 'money_earned',       threshold = 500 },
        { key = 'money_earned_10000',     name = 'First paycheck',                         description = 'Earn $10 000 in total',                                           icon = 'circle-dollar-sign', stat_key = 'money_earned',       threshold = 10000 },
        { key = 'money_earned_50000',     name = 'Milburn Pennybags',                      description = 'Earn $50 000 in total',                                           icon = 'circle-dollar-sign', stat_key = 'money_earned',       threshold = 50000 },
        { key = 'money_earned_500000',    name = "Get Rich or Die Tryin'",                 description = 'Earn $500 000 in total',                                          icon = 'circle-dollar-sign', stat_key = 'money_earned',       threshold = 500000 },
        { key = 'money_earned_1000000',   name = 'Small loan of a million dollars',        description = 'Earn $1 000 000 in total',                                        icon = 'circle-dollar-sign', stat_key = 'money_earned',       threshold = 1000000 },
        { key = 'money_spent_1000',       name = 'Rent money',                             description = 'Spend $1000 in total',                                            icon = 'hand-coins',         stat_key = 'money_spent',        threshold = 1000 },
        { key = 'money_spent_50000',      name = 'Show me the money',                      description = 'Spend $50 000 in total',                                          icon = 'hand-coins',         stat_key = 'money_spent',        threshold = 50000 },
        { key = 'money_spent_100000',     name = 'Make money money go $hoppin',            description = 'Spend $100 000 in total',                                         icon = 'hand-coins',         stat_key = 'money_spent',        threshold = 100000 },
        { key = 'money_spent_1000000',    name = "Millionairn't",                          description = 'Spend $1 000 000 in total',                                       icon = 'hand-coins',         stat_key = 'money_spent',        threshold = 1000000 },
        { key = 'player_kills_1',         name = 'Call an ambulance! But not for me.',     description = 'Kill another player',                                             icon = 'skull',              stat_key = 'player_kills',       threshold = 1 },
        { key = 'player_kills_10',        name = 'Killing spree',                          description = 'Kill 10 players',                                                 icon = 'skull',              stat_key = 'player_kills',       threshold = 10 },
        { key = 'player_kills_100',       name = 'Menace to society',                      description = 'Kill 100 players',                                                icon = 'skull',              stat_key = 'player_kills',       threshold = 100 },
        { key = 'time_played_60',         name = 'Ah sh*t, here we go again.',             description = 'Play for 1 hour',                                                 icon = 'hourglass',          stat_key = 'time_played',        threshold = 60 },
        { key = 'time_played_480',        name = 'Full-time job',                          description = 'Play for 8 hours',                                                icon = 'hourglass',          stat_key = 'time_played',        threshold = 480 },
        { key = 'time_played_6000',       name = 'Giving it your 100',                     description = 'Play for 100 hours',                                              icon = 'hourglass',          stat_key = 'time_played',        threshold = 6000 },
        { key = 'time_played_1440',       name = 'It was a good day',                      description = 'Play for 1 day',                                                  icon = 'hourglass',          stat_key = 'time_played',        threshold = 1440 },
        { key = 'time_played_43200',      name = "Time flies when you're having fun!",     description = 'Play for 1 month',                                                icon = 'hourglass',          stat_key = 'time_played',        threshold = 43200 },
        { key = 'vehicles_destroyed_1',   name = 'Fender bender',                          description = 'Destroy first vehicle',                                           icon = 'bomb',               stat_key = 'vehicles_destroyed', threshold = 1 },
        { key = 'vehicles_destroyed_10',  name = 'Breathalyzer test',                      description = 'Destroy 10 vehicles',                                             icon = 'bomb',               stat_key = 'vehicles_destroyed', threshold = 10 },
        { key = 'vehicles_destroyed_100', name = 'Crash Connoisseur',                      description = 'Destroy 100 vehicles',                                            icon = 'bomb',               stat_key = 'vehicles_destroyed', threshold = 100 },
        { key = 'objects_destroyed_1',    name = "What's the red button for?",             description = 'Destroy your first object',                                       icon = 'bomb',               stat_key = 'objects_destroyed',  threshold = 1 },
        { key = 'objects_destroyed_10',   name = 'Should I cut the green wire?',           description = 'Destroy 10 objects',                                              icon = 'bomb',               stat_key = 'objects_destroyed',  threshold = 10 },
        { key = 'objects_destroyed_100',  name = 'Master of Destruction',                  description = 'Destroy 100 objects',                                             icon = 'bomb',               stat_key = 'objects_destroyed',  threshold = 100 },
        { key = 'weapon_headshots_1',     name = 'Bullseye',                               description = 'Shoot a first headshot.',                                         icon = 'scan-face',          stat_key = 'weapon_headshots',   threshold = 1 },
        { key = 'weapon_headshots_10',    name = 'Sharpshooter',                           description = '10 headshots - your accuracy is on point!',                       icon = 'scan-face',          stat_key = 'weapon_headshots',   threshold = 10 },
        { key = 'weapon_headshots_100',   name = 'Mind Blower',                            description = '100 headshots - truly mind-blowing precision!',                   icon = 'scan-face',          stat_key = 'weapon_headshots',   threshold = 100 },
        { key = 'weapon_shots_1',         name = 'Second Amendment FTW',                   description = 'Shoot a weapon',                                                  icon = 'target',             stat_key = 'weapon_shots',       threshold = 1 },
        { key = 'weapon_shots_1000',      name = 'Protecting Freedom',                     description = 'Shoot 1000 rounds from a weapon',                                 icon = 'target',             stat_key = 'weapon_shots',       threshold = 1000 },
        { key = 'weapon_shots_2000',      name = '50 pounds of Freedom',                   description = 'Shoot 2000 rounds from a weapon',                                 icon = 'target',             stat_key = 'weapon_shots',       threshold = 2000 },
    }

    for _, achievement in pairs(defaultAchievements) do
        MySQL.Sync.execute([[
            INSERT INTO rcore_stats_achievements (`key`, name, description, icon, stat_key, threshold)
            VALUES (@key, @name, @description, @icon, @stat_key, @threshold);
        ]], {
            ['@key'] = achievement.key,
            ['@name'] = achievement.name,
            ['@description'] = achievement.description,
            ['@icon'] = achievement.icon,
            ['@stat_key'] = achievement.stat_key,
            ['@threshold'] = achievement.threshold,
        })
    end
end

function InsertDatabaseSafely()
    dbg.info('Started inserting default database tables and data.')
    dbg.info('Checking if data already exists.')
    local result = {}

    for _, v in pairs(MySQL.Sync.fetchAll([[ SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = DATABASE() ]], {})) do
        result[v.TABLE_NAME] = true
    end

    if not result['rcore_stats_categories'] then
        dbg.info('Inserting rcore_stats_categories table to database')
        insertCategoriesDatabase()
        insertDefaultCategories()
    end

    if not result['rcore_stats_types'] then
        dbg.info('Inserting rcore_stats_types table to database')
        insertStatTypesDatabase()
        insertDefaultStatTypes()
    end

    if not result['rcore_stats_data'] then
        dbg.info('Inserting rcore_stats_data table to database')
        insertStatsDataDatabase()
        insertDefaultStatsData()
    end

    if not result['rcore_stats_achievements'] then
        dbg.info('Inserting rcore_stats_achievements table to database')
        insertAchievementsDatabase()
        insertDefaultAchievements()
    end

    dbg.info('Finished inserting default database tables and data.')
end
