Config.Business = {
    Enabled = true, -- Enable business system
    
    ServiceFee = true, -- Enable service fee (deducting money from business account for service fee of billboard)
    ServiceFeeTime = 14, -- Each X days service fee is taken from business bank account
    ServiceFeePercentage = 10, -- 10% of billboard price is taken from business account
    IterationTime = 5, -- How often to check for service fee payments of all billboards on server (5 minutes default)

    SellBannerPercentage = 50, -- 50% of billboard price is given to player when selling -> Only for when owner of billboard sells billboard
    SellBannerSocietyState = true, -- Do you want to gave money to specific society instead of void? -> Only for when owner of billboard sells billboard
    SellBannerSociety = 'gov', -- If SellBannerSocietyState is true, this society will receive the money after selling the billboard. -> Only for when owner of billboard sells billboard
    SellBannerSocietyPercentage = 50, -- What percentage will society receive from each billboard sale (based off SellBannerPercentage). 

    Printers = {
        ProductionItemNeed = false, -- Should player have item to produce banners?
        ProductionItem = 'paper', -- Which item is needed for production?
        Cooldown = 2-- 2 mins cooldown between each production
    },

    SocietyOptionsESX = {
        checkBal = true, -- Allow to check society money from boss menu.
        withdraw = true, -- Allow to withdraw from society (boss menu)
        deposit = true, -- Allow to deposit to society (boss menu)
        employees = true, -- Allow to hire employees in business (boss menu)
        salary = true, -- Allow to adjust employeees salary (boss menu)
        grades = true, -- Allow to adjust grades in boss menu.
        wash = false, -- Allow to wash business money.
    },

    NeedSocietyMoneyForRent = false, -- This option will check if business has enough money to rent billboard.

    -- List of job grades, which holds specific permission access.
    Permissions = {
        ['member'] = {
            ['workstation'] = {
                [WORKSTATION_PERMS.ACCESS_WORKSTATION_CUSTOM] = false,
                [WORKSTATION_PERMS.ACCESS_WORKSTATION_MANAGEMENT] = false,
                [WORKSTATION_PERMS.CAN_SET_BANNER] = false,
                [WORKSTATION_PERMS.CAN_UPDATE_TARGET_BATCH] = false,
                [WORKSTATION_PERMS.CAN_STOP_TARGET_PRODUCTION] = false,
                [WORKSTATION_PERMS.CAN_SET_PRINTER_NAME] = false,
                [WORKSTATION_PERMS.ACCESS_CUSTOM_BANNER] = false,
            },
            ['billboards'] = {
                [BILLBOARDS_PERMS.BUY_BILLBOARD] = false,
            },
            ['app'] = {
                [APP_PERMS.ACCESS_REMOVE_JOB_BANNER] = false,
            }
        },
        ['novice'] = {
            ['workstation'] = {
                [WORKSTATION_PERMS.ACCESS_WORKSTATION_CUSTOM] = false,
                [WORKSTATION_PERMS.ACCESS_WORKSTATION_MANAGEMENT] = false,
                [WORKSTATION_PERMS.CAN_SET_BANNER] = false,
                [WORKSTATION_PERMS.CAN_UPDATE_TARGET_BATCH] = false,
                [WORKSTATION_PERMS.CAN_STOP_TARGET_PRODUCTION] = false,
                [WORKSTATION_PERMS.CAN_SET_PRINTER_NAME] = false,
                [WORKSTATION_PERMS.ACCESS_CUSTOM_BANNER] = false,
            },
            ['billboards'] = {
                [BILLBOARDS_PERMS.BUY_BILLBOARD] = false,
            },
            ['app'] = {
                [APP_PERMS.ACCESS_REMOVE_JOB_BANNER] = false,
            }
        },
        ['boss'] = {
            ['workstation'] = {
                [WORKSTATION_PERMS.ACCESS_WORKSTATION_CUSTOM] = true,
                [WORKSTATION_PERMS.ACCESS_WORKSTATION_MANAGEMENT] = true,
                [WORKSTATION_PERMS.CAN_SET_BANNER] = true,
                [WORKSTATION_PERMS.CAN_UPDATE_TARGET_BATCH] = true,
                [WORKSTATION_PERMS.CAN_STOP_TARGET_PRODUCTION] = true,
                [WORKSTATION_PERMS.CAN_SET_PRINTER_NAME] = true,
                [WORKSTATION_PERMS.ACCESS_CUSTOM_BANNER] = true,
            },
            ['billboards'] = {
                [BILLBOARDS_PERMS.BUY_BILLBOARD] = true,
            },
            ['app'] = {
                [APP_PERMS.ACCESS_REMOVE_JOB_BANNER] = true,
            }
        },
        ['chief'] = {
            ['workstation'] = {
                [WORKSTATION_PERMS.ACCESS_WORKSTATION_CUSTOM] = true,
                [WORKSTATION_PERMS.ACCESS_WORKSTATION_MANAGEMENT] = true,
                [WORKSTATION_PERMS.CAN_SET_BANNER] = true,
                [WORKSTATION_PERMS.CAN_UPDATE_TARGET_BATCH] = true,
                [WORKSTATION_PERMS.CAN_STOP_TARGET_PRODUCTION] = true,
                [WORKSTATION_PERMS.CAN_SET_PRINTER_NAME] = true,
                [WORKSTATION_PERMS.ACCESS_CUSTOM_BANNER] = true,
            },
            ['billboards'] = {
                [BILLBOARDS_PERMS.BUY_BILLBOARD] = true,
            },
            ['app'] = {
                [APP_PERMS.ACCESS_REMOVE_JOB_BANNER] = true,
            }
        },
        ['manager'] = {
            ['workstation'] = {
                [WORKSTATION_PERMS.ACCESS_WORKSTATION_CUSTOM] = true,
                [WORKSTATION_PERMS.ACCESS_WORKSTATION_MANAGEMENT] = true,
                [WORKSTATION_PERMS.CAN_SET_BANNER] = true,
                [WORKSTATION_PERMS.CAN_UPDATE_TARGET_BATCH] = true,
                [WORKSTATION_PERMS.CAN_STOP_TARGET_PRODUCTION] = true,
                [WORKSTATION_PERMS.CAN_SET_PRINTER_NAME] = true,
                [WORKSTATION_PERMS.ACCESS_CUSTOM_BANNER] = true,
            },
            ['billboards'] = {
                [BILLBOARDS_PERMS.BUY_BILLBOARD] = true,
            },
            ['app'] = {
                [APP_PERMS.ACCESS_REMOVE_JOB_BANNER] = true,
            }
        }
    },

    -- List of business 

    List = {
        ['gov'] = {
            enabled = true, -- Is business enabled and can be used?
            name = "gov", -- Name of business
            label = 'Government',
            pos = vec3(-545.098, -204.000, 38.215), -- Location of business
            blipEnabled = false, -- Should show blip on the map?
            blip = {
                name = "GOV",
                color = 5, -- Yellow
                scale = 1.0, -- Blip size
                sprite = 783, -- See https://docs.fivem.net/docs/game-references/blips/ if you want to change it to something else.
            },
            stations = {},
            interact = {
                {
                    type = Interact.BOSS_MENU,
                    pos = vec3(-546.980, -207.210, 38.127),
                    heading = 29.817,
                    blip = {
                        enabled = true,
                        name = "Boss menu",
                        color = 4, -- Yellow
                        scale = 0.8, -- Blip size
                        sprite = 475, -- See https://docs.fivem.net/docs/game-references/blips/ if you want to change it to something else.
                    },
                }
            },
            
        },
        ['printers'] = {
            enabled = true, -- Is business enabled and can be used?
            name = "printers", -- Name of business
            label = 'Printers',
            pos = vec3(-1064.736, -243.742, 44.021), -- Location of business
            blipEnabled = true, -- Should show blip on the map?
            blip = {
                name = "Printers",
                color = 5, -- Yellow
                scale = 1.0, -- Blip size
                sprite = 783, -- See https://docs.fivem.net/docs/game-references/blips/ if you want to change it to something else.
            },
            stations = {
                {
                    type = Interact.PRODUCTION_MINIGAME,
                    pos = vec3(-1053.698, -230.260, 44.021),
                    heading = 296.965
                },
                {
                    type = Interact.PRODUCTION_MINIGAME,
                    pos = vec3(-1053.114, -231.452, 44.021),
                    heading = 296.965
                },
            },
            interact = {
                {
                    type = Interact.BOSS_MENU,
                    pos = vec3(-1050.323, -242.605, 44.020),
                    heading = 126.0,
                    blip = {
                        enabled = true,
                        name = "Boss menu",
                        color = 4, -- White
                        scale = 0.8, -- Blip size
                        sprite = 475, -- See https://docs.fivem.net/docs/game-references/blips/ if you want to change it to something else.
                    },
                }
            },
        },
    }
}