local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('core-policepoints:server:addpoints', function(points)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    exports.oxmysql:execute(
        'SELECT points FROM core_policepoints WHERE citizenid = ? AND license = ? ',
        { Player.PlayerData.citizenid, Player.PlayerData.license }, function(result)
            if result[1] then
                local currentpoints = tonumber(result[1].points)

                local newpoints = currentpoints + points
                exports.oxmysql:execute(
                    'UPDATE core_policepoints SET points = ? WHERE citizenid = ? AND license = ?',
                    {
                        newpoints,
                        Player.PlayerData.citizenid,
                        Player.PlayerData.license,

                    })
                TriggerClientEvent('QBCore:Notify', src, 'you recieved ' .. points .. ' points', "success", 7500)
            else
                exports.oxmysql:insert(
                    'INSERT INTO core_policepoints (citizenid, license, points) VALUES (?, ?, ?)',
                    { Player.PlayerData.citizenid, Player.PlayerData.license, points })
            end
        end)
end)
QBCore.Commands.Add('policepoints', 'See your points', {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if Player.PlayerData.job.name == "police" then
        exports.oxmysql:execute(
            'SELECT points FROM core_policepoints WHERE citizenid = ? AND license = ?',
            { Player.PlayerData.citizenid, Player.PlayerData.license },
            function(result)
                if result[1] then
                    local points = result[1].points
                    TriggerClientEvent('QBCore:Notify', src,
                        "Your police points are: " .. points .. " points ", "success", 7500)
                else
                    TriggerClientEvent('QBCore:Notify', source, "your points are 0", "error", 7500)
                end
            end
        )
    else
        TriggerClientEvent('QBCore:Notify', src, "you arent a cop", "error", 7500)
    end
end)
