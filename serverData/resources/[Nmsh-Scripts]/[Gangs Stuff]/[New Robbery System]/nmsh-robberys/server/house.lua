local QBCore = exports['qb-core']:GetCoreObject()

-- Functions

local function ResetHouseStateTimer(house)
    local num = math.random(3333333, 11111111)
    local time = tonumber(num)
    SetTimeout(time, function()
        House.Houses[house]["opened"] = false
        for _, v in pairs(House.Houses[house]["furniture"]) do
            v["searched"] = false
        end
        TriggerClientEvent('nmsh-houserobbery:client:ResetHouseState', -1, house)
    end)
end

-- Callbacks

QBCore.Functions.CreateCallback('nmsh-houserobbery:server:GetHouseConfig', function(_, cb)
    cb(House.Houses)
end)

-- Events

RegisterNetEvent('nmsh-houserobbery:server:SetBusyState', function(cabin, house, bool)
    House.Houses[house]["furniture"][cabin]["isBusy"] = bool
    TriggerClientEvent('nmsh-houserobbery:client:SetBusyState', -1, cabin, house, bool)
end)

RegisterNetEvent('nmsh-houserobbery:server:enterHouse', function(house)
    local src = source
    if not House.Houses[house]["opened"] then
        ResetHouseStateTimer(house)
        TriggerClientEvent('nmsh-houserobbery:client:setHouseState', -1, house, true)
    end
    TriggerClientEvent('nmsh-houserobbery:client:enterHouse', src, house)
    House.Houses[house]["opened"] = true
end)

RegisterNetEvent('nmsh-houserobbery:server:searchCabin', function(cabin, house)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local luck = math.random(1, 10)
    local itemFound = math.random(1, 4)
    local itemCount = 1
	local cash = math.random(1000,10000)
    local Tier = 1
    if House.Houses[house]["tier"] == 1 then
        Tier = 1
    elseif House.Houses[house]["tier"] == 2 then
        Tier = 2
    elseif House.Houses[house]["tier"] == 3 then
        Tier = 3
	 elseif House.Houses[house]["tier"] == 4 then
        Tier = 4
	 elseif House.Houses[house]["tier"] == 5 then
        Tier = 5
	 elseif House.Houses[house]["tier"] == 6 then
        Tier = 6
    end
	
    if itemFound < 4 then
        if luck == 10 then
            itemCount = 3
        elseif luck >= 6 and luck <= 8 then
            itemCount = 2
        end

        for _ = 1, itemCount, 1 do
            local randomItem = House.Rewards[Tier][House.Houses[house]["furniture"][cabin]["type"]][math.random(1, #House.Rewards[Tier][House.Houses[house]["furniture"][cabin]["type"]])]
            local itemInfo = QBCore.Shared.Items[randomItem]
            if math.random(1, 100) == 69 then
                randomItem = "houselaptop"
                itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
            elseif math.random(1, 100) == 35 then
                randomItem = "mansionlaptop"
                itemInfo = QBCore.Shared.Items[randomItem]
                Player.Functions.AddItem(randomItem, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
			elseif math.random(1,100) == 22 then
				Player.Functions.AddMoney("cash", cash)
            else
                if not itemInfo["unique"] then
                    local itemAmount = math.random(1, 3)
                    if randomItem == "plastic" then
                        itemAmount = math.random(15, 30)
                    elseif randomItem == "goldchain" then
                        itemAmount = math.random(1, 4)
                    elseif randomItem == "pistol_ammo" then
                        itemAmount = math.random(1, 3)
                    elseif randomItem == "weed_skunk" then
                        itemAmount = math.random(1, 6)
					elseif randomItem == "weed_white-widow" then
                        itemAmount = math.random(3, 9)
					elseif randomItem == "weed_purple-haze" then
                        itemAmount = math.random(5, 12)
					elseif randomItem == "weed_og-kush" then
                        itemAmount = math.random(7, 14)	
					elseif randomItem == "weed_amnesia" then
                        itemAmount = math.random(10, 15)	
					elseif randomItem == "weed_ak47" then
                        itemAmount = math.random(15, 20)		
                    elseif randomItem == "cryptostick" then
                        itemAmount = math.random(1, 2)
                    end

                    Player.Functions.AddItem(randomItem, itemAmount)
                else
                    Player.Functions.AddItem(randomItem, 1)
                end
                TriggerClientEvent('inventory:client:ItemBox', src, itemInfo, "add")
            end
            Wait(500)
            if math.random(1, 100) > House.NextRobbery.chance then
                Player.Functions.AddItem(House.NextRobbery.item, 1)
            end
            -- local weaponChance = math.random(1, 100)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "The Box Is Empty..", 'error')
    end

    House.Houses[house]["furniture"][cabin]["searched"] = true
    TriggerClientEvent('nmsh-houserobbery:client:setCabinState', -1, house, cabin, true)
end)

RegisterNetEvent('nmsh-houserobbery:server:removeAdvancedLockpick', function()
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('advancedlockpick', 1)
end)

RegisterNetEvent('nmsh-houserobbery:server:removeLockpick', function(source)
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('lockpick', 1)
end)


QBCore.Functions.CreateUseableItem("houselaptop", function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
     if  TriggerClientEvent("nmsh-houserobbery:client:househacking", src) then
	 end
end)


RegisterNetEvent('nmsh-houserobbery:server:removehousehacking', function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    local src = source
   if Player.Functions.RemoveItem('houselaptop', 1) then
		TriggerClientEvent('QBCore:Notify', src, "You Lost Your House Hacking Laptop", 'error')
	end
end)

QBCore.Functions.CreateUseableItem("mansionlaptop", function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	
       TriggerClientEvent("nmsh-houserobbery:client:mansionhacking", src) 
	 
end)


RegisterNetEvent('nmsh-houserobbery:server:removemansionhacking', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local src = source
   if Player.Functions.RemoveItem('mansionlaptop', 1) then
		TriggerClientEvent('QBCore:Notify', src, "You Lost Your Mansion Hacking Laptop", 'error')
	end
end)