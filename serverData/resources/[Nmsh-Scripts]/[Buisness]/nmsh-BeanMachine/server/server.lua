local QBCore = exports['qb-core']:GetCoreObject()

local seatsTaken = {}

QBCore.Functions.CreateCallback('nmsh-BeanMachine:GetPlace', function(source, cb, objectCoords)
	cb(seatsTaken[objectCoords])
end)

RegisterNetEvent('nmsh-BeanMachine:TakePlace', function(objectCoords)
	seatsTaken[objectCoords] = true
end)

RegisterNetEvent('nmsh-BeanMachine:LeavePlace', function(objectCoords)
	if seatsTaken[objectCoords] then
		seatsTaken[objectCoords] = nil
	end
end)

QBCore.Functions.CreateUseableItem("bdonut", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Eat", src, Config.Items['DonutItem'], Config.Locals["EatDonutProgressBar"]["Txt"], Config.Locals["EatDonutProgressBar"]["Time"], true, false, false)                                                              				
end)

QBCore.Functions.CreateUseableItem("bbanana", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Eat", src, Config.Items['BananaItem'], Config.Locals["EatBananaProgressBar"]["Txt"], Config.Locals["EatBananaProgressBar"]["Time"], false, true, false)                                                              				
end)

QBCore.Functions.CreateUseableItem("borange", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Eat", src, Config.Items['OrangeItem'], Config.Locals["EatOrangeProgressBar"]["Txt"], Config.Locals["EatOrangeProgressBar"]["Time"], false, true, false)                                                              				
end)

QBCore.Functions.CreateUseableItem("bapple", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Eat", src, Config.Items['AppleItem'], Config.Locals["EatAppleProgressBar"]["Txt"], Config.Locals["EatAppleProgressBar"]["Time"], false, true, false)                                                              				
end)

QBCore.Functions.CreateUseableItem("bmuffin", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Eat", src, Config.Items['RegularMuffinItem'], Config.Locals["EatMuffinProgressBar"]["Txt"], Config.Locals["EatMuffinProgressBar"]["Time"], false, false, true)                                                              				
end)

QBCore.Functions.CreateUseableItem("bchocolatemuffin", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Eat", src, Config.Items['ChocolateMuffinItem'], Config.Locals["EatChocolateMuffinProgressBar"]["Txt"], Config.Locals["EatChocolateMuffinProgressBar"]["Time"], false, false, true)                                                              				
end)

QBCore.Functions.CreateUseableItem("bberrymuffin", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Eat", src, Config.Items['BerryMuffinItem'], Config.Locals["EatBerryMuffinProgressBar"]["Txt"], Config.Locals["EatBerryMuffinProgressBar"]["Time"], false)                                                              				
end)

QBCore.Functions.CreateUseableItem("bsprite", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Drink", src, Config.Items['SpriteItem'], Config.Locals["DrinkingProgressBar"]["Txt"], Config.Locals["DrinkingProgressBar"]["Time"], false, true, false, false)                                                              				
end)

QBCore.Functions.CreateUseableItem("bcocacola", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Drink", src, Config.Items['CocacolaItem'], Config.Locals["DrinkingProgressBar"]["Txt"], Config.Locals["DrinkingProgressBar"]["Time"], true, false, false, false, false)                                                              				
end)

QBCore.Functions.CreateUseableItem("bpepper", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Drink", src, Config.Items['DRPepperItem'], Config.Locals["DrinkingProgressBar"]["Txt"], Config.Locals["DrinkingProgressBar"]["Time"], false, false, true, false, false)                                                              				
end)

QBCore.Functions.CreateUseableItem("blemonslush", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Drink", src, Config.Items['LemonSlushItem'], Config.Locals["DrinkingProgressBar"]["Txt"], Config.Locals["DrinkingProgressBar"]["Time"], false, false, false, true, false)                                                              				
end)

QBCore.Functions.CreateUseableItem("borangeslush", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Drink", src, Config.Items['OrangeSlushItem'], Config.Locals["DrinkingProgressBar"]["Txt"], Config.Locals["DrinkingProgressBar"]["Time"], false, false, false, true, false)                                                              				
end)

QBCore.Functions.CreateUseableItem("bcloudcafe", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Drink", src, Config.Items['CloudCafeItem'], Config.Locals["DrinkingProgressBar"]["Txt"], Config.Locals["DrinkingProgressBar"]["Time"], false, false, false, false, true)                                                              				
end)

QBCore.Functions.CreateUseableItem("bjavachipfrappuccino", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Drink", src, Config.Items['JavaChipFrappuccinoItem'], Config.Locals["DrinkingProgressBar"]["Txt"], Config.Locals["DrinkingProgressBar"]["Time"], false, false, false, false, true)                                                              				
end)

