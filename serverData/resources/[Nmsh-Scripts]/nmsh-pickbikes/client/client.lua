local QBCore = exports['qb-core']:GetCoreObject()

local hasbike = false
local closebike = false

CreateThread( function ()
	while true do
		if Config.Interaction == "qb" then
			local ped = PlayerPedId()
			local pos = GetEntityCoords(ped)
			bike = QBCore.Functions.GetClosestVehicle()
			for k, v in pairs(Config.Bikes) do
				if GetEntityModel(bike) == v then
					local bikepos = GetEntityCoords(bike)
                    local dist = #(pos - bikepos)
                    if dist <= 1.5 then
						if IsPedOnFoot(ped) and not closebike then
							closebike = true
							exports['qb-core']:DrawText("["..Config.InteractKey.."] Pick Up", Config.DrawTextPosition)
							PressedKey()
						end
					else
						closebike = false
						exports['qb-core']:HideText()
					end
				end
			end
		else
			exports['nmsh-target']:AddTargetModel(Config.Bikes, {
				options = {
				{
					type = "client",
					event = "kevin-pickbikes:client:takeup",
					icon = "fas fa-bicycle",
					label = "Pick Up",
				}
			},
				distance = 2.0,
			})
		end
		Wait(1000)
	end
end)

function PressedKey()
	CreateThread(function ()
		while not hasbike do
			local ped = PlayerPedId()
			if IsControlJustReleased(0, 38) then
				-- print('pressed')
				RequestAnimDict("anim@heists@box_carry@")
				while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
					Wait(1)
				end
				TaskPlayAnim(ped, "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
				AttachEntityToEntity(bike, ped, GetPedBoneIndex(player, 60309), 0.0, 0.35, 0.160, 180.0, 170.0, 90.0, true, false, false, true, 0, true)
				hasbike = true
				exports['qb-core']:ChangeText("["..Config.InteractKey.."] Drop ", Config.DrawTextPosition)
			end
			Wait(1)
		end
	end)
end
RegisterNetEvent("kevin-pickbikes:client:takeup", function ()
    local ped = PlayerPedId()
	bike = QBCore.Functions.GetClosestVehicle()
	for k, v in pairs(Config.Bikes) do
		if GetEntityModel(bike) == v then
			RequestAnimDict("anim@heists@box_carry@")
			while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
				Wait(1)
			end
			TaskPlayAnim(ped, "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
			AttachEntityToEntity(bike, ped, GetPedBoneIndex(player, 60309), 0.0, 0.35, 0.160, 180.0, 170.0, 90.0, true, false, false, true, 0, true)
			hasbike = true
			exports['qb-core']:DrawText("["..Config.InteractKey.."] Drop ", Config.DrawTextPosition)
		end
	end
end)

RegisterCommand('dropbike', function()
	if IsEntityAttachedToEntity(bike, PlayerPedId()) then
		DetachEntity(bike, false, false)
		SetVehicleOnGroundProperly(bike)
		ClearPedTasks(PlayerPedId())
		hasbike = false
		closebike = false
		exports['qb-core']:HideText()
	end
end)

RegisterKeyMapping('dropbike', 'Drop Bike', 'keyboard', Config.InteractKey)
