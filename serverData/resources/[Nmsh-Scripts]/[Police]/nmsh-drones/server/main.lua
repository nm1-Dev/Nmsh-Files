local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Functions.CreateUseableItem('drone' , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Config.EMSPoliceOnly then
        if Player ~= nil and Player.PlayerData.job ~= nil and Player.PlayerData.job.name == "police" or Player.PlayerData.job.name == "ambulance" then
            if Player.Functions.RemoveItem(item.name, 1, item.slot) then
                TriggerClientEvent("grw_drones:client:UseDrone", source)
            end
        else
            TriggerClientEvent('QBCore:Notify', source,  "Drones are for emergency services only", "error")
        end
    else
        TriggerClientEvent("grw_drones:client:UseDrone", source)
    end   
end)

RegisterServerEvent('grw_drones:server:DroneReturned')
AddEventHandler('grw_drones:server:DroneReturned', function(source)
	local Player = QBCore.Functions.GetPlayer(source)
	Player.Functions.AddItem("drone", 1)
end)