Config = Config or {}
Config.Permissions = {
    --[[
        value:string = an unique identifier for the permission, will be used for exports and internal use
        label:string = This is how players will see it in the game ui
        jobs: <table | false> = A table with jobs with access to use this permission or false to make it available to everyone
        default: boolean = Set this to true to give the permission to a new employee by default
    ]]--
    { value = "employees", label = "Employees", jobs = false, default = false }, -- Used for App (don't edit value field)
    { value = "products", label = "Products", jobs = false, default = false  }, -- Used for App (don't edit value field)
    { value = "bank", label = "Bank", jobs = false, default = false  }, -- Used for App (don't edit value field)
    { value = "applications", label = "Applications", jobs = false, default = false  }, -- Used for App (don't edit value field)
    { value = "stashes", label = "Stashes", jobs = false, default = true  }, -- Gives access to business stashes
    { value = "cameras", label = "Cameras", jobs = false, default = false  }, -- Gives access to business cameras (required for av_cameras)
    { value = "supplies", label = "Supplies", jobs = false, default = false  }, -- Used for App (don't edit value field) Gives access to supplies tab + npc
    { value = "billing", label = "Billing", jobs = false, default = false  }, -- Used for App (don't edit value field) Gives access to billing tab
    { value = "poster", label = "Poster", jobs = false, default = false  }, -- Used for App (don't edit value field) Gives access to poster tab
    { value = "deliveries", label = "Deliveries", jobs = false, default = true  }, -- Used for App (don't edit value field) Gives access to poster tab
--    { value = "evidence_stash",      label = "Evidence Stash", jobs = {"police", "bcso"}, default = true  }, -- Gives access to evidence stashes / this is just an example
}
