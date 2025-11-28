if Configuration.Framework ~= 'esx' then
    return
end

local webhook_link = ""

function SendWebhookLog(message,color)
    if webhook_link == "" then return end
    local embed = {
        {
            ['color'] = color,
            ['title'] = "📢 INFINITE JOBS",
            ['description'] = message,
            ['footer'] = {
                ['text'] = os.date("%Y-%m-%d %H:%M:%S"),
            },
        }
    }
    PerformHttpRequest(webhook_link, function(err, text, headers) end, 'POST', json.encode({
        username = "InfiniteJobs Logs",
        embeds = embed
    }), { ['Content-Type'] = 'application/json' })
end

ESX = exports['es_extended']:getSharedObject()

function GetIdPlayer(player)
    return ESX.GetPlayerFromId(player) or ESX.GetPlayer(player)
end

function GetIdentifier(player)
    return player.identifier
end

function giveReward(player, amount, configpay, level)
    local xPlayer = GetIdPlayer(player)
    local playerName = GetPlayerName(player)
    local rewardType = configpay.paymentmethod.option
    local rewardAmount = amount + (level * configpay.increase_per_level)
    local itemName = configpay.paymentmethod.item_name

    if rewardType == 'cash' then
        xPlayer.addMoney(rewardAmount)
        sendChatMessage(player, _U('JOBS_NOTIFICATION_REWARD_MONEY') .. rewardAmount .. _U('JOBS_NOTIFICATION_REWARD_CASH'))
    elseif rewardType == 'bank' then
        xPlayer.addAccountMoney('bank', rewardAmount)
        sendChatMessage(player, _U('JOBS_NOTIFICATION_REWARD_MONEY') .. rewardAmount .. _U('JOBS_NOTIFICATION_REWARD_BANK'))
    elseif rewardType == 'item' then
        if itemName then
            xPlayer.addInventoryItem(itemName, rewardAmount)
            sendChatMessage(player, _U('JOBS_NOTIFICATION_REWARD_ITEM') .. rewardAmount .. "x " .. itemName .. ".")
        else
            print("Item name no especificado.")
        end
    else
        print("Tipo de recompensa no válido.")
    end
end

function giveitem(player,itemname,quantity)
    local xPlayer = GetIdPlayer(player)
    xPlayer.addInventoryItem(itemname, quantity)
    sendChatMessage(player, _U('JOBS_NOTIFICATION_GET') .. quantity .. "x " .. itemname .. ".")
end

function sendChatMessage(player, message)
    TriggerClientEvent('chat:addMessage', player, {
        args = { "SYSTEM", message }
    })
end

RegisterNetEvent("Buty-InfiniteJobs:setJob")
AddEventHandler("Buty-InfiniteJobs:setJob", function(player, jobname, grade)
    local xPlayer = GetIdPlayer(source)
    xPlayer.setJob(jobname, grade)
    return
end)

lib.callback.register('Buty-InfiniteJobs:server:GetJob', function(source, player)
    local xPlayer = GetIdPlayer(player)
    local job = xPlayer.getJob()
    local jobName = job.name
    return jobName
end)

lib.callback.register('Buty-InfiniteJobs:server:GetItems', function(source, items)
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemsToSend = {}

    for _, itemName in ipairs(items) do
        local item = xPlayer.getInventoryItem(itemName.name)
        
        if item and item.count > 0 then
            local itemPrice = nil
            for _, generatedItem in ipairs(Config_Sell.itemsWithPrices) do
                if generatedItem.name == itemName.name then
                    itemPrice = generatedItem.price
                    break
                end
            end
            
            if itemPrice then
                table.insert(itemsToSend, {
                    label = itemName.label,
                    name = itemName.name,
                    img = itemName.img,
                    count = item.count,
                    price = itemPrice
                })
            end
        end
    end
    
    return itemsToSend
end)

RegisterServerEvent('Buty-InfiniteJobs:server:s3ll3', function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(data.selectedItem)
    local totalPrice = 0

    if data.selltype == "retail" then
        selltype_ = Config_Sell.retail
        totalPrice = data.priceItemRetail * selltype_
    elseif data.selltype == "wholesale" then
        selltype_ = Config_Sell.wholesale
        totalPrice = data.priceItemWholesale * selltype_
    end

    if Config_Sell.paymentmethod.option == "cash" then
        xPlayer.addMoney(totalPrice)
    elseif Config_Sell.paymentmethod.option == "bank" then
        xPlayer.addAccountMoney('bank', totalPrice)
    elseif Config_Sell.paymentmethod.option == "item" then
        xPlayer.addInventoryItem(data.selectedItem, selltype_)
    end

    xPlayer.removeInventoryItem(data.selectedItem, selltype_)
end)