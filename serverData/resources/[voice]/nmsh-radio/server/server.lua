local playerList = {}
 
function Scully.GetPlayerName(source)
    local callsign, name = Scully.Functions.GetPlayerName(source)
    if playerList[source] then
        if playerList[source]['callsign'] then
            callsign = playerList[source]['callsign'] .. ' | '
        end
        if playerList[source]['name'] then
            name = playerList[source]['name']
        end
    end
    local playerName = callsign .. name
    return playerName
end
 
exports('getPlayerName', Scully.GetPlayerName)
 
RegisterNetEvent('scully_radio:updateRadioInfo', function(dataType, dataValue)
    local _source = source
    local callsign, name = Scully.Functions.GetPlayerName(_source)
    if playerList[_source] then
        playerList[_source][dataType] = dataValue
        if playerList[_source]['callsign'] then
            callsign = playerList[_source]['callsign'] .. ' | '
        end
        if playerList[_source]['name'] then
            name = playerList[_source]['name']
        end
    else
        playerList[_source] = {}
        playerList[_source][dataType] = dataValue
        if playerList[_source]['callsign'] then
            callsign = playerList[_source]['callsign'] .. ' | '
        end
        if playerList[_source]['name'] then
            name = playerList[_source]['name']
        end
    end
    local playerName = callsign .. name
    TriggerClientEvent('scully_radio:updateRadioInfo', -1, _source, playerName)
end)
 
RegisterNetEvent('scully_radio:addPlayerToRadio', function(player)
    local _source = source
    local callsign, name = Scully.Functions.GetPlayerName(player)
    if playerList[player] then
        if playerList[player]['callsign'] then
            callsign = playerList[player]['callsign'] .. ' | '
        end
        if playerList[player]['name'] then
            name = playerList[player]['name']
        end
    end
    local playerName = callsign .. name
    TriggerClientEvent('scully_radio:addPlayerToRadio', _source, player, playerName)
end)
 
RegisterNetEvent('pma-voice:setPlayerRadio', function(channel)
    if channel == 0 then return end
    local _source = source
    local players = exports['pma-voice']:getPlayersInRadioChannel(channel)
    for player, isTalking in pairs(players) do
        if player ~= _source then
            local callsign, name = Scully.Functions.GetPlayerName(player)
            if playerList[player] then
                if playerList[player]['callsign'] then
                    callsign = playerList[player]['callsign'] .. ' | '
                end
                if playerList[player]['name'] then
                    name = playerList[player]['name']
                end
            end
            local playerName = callsign .. name
            TriggerClientEvent('scully_radio:addPlayerToRadio', _source, player, playerName)
        end
    end
end)
 
RegisterNetEvent('scully_radio:removePlayerFromRadio', function(player)
    local _source = source
    TriggerClientEvent('scully_radio:removePlayerFromRadio', _source, player)
end)
 
RegisterNetEvent('scully_radio:setTalkingOnRadio', function(player, talking)
    local _source = source
    TriggerClientEvent('scully_radio:setTalkingOnRadio', _source, player, talking)
end)