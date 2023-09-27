local QBCore = exports['qb-core']:GetCoreObject()



--Give Smoothie Cup
RegisterNetEvent('lusty94_limeys:server:GiveSmoothieCup', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)    
    if Player.PlayerData.job.name == 'limeys' then
        Player.Functions.AddItem("smoothiecup", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "add")
    end
end)

--Give Coffee Cup
RegisterNetEvent('lusty94_limeys:server:GiveCoffeeCup', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)  
    if Player.PlayerData.job.name == 'limeys' then      
        Player.Functions.AddItem("coffeecup", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["coffeecup"], "add")
    end
end)

--Coffee Cup Callback For Hot Drinks
QBCore.Functions.CreateCallback('lusty94_limeys:get:CoffeeCup', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cup = Player.Functions.GetItemByName("coffeecup")
    if cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create Tea
RegisterNetEvent('lusty94_limeys:server:CreateTea', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)      
    if Player.Functions.GetItemByName('coffeecup') then
        Player.Functions.RemoveItem("coffeecup", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["coffeecup"], "remove")
        Player.Functions.AddItem("tea", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["tea"], "add")
    end
end)

--Create Coffee
RegisterNetEvent('lusty94_limeys:server:CreateCoffee', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)     
    if Player.Functions.GetItemByName('coffeecup') then   
        Player.Functions.RemoveItem("coffeecup", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["coffeecup"], "remove")
        Player.Functions.AddItem("coffee", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["coffee"], "add")
    end
end)

--Create Hot Chocolate
RegisterNetEvent('lusty94_limeys:server:CreateHotChocolate', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)       
    if Player.Functions.GetItemByName('coffeecup') then    
        Player.Functions.RemoveItem("coffeecup", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["coffeecup"], "remove")
        Player.Functions.AddItem("hotchocolate", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["hotchocolate"], "add")
    end
end)


-- Mango Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_limeys:get:MangoSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fruit = Player.Functions.GetItemByName("mango")
    local juice = Player.Functions.GetItemByName("fruitjuice")
    local ice = Player.Functions.GetItemByName("icecubes")
    local cup = Player.Functions.GetItemByName("smoothiecup")
    if fruit and juice and ice and cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create Mango Smoothie
