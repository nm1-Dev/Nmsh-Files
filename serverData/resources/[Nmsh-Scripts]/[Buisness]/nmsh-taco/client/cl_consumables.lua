local QBCore = exports['qb-core']:GetCoreObject()

--- Eating Taco/Burrito
RegisterNetEvent('rt-taco:client:EatTaco', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"taco"})
    QBCore.Functions.Progressbar("eat_something", "Eating", 3000, false, false, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + HungerFill[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(1, 3))
    end)
end)

--- Eating
RegisterNetEvent('rt-taco:client:Eat', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"croissant"})
    QBCore.Functions.Progressbar("eat_something", "Eating", 2000, false, false, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + HungerFill[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(1, 3))
    end)
end)

-- Drinking
RegisterNetEvent('rt-taco:client:Drink', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"soda"})
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 1000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ThirstFill[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(1, 3))
    end)
end)

-- Item Creation
-- Cooked Ground Beef
RegisterNetEvent('rt-taco:client:makeCookedGroundBeef', function(itemName)
    local ingredients = QBCore.Functions.HasItem({'raw-ground-beef'})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"bbq"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.02)
        QBCore.Functions.Progressbar("taco_stuff", "Frying Ground Beef", 6000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("rt-taco:server:makeCookedGroundBeef")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["raw-ground-beef"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ground-beef"], "add", 1)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("Okay then", "error")
            TriggerEvent('rt-taco:client:cooking')
        end)
    else
        QBCore.Functions.Notify('You are missing something', 'error')
    end
end)

-- Cooked Chicken
RegisterNetEvent('rt-taco:client:makeCookedChicken', function(itemName)
    local ingredients = QBCore.Functions.HasItem({'raw-chicken'})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"bbq"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.02)
        QBCore.Functions.Progressbar("taco_stuff", "Frying Chicken", 6000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("rt-taco:server:makeCookedChicken")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["raw-chicken"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chicken"], "add", 1)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("Okay then", "error")
            TriggerEvent('rt-taco:client:cooking')
        end)
    else
        QBCore.Functions.Notify('You are missing something', 'error')
    end
end)

