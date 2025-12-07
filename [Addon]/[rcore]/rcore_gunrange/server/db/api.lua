db = {}

Citizen.CreateThread(function()
    Citizen.Wait(2000)
    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS gunrange_rented (
            `identifier` VARCHAR(50) NOT NULL,
            `weapon` VARCHAR(50) NOT NULL,
            `stored_weapons` LONGTEXT NOT NULL,

            PRIMARY KEY (`identifier`)
        );
    ]])
end)

function db.saveRentedWeapon(identifier, weapon, storedWeapons)
    storedWeapons = json.encode(storedWeapons)
    MySQL.Async.execute(
        'INSERT INTO gunrange_rented (identifier, weapon, stored_weapons) VALUES (@identifier, @weapon, @stored_weapons)',
        {
            ['@identifier'] = identifier,
            ['@weapon'] = weapon,
            ['@stored_weapons'] = json.encode(storedWeapons)
        },
        function(rowsChanged)
            if rowsChanged > 0 then
                print('Saved rented weapon for ' .. identifier)
            end
        end
    )
end

function db.deleteRentedWeapon(identifier)
    MySQL.Async.execute('DELETE FROM gunrange_rented WHERE identifier = @identifier', {
        ['@identifier'] = identifier
    })
end

function db.getWeapons(identifier)
    local row = MySQL.Sync.fetchAll('SELECT weapon, stored_weapons FROM gunrange_rented WHERE identifier = @identifier',
        {
            ['@identifier'] = identifier
        }
    )
    if row[1] ~= nil then
        return row[1].weapon, json.decode(row[1].stored_weapons)
    end
    return nil, nil
end
