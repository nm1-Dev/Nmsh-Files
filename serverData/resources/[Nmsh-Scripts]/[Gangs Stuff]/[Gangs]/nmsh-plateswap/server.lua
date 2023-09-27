local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('nmsh-plateswap:addPlate', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {
        plate = data
    }
    Player.Functions.AddItem('license_plate', 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['license_plate'], 'add')
end)

RegisterNetEvent('nmsh-plateswap:RemovePlate', function(data, slot)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('license_plate', 1, slot)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['license_plate'], 'remove')
end)

RegisterNetEvent('nmsh-plateswap:RemoveScrewdriverItem', function(data, slot)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('plate_screwdriver') then
        Player.Functions.RemoveItem('plate_screwdriver', 1, slot)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['plate_screwdriver'], 'remove')
    end
end)


QBCore.Functions.CreateUseableItem("license_plate", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('nmsh-plateswap:installPlate', source, item.info.plate, item.slot)
    end
end)



QBCore.Functions.CreateUseableItem("plate_screwdriver", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("nmsh-plateswap:removePlate", source)
    end
end)
