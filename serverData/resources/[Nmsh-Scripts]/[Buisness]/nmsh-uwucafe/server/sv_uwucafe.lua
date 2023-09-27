local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('nmsh-uwucafe:server:makeOmurice', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("onion", 1)
    Player.Functions.RemoveItem("chicken_thighs", 1)
    Player.Functions.RemoveItem("virgin_olive_oil", 1)
    Player.Functions.RemoveItem("rice", 1)
    Player.Functions.RemoveItem("soy_sauce", 1)
    Player.Functions.RemoveItem("plate", 1)
    Player.Functions.AddItem("om_nom_omurice", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeCurrye', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("onion", 1)
    Player.Functions.RemoveItem("rice", 1)
    Player.Functions.RemoveItem("chicken_thighs", 1)
    Player.Functions.RemoveItem("plate", 1)
    Player.Functions.AddItem("kira_kira_currye", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeSando', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("pullman_bread", 1)
    Player.Functions.RemoveItem("chicken_breast", 1)
    Player.Functions.RemoveItem("egg", 1)
    Player.Functions.RemoveItem("flour", 1)
    Player.Functions.RemoveItem("butter", 1)
    Player.Functions.RemoveItem("plate", 1)
    Player.Functions.AddItem("sugoi_katsu_sando", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeSteak', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("steak", 1)
    Player.Functions.AddItem("hamburg_stake", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:cleanTallGlass', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("glass_tall_dirty", 1)
    Player.Functions.AddItem("glass_tall", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:cleanBowl', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("bar_bowl_dirty", 1)
    Player.Functions.AddItem("bar_bowl", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:cleanPlate', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("plate_dirty", 1)
    Player.Functions.AddItem("plate", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:cleanCup', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("cup_dirty", 1)
    Player.Functions.AddItem("cup", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeCoffee1', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("matcha_powder", 1)
    Player.Functions.RemoveItem("milk", 1)
    Player.Functions.RemoveItem("brewed_coffee", 1)
    Player.Functions.AddItem("matcha_coffee", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeCoffee2', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("sugar", 1)
    Player.Functions.RemoveItem("cocoa_powder", 1)
    Player.Functions.RemoveItem("milk", 1)
    Player.Functions.RemoveItem("cup", 1)
    Player.Functions.AddItem("hot_chocolate", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeCoffee3', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("sugar", 1)
    Player.Functions.RemoveItem("cocoa_powder", 1)
    Player.Functions.RemoveItem("milk", 1)
    Player.Functions.RemoveItem("cup", 1)
    Player.Functions.AddItem("lovely_hot_chocolate", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeTea1', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("dried_boba_tapioca_pearls", 1)
    Player.Functions.RemoveItem("sugar", 1)
    Player.Functions.RemoveItem("milk", 1)
    Player.Functions.RemoveItem("juice", 1)
    Player.Functions.RemoveItem("ice", 1)
    Player.Functions.AddItem("booba_milk_tea_2", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeTea2', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("lemon", 1)
    Player.Functions.RemoveItem("sugar", 1)
    Player.Functions.RemoveItem("mint", 1)
    Player.Functions.RemoveItem("ice", 1)
    Player.Functions.RemoveItem("cup", 1)
    Player.Functions.AddItem("sweet_herbal_tea", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeRiceBalls', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("rice", 1)
    Player.Functions.RemoveItem("sea_moss", 1)
    Player.Functions.AddItem("rice_balls", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeSoup', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("noodles", 1)
    Player.Functions.RemoveItem("onion", 1)
    Player.Functions.RemoveItem("butter", 1)
    Player.Functions.RemoveItem("chicken", 1)
    Player.Functions.RemoveItem("bar_bowl", 1)
    Player.Functions.AddItem("warm_chicken_noodle", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeChocolate', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("sugar", 1)
    Player.Functions.RemoveItem("cocoa_powder", 1)
    Player.Functions.RemoveItem("milk", 1)
    Player.Functions.AddItem("awwdorable_valentines_chocolate", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeShortcake', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("flour", 1)
    Player.Functions.RemoveItem("baking_powder", 1)
    Player.Functions.RemoveItem("strawberry", 1)
    Player.Functions.RemoveItem("sugar", 1)
    Player.Functions.RemoveItem("butter", 1)
    Player.Functions.RemoveItem("plate", 1)
    Player.Functions.AddItem("strawberry_shortcake", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeCream', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("rice_flour", 1)
    Player.Functions.RemoveItem("sugar", 1)
    Player.Functions.AddItem("meowchi_mochi_ice_cream", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeCake', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("sugar", 1)
    Player.Functions.RemoveItem("flour", 1)
    Player.Functions.RemoveItem("egg", 1)
    Player.Functions.RemoveItem("milk", 1)
    Player.Functions.RemoveItem("plate", 1)
    Player.Functions.AddItem("oxygen_cake", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeParfait', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("milk", 1)
    Player.Functions.RemoveItem("strawberry", 1)
    Player.Functions.RemoveItem("butter", 1)
    Player.Functions.RemoveItem("egg", 1)
    Player.Functions.AddItem("purrfect_parfait", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeCupcake', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("baking_powder", 1)
    Player.Functions.RemoveItem("egg", 1)
    Player.Functions.RemoveItem("sugar", 1)
    Player.Functions.RemoveItem("butter", 1)
    Player.Functions.RemoveItem("flour", 1)
    Player.Functions.AddItem("ballbarry_cupcake", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeCupcake2', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("milk", 1)
    Player.Functions.RemoveItem("egg", 1)
    Player.Functions.RemoveItem("butter", 1)
    Player.Functions.AddItem("dragos_fire_cupcake", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeCookie', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("egg", 1)
    Player.Functions.RemoveItem("lemon", 1)
    Player.Functions.RemoveItem("baking_powder", 1)
    Player.Functions.AddItem("gingerkitty_cookie", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makePancakes', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("flour", 1)
    Player.Functions.RemoveItem("milk", 1)
    Player.Functions.RemoveItem("egg", 1)
    Player.Functions.AddItem("doki_doki_pancakes", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeMacaroonBrown', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("flour", 1)
    Player.Functions.RemoveItem("egg", 1)
    Player.Functions.RemoveItem("sugar", 1)
    Player.Functions.RemoveItem("brown_dye", 1)
    Player.Functions.AddItem("cat_macaroon_brown", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeMacaroonPink', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("flour", 1)
    Player.Functions.RemoveItem("egg", 1)
    Player.Functions.RemoveItem("sugar", 1)
    Player.Functions.RemoveItem("pink_dye", 1)
    Player.Functions.AddItem("cat_macaroon_pink", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeMacaroonTurquoise', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("flour", 1)
    Player.Functions.RemoveItem("egg", 1)
    Player.Functions.RemoveItem("sugar", 1)
    Player.Functions.RemoveItem("turquoise_dye", 1)
    Player.Functions.AddItem("cat_macaroon_turquoise", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:makeMacaroonGreen', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.RemoveItem("flour", 1)
    Player.Functions.RemoveItem("egg", 1)
    Player.Functions.RemoveItem("sugar", 1)
    Player.Functions.RemoveItem("green_dye", 1)
    Player.Functions.AddItem("cat_macaroon_green", 1)
end)

RegisterNetEvent('nmsh-uwucafe:server:takeIce', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    Player.Functions.AddItem("ice", 1)
end)

QBCore.Functions.CreateUseableItem("gingerkitty_cookie", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("kira_kira_currye", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("om_nom_omurice", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("dragos_fire_cupcake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("ballbarry_cupcake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("purrfect_parfait", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("oxygen_cake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("meowchi_mochi_ice_cream", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("strawberry_shortcake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("awwdorable_valentines_chocolate", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("warm_chicken_noodle", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("rice_balls", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("doki_doki_pancakes", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("hamburg_stake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("sugoi_katsu_sando", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cat_macaroon_pink", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cat_macaroon_green", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cat_macaroon_turquoise", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cat_macaroon_brown", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("sweet_herbal_tea", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("booba_milk_tea_2", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("lovely_hot_chocolate", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("hot_chocolate", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("matcha_coffee", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("nmsh-uwucafe:client:Drink", source, item.name)
    end
end)


RegisterNetEvent("nmsh-uwucafe:server:billPlayer", function(playerId, amount)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if biller.PlayerData.job.name == 'uwu' then
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
                billed.Functions.RemoveMoney('bank', amount)
                TriggerClientEvent('QBCore:Notify', source, 'You charged a customer.', 'success')
                TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'You have been charged $'..amount..' for your order at UwU Cafe.')
                exports['nmsh-management']:AddMoney('uwu', amount)
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
