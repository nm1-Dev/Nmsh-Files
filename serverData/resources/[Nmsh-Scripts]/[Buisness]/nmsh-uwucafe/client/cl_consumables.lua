local QBCore = exports['qb-core']:GetCoreObject()   

RegisterNetEvent('nmsh-uwucafe:client:Eat', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, false, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        if Config.NewCore then
    	    TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + HungerFill[itemName])
        else
            TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + HungerFill[itemName])
        end
        TriggerServerEvent('hud:server:RelieveStress', math.random(5, 8))
    end)
end)

RegisterNetEvent('nmsh-uwucafe:client:Drink', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
	if Config.NewCore then
    	    TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstFill[itemName])
        else
            TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstFill[itemName])
        end
        TriggerServerEvent('hud:server:RelieveStress', math.random(5, 8))
    end)
end)


-- PRODUCTION EVENTS --

RegisterNetEvent('nmsh-uwucafe:client:makeOmurice', function()
	local ingredients = QBCore.Functions.HasItem({'onion', 'chicken_thighs', 'virgin_olive_oil', 'rice', 'soy_sauce', 'plate'})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Om-Nom Omurice..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeOmurice")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["onion"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chicken_thighs"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["virgin_olive_oil"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["rice"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["soy_sauce"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["plate"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["om_nom_omurice"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeFood')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeFood')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:makeCurrye', function()
	local ingredients = QBCore.Functions.HasItem({"onion", "rice", "chicken_thighs", "plate"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Kira Kira Currye..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeCurrye")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["onion"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["rice"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chicken_thighs"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["plate"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["kira_kira_currye"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeFood')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeFood')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:makeSando', function()
	local ingredients = QBCore.Functions.HasItem({"pullman_bread", "chicken_breast", "egg", "flour", "butter", "plate"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Sugoi Katsu Sando..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeSando")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pullman_bread"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chicken_breast"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["egg"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["flour"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["butter"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["plate"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugoi_katsu_sando"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeFood')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeFood')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:makeSteak', function()
	local ingredients = QBCore.Functions.HasItem({"steak"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Hamburg Steak..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeSteak")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["steak"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hamburg_stake"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeFood')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeFood')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)




RegisterNetEvent('nmsh-uwucafe:client:takeIce', function()
	local ingredients = QBCore.Functions.GetPlayers()
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Grabbing Ice..", 2000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:takeIce")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ice"], "add")
            TriggerEvent('nmsh-uwucafe:client:grabIce')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:grabIce')
        end)
    else		
        QBCore.Functions.Notify('Error, contact staff', 'error')
    end
end)




RegisterNetEvent('nmsh-uwucafe:client:cleanTallGlass', function()
	local ingredients = QBCore.Functions.HasItem({"glass_tall_dirty"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Cleaning Dirty Tall Glass..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:cleanTallGlass")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["glass_tall_dirty"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["glass_tall"], "add")
            TriggerEvent('nmsh-uwucafe:client:useSink')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:useSink')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have a dirty tall glass.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:cleanBowl', function()
	local ingredients = QBCore.Functions.HasItem({"bar_bowl_dirty"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Cleaning Dirty Bowl..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:cleanBowl")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bar_bowl_dirty"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bar_bowl"], "add")
            TriggerEvent('nmsh-uwucafe:client:useSink')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:useSink')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have a dirty bowl.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:cleanPlate', function()
	local ingredients = QBCore.Functions.HasItem({"plate_dirty"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Cleaning Dirty Plate..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:cleanPlate")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["plate_dirty"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["plate"], "add")
            TriggerEvent('nmsh-uwucafe:client:useSink')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:useSink')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have a dirty plate.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:cleanCup', function()
	local ingredients = QBCore.Functions.HasItem({"cup_dirty"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Cleaning Dirty Cup..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:cleanCup")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cup_dirty"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cup"], "add")
            TriggerEvent('nmsh-uwucafe:client:useSink')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:useSink')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have a dirty cup.', 'error')
    end
end)




RegisterNetEvent('nmsh-uwucafe:client:makeCoffee1', function()
	local ingredients = QBCore.Functions.HasItem({"matcha_powder", "milk", "brewed_coffee"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Matcha Coffee..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeCoffee1")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["matcha_powder"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["milk"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["brewed_coffee"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["matcha_coffee"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeCoffee')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeCoffee')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:makeCoffee2', function()
	local ingredients = QBCore.Functions.HasItem({"sugar", "cocoa_powder", "milk", "cup"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Hot Chocolate..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeCoffee2")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cocoa_powder"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["milk"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cup"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hot_chocolate"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeCoffee')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeCoffee')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:makeCoffee3', function()
	local ingredients = QBCore.Functions.HasItem({"sugar", "cocoa_powder", "milk", "cup"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Lovely Hot Chocolate..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeCoffee3")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cocoa_powder"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["milk"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cup"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lovely_hot_chocolate"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeCoffee')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeCoffee')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)




RegisterNetEvent('nmsh-uwucafe:client:makeTea1', function()
	local ingredients = QBCore.Functions.HasItem({"dried_boba_tapioca_pearls", "sugar", "milk", "juice", "ice"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Booba Milk Tea..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeTea1")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["dried_boba_tapioca_pearls"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["milk"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["juice"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ice"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["booba_milk_tea_2"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeTea')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeTea')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:makeTea2', function()
	local ingredients = QBCore.Functions.HasItem({"lemon", "sugar", "mint", "ice", "cup"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Sweet Herbal Tea..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeTea2")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lemon"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["mint"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ice"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cup"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sweet_herbal_tea"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeTea')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeTea')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)




RegisterNetEvent('nmsh-uwucafe:client:makeRiceBalls', function()
	local ingredients = QBCore.Functions.HasItem({"rice", "sea_moss"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Rice Balls..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeRiceBalls")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["rice"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sea_moss"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["rice_balls"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeSides')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeSides')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:makeSoup', function()
	local ingredients = QBCore.Functions.HasItem({"noodles", "onion", "butter", "chicken", "bar_bowl"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Warm Chicken Noodle Soup..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeSoup")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["noodles"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["onion"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["butter"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chicken"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bar_bowl"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["warm_chicken_noodle"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeSides')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeSides')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:makeChocolate', function()
	local ingredients = QBCore.Functions.HasItem({"sugar", "cocoa_powder", "milk"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Awwdorable Valentine's Chocolate..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeChocolate")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cocoa_powder"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["milk"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["awwdorable_valentines_chocolate"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeSides')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeSides')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)




RegisterNetEvent('nmsh-uwucafe:client:makeShortcake', function()
	local ingredients = QBCore.Functions.HasItem({"flour", "baking_powder", "strawberry", "sugar", "butter", "plate"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Strawberry Shortcake..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeShortcake")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["flour"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["baking_powder"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["strawberry"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["butter"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["plate"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["strawberry_shortcake"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeDeserts')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeDeserts')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:makeCream', function()
	local ingredients = QBCore.Functions.HasItem({"rice_flour", "sugar"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Meowchi Mochi Ice Cream..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeCream")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["rice_flour"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["meowchi_mochi_ice_cream"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeDeserts')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeDeserts')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:makeCake', function()
	local ingredients = QBCore.Functions.HasItem({"sugar", "flour", "egg", "milk", "plate"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Oxygen Cake..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeCake")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["flour"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["egg"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["milk"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["plate"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["oxygen_cake"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeDeserts')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeDeserts')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:makeParfait', function()
	local ingredients = QBCore.Functions.HasItem({"milk", "strawberry", "butter", "egg"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Purrfect Parfait..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeParfait")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["milk"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["strawberry"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["butter"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["egg"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["purrfect_parfait"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeDeserts')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeDeserts')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:makeCupcake', function()
	local ingredients = QBCore.Functions.HasItem({"baking_powder", "egg", "sugar", "butter", "flour"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Ballaberry Cupcake..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeCupcake")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["baking_powder"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["egg"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["butter"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["flour"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ballbarry_cupcake"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeDeserts')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeDeserts')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:makeCupcake2', function()
	local ingredients = QBCore.Functions.HasItem({"milk", "egg", "butter"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Dragon's Fire Cupcake..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeCupcake2")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["milk"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["egg"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["butter"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["dragos_fire_cupcake"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeDeserts')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeDeserts')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:makeCookie', function()
	local ingredients = QBCore.Functions.HasItem({"egg", "lemon", "baking_powder"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a GingerKitty Cookie..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeCookie")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["egg"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lemon"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["baking_powder"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["gingerkitty_cookie"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeDeserts')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeDeserts')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:makePancakes', function()
	local ingredients = QBCore.Functions.HasItem({"flour", "milk", "egg"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Doki Doki Pancakes..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makePancakes")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["flour"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["milk"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["egg"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["doki_doki_pancakes"], "add")
            TriggerEvent('nmsh-uwucafe:client:makeDeserts')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:makeDeserts')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)




RegisterNetEvent('nmsh-uwucafe:client:makeMacaroonBrown', function()
	local ingredients = QBCore.Functions.HasItem({"flour", "egg", "sugar", "brown_dye"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Brown cat macaroon..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeMacaroonBrown")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["flour"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["egg"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["brown_dye"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cat_macaroon_brown"], "add")
            TriggerEvent('nmsh-uwucafe:client:useOven')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:useOven')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:makeMacaroonPink', function()
	local ingredients = QBCore.Functions.HasItem({"flour", "egg", "sugar", "pink_dye"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Pink cat macaroon..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeMacaroonPink")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["flour"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["egg"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["pink_dye"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cat_macaroon_pink"], "add")
            TriggerEvent('nmsh-uwucafe:client:useOven')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:useOven')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:makeMacaroonTurquoise', function()
	local ingredients = QBCore.Functions.HasItem({"flour", "egg", "sugar", "turquoise_dye"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Turquoise cat macaroon..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeMacaroonTurquoise")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["flour"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["egg"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["turquoise_dye"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cat_macaroon_turquoise"], "add")
            TriggerEvent('nmsh-uwucafe:client:useOven')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:useOven')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)

RegisterNetEvent('nmsh-uwucafe:client:makeMacaroonGreen', function()
	local ingredients = QBCore.Functions.HasItem({"flour", "egg", "sugar", "green_dye"})
    if ingredients then
        QBCore.Functions.Progressbar("uwu_stuff", "Making a Green cat macaroon..", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("nmsh-uwucafe:server:makeMacaroonGreen")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["flour"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["egg"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["green_dye"], "remove")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cat_macaroon_green"], "add")
            TriggerEvent('nmsh-uwucafe:client:useOven')
        end, function() -- Cancel
            QBCore.Functions.Notify("You changed your mind.", "error")
            TriggerEvent('nmsh-uwucafe:client:useOven')
        end)
    else		
        QBCore.Functions.Notify('You don\'t have all the ingredients.', 'error')
    end
end)



-- MENUS --     

RegisterNetEvent('nmsh-uwucafe:closemenu', function()
    ClearPedTasksImmediately(PlayerPedId())
    TriggerEvent("nmsh-menu:closeMenu")
end)

RegisterNetEvent('nmsh-uwucafe:client:grabIce', function()
    exports['nmsh-menu']:openMenu({
        {
            header = "Ice Machine",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Ice",
            params = {
                event = "nmsh-uwucafe:client:takeIce",
            }
        },
        {
            header = "Return",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "nmsh-uwucafe:closemenu"
            }
        },
    })
end)

RegisterNetEvent('nmsh-uwucafe:client:makeFood', function()
    exports['nmsh-menu']:openMenu({
        {
            header = "Food",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Hamburg Steak",
            txt = "Requirements: Steak",
            params = {
                event = "nmsh-uwucafe:client:makeSteak",
            }
        },
        {
            header = "Kira Kira Currye",
            txt = "Requirements: Onion, Rice, Chicken thights, Plate",
            params = {
                event = "nmsh-uwucafe:client:makeCurrye",
            }
        },
        {
            header = "Sugoi Katsu Sando",
            txt = "Requirements: Pullman bread, Chicken breast, Egg, Flour, Butter, Plate",
            params = {
                event = "nmsh-uwucafe:client:makeSando",
            }
        },
        {
            header = "Om-Nom Omurice",
            txt = "Requirements: Onion, Chicken thights, Virgin olive oil, Rice, Soy sauce, Plate",
            params = {
                event = "nmsh-uwucafe:client:makeOmurice",
            }
        },
        {
            header = "Return",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "nmsh-uwucafe:closemenu"
            }
        },
    })
end)

RegisterNetEvent('nmsh-uwucafe:client:useSink', function()
    exports['nmsh-menu']:openMenu({
        {
            header = "Sink",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Clean Plate",
            txt = "Requirements: Dirty plate",
            params = {
                event = "nmsh-uwucafe:client:cleanPlate",
            }
        },
        {
            header = "Clean Bowl",
            txt = "Requirements: Dirty bowl",
            params = {
                event = "nmsh-uwucafe:client:cleanBowl",
            }
        },
        {
            header = "Clean Cup",
            txt = "Requirements: Dirty cup",
            params = {
                event = "nmsh-uwucafe:client:cleanCup",
            }
        },
        {
            header = "Clean Tall Glass",
            txt = "Requirements: Dirty tall glass",
            params = {
                event = "nmsh-uwucafe:client:cleanTallGlass",
            }
        },
        {
            header = "Return",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "nmsh-uwucafe:closemenu"
            }
        },
    })
end)

RegisterNetEvent('nmsh-uwucafe:client:makeCoffee', function()
    exports['nmsh-menu']:openMenu({
        {
            header = "Bar",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Matcha Coffee",
            txt = "Requirements: Matcha powder, Milk, Brewed coffee",
            params = {
                event = "nmsh-uwucafe:client:makeCoffee1",
            }
        },
        {
            header = "Hot Chocolate",
            txt = "Requirements: Sugar, Cocoa powder, Milk, Cup",
            params = {
                event = "nmsh-uwucafe:client:makeCoffee2",
            }
        },
        {
            header = "Lovely Hot Chocolate",
            txt = "Requirements: Sugar, Cocoa powder, Milk, Cup",
            params = {
                event = "nmsh-uwucafe:client:makeCoffee3",
            }
        },
        {
            header = "Return",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "nmsh-uwucafe:closemenu"
            }
        },
    })
end)

RegisterNetEvent('nmsh-uwucafe:client:makeTea', function()
    exports['nmsh-menu']:openMenu({
        {
            header = "Tea",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Sweet Herbal Tea",
            txt = "Requirements: Lemon, Sugar, Mint, Ice, Cup",
            params = {
                event = "nmsh-uwucafe:client:makeTea2",
            }
        },
        {
            header = "Booba Milk Tea",
            txt = "Requirements: Dried boba tapioca pearls, Sugar, Milk, Juice, Ice",
            params = {
                event = "nmsh-uwucafe:client:makeTea1",
            }
        },
        {
            header = "Return",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "nmsh-uwucafe:closemenu"
            }
        },
    })
end)

RegisterNetEvent('nmsh-uwucafe:client:useOven', function()
    exports['nmsh-menu']:openMenu({
        {
            header = "Oven",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Turquoise cat macaroon",
            txt = "Requirements: Flour, Egg, Sugar, Turquoise dye",
            params = {
                event = "nmsh-uwucafe:client:makeMacaroonTurquoise",
            }
        },
        {
            header = "Brown cat macaroon",
            txt = "Requirements: Flour, Egg, Sugar, Brown dye",
            params = {
                event = "nmsh-uwucafe:client:makeMacaroonBrown",
            }
        },
        {
            header = "Green cat macaroon",
            txt = "Requirements: Flour, Egg, Sugar, Green dye",
            params = {
                event = "nmsh-uwucafe:client:makeMacaroonGreen",
            }
        },
        {
            header = "Pink cat macaroon",
            txt = "Requirements: Flour, Egg, Sugar, Pink dye",
            params = {
                event = "nmsh-uwucafe:client:makeMacaroonPink",
            }
        },
        {
            header = "Return",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "nmsh-uwucafe:closemenu"
            }
        },
    })
end)

RegisterNetEvent('nmsh-uwucafe:client:makeSides', function()
    exports['nmsh-menu']:openMenu({
        {
            header = "Sides",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Rice Balls",
            txt = "Requirements: Rice, Sea moss",
            params = {
                event = "nmsh-uwucafe:client:makeRiceBalls",
            }
        },
        {
            header = "Awwdorable Valentine's Chocolate",
            txt = "Requirements: Sugar, Cocoa powder, Milk",
            params = {
                event = "nmsh-uwucafe:client:makeChocolate",
            }
        },
        {
            header = "Warm Chicken Noodle Soup",
            txt = "Requirements: Noodles, Onion, Butter, Chicken, Bowl",
            params = {
                event = "nmsh-uwucafe:client:makeSoup",
            }
        },
        {
            header = "Return",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "nmsh-uwucafe:closemenu"
            }
        },
    })
end)

RegisterNetEvent('nmsh-uwucafe:client:makeDeserts', function()
    exports['nmsh-menu']:openMenu({
        {
            header = "Deserts",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Strawberry Shortcake",
            txt = "Requirements: Flour, Baking powder, Strawberry, Sugar, Butter, Plate",
            params = {
                event = "nmsh-uwucafe:client:makeShortcake",
            }
        },
        {
            header = "Meowchi Mochi Ice Cream",
            txt = "Requirements: Rice flour, Sugar",
            params = {
                event = "nmsh-uwucafe:client:makeCream",
            }
        },
        {
            header = "Oxygen Cake",
            txt = "Requirements: Sugar, Flour, Egg, Milk, Plate",
            params = {
                event = "nmsh-uwucafe:client:makeCake",
            }
        },
        {
            header = "Purrfect Parfait",
            txt = "Requirements: Milk, Strawberry, Butter, Egg",
            params = {
                event = "nmsh-uwucafe:client:makeParfait",
            }
        },
        {
            header = "Ballaberry Cupcake",
            txt = "Requirements: Baking powder, Egg, Sugar, Butter, Flour",
            params = {
                event = "nmsh-uwucafe:client:makeCupcake",
            }
        },
        {
            header = "Dragon's Fire Cupcake",
            txt = "Requirements: Milk, Egg, Butter",
            params = {
                event = "nmsh-uwucafe:client:makeCupcake2",
            }
        },
        {
            header = "GingerKitty Cookie",
            txt = "Requirements: Egg, Lemon, Baking powder",
            params = {
                event = "nmsh-uwucafe:client:makeCookie",
            }
        },
        {
            header = "Doki Doki Pancakes",
            txt = "Requirements: Flour, Milk, Egg",
            params = {
                event = "nmsh-uwucafe:client:makePancakes",
            }
        },
        {
            header = "Return",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "nmsh-uwucafe:closemenu"
            }
        },
    })
end)
