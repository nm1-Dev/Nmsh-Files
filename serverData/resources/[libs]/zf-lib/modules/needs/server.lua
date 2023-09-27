function zf.updateNeed(need, type, amount)
    local source = source
    if zf.core == 'qb-core' then
        local Player = zf.getPlayer(source)
        local defaultValue = Player.Functions.GetMetaData(need)
        local newValue = amount
        if type == 'add' then newValue = defaultValue + amount
        elseif type == 'remove' then newValue = defaultValue - amount
        elseif type == 'set' then newValue = amount end

        Player.Functions.SetMetaData(need, newValue)
        TriggerClientEvent('hud:client:UpdateNeeds', source, Player.Functions.GetMetaData('hunger'), Player.Functions.GetMetaData('thirst'))
    elseif zf.core == 'esx' then
        if type == 'add' then TriggerClientEvent(source, 'esx_status:add', need, amount)
        elseif type == 'remove' then TriggerClientEvent(source, 'esx_status:remove', need, amount)
        elseif type == 'set' then TriggerClientEvent(source, 'esx_status:set', need, amount) end
    end
end

RegisterNetEvent('zf-lib:updateNeed', function(need, type, amount)
    local source = source
    zf.updateNeed(need, type, amount)
end)