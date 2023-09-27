

local Sounds = { -- In case you wanna change out the sounds they are located here.
	["Close"] = {"TOGGLE_ON", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	["Open"] = {"NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET"},
	["Select"] = {"SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET"}
}
function SoundPlay(which)
	if Config.NUI.Sound then else return end
	local Sound = Sounds[which]
	PlaySoundFrontend(-1, Sound[1], Sound[2])
end

function ToggleCamera(type)
	if Config.NUI.Camera then else return end
	if type == 'Open' then
		cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
		camOffset = vector3(-0.025120, 1.512561, 0.559709)
		SetCamActive(cam, true)
		RenderScriptCams(true, true, 500, true, false)
		SetCamCoord(cam, GetOffsetFromEntityInWorldCoords(PlayerPedId(), camOffset))
		SetCamRot(cam, vector3(-15.0, 0.0, GetEntityHeading(PlayerPedId()) + 180))
	elseif type == 'Close' then
		RenderScriptCams(false, true, 500, true, false)
		DestroyCam(cam, false)
	end
end


local function Check(ped) -- We check if the player should be able to open the menu.
	if IsPedInAnyVehicle(ped) and not Config.NUI.AllowInCars then
		return false
	elseif IsPedSwimmingUnderWater(ped) then
		return false
	elseif IsPedRagdoll(ped) and not Config.NUI.AllowWhenRagdolled then
		return false
	elseif IsHudComponentActive(19) then -- If the weapon wheel is open, we close!
		return false
	end
	return true
end


RegisterNUICallback('close', function(_, cb)
	SetNuiFocus(false, false)
	SendNUIMessage({
		action = 'close',
	})
	RenderScriptCams(false, true, 750, true, false)
	DestroyCam(cam, false)
	SoundPlay("Close")
	ToggleCamera("Close")
    cb('ok')
end)

RegisterNUICallback('changecloth', function(data, cb)
	ExecuteCommand(data)
end)

RegisterNUICallback('reset', function(data, cb)
	ResetClothing()
	Wait(1000)
	SetNuiFocus(false, false)
	SendNUIMessage({
		action = 'close',
	})
	RenderScriptCams(false, true, 750, true, false)
	DestroyCam(cam, false)
	SoundPlay("Close")
	ToggleCamera("Close")
    cb('ok')
end)



Citizen.CreateThread(function()
    RegisterKeyMapping('+szclothing', 'Toggle Clothing', 'keyboard', Config.NUI.DefultKey)
    RegisterCommand('+szclothing', ShowClothingUI, false)
end)

function ShowClothingUI()
	local Ped = PlayerPedId()
	if Check(Ped) then
		SoundPlay("Open")
		ToggleCamera("Open")
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'open',
		})
		SetNuiFocus(true, true)
	end
end

function rotation(dir)
    local pedRot = GetEntityHeading(PlayerPedId())+dir
    SetEntityHeading(PlayerPedId(), pedRot % 360)
end