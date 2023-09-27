local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('nmsh-policehub:officers:count', function(source, cb)
    local count = 0
    local policelist = {}
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player.PlayerData.job.name == "police" and Player.PlayerData.job then
            count = count + 1
        end
    end
    cb(count)
end)

QBCore.Functions.CreateCallback('nmsh-policehub:officer:location', function(source, cb)
    local count = 0
    local policelist = {}
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player.PlayerData.job.name == "police" and Player.PlayerData.job then
            count = count + 1
        end
    end
    cb(count)
end)

RegisterServerEvent('nmsh-policehub:get:officers')
AddEventHandler('nmsh-policehub:get:officers', function()
    local src = source
    local cops = 0
    local data = {}
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(Player.PlayerData.source), false)
        if Player.PlayerData.job.name == "police"then
            cops = cops + 1
            local vehicleClass = GetVehicleType(vehicle)
            if vehicleClass == nil then
                vehiclestatus = 1 --"OnFoot"
              elseif vehicleClass == "bike" then
                vehiclestatus = 2 --"Cycles"
              elseif vehicleClass == "boat" then
                vehiclestatus = 3 --"Boats"
              elseif vehicleClass == "heli" then
                vehiclestatus = 4 --"Helicopters"
              elseif vehicleClass == "plane" then
                vehiclestatus = 5 --"Planes"
              else
                vehiclestatus = 6 --"Cars"
            end
            table.insert(data, {id = Player.PlayerData.source, name = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname, grade = Player.PlayerData.job.grade.name, count = cops, duty = Player.PlayerData.job.onduty, callsign =  Player.PlayerData.metadata["callsign"], status = vehiclestatus})
        end
    end
    TriggerClientEvent('nmsh-policehub:send:officers', src, data, cops)
end)

RegisterServerEvent('nmsh-policehub:SendPanicToPlayers')
AddEventHandler('nmsh-policehub:SendPanicToPlayers', function(coords, grade, name)
    local src = source
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        local Player2 = QBCore.Functions.GetPlayer(id)
        if Player.PlayerData.job.name == "police" then
            TriggerClientEvent("QBCore:Notify", Player.PlayerData.source, ""..grade.." "..name.." activated panic button", "police", 15000)
            TriggerClientEvent("QBCore:Notify", Player.PlayerData.source, "To all officers you have to head to "..grade.." "..name.." the radar will give you the location of the "..grade.."", "police", 15000)
            TriggerClientEvent("nmsh-policehub:SetPanicBlip", Player.PlayerData.source, coords)
        end
    end
end)

RegisterServerEvent('nmsh-policehub:officer:change:callsign')
AddEventHandler('nmsh-policehub:officer:change:callsign', function(id, callsign)
    local Player = QBCore.Functions.GetPlayer(id)
    Player.Functions.SetMetaData("callsign", callsign)
    TriggerClientEvent("QBCore:Notify", Player.PlayerData.source, "You just changed your callsign successfully", "police", 5000)
end)