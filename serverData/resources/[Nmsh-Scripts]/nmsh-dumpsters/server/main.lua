local QBCore = exports['qb-core']:GetCoreObject()

Loot = {
    {'recyclablematerial', math.random(1,3)}, -- spelled correctly
    {'weapon_bat', 1},
    {'phone', math.random(1,2)},
    -- {'xs-condom', 1},  -- invalid item
    {'weed_ak47', math.random(1,13)},
    {'kurkakola', math.random(1,3)},
	{'pokebox', 1},
    {'venusaur', 1},
    {'rainbowvmaxcharizard', 1},
    {'rainbowvmaxpikachu', 1},
    {'snorlaxvmaxrainbow', 1},
    {'pikachuv', 1},
    {'blastoisevmax', 1},
    {'mewtwogx', 1},
}

RegisterServerEvent('nmsh-trashsearch:server:startDumpsterTimer')
AddEventHandler('nmsh-trashsearch:server:startDumpsterTimer', function(dumpster)
    startTimer(source, dumpster)
end)

RegisterNetEvent('nmsh-trashsearch:server:recieveItem', function(amount)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    local chosenrandomItem = Loot[math.random(1, #Loot)]
    print(chosenrandomItem[1], chosenrandomItem[2])
    if amount then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[chosenrandomItem[1]], "add")
        ply.Functions.AddItem(chosenrandomItem[1], chosenrandomItem[2])
    else
        DropPlayer('اشتباه بهاك , اذا كنت تظن ان الباند جائك عن طريق الخطأ فقم بمراجعة سيرفر الديسكورد الخاص بنا')
    end
end)

RegisterNetEvent('nmsh-trashsearch:server:givemoney', function(money, amount)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if amount then
        ply.Functions.AddMoney("cash", money)
    else
        QBCore.Functions.Notify('Hacker ? :)', 'success', 2500)
    end
end)

function startTimer(id, object)
    local timer = 10 * 1000

    while timer > 0 do
        Wait(10)
        timer = timer - 10
        if timer == 0 then
            TriggerClientEvent('nmsh-trashsearch:server:removeDumpster', id, object)
        end
    end
end


