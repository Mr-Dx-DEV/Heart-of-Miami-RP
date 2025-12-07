Config = {
    Debug = false, -- [true/false] - Enables debug mode, which will print additional information to the console.

    Locale = 'en', -- Locale for translations (locales/[locale].lua)

    IgnoredLocales = {},

    --[[
        ⚠️ IMPORTANT NOTICE ⚠️
            This script is designed to work with multiple frameworks and inventories.
            It automatically detects the framework, inventory, database, and target resources.
            If you want to use a specific resource instead of auto-detecting, you can change the settings below.
            However, it is recommended to use AUTO_DETECT unless you have a specific reason to change it.

        ⚠️ INVENTORIES ⚠️
            The supported inventories are listed below. If an inventory is not included here, it is probably incompatible
            and does not have the features for xmas script functionality.
            If there is an issue, please contact us in ticket to add support for the inventory.
            Supported inventories are:
            * OX Inventory
            * QB Inventory
            * QS Inventory
            * MF Inventory
            * PS Inventory
            * LJ Inventory
            * CORE Inventory
            * Chezza Inventory
            * Codem Inventory
            * Origen Inventory
            * Tgiann Inventory
            * Ak47 Inventory
            * Ak47 QB Inventory
            * ESX Inventory
            * NONE Inventory (Standalone)
    ]]
    Framework = Framework.AUTO_DETECT,    -- [ESX - es_extended, QBCore - qb-core, QBX - qbx_core, Standalone - none]
    Inventory = Inventory.AUTO_DETECT,
    Target = Target.AUTO_DETECT,          -- [NONE - none (pressing E), OX - ox_target, QB - qb-target, Q - qtarget]
    Database = Database.AUTO_DETECT,      -- [OX - ox_mysql, MYSQL_ASYNC - mysql-async, GHMATTI - ghmattimysql]

    XmasWeather = true,                   -- [true/false] - Enables Xmas weather.
    EnableVehicleTrailsEverywhere = true, -- [true/false] - Enables vehicle trails everywhere.
    EnablePedFootstepsEverywhere = true,  -- [true/false] - Enables ped footsteps everywhere.
    WaterFreezes = 0.0,                   -- [float] - The strength of the frozen water effect. 0.0 = no frozen water, 3.0 = completely frozen water.
    SnowIntensity = 1.0,                  -- [float] - The intensity of the snow effect. 0.0 = no snow, 1.0 = heavy snow.

    AcePermsInsteadOfFramework = false,   -- [true/false] - Enables ACE permissions instead of framework permissions.

    FrameworkAdminGroups = {
        [Framework.ESX] = { 'superadmin', 'admin' },
        [Framework.QBCore] = { 'god', 'admin' },
    },

    CancelProgressBar = {
        Key = 194,
        Label = 'INPUT_FRONTEND_RRIGHT',
    },
}
