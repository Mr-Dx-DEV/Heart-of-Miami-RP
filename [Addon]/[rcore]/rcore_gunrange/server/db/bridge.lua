local databaseResource = Config.Database

if databaseResource == nil then
    for _, resource in pairs(Database) do
        if isResourceLoaded(resource) then
            databaseResource = resource
            break
        end
    end
end

if databaseResource == nil or not isResourceLoaded(databaseResource) then
    print(string.format('^1[error] ^0Database resource %s was not found!', databaseResource))
    return
end

if databaseResource ~= 'mysql-async' then
    MySQL = {
        Sync = {},
        Async = {}
    }

    function MySQL.Sync.fetchAll(query, table, cb)
        return exports[databaseResource]:executeSync(query, table, cb)
    end

    function MySQL.Sync.fetchScalar(query, table, cb)
        return exports[databaseResource]:scalar(query, table, cb)
    end

    function MySQL.Sync.execute(query, table, cb)
        return exports[databaseResource]:executeSync(query, table, cb)
    end

    function MySQL.Sync.insert(query, table, cb)
        return exports[databaseResource]:insert(query, table, cb)
    end

    function MySQL.Async.fetchAll(query, table, cb)
        return exports[databaseResource]:execute(query, table, cb)
    end

    function MySQL.Async.execute(query, table, cb)
        return exports[databaseResource]:execute(query, table, cb)
    end
end
