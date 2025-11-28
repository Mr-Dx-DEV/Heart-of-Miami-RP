local identifiers = {}

AddEventHandler('QBCore:Player:SetPlayerData', function(Player)
    if Player then
        runExpired(Player.source,Player.cid)
    end
end)

AddEventHandler('esx:addAccountMoney', function(src, account)
    local cid = identifiers[src] or exports['av_laptop']:getIdentifier(src)
    identifiers[src] = cid
    if account == Config.BankAccount then
        runExpired(src,cid)
    end
end)

AddEventHandler('esx:setAccountMoney', function(src, account)
    local cid = identifiers[src] or exports['av_laptop']:getIdentifier(src)
    identifiers[src] = cid
    if account == Config.BankAccount then
        runExpired(src,cid)
    end
end)