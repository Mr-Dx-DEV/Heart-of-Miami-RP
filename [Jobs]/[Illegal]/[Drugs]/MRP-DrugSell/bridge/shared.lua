local FrameworkCache = {
    oxInventoryEnabled = nil,
    lastInventoryCheck = 0,
    inventoryCheckInterval = 30000 
}

FrameworkCache.oxInventoryEnabled = GetResourceState('ox_inventory') == 'started'
FrameworkCache.lastInventoryCheck = GetGameTimer()

function IsOxInventoryEnabled()
    local currentTime = GetGameTimer()
    if currentTime - FrameworkCache.lastInventoryCheck > FrameworkCache.inventoryCheckInterval then
        FrameworkCache.oxInventoryEnabled = GetResourceState('ox_inventory') == 'started'
        FrameworkCache.lastInventoryCheck = currentTime
    end
    return FrameworkCache.oxInventoryEnabled
end

-- ============================================================================
-- SERVER-SIDE NOTIFICATIONS
-- ============================================================================
local notificationSystemCache = {}

function ServerNotify(source, title, message, type, duration)
    duration = duration or 5000
    local notifSystem = Config.NotificationSystem

    if notifSystem == 'framework' then
        local qbCoreState = GetResourceState('qb-core')
        local esxState = GetResourceState('es_extended')

        if Config.Framework == 'qb' or (Config.Framework == 'auto' and qbCoreState == 'started') then
            TriggerClientEvent('QBCore:Notify', source, message, type, duration)
        elseif Config.Framework == 'esx' or (Config.Framework == 'auto' and esxState == 'started') then
            TriggerClientEvent('esx:showNotification', source, message, type, duration)
        else
            TriggerClientEvent('ox_lib:notify', source, {
                description = message,
                type = type or 'inform'
            })
        end
    elseif notifSystem == 'ox_lib' then
        TriggerClientEvent('GM_DrugSellclient:showNotification', source, title, message, type, duration)
    elseif notifSystem == 'mythic' then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, {
            type = type or 'inform',
            text = message,
            length = duration
        })
    elseif notifSystem == 'okoknotify' then
        TriggerClientEvent('okokNotify:Alert', source, title, message, duration, type or 'info')
    end
end

-- ============================================================================
-- CLIENT-SIDE NOTIFICATIONS
-- ============================================================================
function ClientNotify(title, message, type, duration)
    duration = duration or 5000
    local notifSystem = Config.NotificationSystem

    if notifSystem == 'framework' then
        local qbCoreState = GetResourceState('qb-core')
        local esxState = GetResourceState('es_extended')

        if Config.Framework == 'qb' or (Config.Framework == 'auto' and qbCoreState == 'started') then
            local QBCore = exports['qb-core']:GetCoreObject()
            if QBCore and QBCore.Functions then
                QBCore.Functions.Notify(message, type, duration)
            else
                ShowNotificationFallback(message, type, duration)
            end
        elseif Config.Framework == 'esx' or (Config.Framework == 'auto' and esxState == 'started') then
            local ESX = exports['es_extended']:getSharedObject()
            if ESX and ESX.ShowNotification then
                local esxType = ConvertNotificationType(type)
                ESX.ShowNotification(message, esxType, duration)
            else
                ShowNotificationFallback(message, type, duration)
            end
        else
            ShowNotificationFallback(message, type, duration)
        end
    elseif notifSystem == 'ox_lib' then
        if Config.DebugMode then
            print('^2[GM_DrugSell]^7 Showing ox_lib notification - Title: ' .. tostring(title) .. ', Message: ' .. tostring(message) .. ', Type: ' .. tostring(type))
        end
        lib.notify({
            title = title,
            description = message,
            type = type or 'inform',
            duration = duration
        })
    elseif notifSystem == 'native' then
        ShowNotificationFallback(message, type, duration)
    elseif notifSystem == 'mythic' then
        if GetResourceState('mythic_notify') == 'started' then
            exports['mythic_notify']:DoHudText(type or 'inform', message, duration)
        else
            ShowNotificationFallback(message, type, duration)
        end
    elseif notifSystem == 'okoknotify' then
        if GetResourceState('okokNotify') == 'started' then
            exports['okokNotify']:Alert(title, message, duration, type or 'info')
        else
            ShowNotificationFallback(message, type, duration)
        end
    end
end

-- ============================================================================
-- LEGACY FUNCTION (for backwards compatibility)
-- ============================================================================
function ShowNotification(title, message, type, duration, source)
    if IsDuplicityVersion() then
        ServerNotify(source, title, message, type, duration)
    else
        ClientNotify(title, message, type, duration)
    end
end

function ConvertNotificationType(type)
    local typeMap = {
        success = 'success',
        error = 'error',
        primary = 'info',
        info = 'info',
        inform = 'info'
    }
    return typeMap[type] or 'info'
end

function ShowNotificationFallback(message, type, duration)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(message)
    DrawNotification(false, true)
end

-- ============================================================================
-- TIME FORMATTING UTILITIES
-- ============================================================================
function FormatTimeMinutes(seconds)
    if not seconds or seconds < 0 then
        return "0m"
    end

    local minutes = math.ceil(seconds / 60)
    return minutes .. "m"
end

function FormatTimeMinutesSeconds(seconds)
    if not seconds or seconds < 0 then
        return "0s"
    end

    local minutes = math.floor(seconds / 60)
    local secs = seconds % 60

    if minutes > 0 then
        return minutes .. "m " .. secs .. "s"
    else
        return secs .. "s"
    end
end
