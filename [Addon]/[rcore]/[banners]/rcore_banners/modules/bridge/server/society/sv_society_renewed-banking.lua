CreateThread(function()
    if Config.Society == Society.RENEWED then
        SocietyService.GetBusinessMoney = function(business)
            local success, result = pcall(function()
                return exports[Society.RENEWED]:getAccountMoney(business)
            end)

            if not success then
                dbg.critical("Failed to get society money for business %s: %s", business, result)
                return 0
            end

            return tonumber(result)
        end

        SocietyService.RemoveMoney = function(business, amount)
            local success, result = pcall(function()
                return exports[Society.RENEWED]:removeAccountMoney(business, amount)
            end)

            if not success then
                dbg.critical("Failed to remove society money %s for business %s: %s", amount, business, result)
            end

            return result
        end

        SocietyService.AddMoney = function(business, amount)
            local success, result = pcall(function()
                return exports[Society.RENEWED]:addAccountMoney(business, amount)
            end)

            if not success then
                dbg.critical("Failed to add society money %s for business %s: %s", amount, business, result)
            end

            return result
        end


        SocietyService.RegisterBusiness = function(business)
            
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
            
            dbg.business('Returning society business: %s (named: %s)', account and "Account exists" or "Account is nil", businessName)
            
            return account
        end
    end
end)