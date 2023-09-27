local QBCore = exports['qb-core']:GetCoreObject()

PlayerData  = {}

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
    PlayerData = {}
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerData = job
end)

CreateThread(function()
    while true do
        Wait(Config.time * 60 * 1000)
        if PlayerData.job.name == "police" and PlayerData.job.onduty then
            TriggerServerEvent('core-policepoints:server:addpoints', Config.points)
        end
    end
end)