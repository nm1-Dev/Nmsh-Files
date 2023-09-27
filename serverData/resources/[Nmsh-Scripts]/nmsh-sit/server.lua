local QBCore = exports['qb-core']:GetCoreObject()

local seatsTaken = {}

RegisterNetEvent('nmsh-sit:takePlace', function(objectCoords)
    seatsTaken[objectCoords] = true
end)

RegisterNetEvent('nmsh-sit:leavePlace', function(objectCoords)
    if seatsTaken[objectCoords] then
        seatsTaken[objectCoords] = nil
    end
end)

QBCore.Functions.CreateCallback('nmsh-sit:getPlace', function(source, cb, objectCoords)
    -- print(objectCoords)
    taken = nil

    -- for k, v in pairs(seatsTaken) do
    -- 	-- print(k, v)
    -- end

    if seatsTaken[objectCoords] then
        taken = true
    end

    -- print(taken)
    cb(taken)
end)
