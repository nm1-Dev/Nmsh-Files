local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local isLoggedIn = LocalPlayer.state['isLoggedIn']


local streams = {}
local goProActivated = false

local staticCam = nil
local currentCoords = nil

local function prepareCameraSelf(activating, coords)
	local me = PlayerPedId()
	DetachEntity(me, 1, 1)
	SetEntityCollision(me, not activating, not activating)
	SetEntityInvincible(me, activating)
	if activating then
	  NetworkFadeOutEntity(me, activating, false)
	else
	  NetworkFadeInEntity(me, 0, false)
	end
	SetEntityCoords(me, coords)
  end

RegisterNetEvent('rp_vehicles:client:GoPro:attach', function(item, dashType)
	local ply = PlayerPedId()
	local veh = GetVehiclePedIsIn(ply, false)

	if veh == 0 then 
		QBCore.Functions.Notify("Bir araçta olmalısınız.", 'error')
		return
	end
	local isDashCammed = Entity(veh).state.dashcam
	if isDashCammed then
		QBCore.Functions.Notify("Bu araçta zaten araç kamerası takılı.", 'error')
		return
	end

	if dashType == "pd" and GetVehicleClass(veh) ~= 18 then
		QBCore.Functions.Notify("Acil durum aracı değil.", 'error')
		return
	end
	QBCore.Functions.Progressbar("dashcam_tak", "Dashcam takılıyor...", 7500, false, false, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() -- Done
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['dashcam'], "remove")
	end)
	TriggerServerEvent("QBCore:Server:RemoveItem", item.name, 1, item.slot)
	TriggerServerEvent('rp_vehicles:server:GoPro:CreateStream', VehToNet(veh), dashType)
end)

RegisterNetEvent('rp_vehicles:client:GoPro:AttachCam', function(netID, vehCoords)
	local alreadyActive = goProActivated
	goProActivated = true
	local coords = vector3(vehCoords.x, vehCoords.y, vehCoords.z - 10.0)
	if not alreadyActive then
		staticCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
		currentCoords = GetEntityCoords(PlayerPedId())
	end
	prepareCameraSelf(true, coords)
	local veh = 0
	local vehLoopCount = 0
	while veh == 0 and vehLoopCount < 10 do
	  veh = NetworkGetEntityFromNetworkId(netID)
	  vehLoopCount = vehLoopCount + 1
	  if veh == 0 then Wait(250) end
	end
	if veh == 0 then
	  prepareCameraSelf(false, currentCoords)
	  QBCore.Functions.Notify("Araba Bulunamadı", 'error')
	  return
	end
	AttachEntityToEntity(PlayerPedId(), veh, 0, 0.0, 0.0, -40.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0)
	local vehModel = GetEntityModel(veh)
	local camX, camY, camZ = 0.35, 1.0, 0.6
	SetTimecycleModifier("scanline_cam_cheap")
    SetTimecycleModifierStrength(2.0)
	SetCamFov(staticCam, 80.0)
	DetachCam(staticCam)
	AttachCamToVehicleBone(staticCam,veh,GetEntityBoneIndexByName(veh, "seat_dside_f"),1, 0.0, 0.0, 0.0, camX, camY, camZ, 1)
	if not alreadyActive then
		RenderScriptCams(true, false, 0, 1, 0)
	end

	TriggerEvent('rp_vehicles:client:GoPro:ListenKeypress')
end)

local isListeningKeyPress = false
AddEventHandler('rp_vehicles:client:GoPro:ListenKeypress', function()
	if isListeningKeyPress then return end
	exports['qb-core']:DrawText('<b>[E]</b> Dashcamden ÇIK','left')
	isListeningKeyPress = true
	while isListeningKeyPress do
		if IsControlJustReleased(0, 38) then
			TriggerEvent('rp_vehicles:server:GoPro:DetachCam')
			Citizen.Wait(100)
			SetTimecycleModifier("default")
            SetTimecycleModifierStrength(0.3)
		end
		Wait(3)
	end
end)

AddEventHandler('rp_vehicles:client:GoPro:viewGoPro', function(data)
	TriggerServerEvent('rp_vehicles:server:GoPro:JoinStream', data)
end)

RegisterNetEvent('rp_vehicles:server:GoPro:DetachCam', function()
	prepareCameraSelf(false, currentCoords)
	RenderScriptCams(false, false, 0, 1, 0)

	exports['qb-core']:HideText()
	isListeningKeyPress = false

	goProActivated = false
	alreadyActive = false
end)  

function dump(o)
	if type(o) == 'table' then
	   local s = '{ '
	   for k,v in pairs(o) do
		  if type(k) ~= 'number' then k = '"'..k..'"' end
		  s = s .. '['..k..'] = ' .. dump(v) .. ','
	   end
	   return s .. '} '
	else
	   return tostring(o)
	end
 end
 
AddEventHandler('rp_interact:client:PoliceDashCams', function()
	QBCore.Functions.TriggerCallback('rp_vehicles:server:GoPro:GetDashCams', function(results)
		local menu = {{
			header = "<center><strong>Araba Kameraları<strong/><center/>",
		}}
		
		for k,v in pairs(results) do
			table.insert(menu, {
				header = v.streamTitle,
				txt = '#KameraID '..v.streamID,
				params = {
					event = "rp_vehicles:client:GoPro:viewGoPro",
					args = v,
				}
			})
			exports['nmsh-menu']:openMenu(menu)
		end
		if results == nil then
			TriggerEvent('QBCore:Notify', "Aktif Kamera Yok", "error", 3000)
		end
	end, 'pd')
end)