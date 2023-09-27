local answer

RegisterCommand('apodeijh', function()
	local dialog = exports['dialog']:Create('Payment Receipt', 'Please define amount')
	local amount = tonumber(dialog.value) or -1
	TriggerServerEvent('esx_billing:sendBill', playerId, "bank", "Απόδειξη", amount)
	
	local xTarget = ESX.GetPlayerFromId(playerId)
end)
