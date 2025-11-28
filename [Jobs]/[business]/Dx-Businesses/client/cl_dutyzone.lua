local QBCore = exports['qb-core']:GetCoreObject()
local onDuty = false
local PlayerJob = {}


RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        InitializeDutyZones()
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

function InitializeDutyZones()
    for k, i in pairs(Businesses) do
        local loc = i
        if i.enabled and loc.enabled then
            JobLocation = PolyZone:Create(loc.dutyzone.zones, {
                name = loc.job,
                debugPoly = Config.Debug
            })
            JobLocation:onPlayerInOut(function(isPointInside)
                if PlayerJob.name == loc.job then
                    if loc.dutyzone.autoClock.enter then
                        if isPointInside and not onDuty then
                            TriggerServerEvent("QBCore:ToggleDuty")
                        end
                    end

                    if loc.dutyzone.autoClock.exit then
                        if not isPointInside and onDuty then
                            TriggerServerEvent("QBCore:ToggleDuty")
                        end
                    end
                end
            end)
        end
    end
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(1000)
        QBCore.Functions.GetPlayerData(function(PlayerData)
            PlayerJob = PlayerData.job
            InitializeDutyZones()
        end)
    end
end)
