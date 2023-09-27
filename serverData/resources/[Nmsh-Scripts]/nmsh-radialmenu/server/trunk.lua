local QBCore = exports['qb-core']:GetCoreObject()
local trunkBusy = {}

RegisterNetEvent('nmsh-radialmenu:trunk:server:Door', function(open, plate, door)
    TriggerClientEvent('nmsh-radialmenu:trunk:client:Door', -1, plate, door, open)
end)

RegisterNetEvent('nmsh-trunk:server:setTrunkBusy', function(plate, busy)
    trunkBusy[plate] = busy
end)

RegisterNetEvent('nmsh-trunk:server:KidnapTrunk', function(targetId, closestVehicle)
    TriggerClientEvent('nmsh-trunk:client:KidnapGetIn', targetId, closestVehicle)
end)

QBCore.Functions.CreateCallback('nmsh-trunk:server:getTrunkBusy', function(_, cb, plate)
    if trunkBusy[plate] then cb(true) return end
    cb(false)
end)

QBCore.Commands.Add("getintrunk", Lang:t("general.getintrunk_command_desc"), {}, false, function(source)
    TriggerClientEvent('nmsh-trunk:client:GetIn', source)
end)

QBCore.Commands.Add("putintrunk", Lang:t("general.putintrunk_command_desc"), {}, false, function(source)
    TriggerClientEvent('nmsh-trunk:server:KidnapTrunk', source)
end)