QBCore.Functions.CreateUseableItem("bhotchoc", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Drink", src, Config.Items['HotChocItem'], Config.Locals["DrinkingProgressBar"]["Txt"], Config.Locals["DrinkingProgressBar"]["Time"], false, false, false, false, true)                                                              				
end)

QBCore.Functions.CreateUseableItem("bhoneyhazelnutoatlatte", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Drink", src, Config.Items['HoneyHazelnutOatLatteItem'], Config.Locals["DrinkingProgressBar"]["Txt"], Config.Locals["DrinkingProgressBar"]["Time"], false, false, false, false, true)                                                              				
end)

QBCore.Functions.CreateUseableItem("bstrawberrycreamfrappuccino", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Drink", src, Config.Items['StrawberryCreamFrappuccinoItem'], Config.Locals["DrinkingProgressBar"]["Txt"], Config.Locals["DrinkingProgressBar"]["Time"], false, false, false, false, true)                                                              				
end)

QBCore.Functions.CreateUseableItem("bicedcaffelatte", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Drink", src, Config.Items['IcedCaffeLatteItem'], Config.Locals["DrinkingProgressBar"]["Txt"], Config.Locals["DrinkingProgressBar"]["Time"], false, false, false, false, true)                                                              				
end)

QBCore.Functions.CreateUseableItem("bespresso", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Drink", src, Config.Items['EspressoItem'], Config.Locals["DrinkingProgressBar"]["Txt"], Config.Locals["DrinkingProgressBar"]["Time"], false, false, false, false, true)                                                              				
end)

QBCore.Functions.CreateUseableItem("bespressomacchiato", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Drink", src, Config.Items['EspressoMacchiatoItem'], Config.Locals["DrinkingProgressBar"]["Txt"], Config.Locals["DrinkingProgressBar"]["Time"], false, false, false, false, true)                                                              				
end)

QBCore.Functions.CreateUseableItem("bcaramelfrappucino", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Drink", src, Config.Items['CaramelFrappucinoItem'], Config.Locals["DrinkingProgressBar"]["Txt"], Config.Locals["DrinkingProgressBar"]["Time"], false, false, false, false, true)                                                              				
end)

QBCore.Functions.CreateUseableItem("bcoldbrewlatte", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Drink", src, Config.Items['ColdBrewlatteItem'], Config.Locals["DrinkingProgressBar"]["Txt"], Config.Locals["DrinkingProgressBar"]["Time"], false, false, false, false, true)                                                              				
end)

QBCore.Functions.CreateUseableItem("bstrawberryvanillaoatlatte", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:Drink", src, Config.Items['StrawberryVanillaOatLatteItem'], Config.Locals["DrinkingProgressBar"]["Txt"], Config.Locals["DrinkingProgressBar"]["Time"], false, false, false, false, true)                                                              				
end)

QBCore.Functions.CreateUseableItem("bmenu", function(source, item)
    local src = source
    TriggerClientEvent("nmsh-BeanMachine:OpenMenu", src)                                                              				
end)

RegisterServerEvent('nmsh-BeanMachine:TakeMoney', function(data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

    if Player.PlayerData.money.cash >= data.price then
        TriggerClientEvent("nmsh-BeanMachine:SpawnVehicle", src, data.vehicle)  
        Player.Functions.RemoveMoney("cash", data.price)
        TriggerClientEvent('QBCore:Notify', src, 'Vehicle Successfully Bought', "success")    
    else
        TriggerClientEvent('QBCore:Notify', src, 'You Dont Have Enough Money !', "error")              
    end    
end)

RegisterNetEvent('nmsh-BeanMachine:Givecup', function()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bregularcup'], 'add')
    ply.Functions.AddItem('bregularcup',1)
end)
RegisterNetEvent('nmsh-BeanMachine:GiveCoffeeCup', function()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcoffeeglass'], 'add')
    ply.Functions.AddItem('bcoffeeglass', 1)
end)
RegisterNetEvent('nmsh-BeanMachine:GiveHighCoffeeGlass', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bhighcoffeeglasscup'], 'add')
    ply.Functions.AddItem('bhighcoffeeglasscup', 1)
end)
RegisterNetEvent('nmsh-BeanMachine:GiveEspressocoffecup', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bespressocoffeecup'], 'add')
    ply.Functions.AddItem('bespressocoffeecup', 1)
end)
RegisterNetEvent('nmsh-BeanMachine:GiveLemonSlush', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bregularcup'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['blemonslush'], 'add')
    ply.Functions.RemoveItem('bregularcup', 1)
    ply.Functions.AddItem('blemonslush',1)
end)

RegisterNetEvent('nmsh-BeanMachine:GiveOrangeSlush', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bregularcup'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['borangeslush'], 'add')
    ply.Functions.RemoveItem('bregularcup', 1)
    ply.Functions.AddItem('borangeslush',1)
end)

RegisterNetEvent('nmsh-BeanMachine:GiveSprite', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bregularcup'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bsprite'], 'add')
    ply.Functions.RemoveItem('bregularcup', 1)
    ply.Functions.AddItem('bsprite',1)
