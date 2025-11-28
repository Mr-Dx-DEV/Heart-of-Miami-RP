PlayerJob = {}
onDuty = false

QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerJob = job
    onDuty = PlayerJob.onduty
end)

-- Function to check if the player is in a duty zone

AddEventHandler("onResourceStart", function(name)
    Wait(1000)
    if name == GetCurrentResourceName() then
        PlayerJob = QBCore.Functions.GetPlayerData().job
        onDuty = PlayerJob.onduty
    end
end)