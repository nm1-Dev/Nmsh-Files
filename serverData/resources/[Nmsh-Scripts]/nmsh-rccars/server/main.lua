local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('grw-rccars:get')
AddEventHandler('grw-rccars:get', function()
	local Player = QBCore.Functions.GetPlayer(source)
	Player.Functions.AddItem("rccar", 1)
end)

QBCore.Functions.CreateUseableItem("rccar", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent('grw-rccars:rcCar', source)
    end
end)