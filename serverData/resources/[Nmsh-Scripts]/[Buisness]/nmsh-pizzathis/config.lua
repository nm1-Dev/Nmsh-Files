Config = {}
Config.Debug = false

Config.link = "nmsh-inventory/html/images/" -- Change this to your inventory's name and image folder

Config.DrinkItems = {
    label = "Drinks Store",
    slots = 5,
    items = {
        [1] = { name = "vodka", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
        [2] = { name = "sprunk", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
        [3] = { name = "sprunklight", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
        [4] = { name = "ecola", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
        [5] = { name = "ecolalight", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
    }
}

Config.FoodItems = {
    label = "Food Fridge Store",
    slots = 7,
    items = {
        [1] = { name = "sauce", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
        [2] = { name = "pasta", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
        [3] = { name = "olives", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
        [4] = { name = "basil", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
        [5] = { name = "mozz", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
        [6] = { name = "lettuce", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
        [7] = { name = "pizzmushrooms", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
        [8] = { name = "tiramisu", price = 0, amount = 50, info = {}, type = "item", slot = 8, },
        [9] = { name = "gelato", price = 0, amount = 50, info = {}, type = "item", slot = 9, },
        [10] = { name = "medfruits", price = 0, amount = 50, info = {}, type = "item", slot = 10, },
    }
}

Config.FreezerItems = {
    label = "Freezer Store",
    slots = 2,
    items = {
        [1] = { name = "meat", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
        [2] = { name = "squid", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
    }
}

Config.Locations = {
    [1] = {
        zoneEnable = true,
        label = "pizzathis", -- Set this to the required job
        zones = {
            vector2(776.45977783203, -734.53753662109),
            vector2(815.66552734375, -733.91662597656),
            vector2(819.54748535156, -747.50708007812),
            vector2(827.40344238281, -760.18341064453),
            vector2(829.70361328125, -769.6220703125),
            vector2(830.78997802734, -775.21801757812),
            vector2(776.12048339844, -774.75408935547)
        },
        blip = vector3(806.97, -759.59, 26.78),
        blipcolor = 36,
    },
}
