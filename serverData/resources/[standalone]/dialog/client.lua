local answer

function CreateDialog(title, desc, pricetxt, price, decision, submit, cancel)
	answer = nil
	
	local title = title or ''
	local desc = desc or ''
	local pricetxt = pricetxt or ''
	local price = price or ''
	
	SetNuiFocus(true, true)
	
	SendNUIMessage({
		action = 'show',
		title = title,
		desc = desc,
		pricetxt = pricetxt,
		price = price,
		decision = decision,
		submit = submit,
		cancel = cancel,
	})
end

RegisterNUICallback('submit', function(data, cb)
	SetNuiFocus(false, false)
	SendNUIMessage({action = 'hide'})
	
	answer = data
	
	cb('ok')
end)

RegisterNUICallback('cancel', function(data, cb)
	SetNuiFocus(false, false)
	SendNUIMessage({action = 'hide'})
	
	answer = {action = 'cancel'}
	
	cb('ok')
end)

exports('Create', function(title, desc, pricetxt, price, submit, cancel)
	CreateDialog(title, desc, pricetxt, price, nil, submit, cancel)
	
	while answer == nil do
		Wait(25)
	end
	
	return answer
end)

exports('Decision', function(title, desc, pricetxt, submit, cancel)
	CreateDialog(title, desc, pricetxt, '', true, submit, cancel)
	
	while answer == nil do
		Wait(25)
	end
	
	return answer
end)

exports('Close', function()
	SetNuiFocus(false, false)
	SendNUIMessage({action = 'hide'})
	
	answer = {action = 'cancel'}
end)