local nmsh = exports['qb-core']:GetCoreObject()

RegisterNetEvent('nmsh-robberylist:server:buyshit', function(ped)
    local src = source
    local Player = nmsh.Functions.GetPlayer(src)
    if not src or not Player or not ped then return end
    -- local cash = Player.PlayerData.money[Config.Shop[ped].type]
    local price = Config.Shop[ped].price
    local payType = Config.Shop[ped].type

    if Player.Functions.RemoveMoney(payType, price) ~= true then
        TriggerClientEvent('nmsh:Notify', src, 'Not enough ' .. payType, 'error')
        return
    end

    if Player.Functions.AddItem(Config.Shop[ped].item, 1) ~= true then
        Player.Functions.AddMoney(payType, price)
        TriggerClientEvent('nmsh:Notify', src, 'Could not give item', 'error')
        return
    end

    TriggerClientEvent('inventory:client:ItemBox', src, nmsh.Shared.Items[Config.Shop[ped].item], "add")
    TriggerClientEvent('nmsh:Notify', src, "Here's the contraband, Good Luck!")
end)
