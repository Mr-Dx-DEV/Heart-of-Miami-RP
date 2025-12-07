API = {}

API.SendHeartbeat = function(actionName, originCb, ...)
    TriggerEvent('rcore_banners:server:business:API', actionName, ..., function(retval)
        originCb(retval)
    end)
end

AddEventHandler('rcore_banners:server:business:API', function(action, data, cb)
    dbg.business('Received task: %s', action)

    if action == 'RENT_BILLBOARD' then
        local state = RentBillboard(data.playerId, data.billboardId)
        cb(state)
    elseif action == 'TRANSFER_BILLBOARD' then
        local state = TransferBillboard(data.playerId, data.businessName, data.billboardId)
        cb(state)
    elseif action == 'SET_BILLBOARD_IMAGE' then
        local state = SetBillboardImage(data.playerId, data.data, data.side, data.billboardId)
        cb(state)
    else
        cb(true)
    end
end)

function SetBillboardImage(Source, data, side, billboardId)
    local retval = false
    local state, job = IsPlayerAllowedToRegisterBillboard(Source)

    if state and job then
        if FrameworkService.IsAuthorisedForBillboard(Source) then
            if IsBillboardOwnedByTarget(billboardId, job.name) then
                BillboardAPI({
                    initiator = Source,
                    initiatorName = GetPlayerName(Source),
                    billboardId = billboardId,
                    owner = job.name,
                    action = 'setBillboardImage',
                    data = {
                        side = side,
                        banner_name = data['banner_name'],
                        banner_iamge = data['banner_image']
                    }
                })
                RefreshBillboardWithImage(billboardId, data, Source, side)

                retval = true
            else
                ShowNotification(Source, _U('BILLBOARD_BUSINESS.TITLE_LABEL'),
                    _U('BILLBOARD_BUSINESS.SET_BILLBOARD_IMAGE_NOT_OWNER'), 'error')
            end
        else
            ShowNotification(Source, _U('BILLBOARD_BUSINESS.TITLE_LABEL'),
                _U('BILLBOARD_BUSINESS.YOU_ARE_NOT_AUTHRORIZED'), 'error')
        end
    end

    return retval
end

function TransferBillboard(Source, businessName, billboardId)
    local retval = false
    local state, job = IsPlayerAllowedToRegisterBillboard(Source)

    if state and job then
        if FrameworkService.IsAuthorisedForManagementMenu(Source) and IsBillboardOwnedByTarget(billboardId, job.name) then
            if type(businessName) ~= 'string' then
                return
            end

            if businessName == job.name then
                return ShowNotification(Source, _U('BILLBOARD_BUSINESS.TITLE_LABEL'),
                    _U('BILLBOARD_BUSINESS.TRANSFER_BILLBOARD_NOT_YOURSELF'), 'error')
            end

            local ownerName = businessName

            if Config.Business.List[ownerName] and Config.Business.List[ownerName].enabled then
                dbg.business('Transfered billboard ownership [%s] by user [%s] to: %s', billboardId,
                    GetPlayerName(Source),
                    ownerName)

                RefreshBillboardState(billboardId, ownerName, BILLBOARD_STATES.OWNED, 'sold')

                SetTimeout(500, function()
                    StartClient(-1, 'updateBillboardMarker', billboardId, nil)
                    SyncBillboardsData(billboardId)
                end)

                BillboardAPI({
                    initiator = Source,
                    initiatorName = GetPlayerName(Source),
                    billboardId = billboardId,
                    owner = job.name,
                    action = 'transferBillboard',
                    data = {
                        transferTo = businessName,
                        state = BILLBOARD_STATES.OWNED,
                    }
                })

                retval = true
            else
                ShowNotification(Source, _U('BILLBOARD_BUSINESS.TITLE_LABEL'), _U('BILLBOARD_BUSINESS.UNK_BUSINESS'),
                    'error')
            end
        end
    end

    return retval
end

