if Config.BillingCommand then
    lib.addCommand(Config.BillingCommand, {
        help = 'Player Invoices',
        params = {},
    }, function(source)
        TriggerClientEvent('av_business:openBilling', source)
    end)
end

if Config.Command then
    lib.addCommand(Config.Command, {
        help = 'Business Admin',
        params = {},
        restricted = Config.AdminLevel
    }, function(source)
        TriggerClientEvent('av_business:openAdmin', source)
    end)
end