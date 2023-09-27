local QBCore = exports['qb-core']:GetCoreObject()

local GoProStreams = {}
local myStreams = {}

local function uuid()
    math.randomseed(os.time())
    local template = 'xxxx-META-xxx-xx'
    return string.gsub(template, '[xy]', function (c)
        local v = (c == 'x') and math.random(0, 0xf) or math.random(8, 0xb)
        return string.format('%x', v)
    end)
end

local function GenerateStreamID()
    local defaultID = uuid()

    for k,v in pairs(GoProStreams) do
        if v.streamID == defaultID then
            defaultID = nil
            break
        end
    end

    repeat
        Wait(1)
    until defaultID ~= nil

    return defaultID
end

RegisterNetEvent('rp_vehicles:server:GoPro:CreateStream')
AddEventHandler('rp_vehicles:server:GoPro:CreateStream', function(veh, dashType)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cid = Ply.PlayerData.citizenid
    local networkVehicleEntity = NetworkGetEntityFromNetworkId(veh)

	local streamTitle = ""

	if dashType == 'pd' then
		streamTitle = Ply.PlayerData.job.grade.name .. ' - '.. Ply.PlayerData.charinfo.lastname .. ' #'..Ply.PlayerData.metadata.callsign
	end
    GoProStreams[networkVehicleEntity] = {
        vehicleEntity = networkVehicleEntity, --NetToVeh()
        streamPin = math.random(0000,9999),
        streamTitle = streamTitle,
        streamID = GenerateStreamID(),
        viewers = {},
		streamType = dashType
    }
	Entity(networkVehicleEntity).state:set('dashcam', true, true)
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

RegisterNetEvent('rp_vehicles:server:GoPro:JoinStream', function(data)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)

    if not GoProStreams[data.vehicleEntity] then 
        return 
    end

        local vehData = GoProStreams[data.vehicleEntity]

        local StillExists = DoesEntityExist(vehData.vehicleEntity)

        if not StillExists then
            GoProStreams[vehData.vehicleEntity] = nil
            TriggerClientEvent('QBCore:Notify', src, "Araç artık yok", 'error')
            return
        end

        local vehCoords = GetEntityCoords(vehData.vehicleEntity)
        TriggerClientEvent('rp_vehicles:client:GoPro:AttachCam', src, NetworkGetNetworkIdFromEntity(vehData.vehicleEntity), vehCoords)
end)

RegisterNetEvent('rp_vehicles:server:GoPro:LeaveStream', function()
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)

    if myStreams[Ply.PlayerData.citizenid] ~= nil then
        TriggerClientEvent('rp_vehicles:server:GoPro:DetachCam', src)
    end
end)

QBCore.Functions.CreateUseableItem('dashcam', function(source, item)
	TriggerClientEvent('rp_vehicles:client:GoPro:attach', source, item, 'pd')
end)

QBCore.Functions.CreateCallback('rp_vehicles:server:GoPro:GetDashCams', function(source, cb, camType)
	local retval = {}

	for k,v in pairs(GoProStreams) do
		if v.streamType == camType then
			retval[k] = v
		end
	end

	cb(retval)
end)

AddEventHandler('entityRemoved', function(entity)
	if GoProStreams[entity] then
		GoProStreams[entity] = nil
	end
end)