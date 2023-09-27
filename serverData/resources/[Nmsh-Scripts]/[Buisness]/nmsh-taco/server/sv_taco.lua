local QBCore = exports['qb-core']:GetCoreObject()

-- Cooked Ground Beef
RegisterNetEvent('rt-taco:server:makeCookedGroundBeef', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("raw-ground-beef", 1)
    Player.Functions.AddItem("ground-beef", 1)
end)

-- Cooked Chicken
RegisterNetEvent('rt-taco:server:makeCookedChicken', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("raw-chicken", 1)
    Player.Functions.AddItem("chicken", 1)
end)

-- Beef Taco
RegisterNetEvent('rt-taco:server:makeBeefTaco', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("tortillas", 1)
    Player.Functions.RemoveItem("ground-beef", 1)
    Player.Functions.RemoveItem("taco-tomato", 1)
    Player.Functions.RemoveItem("lettuce", 1)
    Player.Functions.RemoveItem("cheddar-cheese", 1)
    Player.Functions.AddItem("beef-taco", 1)
end)

-- Beef Burrito
RegisterNetEvent('rt-taco:server:makeBeefBurrito', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("tortillas", 1)
    Player.Functions.RemoveItem("ground-beef", 1)
    Player.Functions.RemoveItem("cheddar-cheese", 1)
    Player.Functions.RemoveItem("lettuce", 1)
    Player.Functions.AddItem("beef-burrito", 1)
end)

-- Chicken Taco
RegisterNetEvent('rt-taco:server:makeChickenTaco', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("tortillas", 1)
    Player.Functions.RemoveItem("chicken", 1)
    Player.Functions.RemoveItem("taco-tomato", 1)
    Player.Functions.RemoveItem("lettuce", 1)
    Player.Functions.RemoveItem("cheddar-cheese", 1)
    Player.Functions.AddItem("chicken-taco", 1)
end)

-- Chicken Burrito
RegisterNetEvent('rt-taco:server:makeChickenBurrito', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("tortillas", 1)
    Player.Functions.RemoveItem("chicken", 1)
    Player.Functions.RemoveItem("cheddar-cheese", 1)
    Player.Functions.RemoveItem("lettuce", 1)
    Player.Functions.AddItem("chicken-burrito", 1)
end)

-- Quesadillas
RegisterNetEvent('rt-taco:server:makeQuesadillas', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("tortillas", 1)
    Player.Functions.RemoveItem("cheddar-cheese", 1)
    Player.Functions.RemoveItem("butter", 1)
    Player.Functions.AddItem("quesadilla", 1)
end)

-- Nachos
RegisterNetEvent('rt-taco:server:makeNachos', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("tortilla-chips", 1)
    Player.Functions.RemoveItem("cheddar-cheese", 1)
    Player.Functions.AddItem("nachos", 1)
end)

-- Drink Section
-- Coke Soda
RegisterNetEvent('rt-taco:server:makeCokeSoda', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("carbonated-water", 1)
    Player.Functions.RemoveItem("sugar-cubes", 1)
    Player.Functions.AddItem("coke-soda", 1)
end)

-- Fanta
RegisterNetEvent('rt-taco:server:makeFanta', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("carbonated-water", 1)
    Player.Functions.RemoveItem("sugar-cubes", 1)
    Player.Functions.AddItem("fanta", 1)
end)

-------/ Creating Usable Item
-- Beef Taco
QBCore.Functions.CreateUseableItem("beef-taco", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("rt-taco:client:EatTaco", source, item.name)
    end
end)

-- Beef Burrito
QBCore.Functions.CreateUseableItem("beef-burrito", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("rt-taco:client:EatTaco", source, item.name)
    end
end)

-- Chicken Taco
QBCore.Functions.CreateUseableItem("chicken-taco", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("rt-taco:client:EatTaco", source, item.name)
    end
end)

-- Chicken Burrito
QBCore.Functions.CreateUseableItem("chicken-burrito", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("rt-taco:client:EatTaco", source, item.name)
    end
end)

-- Quesadilla
QBCore.Functions.CreateUseableItem("quesadilla", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("rt-taco:client:Eat", source, item.name)
    end
end)

-- Nachos
QBCore.Functions.CreateUseableItem("nachos", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("rt-taco:client:Eat", source, item.name)
    end
end)

-- Coke Soda
QBCore.Functions.CreateUseableItem("coke-soda", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("rt-taco:client:Drink", source, item.name)
    end
end)

-- Fanta
QBCore.Functions.CreateUseableItem("fanta", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("rt-taco:client:Drink", source, item.name)
    end
end)

-------/ Create Bill Section
RegisterNetEvent("rt-taco:server:billPlayer", function(playerId, amount)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if biller.PlayerData.job.name == 'taco' then
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
                billed.Functions.RemoveMoney('bank', amount)
                TriggerClientEvent('QBCore:Notify', source, 'You charged a customer.', 'success')
                TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'You have been charged $'..amount..' for your order at Taco Shop.')
                --exports['Renewed-Banking']:addAccountMoney('taco', amount) -- Uncomment and comment out the nmsh-management one to use renewed-banking
                exports['nmsh-management']:AddMoney('taco', amount)
                else
                    TriggerClientEvent('QBCore:Notify', source, 'Must be a valid amount above 0.', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'You cannot bill yourself.', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'Player not online', 'error')
        end
    end
end)