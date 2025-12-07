CreateThread(function()
    if Config.Society == Society.QB_MANAGEMENT then
        SocietyService.GetBusinessMoney = function(businessName)
            local retval = 0

            if doesExportExistInResource("qs-banking", "GetAccountBalance") then
                return exports['qs-banking']:GetAccountBalance(businessName)
            end

            if doesExportExistInResource(Society.QB_MANAGEMENT, "GetAccount") then
                retval = exports[Society.QB_MANAGEMENT]:GetAccount(businessName)
            else
                if doesExportExistInResource(Society.QB_BANKING, "GetAccountBalance") then
                    retval = exports[Society.QB_BANKING]:GetAccountBalance(businessName)
                else
                    if isResourcePresentProvideless("codem-bank") and isResourcePresentProvideless("mBossmenu") then
                        local result = MySQL.query.await("SELECT amount FROM `management_funds` WHERE `job_name` = @businessName LIMIT 1", {
                            ['@businessName'] = businessName,
                        })
                        
                        if result and next(result) then
                            retval = result[1].amount
                        end
                    else
                        dbg.critical('Running qb_management without any supported fallback solution! [GetBusinessMoney]')
                    end
                end
            end

            return tonumber(retval)
        end

        SocietyService.RemoveMoney = function(businessName, amount)
            if doesExportExistInResource("qs-banking", "RemoveMoney") then
                return exports['qs-banking']:RemoveMoney(businessName, amount, "banners")
            end

            local success, result = pcall(function()
                if doesExportExistInResource(Society.QB_MANAGEMENT, "RemoveMoney") then
                    return exports[Society.QB_MANAGEMENT]:RemoveMoney(businessName, amount)
                else
                    if doesExportExistInResource(Society.QB_BANKING, "RemoveMoney") then
                        return exports[Society.QB_BANKING]:RemoveMoney(businessName, amount)
                    else
                        if isResourcePresentProvideless("codem-bank") and isResourcePresentProvideless("mBossmenu") then
                            local result = MySQL.query.await("SELECT amount FROM `management_funds` WHERE `job_name` = @businessName LIMIT 1", {
                                ['@businessName'] = businessName,
                            })

                            if result and next(result) then
                                local currentAmount = result[1].amount
                                local newAmount = currentAmount - amount

                                if newAmount <= 0 then
                                    return
                                end

                                MySQL.query.await("UPDATE `management_funds` SET `amount` = @amount WHERE `job_name` = @businessName", {
                                    ['@businessName'] = businessName,
                                    ['@amount'] = newAmount,
                                })
                            end
                        else
                            dbg.critical('Running qb_management without any supported fallback solution! [RemoveMoney]')
                        end
                    end
                end
            end)

            if not success then
                dbg.critical("Failed to remove society money %s for businessName %s: %s", amount, businessName, result)
            end

            return result
        end

        SocietyService.AddMoney = function(businessName, amount)
            if doesExportExistInResource("qs-banking", "AddMoney") then
                return exports['qs-banking']:AddMoney(businessName, amount, "banners")
            end

            local success, result = pcall(function()
                if doesExportExistInResource(Society.QB_MANAGEMENT, "AddMoney") then
                    return exports[Society.QB_MANAGEMENT]:AddMoney(businessName, amount)
                else
                    if doesExportExistInResource(Society.QB_BANKING, "AddMoney") then
                        return exports[Society.QB_BANKING]:AddMoney(businessName, amount)
                    end

                    if isResourcePresentProvideless("codem-bank") and isResourcePresentProvideless("mBossmenu") then
                        local result = MySQL.query.await("SELECT amount FROM `management_funds` WHERE `job_name` = @businessName LIMIT 1", {
                            ['@businessName'] = businessName,
                        })

                        if result and next(result) then
                            local currentAmount = result[1].amount
                            local newAmount = currentAmount + amount

                            if newAmount <= 0 then
                                return
                            end

                            MySQL.query.await("UPDATE `management_funds` SET `amount` = @amount WHERE `job_name` = @businessName", {
                                ['@businessName'] = businessName,
                                ['@amount'] = newAmount,
                            })
                        end
                    else
                        dbg.critical('Running qb_management without any supported fallback solution! [AddMoney]')
                    end
                end
            end)

            if not success then
                dbg.critical("Failed to add society money %s for businessName %s: %s", amount, businessName, result)
            end

            return result
        end


        SocietyService.RegisterBusiness = function(businessName)
            Wait(1000)
            
            if isResourcePresentProvideless("qs-banking") then
                return
            end

            local isRegistered = db.IsBusinessRegisteredQBManagement(businessName)

            if not isRegistered then
                db.RegisterBusinessQBManagement(businessName, 0)
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

            dbg.business('Returning society business: %s (named: %s)', account and "Account exists" or "Account is nil",
                businessName)

            return account
        end
    end
end)
