local QBCore = exports['qb-core']:GetCoreObject()

local pizzaseat = 0
local sitting = false

CreateThread(function()
	for k, v in pairs(Config.Chairs) do
		exports['nmsh-target']:AddBoxZone("PizzChair"..k, v.location, v.width, v.depth, { name="PizzChair"..k, heading = v.heading, debugPoly = false, minZ = v.minZ, maxZ = v.maxZ, }, 
			{ options = { { event = "nmsh-pizzathis:Chair", icon = "fas fa-chair", label = "Sit Down", loc = v.location, head = v.heading, seat = v.seat }, },
			  distance = v.distance+0.4
		})
	end
end)

RegisterNetEvent('nmsh-pizzathis:Chair', function(data)
	local canSit = true
	local sitting = false
	for k, v in pairs(QBCore.Functions.GetPlayersFromCoords(data.loc, 0.6)) do
		local dist = #(GetEntityCoords(GetPlayerPed(v)) - data.loc)
		if dist <= 0.4 then TriggerEvent("QBCore:Notify", "Someone is already sitting there..") canSit = false end
	end
	if canSit then
		TaskStartScenarioAtPosition(PlayerPedId(), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.head, 0, 1, true)
		pizzaseat = data.seat
		sitting = true
	end
	while sitting do
		local ped = PlayerPedId()
		if sitting then 
			if IsControlJustReleased(0, 202) and IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then
				sitting = false
				ClearPedTasks(ped)

				if pizzaseat == 1 then SetEntityCoords(ped, vector3(808.69, -751.55, 26.78-0.5)) end
				if pizzaseat == 2 then SetEntityCoords(ped, vector3(805.09, -751.64, 26.78-0.5)) end
				if pizzaseat == 3 then SetEntityCoords(ped, vector3(801.11, -751.54, 26.78-0.5)) end
				if pizzaseat == 4 then SetEntityCoords(ped, vector3(797.26, -751.56, 26.78-0.5)) end
				if pizzaseat == 5 then SetEntityCoords(ped, vector3(799.7, -748.8, 26.78-0.5)) end
				if pizzaseat == 6 then SetEntityCoords(ped, vector3(796.46, -748.66, 26.78-0.5)) end
				if pizzaseat == 7 then SetEntityCoords(ped, vector3(795.42, -749.88, 26.78-0.5)) end
				if pizzaseat == 8 then SetEntityCoords(ped, vector3(795.34, -753.39, 26.78-0.5)) end
				if pizzaseat == 9 then SetEntityCoords(ped, vector3(799.53, -753.53, 26.78-0.5)) end
				if pizzaseat == 10 then SetEntityCoords(ped, vector3(798.94, -756.07, 26.78-0.5)) end
				
				if pizzaseat == 11 then SetEntityCoords(ped, vector3(808.29, -753.46, 26.78-0.5)) end
				if pizzaseat == 12 then SetEntityCoords(ped, vector3(807.06, -753.62, 26.78-0.5)) end
				if pizzaseat == 13 then SetEntityCoords(ped, vector3(806.31, -753.61, 26.78-0.5)) end
				if pizzaseat == 14 then SetEntityCoords(ped, vector3(804.93, -753.63, 26.78-0.5)) end
				if pizzaseat == 15 then SetEntityCoords(ped, vector3(804.14, -753.59, 26.78-0.5)) end
				if pizzaseat == 16 then SetEntityCoords(ped, vector3(802.9, -753.61, 26.78-0.5)) end
				if pizzaseat == 17 then SetEntityCoords(ped, vector3(802.11, -753.59, 26.78-0.5)) end
				if pizzaseat == 18 then SetEntityCoords(ped, vector3(800.74, -753.63, 26.78-0.5)) end
				if pizzaseat == 19 then SetEntityCoords(ped, vector3(798.24, -757.15, 26.78-0.5)) end
				if pizzaseat == 20 then SetEntityCoords(ped, vector3(798.36, -758.28, 26.78-0.5)) end
				if pizzaseat == 21 then SetEntityCoords(ped, vector3(798.32, -759.04, 26.78-0.5)) end
				if pizzaseat == 22 then SetEntityCoords(ped, vector3(798.36, -760.38, 26.78-0.5)) end
				
				if pizzaseat == 23 then SetEntityCoords(ped, vector3(796.12, -747.16, 26.78-0.5)) end
				if pizzaseat == 24 then SetEntityCoords(ped, vector3(799.78, -747.05, 26.78-0.5)) end
				
				if pizzaseat == 25 then SetEntityCoords(ped, vector3(796.33, -741.25, 26.78-0.5)) end
				if pizzaseat == 26 then SetEntityCoords(ped, vector3(800.3, -741.5, 26.78-0.5)) end
				
				if pizzaseat == 27 then SetEntityCoords(ped, vector3(802.65, -741.44, 26.78-0.5)) end
				if pizzaseat == 28 then SetEntityCoords(ped, vector3(806.46, -741.27, 26.78-0.5)) end
				
				if pizzaseat == 29 then SetEntityCoords(ped, vector3(808.05, -741.27, 26.78-0.5)) end
				if pizzaseat == 30 then SetEntityCoords(ped, vector3(811.95, -741.23, 26.78-0.5)) end
				
				if pizzaseat == 32 then SetEntityCoords(ped, vector3(812.85, -747.13, 26.78-0.5)) end
				if pizzaseat == 31 then SetEntityCoords(ped, vector3(809.14, -747.22, 26.78-0.5)) end
				
				
				if pizzaseat == 33 then SetEntityCoords(ped, vector3(803.35, -761.66, 31.27-0.5)) end
				if pizzaseat == 34 then SetEntityCoords(ped, vector3(806.01, -761.49, 31.27-0.5)) end
				
				if pizzaseat == 35 then SetEntityCoords(ped, vector3(798.56, -750.4, 31.27-0.5)) end
				if pizzaseat == 36 then SetEntityCoords(ped, vector3(798.86, -753.3, 31.27-0.5)) end
				if pizzaseat == 37 then SetEntityCoords(ped, vector3(797.04, -753.41, 31.27-0.5)) end
				
				if pizzaseat == 38 then SetEntityCoords(ped, vector3(800.41, -756.39, 31.27-0.5)) end
				
				pizzaseat = 0
			end
		end
		Wait(5) if not IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then sitting = false end
	end
end)


