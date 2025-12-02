WebhookURL = "WEBHOOK" -- Webhook to send logs to discord

-----------------------------------------------------------------------------------------------------------------------------------------	
-- Access / UI
-----------------------------------------------------------------------------------------------------------------------------------------	
function beforeBuyLocation(source,user_id)
	-- Here you can do any verification when a player is opening the trucker UI for the first time, like if player has the permission or money to that or anything else you want to check. return true or false
	return true
end

-----------------------------------------------------------------------------------------------------------------------------------------	
-- Trucks (buy/sell/maintenance)
-----------------------------------------------------------------------------------------------------------------------------------------	
function beforeBuyTruck(source,truck_name,price,user_id)
	-- Here you can do any verification when a player is buying a truck, like if player has driver license or anything else you want to check before buy the truck. return true or false
	return true
end

function afterBuyTruck(source,truck_name,price,user_id)
	-- Here you can run any code after the player buys a truck. Does not return anything
end

function beforeSellTruck(source,truck_name,price,user_id)
	-- Here you can do any verification when a player is selling a truck. return true or false
	return true
end

function afterSellTruck(source,truck_name,price,user_id)
	-- Here you can run any code after the player sells a truck. Does not return anything
end

function beforeRepairTruck(source,part,cost,user_id,truck_row)
	-- Return false to block the repair; return true and optionally override the repair cost (return true, newCost)
	return true, cost
end

function afterRepairTruck(source,part,cost,user_id,truck_row)
	-- Called after a repair succeeds
end

function beforeRefuelTruck(source,truck_id,refuel_amount,cost,user_id,truck_row)
	-- Return false to block refueling; return true and optionally override the refuel cost (return true, newCost)
	return true, cost
end

function afterRefuelTruck(source,truck_id,refuel_amount,cost,user_id,truck_row)
	-- Called after a refuel succeeds
end

-----------------------------------------------------------------------------------------------------------------------------------------	
-- Drivers
-----------------------------------------------------------------------------------------------------------------------------------------	
function beforeHireDriver(source,price,user_id)
	-- Here you can do any verification when a player is hiring a driver. return true or false
	return true
end

function afterHireDriver(source,price,user_id)
	-- Here you can run any code after the player hires a driver. Does not return anything
end

function beforeAssignDriver(source,driver_id,truck_id,user_id)
	-- Return false to block assigning a driver to a truck
	return true
end

function afterAssignDriver(source,driver_id,truck_id,user_id)
	-- Called after assigning a driver
end

function beforeFireDriver(source,driver_id,user_id)
	-- Return false to block firing a driver
	return true
end

function afterFireDriver(source,driver_id,user_id)
	-- Called after a driver is fired
end

-----------------------------------------------------------------------------------------------------------------------------------------	
-- Contracts
-----------------------------------------------------------------------------------------------------------------------------------------	
function beforeStartContract(source,contract_id)
	-- Here you can do any verification when a player is starting a contract. return true or false
	return true
end

function afterfinishContract(source,received_amount,received_xp,distance,contract_data)
	-- Here you can run any code when player finishes the job. Does not return anything
end

function beforeCancelContract(source,contract_id,user_id,contract_data)
	-- Return false to prevent cancelling a contract
	return true
end

function afterCancelContract(source,contract_id,user_id,contract_data)
	-- Called after a contract is cancelled
end

-----------------------------------------------------------------------------------------------------------------------------------------	
-- Skills / progression
-----------------------------------------------------------------------------------------------------------------------------------------	
function beforeUpgradeSkill(source,skill_id,new_value,cost,user_id,user_row)
	-- Return false to block the upgrade; return true and optionally a custom cost as second value
	return true, cost
end

function afterUpgradeSkill(source,skill_id,new_value,cost,user_id,user_row)
	-- Called after a skill upgrade succeeds
end

-----------------------------------------------------------------------------------------------------------------------------------------	
-- Money / balance
-----------------------------------------------------------------------------------------------------------------------------------------	
function beforeDepositMoney(source,amount,account)
	-- Here you can do any verification when a player is depositing money. return true or false
	return true
end

function beforeWithdrawMoney(source,amount,account)
	-- Here you can do any verification when a player is withdrawing money. return true or false
	return true
end

-----------------------------------------------------------------------------------------------------------------------------------------	
-- Loans
-----------------------------------------------------------------------------------------------------------------------------------------	
function beforeTakeLoan(source,loan_plan,current_total,user_id)
	-- Return false to block taking the loan; return true and optionally a modified plan as second value
	return true, loan_plan
end

function afterTakeLoan(source,loan_plan,user_id)
	-- Called after taking a loan
end

function beforePayLoan(source,loan_row,user_id)
	-- Return false to block paying a loan
	return true
end

function afterPayLoan(source,loan_row,user_id)
	-- Called after paying a loan
end

-----------------------------------------------------------------------------------------------------------------------------------------	
-- Parties
-----------------------------------------------------------------------------------------------------------------------------------------	
function beforeCreateParty(source,party_data,total_cost,user_id)
	-- Return false to block party creation; return true and optionally override the cost (return true, newCost)
	return true, total_cost
end

function afterCreateParty(source,party_id,party_data,total_cost,user_id)
	-- Called after a party is created
end

function beforeJoinParty(source,party_info,request_data,user_id)
	-- Return false to block joining a party
	return true
end

function afterJoinParty(source,party_id,request_data,user_id)
	-- Called after joining a party
end

function beforeKickFromParty(source,target_user_id,party_id,user_id)
	-- Return false to block kicking a member from a party
	return true
end

function afterKickFromParty(source,target_user_id,party_id,user_id)
	-- Called after kicking a member from a party
end

function beforeDeleteParty(source,party_id,user_id)
	-- Return false to block deleting a party
	return true
end

function afterDeleteParty(source,party_id,user_id)
	-- Called after deleting a party
end

function beforeQuitParty(source,party_id,user_id)
	-- Return false to block leaving a party
	return true
end

function afterQuitParty(source,party_id,user_id)
	-- Called after leaving a party
end