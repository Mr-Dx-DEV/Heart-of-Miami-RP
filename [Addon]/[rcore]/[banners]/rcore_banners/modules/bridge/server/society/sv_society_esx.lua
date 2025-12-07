CreateThread(function()
    if Config.Society == Society.ESX then
        SocietyService.GetBusinessMoney = function(business)
            local p = promise.new()
            local societyPrefix = ('%s_%s'):format('society', business)
            local retval = nil

            TriggerEvent(Config.Events['esx_addonaccount:getSharedAccount'], societyPrefix, function(account)
                if account then
                    retval = account.money
                end

                p:resolve(true)
            end)

            Citizen.Await(p)

            return retval
        end

        SocietyService.RemoveMoney = function(business, amount)
            local p = promise.new()
            local societyPrefix = ('%s_%s'):format('society', business)
            local retval = false

            TriggerEvent(Config.Events['esx_addonaccount:getSharedAccount'], societyPrefix, function(account)
                if account then
                    account.removeMoney(amount)
                    retval = true
                end

                p:resolve(true)
            end)

            Citizen.Await(p)

            return retval
        end

        SocietyService.AddMoney = function(business, amount)
            local p = promise.new()
            local societyPrefix = ('%s_%s'):format('society', business)
            local retval = false

            TriggerEvent(Config.Events['esx_addonaccount:getSharedAccount'], societyPrefix, function(account)
                if account then
                    account.addMoney(amount)
                    retval = true
                end

                p:resolve(true)
            end)

            Citizen.Await(p)

            return retval
        end


        SocietyService.RegisterBusiness = function(business)
            if isResourcePresentProvideless(THIRD_PARTY.LB_PHONE) then
                local version = GetResourceMetadata(THIRD_PARTY.LB_PHONE, 'version', 0)

                if version and version >= '1.7.0' then
                    return
                end
            end

            TriggerEvent(Config.Events['esx_society:registerSociety'] or 'esx_society:registerSociety', 
                business,
                business, business, business, business, {
                type = "private"
            })
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