end)

RegisterNetEvent('nmsh-BeanMachine:GiveCola', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bregularcup'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcocacola'], 'add')
    ply.Functions.RemoveItem('bregularcup', 1)
    ply.Functions.AddItem('bcocacola',1)
end)

RegisterNetEvent('nmsh-BeanMachine:Givedrpepper', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bregularcup'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bpepper'], 'add')
    ply.Functions.RemoveItem('bregularcup', 1)
    ply.Functions.AddItem('bpepper',1)
end)

RegisterNetEvent('nmsh-BeanMachine:GiveToast', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['tosti'], 'add')
    ply.Functions.AddItem('tosti',1)
end)
RegisterNetEvent('nmsh-BeanMachine:GiveDonut', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bdonut'], 'add')
    ply.Functions.AddItem('bdonut',1)
end)

RegisterNetEvent('nmsh-BeanMachine:GiveBanana', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bbanana'], 'add')
    ply.Functions.AddItem('bbanana',1)
end)

RegisterNetEvent('nmsh-BeanMachine:GiveOrange', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['borange'], 'add')
    ply.Functions.AddItem('borange',1)
end)

RegisterNetEvent('nmsh-BeanMachine:Giveapple', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bapple'], 'add')
    ply.Functions.AddItem('bapple',1)
end)

RegisterNetEvent('nmsh-BeanMachine:Givemuffin', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bmuffin'], 'add')
    ply.Functions.AddItem('bmuffin',1)
end)

RegisterNetEvent('nmsh-BeanMachine:Givebeans', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcoffeebeans'], 'add')
    ply.Functions.AddItem('bcoffeebeans',1)
end)
RegisterNetEvent('nmsh-BeanMachine:GiveChocolateMuffin', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bchocolatemuffin'], 'add')
    ply.Functions.AddItem('bchocolatemuffin',1)
end)

RegisterNetEvent('nmsh-BeanMachine:GiveberryMuffin', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bberrymuffin'], 'add')
    ply.Functions.AddItem('bberrymuffin',1)
end)

RegisterNetEvent('nmsh-BeanMachine:Givemenu', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bmenu'], 'add')
    ply.Functions.AddItem('bmenu',1)
end)
RegisterNetEvent('nmsh-BeanMachine:GiveCloudCafe', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bhighcoffeeglasscup'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bmilk'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcoffeebeans'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcream'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcloudcafe'], 'add')
    ply.Functions.RemoveItem('bhighcoffeeglasscup',1)
    ply.Functions.RemoveItem('bmilk',1)
    ply.Functions.RemoveItem('bcoffeebeans',1)
    ply.Functions.RemoveItem('bcream',1)
    ply.Functions.AddItem('bcloudcafe',1)
end)

RegisterNetEvent('nmsh-BeanMachine:GiveStrawberryCreamFrap', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bhighcoffeeglasscup'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bmilk'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcoffeebeans'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcream'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bstrawberry'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bstrawberrycreamfrappuccino'], 'add')
    ply.Functions.RemoveItem('bhighcoffeeglasscup',1)
    ply.Functions.RemoveItem('bmilk',1)
    ply.Functions.RemoveItem('bcoffeebeans',1)
    ply.Functions.RemoveItem('bcream',1)
    ply.Functions.RemoveItem('bstrawberry',1)
    ply.Functions.AddItem('bstrawberrycreamfrappuccino',1)
end)

RegisterNetEvent('nmsh-BeanMachine:GiveJavaChipFrap', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bhighcoffeeglasscup'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bmilk'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcoffeebeans'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcream'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bjavachipfrappuccino'], 'add')
    ply.Functions.RemoveItem('bhighcoffeeglasscup',1)
    ply.Functions.RemoveItem('bmilk',1)
    ply.Functions.RemoveItem('bcoffeebeans',1)
    ply.Functions.RemoveItem('bcream',1)
    ply.Functions.AddItem('bjavachipfrappuccino',1)
end)

RegisterNetEvent('nmsh-BeanMachine:GiveHotChoclate', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcoffeeglass'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bmilk'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcoffeebeans'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcream'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bhotchocolatepowder'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bhotchoc'], 'add')
    ply.Functions.RemoveItem('bcoffeeglass',1)
    ply.Functions.RemoveItem('bmilk',1)
    ply.Functions.RemoveItem('bcoffeebeans',1)
    ply.Functions.RemoveItem('bcream',1)
    ply.Functions.RemoveItem('bhotchocolatepowder',1)
    ply.Functions.AddItem('bhotchoc',1)