function RentBillboard(Source, billboardId)
    local retval = false

    if CanBillboardBeRentend(billboardId) then
        local state, job = IsPlayerAllowedToRegisterBillboard(Source)
        local _, serviceFee, buyPrice = GetBillboardPrice(billboardId)
        local access = GetPermissionToStation(Source, job.name, 'billboards')
        local price = FormatCurrency(buyPrice)

        if state and job then
            if access[BILLBOARDS_PERMS.BUY_BILLBOARD] then
                dbg.business(
                    'RentBillboard: User [%s] has enough permissions [BILLBOARD_PERMS_BUY_BILLBOARD] when trying to buy billboard!',
                    GetPlayerName(Source))

                local business = SocietyService.GetAccount(job.name)

                if Config.Business.NeedSocietyMoneyForRent then
                    if business then
                        local factionMoney = business.GetBalance()

                        if factionMoney and factionMoney >= buyPrice then
                            dbg.business('RentBillboard: Removing amount %s from society named: %s by player %s',
                                buyPrice, job.name, GetPlayerName(Source))
                            business.RemoveMoney(buyPrice)
                        else
                            return ShowNotification(Source, _U('BILLBOARD_BUSINESS.TITLE_LABEL'),
                                _U('BILLBOARD_BUSINESS.BUY_BUSINESS_BILLBOARD_NOT_ENOUGH_MONEY', price), 'error')
                        end
                    else
                        dbg.critical(
                            'RentBillboard: Faction society account named [%s] does not exist - when user %s, from job named: %s tried to buy billboard, but still allow to buy billboard',
                            job.name, GetPlayerName(Source), job.name)
                    end
                end

                RefreshBillboardState(billboardId, job and job.name, BILLBOARD_STATES.OWNED)

                if Config.Business.ServiceFee then
                    dbg.business('RentBillboard: Setting service fee for billboard [%s] by user [%s]', billboardId,
                        GetPlayerName(Source))
                    db.InsertServiceFee(billboardId, GetServiceFeeTime())
                end

                SetTimeout(500, function()
                    StartClient(-1, 'updateBillboardMarker', billboardId, job and job.name)
                    SyncBillboardsData(billboardId)
                end)

                if Config.Business.NeedSocietyMoneyForRent then
                    ShowNotification(Source, _U('BILLBOARD_BUSINESS.TITLE_LABEL'),
                        _U('BILLBOARD_BUSINESS.BUY_BUSINESS_BILLBOARD_SUCC', price), 'success')
                else
                    ShowNotification(Source, _U('BILLBOARD_BUSINESS.TITLE_LABEL'),
                        _U('BILLBOARD_BUSINESS.BUY_BUSINESS_BILLBOARD_RECEIVED_OWNERSHIP'), 'success')
                end

                StartClient(Source, 'playerBuyBusinessBillboard')

                BillboardAPI({
                    initiator = Source,
                    initiatorName = GetPlayerName(Source),
                    billboardId = billboardId,
                    owner = job.name,
                    action = 'buyBillboard',
                    buyPrice = Config.Business.NeedSocietyMoneyForRent and 'FREE' or buyPrice
                })

                retval = true
            else
                dbg.business(
                    'RentBillboard: User doesnt have enough permissions [BILLBOARD_PERMS_BUY_BILLBOARD] when trying to buy billboard!',
                    state, GetPlayerName(Source))
                ShowNotification(Source, _U('BILLBOARD_BUSINESS.TITLE_LABEL'),
                    _U('BILLBOARD_BUSINESS.YOU_DONT_HAVE_PERMISSION_TO_BUY_THIS_BILLBOARD',
                        BILLBOARDS_PERMS.BUY_BILLBOARD),
                    'error')
            end
        else
            dbg.business('RentBillboard: User doesnt have state: %s access when user: %s tried to buy billboard!', state,
                GetPlayerName(Source))
            ShowNotification(Source, _U('BILLBOARD_BUSINESS.TITLE_LABEL'),
                _U('BILLBOARD_BUSINESS.BUY_BUSINESS_BILLBOARD_NOT_VALID'), 'error')
        end
    else
        ShowNotification(Source, _U('BILLBOARD_BUSINESS.TITLE_LABEL'),
            _U('BILLBOARD_BUSINESS.BUY_BUSINESS_BILLBOARD_IS_OWNED'), 'error')
    end

    return retval
end
