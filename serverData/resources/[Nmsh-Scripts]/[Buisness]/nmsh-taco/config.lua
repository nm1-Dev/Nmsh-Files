Config = {}

Config.GaragePed = "u_m_m_bikehire_01"

Config.PedLocation = vector4(22.16, -1602.71, 28.30, 233.38)

Config.VehicleSpawn = vector4(23.45, -1599.89, 29.28, 47.29)

Config.Vehicle = 'taco'

HungerFill = {
    ["beef-taco"] = math.random(40, 65),
    ["chicken-taco"] = math.random(40, 65),
    ["beef-burrito"] = math.random(45, 70),
    ["chicken-burrito"] = math.random(45, 70),
    ["quesadilla"] = math.random(35, 50),
    ["nachos"] = math.random(35, 50),
}

ThirstFill = {
    ["coke-soda"] = math.random(75, 100),
    ["fanta"] = math.random(75, 100),
}

Config.Zones = {
    [1] = { coords = vector3(17.08, -1599.68, 29.38), radius = 1.35, icon = "fa-solid fa-store fa-beat", event = "rt-taco:client:ingredientStore", label = "Ingredients", job = "taco" },
    [2] = { coords = vector3(8.21, -1606.99, 29.38), radius = 0.75, icon = "fa-solid fa-briefcase fa-beat", event = "qb-bossmenu:client:OpenMenu", label = "Manage Business", job = {['taco'] = 1} },	
    [3] = { coords = vector3(10.7, -1605.04, 29.38), radius = 0.8, icon = "fa-solid fa-grip-lines fa-beat", event = "rt-taco:client:frontTray1", label = "Counter", },  
    [4] = { coords = vector3(13.47, -1595.98, 29.41), radius = 0.9, icon = "fa-solid fa-faucet fa-beat", event = "rt-taco:client:drinkStation", label = "Make Drinks", job = "taco" },  
    [5] = { coords = vector3(11.33, -1599.31, 29.38), radius = 0.9, icon = "fa-solid fa-fire-burner fa-beat", event = "rt-taco:client:cookStation", label = "Cook Food", job = "taco" },  
    [6] = { coords = vector3(15.65, -1598.21, 29.38), radius = 0.9, icon = "fa-solid fa-box fa-beat", event = "rt-taco:client:packageStation", label = "Package", job = "taco" },
    [7] = { coords = vector3(12.73, -1600.46, 29.38), radius = 0.9, icon = "fa-solid fa-square-up-right fa-beat", event = "rt-taco:client:jobFridge1", label = "Fridge", job = "taco" },
    [8] = { coords = vector3(20.28, -1601.96, 29.38), radius = 0.6, icon = "fa-solid fa-clock fa-beat", event = "rt-taco:clientToggleDuty", label = "Clock In/Out", job = "taco" },
    [9] = { coords = vector3(9.74, -1605.79, 29.38), radius = 0.5, icon = "fa-solid fa-cash-register fa-beat", event = "rt-taco:bill", label = "Bill Customer", job = "taco" },
}

Config.Items = {
label = "Shop",
    slots = 9,
    items = {
        [1] = {
            name = "tortillas",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "raw-ground-beef",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "cheddar-cheese",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "butter",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "raw-chicken",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },       
		[6] = {
            name = "lettuce",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
		[7] = {
            name = "tortilla-chips",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
		[8] = {
            name = "carbonated-water",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
		[9] = {
            name = "sugar-cubes",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "taco-tomato",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
    }
}