RegisterNetEvent('lusty94_limeys:server:CreateMangoSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('mango') and Player.Functions.GetItemByName('fruitjuice') and Player.Functions.GetItemByName('icecubes') and Player.Functions.GetItemByName('smoothiecup') then          
        Player.Functions.RemoveItem("mango", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["mango"], "remove")
        Player.Functions.RemoveItem("fruitjuice", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fruitjuice"], "remove")
        Player.Functions.RemoveItem("icecubes", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecubes"], "remove")
        Player.Functions.RemoveItem("smoothiecup", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove")
        Player.Functions.AddItem("mangosmoothie", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["mangosmoothie"], "add")
    end
end)

-- Peach Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_limeys:get:PeachSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fruit = Player.Functions.GetItemByName("peach")
    local juice = Player.Functions.GetItemByName("fruitjuice")
    local ice = Player.Functions.GetItemByName("icecubes")
    local cup = Player.Functions.GetItemByName("smoothiecup")
    if fruit and juice and ice and cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create Peach Smoothie
RegisterNetEvent('lusty94_limeys:server:CreatePeachSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)     
    if Player.Functions.GetItemByName('fruitjuice') and Player.Functions.GetItemByName('peach') and Player.Functions.GetItemByName('icecubes') and Player.Functions.GetItemByName('smoothiecup') then             
        Player.Functions.RemoveItem("peach", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["peach"], "remove")
        Player.Functions.RemoveItem("fruitjuice", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fruitjuice"], "remove")
        Player.Functions.RemoveItem("icecubes", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecubes"], "remove")
        Player.Functions.RemoveItem("smoothiecup", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove")
        Player.Functions.AddItem("peachsmoothie", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["peachsmoothie"], "add")
    end
end)

-- Lychee Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_limeys:get:LycheeSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fruit = Player.Functions.GetItemByName("lychee")
    local juice = Player.Functions.GetItemByName("fruitjuice")
    local ice = Player.Functions.GetItemByName("icecubes")
    local cup = Player.Functions.GetItemByName("smoothiecup")
    if fruit and juice and ice and cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create Lychee Smoothie
RegisterNetEvent('lusty94_limeys:server:CreateLycheeSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)  
    if Player.Functions.GetItemByName('fruitjuice') and Player.Functions.GetItemByName('lychee') and Player.Functions.GetItemByName('icecubes') and Player.Functions.GetItemByName('smoothiecup') then                   
        Player.Functions.RemoveItem("lychee", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["lychee"], "remove")
        Player.Functions.RemoveItem("fruitjuice", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fruitjuice"], "remove")
        Player.Functions.RemoveItem("icecubes", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecubes"], "remove")
        Player.Functions.RemoveItem("smoothiecup", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove")
        Player.Functions.AddItem("lycheesmoothie", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["lycheesmoothie"], "add")
    end
end)

-- Pineapple Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_limeys:get:PineappleSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fruit = Player.Functions.GetItemByName("pineapple")
    local juice = Player.Functions.GetItemByName("fruitjuice")
    local ice = Player.Functions.GetItemByName("icecubes")
    local cup = Player.Functions.GetItemByName("smoothiecup")
    if fruit and juice and ice and cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create Pineapple Smoothie
RegisterNetEvent('lusty94_limeys:server:CreatePineappleSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)        
        Player.Functions.RemoveItem("pineapple", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["pineapple"], "remove")
        Player.Functions.RemoveItem("fruitjuice", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fruitjuice"], "remove")
        Player.Functions.RemoveItem("icecubes", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecubes"], "remove")
        Player.Functions.RemoveItem("smoothiecup", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove")
        Player.Functions.AddItem("pineapplesmoothie", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["pineapplesmoothie"], "add")
end)

-- Coconut Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_limeys:get:CoconutSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fruit = Player.Functions.GetItemByName("coconut")
    local juice = Player.Functions.GetItemByName("fruitjuice")
    local ice = Player.Functions.GetItemByName("icecubes")
    local cup = Player.Functions.GetItemByName("smoothiecup")
    if fruit and juice and ice and cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create Coconut Smoothie
RegisterNetEvent('lusty94_limeys:server:CreateCoconutSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)        
        Player.Functions.RemoveItem("coconut", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["coconut"], "remove")
        Player.Functions.RemoveItem("fruitjuice", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fruitjuice"], "remove")
        Player.Functions.RemoveItem("icecubes", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecubes"], "remove")
        Player.Functions.RemoveItem("smoothiecup", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove")
        Player.Functions.AddItem("coconutsmoothie", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["coconutsmoothie"], "add")
end)

-- Strawberry Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_limeys:get:StrawberrySmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fruit = Player.Functions.GetItemByName("strawberry")
    local juice = Player.Functions.GetItemByName("fruitjuice")
    local ice = Player.Functions.GetItemByName("icecubes")
    local cup = Player.Functions.GetItemByName("smoothiecup")
    if fruit and juice and ice and cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create Strawberry Smoothie
RegisterNetEvent('lusty94_limeys:server:CreateStrawberrySmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)        
        Player.Functions.RemoveItem("strawberry", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["strawberry"], "remove")
        Player.Functions.RemoveItem("fruitjuice", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fruitjuice"], "remove")
        Player.Functions.RemoveItem("icecubes", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecubes"], "remove")
        Player.Functions.RemoveItem("smoothiecup", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove")
        Player.Functions.AddItem("strawberrysmoothie", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["strawberrysmoothie"], "add")
end)

-- PassionFruit Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_limeys:get:PassionFruitSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fruit = Player.Functions.GetItemByName("passionfruit")
    local juice = Player.Functions.GetItemByName("fruitjuice")
    local ice = Player.Functions.GetItemByName("icecubes")
    local cup = Player.Functions.GetItemByName("smoothiecup")
    if fruit and juice and ice and cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create PassionFruit Smoothie
RegisterNetEvent('lusty94_limeys:server:CreatePassionFruitSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)        
        Player.Functions.RemoveItem("passionfruit", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["passionfruit"], "remove")
        Player.Functions.RemoveItem("fruitjuice", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fruitjuice"], "remove")
        Player.Functions.RemoveItem("icecubes", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecubes"], "remove")
        Player.Functions.RemoveItem("smoothiecup", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove")
        Player.Functions.AddItem("passionfruitsmoothie", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["passionfruitsmoothie"], "add")
end)

-- Lemon Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_limeys:get:LemonSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fruit = Player.Functions.GetItemByName("lemon")
    local juice = Player.Functions.GetItemByName("fruitjuice")
    local ice = Player.Functions.GetItemByName("icecubes")
    local cup = Player.Functions.GetItemByName("smoothiecup")
    if fruit and juice and ice and cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create Lemon Smoothie
RegisterNetEvent('lusty94_limeys:server:CreateLemonSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)        
        Player.Functions.RemoveItem("lemon", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["lemon"], "remove")
        Player.Functions.RemoveItem("fruitjuice", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fruitjuice"], "remove")
        Player.Functions.RemoveItem("icecubes", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecubes"], "remove")
        Player.Functions.RemoveItem("smoothiecup", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove")
        Player.Functions.AddItem("lemonsmoothie", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["lemonsmoothie"], "add")
end)

-- Almond Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_limeys:get:AlmondSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fruit = Player.Functions.GetItemByName("almonds")
    local juice = Player.Functions.GetItemByName("fruitjuice")
    local ice = Player.Functions.GetItemByName("icecubes")
    local cup = Player.Functions.GetItemByName("smoothiecup")
    if fruit and juice and ice and cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create Almond Smoothie
RegisterNetEvent('lusty94_limeys:server:CreateAlmondSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)        
        Player.Functions.RemoveItem("almonds", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["almonds"], "remove")
        Player.Functions.RemoveItem("fruitjuice", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fruitjuice"], "remove")
        Player.Functions.RemoveItem("icecubes", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecubes"], "remove")
        Player.Functions.RemoveItem("smoothiecup", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove")
        Player.Functions.AddItem("almondsmoothie", 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["almondsmoothie"], "add")
end)


AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('^5--<^3!^5>-- ^7Lusty94 ^5| ^5--<^3!^5>-- ^Limeys V1.0.0 Started Successfully ^5--<^3!^5>--^7')
end)



local function CheckVersion()
	PerformHttpRequest('https://raw.githubusercontent.com/Lusty94/UpdatedVersions/main/Limeys/version.txt', function(err, newestVersion, headers)
		local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
		if not newestVersion then print("Currently unable to run a version check.") return end
		local advice = "^1You are currently running an outdated version^7, ^1please update^7"
		if newestVersion:gsub("%s+", "") == currentVersion:gsub("%s+", "") then advice = '^6You are running the latest version.^7'
		else print("^3Version Check^7: ^5Current^7: "..currentVersion.." ^5Latest^7: "..newestVersion.." "..advice) end
	end)
end
CheckVersion()