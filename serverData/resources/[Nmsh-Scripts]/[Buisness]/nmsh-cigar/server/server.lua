local QBCore = exports[Config.Core]:GetCoreObject()

RegisterNetEvent("nmsh-cigar:server:PickUpTobacco", function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem(Config.WeedLeafItem, 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.WeedLeafItem], "add", 1)
end)

QBCore.Functions.CreateCallback("nmsh-cigar:server:makingcigar", function(source, cb, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local RequiredItems = Config.Products[item].requiredItems
    local ItemCount = 0
    local PassedItem = 0
    for _, i in pairs(RequiredItems) do 
        local ItemFind = Player.Functions.GetItemByName(i.name)
        if ItemFind then 
            local ItemAmount = ItemFind.amount
            if ItemAmount >= i.amount then
                PassedItem = PassedItem + 1
            end
        end
        ItemCount = ItemCount + 1
    end
    if ItemCount == PassedItem then
        for _, i in pairs(RequiredItems) do 
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[i.name], "remove")
            Player.Functions.RemoveItem(i.name, i.amount)
        end
        cb(true) 
    else 
        cb(false)
    end
end)

RegisterNetEvent("nmsh-cigar:server:GiveCigar", function(item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
    Player.Functions.AddItem(item, 1)
end)

QBCore.Functions.CreateUseableItem("cubanbox", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cubanbox"], "remove")
        Player.Functions.RemoveItem("cubanbox", 1)
        Player.Functions.AddItem("cubancigar", 10)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cubancigar"], "add")
    end
end)

QBCore.Functions.CreateUseableItem("morebox", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["morebox"], "remove")
        Player.Functions.RemoveItem("morebox", 1)
        Player.Functions.AddItem("morecigar", 10)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["morecigar"], "add")
    end
end)

QBCore.Functions.CreateUseableItem("cubancigar", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem("cubancigar", 1)
    TriggerClientEvent("consumables:client:SmokeCuban", source)
end)

QBCore.Functions.CreateUseableItem("morecigar", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem("morecigar", 1)
    TriggerClientEvent("consumables:client:SmokeMoreCigar", source)
end)