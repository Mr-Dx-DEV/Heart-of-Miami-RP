CreateThread(function()
    if Config.Society == Society.NONE then
        local registeredAccounts = {}

        --[[
            Since, no Society was detected on your server, we have emulation for society system
            By default each business has 50 000 USD as balance that can be used

        ]]

        --- @param business string Name of business
        SocietyService.GetBusinessMoney = function(business)
            local balance = registeredAccounts[business] 
            return balance
        end


        --- @param business string Name of business
        --- @param amount number Amount of money be removed
        --- @return boolean
        SocietyService.RemoveMoney = function(business, amount)
            if registeredAccounts[business] then
                registeredAccounts[business] = registeredAccounts[business] - amount 
            end
            
            return true
        end

        --- @param business string Name of business
        --- @param amount number Amount of money be added
        --- @return boolean
        SocietyService.AddMoney = function(business, amount)
            if registeredAccounts[business] then
                registeredAccounts[business] = registeredAccounts[business] + amount 
            end
            
            return true
        end

        
        --- @param business string Name of business
        --- @return boolean
        SocietyService.RegisterBusiness = function(business)
            if not registeredAccounts[business] then
                registeredAccounts[business] = 50 * 1000
            end

            dbg.business("Business named %s was registered!", business)

            return true
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