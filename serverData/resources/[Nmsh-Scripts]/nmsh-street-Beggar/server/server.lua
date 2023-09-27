local QBCore = exports[Config.Core]:GetCoreObject()


QBCore.Functions.CreateCallback("kael-beggar:server:checkmoneyforitem", function(source, cb, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local PlayerMoney = Player.Functions.GetMoney("cash")
    local Cost = 0

    if item == "begging_guitar" then 
        Cost = Config.GuitarPrice
    elseif item == "begging_box" then 
        Cost = Config.BoxPrice
    end

    if Player and PlayerMoney >= Cost then 
        Player.Functions.RemoveMoney("cash", Cost)
        Player.Functions.AddItem(item, 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
        cb(true)
    else
        cb(false)
        TriggerClientEvent('QBCore:Notify', source, "You Don't Have Enought Money!", 'error')
    end
end)

QBCore.Functions.CreateCallback("kael-beggar:server:checkbeggingguitar", function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local RequiredItem = Player.Functions.GetItemByName("begging_guitar")

    if RequiredItem then 
        cb(true)
    else
        cb(false)
        TriggerClientEvent('QBCore:Notify', source, "You Don't Have Guitar To Play!", 'error')
    end
end)

RegisterNetEvent("kael-beggar:server:giverewardmoney", function(amount)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then 
        if amount then
            Player.Functions.AddMoney("cash", math.random(Config.RewardMin, Config.RewardMax))
        end
    end
end)

QBCore.Functions.CreateUseableItem('begging_box', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("kael-beggar:client:beggingboxspawn", source)
    end
end)