CreateThread(function()
    if Config.Society == Society.QS then
        SocietyService.GetBusinessMoney = function(businessName)
            return exports['qs-banking']:GetAccountBalance(businessName)
        end

        SocietyService.RemoveMoney = function(businessName, amount)
            return exports['qs-banking']:RemoveMoney(businessName, amount, "banners")
        end

        SocietyService.AddMoney = function(businessName, amount)
            return exports['qs-banking']:AddMoney(businessName, amount, "banners")
        end

        SocietyService.RegisterBusiness = function(businessName)

        end

        SocietyService.GetAccount = function(businessName)
            local account = nil
            local accountBalance = SocietyService.GetBusinessMoney(businessName)

            if accountBalance and accountBalance >= 0 then
                account = {
                    AddMoney = function(amount)
                        SocietyService.AddMoney(businessName, amount)
                    end,
                    RemoveMoney = function(amount)
                        SocietyService.RemoveMoney(businessName, amount)
                    end,
                    GetBalance = function()
                        return SocietyService.GetBusinessMoney(businessName)
                    end
                }
            else
                dbg.business('Failed to get society account: %s', businessName)
            end

            dbg.business('Returning society business: %s (named: %s)', account and "Account exists" or "Account is nil",
                businessName)

            return account
        end
    end
end)


