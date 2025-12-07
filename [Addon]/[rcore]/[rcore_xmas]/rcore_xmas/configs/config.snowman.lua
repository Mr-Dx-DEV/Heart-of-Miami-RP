Config.Snowman = {                    -- [table] - Snowman building
    Enabled = true,                   -- [true/false] - Enables snowman building
    Command = 'snowman',              -- [string] - Command to start building
    Model = `bzzz_maku_snowmen_full`, -- [hash] - Snowman model
    Place = {                         -- [table] - Snowman placing
        Radius = 1.0,                 -- [float] - Radius of the parts building area (Work only with Target.NONE)
        HelpText = {                  -- Works only with Target.NONE
            Enabled = true,
        },
        Target = {
            icon = 'fa-solid fa-hammer', -- https://fontawesome.com/v5.15/icons?d=gallery&p=2&m=free
        },
        CancelTarget = {
            icon = 'fa-solid fa-times',
        },
    },
    FireDestroyable = true,                   -- [true/false] - Is the fire destroyable?
    BuiltModel = `bzzz_maku_snowmen_full`,
    Plan = {                                  -- [table] - Snowman building plan / "blueprint"
        [SNOWMAN_PART_BODY] = {               -- [string] - Part name
            Body = true,                      -- [true/false] - Is this part the body?
            Model = `bzzz_maku_snowmen_body`, -- [hash] - Part model
            Required = {                      -- [table] - Required items to build this part
                { item = 'WEAPON_SNOWBALL', amount = 5 },
            },
            Next = {
                [SNOWMAN_PART_HEAD] = {
                    Model = `bzzz_maku_snowmen_head`,
                    Offset = { -- [table] - Offset of the part
                        z = 0.95
                    },
                    Required = {
                        { item = 'WEAPON_SNOWBALL', amount = 5 },
                    },
                    Next = {
                        [SNOWMAN_PART_SCARF] = {
                            Model = `bzzz_maku_snowmen_scarf`,
                            Required = {
                                { item = 'WEAPON_SNOWBALL', amount = 5 },
                            },
                            Offset = {
                                r = 0.02,
                                z = 0.63
                            },
                            Target =
                                SNOWMAN_PART_BODY -- [string] - Attach target (third-eye) to this part if it's too small
                        },
                        [SNOWMAN_PART_HAT] = {
                            Model = `bzzz_maku_snowmen_hat`,
                            Required = {
                                { item = 'WEAPON_SNOWBALL', amount = 5 },
                            },
                            Offset = {
                                r = 0.05, -- [float] - Radius of the circle for counting the offset
                                h = 90.0, -- [float] - Added degree to the rotation
                                z = 1.4   -- [float] - Height offset
                            }
                        },
                        [SNOWMAN_PART_NOSE] = {
                            Model = `bzzz_maku_snowmen_nose`,
                            Required = {
                                { item = 'WEAPON_SNOWBALL', amount = 5 },
                            },
                            Offset = {
                                r = -0.3,
                                h = 90.0,
                                z = 1.2
                            }
                        },
                        [SNOWMAN_PART_FACE] = {
                            Model = `bzzz_maku_snowmen_face`,
                            Required = {
                                { item = 'WEAPON_SNOWBALL', amount = 5 },
                            },
                            Offset = {
                                z = 0.32
                            },
                            Target = SNOWMAN_PART_BODY
                        },
                    }
                },
                [SNOWMAN_PART_HANDS] = {
                    Model = `bzzz_maku_snowmen_hands`,
                    Required = {
                        { item = 'WEAPON_SNOWBALL', amount = 5 },
                    },
                    Offset = {
                        z = 0.8
                    },
                    Target = SNOWMAN_PART_BODY
                }
            }
        },
    }
}