Config.Chairs = {
	--TableSeating
	{ location = vector3(808.11, -751.56, 26.78), heading = 84.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 1 },
	{ location = vector3(805.96, -751.59, 26.78), heading = 276.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 2 },
	
	{ location = vector3(804.17, -751.56, 26.78), heading = 86.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 2 },
	{ location = vector3(802.06, -751.55, 26.78), heading = 275.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 3 },
	
	{ location = vector3(800.18, -751.55, 26.78), heading = 85.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 3 },
	{ location = vector3(798.03, -751.55, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 4 },

	{ location = vector3(799.07, -748.83, 26.78), heading = 95.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 5 },
	{ location = vector3(796.92, -748.78, 26.78), heading = 265.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 6 },
	
	{ location = vector3(795.08, -750.45, 26.78), heading = 205.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 7 },
	{ location = vector3(795.14, -752.68, 26.78), heading = 355.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 8 },
	
	{ location = vector3(799.58, -754.03, 26.78), heading = 161.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 9 },
	{ location = vector3(799.51, -756.1, 26.78), heading = 7.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 10 },
	
	--CORNER NEAR ATM
	{ location = vector3(796.55, -767.47, 26.78), heading = 0.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7 },
	{ location = vector3(795.12, -765.91, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7 },
	{ location = vector3(795.09, -764.92, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7 },
	{ location = vector3(795.1, -763.93, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7 },

	--BOOTHS
	{ location = vector3(808.50, -755.42, 26.78), heading = 90.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 11 },
	{ location = vector3(808.50, -754.42, 26.78), heading = 90.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 11 },
	{ location = vector3(806.96, -755.42, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 12 },
	{ location = vector3(806.96, -754.42, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 12 },

	{ location = vector3(806.36, -755.42, 26.78), heading = 90.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 13 },
	{ location = vector3(806.36, -754.42, 26.78), heading = 90.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 13 },
	{ location = vector3(804.85, -755.42, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 14 },
	{ location = vector3(804.85, -754.42, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 14 },

	{ location = vector3(804.25, -755.42, 26.78), heading = 90.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 15 },
	{ location = vector3(804.25, -754.42, 26.78), heading = 90.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 15 },
	{ location = vector3(802.74, -755.42, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 16 },
	{ location = vector3(802.74, -754.42, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 16 },
	
	{ location = vector3(802.14, -755.42, 26.78), heading = 90.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 17 },
	{ location = vector3(802.14, -754.42, 26.78), heading = 90.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 17 },
	{ location = vector3(800.63, -755.42, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 18 },
	{ location = vector3(800.63, -754.42, 26.78), heading = 270.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 18 },
	
	{ location = vector3(799.70, -756.86, 26.78), heading = 180.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 19 },
	{ location = vector3(799.08, -756.86, 26.78), heading = 180.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 19 },
	{ location = vector3(799.70, -758.37, 26.78), heading = 0.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 20 },
	{ location = vector3(799.08, -758.37, 26.78), heading = 0.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 20 },

	{ location = vector3(799.70, -758.97, 26.78), heading = 180.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 21 },
	{ location = vector3(799.08, -758.97, 26.78), heading = 180.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 21 },
	{ location = vector3(799.70, -760.48, 26.78), heading = 0.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 22 },
	{ location = vector3(799.08, -760.48, 26.78), heading = 0.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 22 },
	--OUTSIDE
	{ location = vector3(796.57, -747.15, 26.78), heading = 275.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 23 },
	{ location = vector3(799.28, -747.16, 26.78), heading = 85.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 24 },
	
	{ location = vector3(796.74, -741.29, 26.78), heading = 265.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 25 },
	{ location = vector3(799.63, -741.27, 26.78), heading = 111.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 26 },
	
	{ location = vector3(803.11, -741.31, 26.78), heading = 265.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 27 },
	{ location = vector3(805.97, -741.26, 26.78), heading = 111.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 28 },

	{ location = vector3(808.64, -741.27, 26.78), heading = 265.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 29 },
	{ location = vector3(811.52, -741.3, 26.78), heading = 101.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 30 },
	
	{ location = vector3(809.6, -747.17, 26.78), heading = 285.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 31 },
	{ location = vector3(812.41, -747.16, 26.78), heading = 91.0, width = 0.6, depth = 0.6, minZ=25.78, maxZ=26.78, distance = 1.7, seat = 32 },
	--Basement
	{ location = vector3(809.75, -759.73, 22.3), heading = 352.0, width = 0.6, depth = 0.6, minZ=21.3, maxZ=22.3, distance = 1.7, },
	{ location = vector3(808.58, -758.5, 22.3), heading = 270.0, width = 0.6, depth = 0.6, minZ=21.3, maxZ=22.3, distance = 1.7, },
	{ location = vector3(809.78, -757.21, 22.3), heading = 170.0, width = 0.6, depth = 0.6, minZ=21.3, maxZ=22.3, distance = 1.7, },

	--UPSTAIRS
	--Office
	{ location = vector3(796.19, -767.65, 31.27), heading = 357.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	{ location = vector3(795.36, -763.7, 31.27), heading = 180.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	{ location = vector3(796.11, -763.7, 31.27), heading = 180.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	{ location = vector3(796.85, -763.68, 31.27), heading = 180.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	--Main Area
	{ location = vector3(796.4, -762.58, 31.27), heading = 357.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	{ location = vector3(795.38, -761.42, 31.27), heading = 267.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	{ location = vector3(795.33, -760.45, 31.27), heading = 267.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	{ location = vector3(795.4, -759.43, 31.27), heading = 267.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	
	{ location = vector3(803.91, -758.86, 31.27), heading = 267.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 33 },
	{ location = vector3(803.85, -759.62, 31.27), heading = 267.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 33 },
	{ location = vector3(803.87, -760.62, 31.27), heading = 277.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 33 },
	{ location = vector3(804.85, -761.66, 31.27), heading = 9.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	{ location = vector3(805.72, -760.58, 31.27), heading = 81.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 34 },
	{ location = vector3(805.69, -759.62, 31.27), heading = 91.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 34 },
	{ location = vector3(805.71, -758.86, 31.27), heading = 91.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 34 },
	--BOSS
	{ location = vector3(797.9, -750.40, 31.27), heading = 180.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 35 },
	{ location = vector3(798.58, -752.73, 31.27), heading = 20.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 36 },
	{ location = vector3(797.19, -752.72, 31.27), heading = 340.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 37 },
	{ location = vector3(802.57, -749.27, 31.27), heading = 160.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	{ location = vector3(803.31, -756.31, 31.27), heading = 81.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, },
	{ location = vector3(802.2, -757.48, 31.27), heading = 15.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 38 },
	{ location = vector3(800.83, -757.44, 31.27), heading = 340.0, width = 0.6, depth = 0.6, minZ=30.47, maxZ=31.47, distance = 1.7, seat = 38 },
}