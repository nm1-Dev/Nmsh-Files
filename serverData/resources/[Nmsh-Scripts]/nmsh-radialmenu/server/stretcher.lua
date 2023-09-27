RegisterNetEvent('nmsh-radialmenu:server:RemoveStretcher', function(pos, stretcherObject)
    TriggerClientEvent('nmsh-radialmenu:client:RemoveStretcherFromArea', -1, pos, stretcherObject)
end)

RegisterNetEvent('nmsh-radialmenu:Stretcher:BusyCheck', function(id, type)
    TriggerClientEvent('nmsh-radialmenu:Stretcher:client:BusyCheck', id, source, type)
end)

RegisterNetEvent('nmsh-radialmenu:server:BusyResult', function(isBusy, otherId, type)
    TriggerClientEvent('nmsh-radialmenu:client:Result', otherId, isBusy, type)
end)