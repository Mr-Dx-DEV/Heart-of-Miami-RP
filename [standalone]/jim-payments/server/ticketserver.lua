RegisterServerEvent(getScript()..":Tickets:Give", function(data, biller, gang)
    local src = source
	local activePlayers = GetPlayers()
	local commPercent = 0
	jsonPrint(data)

	-- Check if it's a PolCharge fine or regular job payment
	local commPercent = Config.PolCharge.FineJobs[data.society] and Config.PolCharge.FineJobs[data.society].Commission or 0.25

	-- For regular jobs with commission split enabled, calculate commission
	local takecomm = 0
	if Config.Receipts.CommissionSplit and Config.Receipts.Jobs[data.society] and Config.Receipts.Jobs[data.society].Commission then
		takecomm = math.floor(data.amount * Config.Receipts.Jobs[data.society].Commission)
	elseif Config.PolCharge.FineJobs[data.society] then
		takecomm = math.floor(data.amount * commPercent)
	end

	if biller ~= nil then -- If this is found, it ISN'T a phone payment, so add money to society here
		local amountChange, newAmount = (data.amount - takecomm), 0
		local society = gang and tostring(biller.gang) or tostring(biller.job)
		local bankScript = nil
		if isStarted("Renewed-Banking") then
			bankScript = "Renewed-Banking"
			exports["Renewed-Banking"]:addAccountMoney(society, amountChange)
			newAmount = exports["Renewed-Banking"]:getAccountMoney(society)

		elseif isStarted("qb-banking") then
			bankScript = "qb-banking"
			exports["qb-banking"]:AddMoney(society, amountChange, "Cash Register Payment")
			newAmount = exports["qb-banking"]:GetAccountBalance(society)

		elseif isStarted("fd_banking") then
			bankScript = "fd_banking"
			if gang then
				exports["fd_banking"]:AddGangMoney(society, amountChange)
				newAmount = exports["fd_banking"]:GetGangAccount(society)
			else
				exports["fd_banking"]:AddMoney(society, amountChange)
				newAmount = exports["fd_banking"]:GetAccount(society)
			end
		elseif isStarted("okokBanking") then
			bankScript = "okokBanking"
			exports['okokBanking']:AddMoney(society, amountChange)
			newAmount = exports['okokBanking']:GetAccount(society)
		end

		debugPrint("^5Debug^7: ^3"..bankScript.."^7(^3"..(gang and "Gang" or "Job").."^7): ^2Adding ^7$"..amountChange.." ^2to account ^7'^6"..society.."^7' ($"..newAmount..")")
	elseif not biller then	--Find the biller from their citizenid
		for _, v in pairs(activePlayers) do
            local Player = getPlayer(v)
			if Player.citizenid == data.senderCitizenId then
				biller = Player
			end
		end
		triggerNotify(nil, data.sender..locale("success", "invoice_start")..data.amount..locale("success", "invoice_end"), "success", biller.source)
	end

	-- If ticket system enabled, do this
	if (biller.onDuty or gang) and Config.Receipts.TicketSystem then
		if not Config.Receipts.Jobs[data.society] then
			print("^1Error^7: Failed to find job "..data.society.." in ^2Config.Receipts.Jobs^7")
			return
		end
		if data.amount >= Config.Receipts.Jobs[data.society].MinAmountforTicket then
			if Config.Receipts.TicketSystemAll then
				for _, v in pairs(activePlayers) do
					local Player = getPlayer(v)
					if v ~= src then
						if gang then
							if Player.gang == data.society then
								addItem("payticket", 1, nil, Player.source)
								triggerNotify(nil, locale("success", "rec_rec"), 'success', Player.source)
							end
						else
							if Player.job == data.society and Player.onDuty then
								print("player on duty, giving tickets")
                                addItem("payticket", 1, nil, Player.source)
								triggerNotify(nil, locale("success", "rec_rec"), 'success', Player.source)
							end
						end
					end
				end
			else
                addItem("payticket", 1, nil, biller.source)
				triggerNotify(nil, locale("success", "rec_rec"), 'success', biller.source)
			end
		end
	end

	-- Commission section, does each config option separately
	local comm = tonumber(Config.Receipts.Jobs[data.society].Commission)
	if Config.Receipts.Commission and comm ~= 0 then
		if Config.Receipts.CommissionLimit and data.amount < Config.Receipts.Jobs[data.society].MinAmountforTicket then return end

		local commissionAmount = 0
		if Config.Receipts.CommissionSplit then
			-- With CommissionSplit, we already took the commission from society, just give it to employee
			commissionAmount = takecomm
		else
			-- Without CommissionSplit, give commission as bonus (old behavior)
			if Config.Receipts.CommissionDouble then
				commissionAmount = math.floor(tonumber(data.amount) * (comm * 2))
			else
				commissionAmount = math.floor(tonumber(data.amount) * comm)
			end
		end

		if commissionAmount > 0 then
			fundPlayer(commissionAmount, "bank", biller.source)
			local societyPercent = math.floor((1 - comm) * 100)
			if Config.Receipts.CommissionSplit then
				triggerNotify(nil, locale("success", "recieved").."$"..commissionAmount.." ("..(math.floor(comm * 100)).."% commission, "..societyPercent.."% to business)", "success", biller.source)
			else
				triggerNotify(nil, locale("success", "recieved")..commissionAmount..locale("success", "commission"), "success", biller.source)
			end
		end

		if Config.Receipts.CommissionAll and not Config.Receipts.CommissionSplit then
			for _, v in pairs(activePlayers) do
				local Player = getPlayer(v)
				if v ~= biller.source then
					if Player.job == data.society and Player.onDuty then
                        fundPlayer(math.floor(tonumber(data.amount) * comm), "bank", Player.source)
						triggerNotify(nil, locale("success", "recieved")..math.floor(tonumber(data.amount) * comm)..locale("success", "commission"), "success", Player.source)
					end
				end
			end
		end
	end
end)

RegisterServerEvent(getScript()..":Tickets:Sell", function() local src = source
    local Player = getPlayer(src)
    local hasItem, hasTable = hasItem("payticket", 1, src)
    if not hasItem then
		triggerNotify(nil, locale("error", "no_ticket_to"), 'error', src)
        return
    else
		local tickets = hasTable["payticket"].count
        removeItem("payticket", tickets, src)
		local pay = (tickets * Config.Receipts.Jobs[Player.job].PayPerTicket)
        fundPlayer(pay, "bank", src)
        triggerNotify(nil, locale("success", "trade_ticket_start")..tickets..locale("success", "trade_ticket_end")..cv(pay), 'success', src)
	end
end)