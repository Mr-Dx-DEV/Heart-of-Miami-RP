function IsResourceOnServer(resourceName)
    if GetResourceState(resourceName) == "started" or GetResourceState(resourceName) == "starting" then
        return true
    end
    return false
end

if Config == nil then
    Config = {}
end

local function checkOxVersion()
    local OxMySQLVersion = GetResourceMetadata("oxmysql", "version"):gsub("%D+", "")
    OxMySQLVersion = tonumber(OxMySQLVersion)

    if OxMySQLVersion <= 189 then
        -- is older than 2.0.0 version we're going to
        -- switch to old exports to make sure
        Config.MysqlType = MySQLFramework.OX_MYSQL
    else
        -- is newest we will trust the bridge for mysql-async will work on their part.
        Config.MysqlType = MySQLFramework.MYSQL_ASYNC
    end
end

if Config.MysqlType == 0 then
    if IsResourceOnServer("oxmysql") then
        checkOxVersion()
    elseif IsResourceOnServer("mysql-async") then
        Config.MysqlType = MySQLFramework.MYSQL_ASYNC
    else
        print('Use oxmysql or mysql-async for database connection!')
        print('Use oxmysql or mysql-async for database connection!')
        print('Use oxmysql or mysql-async for database connection!')
    end
end

-- Fallback to handle oxmysql version in case of no auto detection
if Config.MysqlType == MySQLFramework.OX_MYSQL then
    if IsResourceOnServer("oxmysql") then
        checkOxVersion()
    else
        print('Use oxmysql or mysql-async for database connection!')
        print('Use oxmysql or mysql-async for database connection!')
        print('Use oxmysql or mysql-async for database connection!')
    end
end

if Config.MysqlType == MySQLFramework.OX_MYSQL then
    MySQL = {}
    MySQL.Sync = {}
    MySQL.Async = {}

    function MySQL.Sync.fetchAll(query, table_, cb)
        return exports['oxmysql']:executeSync(query, table_, cb)
    end

    function MySQL.Async.fetchAll(query, table_, cb)
        return exports['oxmysql']:execute(query, table_, cb)
    end

    ---
    -- sync / async
    function MySQL.Sync.execute(query, table_, cb)
        return exports['oxmysql']:executeSync(query, table_, cb)
    end

    function MySQL.Async.execute(query, table_, cb)
        return exports['oxmysql']:execute(query, table_, cb)
    end

    -- sync / async
    function MySQL.Sync.insert(query, table_, cb)
        return exports['oxmysql']:insert(query, table_, cb)
    end

    function MySQL.Async.insert(query, table_, cb)
        return exports['oxmysql']:insert_async(query, table_, cb)
    end

    function MySQL.Sync.transaction(query, table_, cb)
        return exports['oxmysql']:transaction(query, table_, cb)
    end
end
