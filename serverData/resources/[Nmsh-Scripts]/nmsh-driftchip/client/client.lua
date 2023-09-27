local QBCore = exports['qb-core']:GetCoreObject()
local useDebug = Config.Debug

local function toggleDriftMode(vehicle, on)
    QBCore.Functions.Progressbar("driftChip", "Toggling Drift Chip", Config.ActivateTime, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
        SetDriftTyresEnabled(vehicle, on)
        SetVehicleEngineOn(vehicle, true, false)
	end, function() -- Cancel
		QBCore.Functions.Notify("Canceled", "error")
	end, 'fas fa-microchip')
end

RegisterNetEvent('cw-driftchip:client:toggleDrift', function()
    local Player = PlayerPedId()
    local vehicle = GetVehiclePedIsUsing(Player)
    local isOn = GetDriftTyresEnabled(vehicle)
    if vehicle ~= 0 then
        if GetEntitySpeed(vehicle) > 1.0 then 
            QBCore.Functions.Notify('You need to be parked to do this', 'error')
        else
            SetVehicleEngineOn(vehicle, false, false, true)
            if isOn then
                QBCore.Functions.Notify('Toggling Drift mode off')
                toggleDriftMode(vehicle, false)
            else
                QBCore.Functions.Notify('Toggling Drift mode on')
                toggleDriftMode(vehicle, true)
            end
        end
    else
        QBCore.Functions.Notify('You need to be in a vehicle', 'error')
    end
end)

RegisterNetEvent('cw-driftchip:client:openbox', function()
    QBCore.Functions.Progressbar("driftChipbox", "Opening box", Config.BoxTime, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
        TriggerServerEvent('cw-driftchip:server:openbox')
	end, function() -- Cancel
		QBCore.Functions.Notify("Canceled", "error")
	end, 'fas fa-box-open')
end)

RegisterNetEvent('cw-plateswap:client:toggleDebug', function(debug)
   print('Setting debug to', debug)
   useDebug = debug
end)

