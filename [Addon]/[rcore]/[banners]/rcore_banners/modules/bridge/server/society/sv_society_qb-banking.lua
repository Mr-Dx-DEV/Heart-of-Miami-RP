CreateThread(function()
    if Config.Society == Society.QB_BANKING then
        SocietyService.GetBusinessMoney = function(business)
            local result = false

            if doesExportExistInResource(Society.QB_BANKING, 'GetAccountBalance') then
                result = exports[Society.QB_BANKING]:GetAccountBalance(business)
            else
                dbg.critical('qb-banking: Export named GetAccountBalance doesnt exist, loaded society: ', Config.Society)
            end

            if not result then
                dbg.critical("Failed to get society money for business %s: %s", business, result)
                return 0
            end

            return tonumber(result)
        end

        SocietyService.RemoveMoney = function(business, amount)
            local result = false

            if doesExportExistInResource(Society.QB_BANKING, 'RemoveMoney') then
                result = exports[Society.QB_BANKING]:RemoveMoney(business, amount)
            else
                dbg.critical('qb-banking: Export named RemoveMoney doesnt exist, loaded society: ', Config.Society)
            end

            if not result then
                dbg.critical("Failed to remove society money %s for business %s: %s", amount, business, result)
            end

            return result
        end

        SocietyService.AddMoney = function(business, amount)
            local result = false

            if doesExportExistInResource(Society.QB_BANKING, 'AddMoney') then
                result = exports[Society.QB_BANKING]:AddMoney(business, amount)
            else
                dbg.critical('qb-banking: Export named AddMoney doesnt exist, loaded society: ', Config.Society)
            end

            if not result then
                dbg.critical("Failed to add society money %s for business %s: %s", amount, business, result)
            end

            return result
        end


        SocietyService.RegisterBusiness = function(business)
            Wait(1000)

            local isRegistered = true

            if doesExportExistInResource(Society.QB_BANKING, 'GetAccount') then
                isRegistered = exports[Society.QB_BANKING]:GetAccount(business)
            else
                dbg.critical('qb-banking: Export named GetAccount doesnt exist, loaded society: ', Config.Society)
            end
            
            if not isRegistered then
                local success, result = pcall(function()
                    return exports[Society.QB_BANKING]:CreateJobAccount(business, 0)
                end)

                if not success then
                    return dbg.critical("Failed to register business named %s: %s", business, result)
                end

                dbg.business("Business named %s was registered!", business)
            else
                dbg.business("Business named %s is already registered.", business)
            end
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