end)

RegisterNetEvent('nmsh-BeanMachine:GiveCaramelFrap', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bhighcoffeeglasscup'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bmilk'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcoffeebeans'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcream'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcaramelsyrup'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcaramelfrappucino'], 'add')
    ply.Functions.RemoveItem('bhighcoffeeglasscup',1)
    ply.Functions.RemoveItem('bmilk',1)
    ply.Functions.RemoveItem('bcoffeebeans',1)
    ply.Functions.RemoveItem('bcream',1)
    ply.Functions.RemoveItem('bcaramelsyrup',1)
    ply.Functions.AddItem('bcaramelfrappucino',1)
end)

RegisterNetEvent('nmsh-BeanMachine:GiveHoneyHazelnutOatLatte', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcoffeeglass'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bmilk'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcoffeebeans'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bhoney'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bhoneyhazelnutoatlatte'], 'add')
    ply.Functions.RemoveItem('bcoffeeglass',1)
    ply.Functions.RemoveItem('bmilk',1)
    ply.Functions.RemoveItem('bcoffeebeans',1)
    ply.Functions.RemoveItem('bhoney',1)
    ply.Functions.AddItem('bhoneyhazelnutoatlatte',1)
end)

RegisterNetEvent('nmsh-BeanMachine:GiveColdBrewLatte', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bhighcoffeeglasscup'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bmilk'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcoffeebeans'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bice'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcoldbrewlatte'], 'add')
    ply.Functions.RemoveItem('bhighcoffeeglasscup',1)
    ply.Functions.RemoveItem('bmilk',1)
    ply.Functions.RemoveItem('bcoffeebeans',1)
    ply.Functions.RemoveItem('bice',1)
    ply.Functions.AddItem('bcoldbrewlatte',1)
end)

RegisterNetEvent('nmsh-BeanMachine:GiveStrawberryVanillaOatLatte', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcoffeeglass'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bmilk'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcoffeebeans'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bstrawberry'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bstrawberryvanillaoatlatte'], 'add')
    ply.Functions.RemoveItem('bcoffeeglass',1)
    ply.Functions.RemoveItem('bmilk',1)
    ply.Functions.RemoveItem('bcoffeebeans',1)
    ply.Functions.RemoveItem('bstrawberry',1)
    ply.Functions.AddItem('bstrawberryvanillaoatlatte',1)
end)

RegisterNetEvent('nmsh-BeanMachine:GiveIcedCaffeLatte', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bhighcoffeeglasscup'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bmilk'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcoffeebeans'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bice'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bicedcaffelatte'], 'add')
    ply.Functions.RemoveItem('bhighcoffeeglasscup',1)
    ply.Functions.RemoveItem('bmilk',1)
    ply.Functions.RemoveItem('bcoffeebeans',1)
    ply.Functions.RemoveItem('bice',1)
    ply.Functions.AddItem('bicedcaffelatte',1)
end)

RegisterNetEvent('nmsh-BeanMachine:GiveEspresso', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bespressocoffeecup'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bmilk'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcoffeebeans'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bespresso'], 'add')
    ply.Functions.RemoveItem('bespressocoffeecup',1)
    ply.Functions.RemoveItem('bmilk',1)
    ply.Functions.RemoveItem('bcoffeebeans',1)
    ply.Functions.AddItem('bespresso',1)
end)

RegisterNetEvent('nmsh-BeanMachine:GiveEspressoMacchiato', function ()
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bespressocoffeecup'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bmilk'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bcoffeebeans'], 'remove')
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bespressomacchiato'], 'add')
    ply.Functions.RemoveItem('bespressocoffeecup',1)
    ply.Functions.RemoveItem('bmilk',1)
    ply.Functions.RemoveItem('bcoffeebeans',1)
    ply.Functions.AddItem('bespressomacchiato',1)
end)
QBCore.Functions.CreateCallback('nmsh-BeanMachine:CheckDuty', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.onduty then
        cb(true)
    else
        cb(false)
	end
end)
RegisterNetEvent('Eat', function (item, progressbartext, progressbartime, donut, fruit, muffin)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    if donut then
		TriggerEvent("nmsh-BeanMachine:SpawnObject", "prop_amb_donut", 18905, 0.13, 0.05, 0.02, -50.0, 16.0, 60.0, 3500, false)
		TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + Config.EatingDonutHunger)
	elseif fruit then
		TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + Config.EatingFruitsHunger)
	elseif muffin then
		TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + Config.EatingMuffinsHunger)
	end
end)
RegisterServerEvent('nmsh-BeanMachine:ResetDuty', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.SetJobDuty(false)  
end)