CreateThread(function()
    if Config.Society == Society.FD_BANKING then
        SocietyService.GetBusinessMoney = function(business)
            local success, result = pcall(function()
                return exports[Society.FD_BANKING]:GetAccount(business)
            end)

            if not success then
                dbg.critical("Failed to get society money for business %s: %s", business, result)
                return 0
            end

            return tonumber(result)
        end

        SocietyService.RemoveMoney = function(business, amount)
            local success, result = pcall(function()
                return exports[Society.FD_BANKING]:RemoveMoney(business, amount)
            end)

            if not success then
                dbg.critical("Failed to remove society money %s for business %s: %s", amount, business, result)
            end

            return result
        end

        SocietyService.AddMoney = function(business, amount)
            local success, result = pcall(function()
                return exports[Society.FD_BANKING]:AddMoney(business, amount)
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
                dbg.debug('Failed to get society account: %s', businessName)
            end

            return account
        end
    end
end)