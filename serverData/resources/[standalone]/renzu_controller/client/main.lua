local showui = false
Controller = function(data, item)
	local closestvehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 6.0)
	if not DoesEntityExist(closestvehicle) then return end
	if GetVehicleDoorLockStatus(closestvehicle) ~= 1 then return end
	local plate = string.gsub(GetVehicleNumberPlateText(closestvehicle), '^%s*(.-)%s*$', '%1'):upper()
	local saved
	SendNUIMessage({ show = not showui, plate = plate})
	SetNuiFocus(not showui,not showui)
	SetNuiFocusKeepInput(false)
	SetVehicleEngineOn(closestvehicle,true,true)
	print(saved)
	if saved then
		lib.notify({
			title = 'Successfully register Plate: '..plate..' in this remote',
			type = 'success'
		})
	end
	showui = not showui
end

function GetClosestVehicle(c,dist)
	local closest = 0
	for k,v in pairs(GetGamePool('CVehicle')) do
		local dis = #(GetEntityCoords(v) - c)
		if dis < dist 
		    or dist == -1 then
			closest = v
			dist = dis
		end
	end
	return closest, dist
end

exports('Control', Controller)


SetVehicleControl = function(vehicle,data)
	local state = GetVehicleStates(vehicle,data)
	if data.type == 'seat' then
		return SetPedIntoVehicle(PlayerPedId(),vehicle,data.index)
	elseif data.type == 'door' then
		if state > 0.0 then
			SetVehicleDoorShut(vehicle,data.index,false)
		else
			SetVehicleDoorOpen(vehicle,data.index,false)
		end
	elseif data.type == 'interiorlight' then
		SetVehicleInteriorlight(vehicle, not state)
	elseif data.type == 'toggleall' then
		for i = -1, 6 do
			local state = GetVehicleStates(vehicle,{type = 'door', index = i})
			if state > 0.0 then
				SetVehicleDoorShut(vehicle,i,false)
			else
				SetVehicleDoorOpen(vehicle,i,false)
			end
		end
	elseif data.type == 'engine' then
		SetVehicleEngineOn(vehicle, not GetIsVehicleEngineRunning(vehicle), false, true)
	end
end

GetVehicleStates = function(vehicle,data)
	if data.type == 'door' then
		return GetVehicleDoorAngleRatio(vehicle,data.index)
	elseif data.type == 'seat' then
		return IsVehicleSeatFree(vehicle,data.index)
	elseif data.type == 'interiorlight' then
		return IsVehicleInteriorLightOn(vehicle)
	end
end

local vehicle = nil
AddEventHandler('gameEventTriggered', function (name, args)
	if name == 'CEventNetworkPlayerEnteredVehicle' then
		if args[1] == PlayerId() then
			vehicle = args[2]
		end
	end
end)

RegisterCommand('engine', function(src,args)
	SetVehicleEngineOn(vehicle, not GetIsVehicleEngineRunning(vehicle), false, true)
end)

RegisterCommand('seat', function(src,args)
	SetPedIntoVehicle(PlayerPedId(),vehicle,tonumber(args[1]))
end)

RegisterCommand('door', function(src,args)
	local index = tonumber(args[1])
	local vehicle = vehicle
	local state = GetVehicleStates(vehicle,{type = 'door', index = index})
	if state > 0.0 then
		SetVehicleDoorShut(vehicle,index,false)
	else
		SetVehicleDoorOpen(vehicle,index,false)
	end
end)

RegisterCommand('carcontrol', function(src,args)
	if config.item then return end
	return Controller()
end)

RegisterKeyMapping('carcontrol', 'Vehicle Controller', 'keyboard', config.keybind)

RegisterNUICallback('nuicb', function(data, cb)
	local closestvehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 10.0)
	SetEntityControlable(closestvehicle)
	SetVehicleModKit(closestvehicle,0)
	if data.msg == 'headlight' then
		ToggleVehicleMod(closestvehicle, 22, true)
		SetVehicleXenonLightsCustomColor(closestvehicle, data.val.r,data.val.g,data.val.b)
	end
	if data.msg == 'togglelights' then
		ToggleVehicleMod(closestvehicle, 22, not GetVehicleMod(closestvehicle, 22) == -1)
	end
	if data.msg == 'close' then
		SendNUIMessage({ show = false})
		SetNuiFocus(false,false)
		SetNuiFocusKeepInput(false)
		showui = false
	end
	if data.msg == 'carcontrol' then
		SetVehicleControl(closestvehicle,data)
	end
	cb(1)
end)


RegisterCommand('controller', Controller)

SetEntityControlable = function(entity) -- server based entities. incase you are not the owner. server entities are a little complicated
    local netid = NetworkGetNetworkIdFromEntity(entity)
    SetNetworkIdExistsOnAllMachines(netid,true)
    SetEntityAsMissionEntity(entity,true,true)
    NetworkRequestControlOfEntity(entity)
    local attempt = 0
    while not NetworkHasControlOfEntity(entity) and attempt < 2000 and DoesEntityExist(entity) do
        NetworkRequestControlOfEntity(entity)
        Citizen.Wait(0)
        attempt = attempt + 1
    end
end