-- Beef Taco
RegisterNetEvent('rt-taco:client:makeBeefTaco', function()
	local ingredients = QBCore.Functions.HasItem({'tortillas', 'ground-beef', 'taco-tomato', 'lettuce', 'cheddar-cheese'})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
        QBCore.Functions.Progressbar("taco_stuff", "Making Beef Taco", 5000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("rt-taco:server:makeBeefTaco")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["tortillas"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ground-beef"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["taco-tomato"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lettuce"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cheddar-cheese"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["beef-taco"], "add", 1)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('rt-taco:client:cooking')
        end, function() -- Cancel
            QBCore.Functions.Notify("Okay then", "error")
            TriggerEvent('rt-taco:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You missing something.', 'error')
    end
end)

-- Chicken Burrito
RegisterNetEvent('rt-taco:client:makeBeefBurrito', function()
	local ingredients = QBCore.Functions.HasItem({'tortillas', 'ground-beef', 'lettuce', 'cheddar-cheese'})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
        QBCore.Functions.Progressbar("taco_stuff", "Making Beef Burrito.", 5000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("rt-taco:server:makeBeefBurrito")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["tortillas"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["ground-beef"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lettuce"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cheddar-cheese"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["beef-burrito"], "add", 1)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('rt-taco:client:cooking')
        end, function() -- Cancel
            QBCore.Functions.Notify("Okay then", "error")
            TriggerEvent('rt-taco:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You missing something.', 'error')
    end
end)

-- Chicken Taco
RegisterNetEvent('rt-taco:client:makeChickenTaco', function()
	local ingredients = QBCore.Functions.HasItem({'tortillas', 'chicken', 'taco-tomato', 'lettuce', 'cheddar-cheese'})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
        QBCore.Functions.Progressbar("taco_stuff", "Making Chicken Taco", 5000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("rt-taco:server:makeChickenTaco")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["tortillas"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chicken"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["taco-tomato"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lettuce"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cheddar-cheese"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chicken-taco"], "add", 1)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('rt-taco:client:cooking')
        end, function() -- Cancel
            QBCore.Functions.Notify("Okay then", "error")
            TriggerEvent('rt-taco:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You missing something.', 'error')
    end
end)

-- Chicken Burrito
RegisterNetEvent('rt-taco:client:makeChickenBurrito', function()
	local ingredients = QBCore.Functions.HasItem({'tortillas', 'chicken', 'lettuce', 'cheddar-cheese'})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
        QBCore.Functions.Progressbar("taco_stuff", "Making Chicken Burrito", 5000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("rt-taco:server:makeChickenBurrito")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["tortillas"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chicken"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lettuce"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cheddar-cheese"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["chicken-burrito"], "add", 1)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('rt-taco:client:cooking')
        end, function() -- Cancel
            QBCore.Functions.Notify("Okay then", "error")
            TriggerEvent('rt-taco:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You missing something.', 'error')
    end
end)

-- Quesadillas
RegisterNetEvent('rt-taco:client:makeQuesadillas', function()
	local ingredients = QBCore.Functions.HasItem({"tortillas", "cheddar-cheese", "butter"})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"bbq"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("taco_stuff", "Frying Quesadilla", 6000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("rt-taco:server:makeQuesadillas")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["tortillas"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cheddar-cheese"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["butter"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["quesadilla"], "add", 1)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('rt-taco:client:cooking')
        end, function() -- Cancel
            QBCore.Functions.Notify("Okay then", "error")
            TriggerEvent('rt-taco:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You missing something.', 'error')
    end
end)

-- Nachos
RegisterNetEvent('rt-taco:client:makeNachos', function()
	local ingredients = QBCore.Functions.HasItem({"tortilla-chips", "cheddar-cheese"})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "grilling", 0.6)
        QBCore.Functions.Progressbar("taco_stuff", "Baking Nachos", 6000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("rt-taco:server:makeNachos")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["tortilla-chips"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cheddar-cheese"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["nachos"], "add", 1)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerEvent('rt-taco:client:cooking')
        end, function() -- Cancel
            QBCore.Functions.Notify("Okay then", "error")
            TriggerEvent('rt-taco:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You missing something.', 'error')
    end
end)

----- Drink Sections
-- Coke Soda
RegisterNetEvent('rt-taco:client:makeCokeSoda', function()
	local ingredients = QBCore.Functions.HasItem({"carbonated-water", "sugar-cubes"})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "watermachine", 0.02)
        QBCore.Functions.Progressbar("taco_stuff", "Pouring Cocoa Cola", 3000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("rt-taco:server:makeCokeSoda")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["carbonated-water"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar-cubes"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["coke-soda"], "add", 1)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("Okay then", "error")
            TriggerEvent('rt-taco:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You missing something.', 'error')
    end
end)

-- Fanta
RegisterNetEvent('rt-taco:client:makeFanta', function()
	local ingredients = QBCore.Functions.HasItem({"carbonated-water", "sugar-cubes"})
    if ingredients then
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "watermachine", 0.02)
        QBCore.Functions.Progressbar("taco_stuff", "Pouring Orange Fanta", 3000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent("rt-taco:server:makeFanta")
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["carbonated-water"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sugar-cubes"], "remove", 1)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["fanta"], "add", 1)
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end, function() -- Cancel
            QBCore.Functions.Notify("Okay then", "error")
            TriggerEvent('rt-taco:client:cooking')
        end)
    else		
        QBCore.Functions.Notify('You missing something.', 'error')
    end
end)

-- MENUS --     

RegisterNetEvent('rt-taco:closemenu', function()
    ClearPedTasksImmediately(PlayerPedId())
    TriggerEvent("nmsh-menu:closeMenu")
end)

RegisterNetEvent('rt-taco:client:cookStation', function()
    SetEntityCoords(PlayerPedId(), 11.33, -1599.31, 29.38)
    SetEntityHeading(PlayerPedId(), 49.1)
    exports['nmsh-menu']:openMenu({
        {
            header = "Cooking Station",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Ground Beef",
            txt = "Requires:</p>1x Raw Ground Beef",
            icon = "fa-solid fa-fire fa-beat",
            params = {
                event = "rt-taco:client:makeCookedGroundBeef",
            }
        },
        {
            header = "Chicken",
            txt = "Requires:</p>1x Raw Chicken",
            icon = "fa-solid fa-fire fa-beat",
            params = {
                event = "rt-taco:client:makeCookedChicken",
            }
        },
        {
            header = "Quesadilla",
            txt = "Requires:</p>1x Tortillas | 1x Cheddar Cheese | 1x Butter ",
            icon = "fa-solid fa-fire fa-beat",
            params = {
                event = "rt-taco:client:makeQuesadillas",
            }
        },
        {
            header = "Nachos",
            txt = "Requires:</p>1x Tortilla Chips | 1x Cheddar Cheese",
            icon = "fa-solid fa-fire fa-beat",
            params = {
                event = "rt-taco:client:makeNachos",
            }
        },
        {
            header = "Exit",
            icon = "fa-regular fa-circle-xmark fa-beat",
            params = {
                event = "rt-taco:closemenu"
            }
        },
    })
end)

RegisterNetEvent('rt-taco:client:drinkStation', function()
    SetEntityCoords(PlayerPedId(), 13.76, -1596.31, 29.38)
    SetEntityHeading(PlayerPedId(), 41.81)
    exports['nmsh-menu']:openMenu({
        {
            header = "Drink Station",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Coke Soda",
            txt = "Requires:</p>1x Carbonated Water | 1x Sugar Cubes",
            icon = "fa-solid fa-faucet-drip fa-beat",
            params = {
                event = "rt-taco:client:makeCokeSoda",
            }
        },
        {
            header = "Fanta",
            txt = "Requires:</p>1x Carbonated Water | 1x Sugar Cubes",
            icon = "fa-solid fa-faucet-drip fa-beat",
            params = {
                event = "rt-taco:client:makeFanta",
            }
        },
        {
            header = "Exit",
            icon = "fa-regular fa-circle-xmark fa-beat",
            params = {
                event = "rt-taco:closemenu"
            }
        },
    })
end)

RegisterNetEvent('rt-taco:client:packageStation', function()
    SetEntityCoords(PlayerPedId(), 15.65, -1598.21, 29.38)
    SetEntityHeading(PlayerPedId(), 323.24)
    exports['nmsh-menu']:openMenu({
        {
            header = "Package Station",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Beef Taco",
            txt = "Requires:</p>1x Tortillas | 1x Ground Beef | 1x Tomato | 1x Lettuce | 1x Cheddar Cheese",
            icon = "fa-solid fa-hands fa-beat",
            params = {
                event = "rt-taco:client:makeBeefTaco",
            }
        },
        {
            header = "Beef Burrito",
            txt = "Requires:</p>1x Tortillas | 1x Ground Beef | 1x Lettuce | 1x Cheddar Cheese ",
            icon = "fa-solid fa-hands fa-beat",
            params = {
                event = "rt-taco:client:makeBeefBurrito",
            }
        },
        {
            header = "Chicken Taco",
            txt = "Requires:</p>1x Tortillas | 1x Chicken | 1x Tomato | 1x Lettuce | 1x Cheddar Cheese",
            icon = "fa-solid fa-hands fa-beat",
            params = {
                event = "rt-taco:client:makeChickenTaco",
            }
        },
        {
            header = "Chicken Burrito",
            txt = "Requires:</p>1x Tortillas | 1x Chicken | 1x Lettuce | 1x Cheddar Cheese",
            icon = "fa-solid fa-hands fa-beat",
            params = {
                event = "rt-taco:client:makeChickenBurrito",
            }
        },
        {
            header = "Exit",
            icon = "fa-regular fa-circle-xmark fa-beat",
            params = {
                event = "rt-taco:closemenu"
            }
        },
    })
end)
