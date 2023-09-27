Config = {}


--
--██╗░░░░░██╗░░░██╗░██████╗████████╗██╗░░░██╗░█████╗░░░██╗██╗
--██║░░░░░██║░░░██║██╔════╝╚══██╔══╝╚██╗░██╔╝██╔══██╗░██╔╝██║
--██║░░░░░██║░░░██║╚█████╗░░░░██║░░░░╚████╔╝░╚██████║██╔╝░██║
--██║░░░░░██║░░░██║░╚═══██╗░░░██║░░░░░╚██╔╝░░░╚═══██║███████║
--███████╗╚██████╔╝██████╔╝░░░██║░░░░░░██║░░░░█████╔╝╚════██║
--╚══════╝░╚═════╝░╚═════╝░░░░╚═╝░░░░░░╚═╝░░░░╚════╝░░░░░░╚═╝


--Thank you for downloading this script!

--Below you can change multiple options to suit your server needs.


--Debugs polyzones and shows green boxes
Config.DebugPoly = false



--Blip Settings
Config.Blips = {
    {
        title = 'Limeys Juice Bar',
        colour = 2,
        id = 77,
        coords = vector3(247.7, -1027.74, 29.14),
        scale = 0.7,
        useblip = true
    },                    -- BLIP FOR VANILLA UNICORN
}


Config.CoreSettings = {
    Job = {
        Name = 'limeys', -- name of job in core/shared/jobs.lua
    },
    EventNames = {
        BossMenu = 'nmsh-bossmenu:client:OpenMenu', -- NAME OF BOSS MENU EVENT TO OPEN MANAGEMENT MENU
    },
    Target = {
        Type = 'qb', -- target script name support for nmsh-target and ox_target
        --EDIT TARGETS.LUA TO ADD YOUR OWN CUSTOM TARGET SCRIPT
        --use 'qb' for nmsh-target
        --use 'ox' for ox_target
        --use 'custom' for custom target
    },
    Notify = {
        Type = 'qb', -- notification type, support for qb-core notify, okokNotify and boii_ui notify
        --use 'qb' for default qb-core notify
        --use 'okok' for okokNotify
        --use 'mythic' for mythic_notify
        --use 'boii' for boii_ui notify
        Sound = true, -- use sound for OKOK notifications ONLY
        Length = {
            Success = 2500,
            Error = 2500,
        },
    },
    Menu = {
        Type = 'qb', -- menu script name, support for nmsh-menu, jixel-menu, boii_ui menu and ox_lib context menu
        --EDIT MENUS.LUA TO ADD YOUR OWN CUSTOM MENU SCRIPT
        --use 'qb' for nmsh-menu
        --use 'jixel' for jixel-menu
        --use 'boii' for boii_ui-menu
        --use 'ox' for ox_lib context menu
        --use 'custom' for your own custom menu
    },
    Shop = {
        Type = 'qb', -- support for qb shops and jim shops
        --use 'qb' for qb-shops
        --use 'jim' for jim-shop
    },
    ProgressBar = {
        Times = {
            PrepareSmoothies = 10000, -- time it takes to prepare smoothies [default is 10000 MS so 10 seconds]
            PrepareHotDrinks = 5000,  -- time it takes to prepare hot drinks [default is 5000 MS so 5 seconds]
        },
    },
}



Config.InteractionLocations = {
    Job = {
        Duty = {
            Location = vector3(252.79, -1018.61, 29.5), -- LOCATION FOR BOXZONE
            Height = 0.3,                               -- HEIGHT OF BOXZONE
            Width = 0.3,                                -- WIDTH OF BOXZONE
            Heading = 45.24,                            -- HEADING OF BOXZONE
            MinZ = 29.45,                               -- MINZ OF BOXZONE
            MaxZ = 29.5,                                -- MAXZ OF BOXZONE
            Icon = 'fa-solid fa-clipboard-user',        -- ICON FOR TARGET
            Label = "Toggle Duty",                      -- LABEL FOR TARGET
            Size = vec3(0.3, 0.3, 0.2),                 -- SIZE OF BOXZONE FOR OX_TARGET
        },
        BossMenu = {
            Location = vector3(253.2, -1022.84, 29.5), -- LOCATION FOR BOXZONE
            Height = 0.3,                              -- HEIGHT OF BOXZONE
            Width = 0.3,                               -- WIDTH OF BOXZONE
            Heading = 230.57,                          -- HEADING OF BOXZONE
            MinZ = 29.45,                              -- MINZ OF BOXZONE
            MaxZ = 29.55,                              -- MAXZ OF BOXZONE
            Icon = 'fa-solid fa-users',                -- ICON FOR TARGET
            Label = "Open Management Menu",            -- LABEL FOR TARGET
            Size = vec3(0.3, 0.3, 0.2),                -- SIZE OF BOXZONE FOR OX_TARGET
        },
    },
    Payment = {
        Location = vector3(253.48, -1022.42, 29.5), -- LOCATION FOR BOXZONE
        Height = 0.6,                               -- HEIGHT OF BOXZONE
        Width = 0.6,                                -- WIDTH OF BOXZONE
        Heading = 249.97,                           -- HEADING OF BOXZONE
        MinZ = 29.45,                               -- MINZ OF BOXZONE
        MaxZ = 29.65,                               -- MAXZ OF BOXZONE
        CashSymbol = '£',
        Icon = 'fa-solid fa-cash-register',         -- ICON FOR TARGET
        Label = "Charge Customer",                  -- LABEL FOR TARGET
        Size = vec3(0.5, 0.5, 0.5),                 -- SIZE OF BOXZONE FOR OX_TARGET
    },
    CollectionTray = {
        Location = vector3(254.07, -1020.83, 29.5), -- LOCATION FOR BOXZONE
        Height = 0.8,                               -- HEIGHT OF BOXZONE
        Width = 0.8,                                -- WIDTH OF BOXZONE
        Heading = 249.99,                           -- HEADING OF BOXZONE
        MinZ = 29.45,                               -- MINZ OF BOXZONE
        MaxZ = 29.55,                               -- MAXZ OF BOXZONE
        Icon = 'fa-solid fa-box-archive',           -- ICON FOR TARGET
        Label = "Open Collection Tray",             -- LABEL FOR TARGET
        Size = vec3(0.8, 0.8, 0.2),                 -- SIZE OF BOXZONE FOR OX_TARGET
        StashSize = 1000000,                        -- STASH SIZE
        StashSlots = 5,                             -- STASH SLOTS

    },
    SmoothieMachine = {
        Location = vector3(251.36, -1022.93, 29.5), -- LOCATION FOR BOXZONE
        Height = 0.5,                               -- HEIGHT OF BOXZONE
        Width = 0.5,                                -- WIDTH OF BOXZONE
        Heading = 161.19,                           -- HEADING OF BOXZONE
        MinZ = 29.45,                               -- MINZ OF BOXZONE
        MaxZ = 30.25,                               -- MAXZ OF BOXZONE
        Icon = 'fa-solid fa-blender',               -- ICON FOR TARGET
        Label = "Prepare Smoothies",                -- LABEL FOR TARGET
        Size = vec3(0.5, 0.5, 1.5),                 -- SIZE OF BOXZONE FOR OX_TARGET
    },
    HotDrinksMachine = {
        Location = vector3(251.98, -1023.12, 29.7), -- LOCATION FOR BOXZONE
        Height = 0.7,                               -- HEIGHT OF BOXZONE
        Width = 0.7,                                -- WIDTH OF BOXZONE
        Heading = 161.19,                           -- HEADING OF BOXZONE
        MinZ = 29.45,                               -- MINZ OF BOXZONE
        MaxZ = 30,                                  -- MAXZ OF BOXZONE
        Icon = 'fa-solid fa-mug-hot',               -- ICON FOR TARGET
        Label = "Prepare Hot Drinks",               -- LABEL FOR TARGET
        Size = vec3(0.7, 0.7, 0.5),                 -- SIZE OF BOXZONE FOR OX_TARGET
    },
    Storage = {
        Fridge = {
            Location = vector3(252.42, -1019.23, 29), -- LOCATION FOR BOXZONE
            Height = 2.0,                             -- HEIGHT OF BOXZONE
            Width = 1.0,                              -- WIDTH OF BOXZONE
            Heading = 71.47,                          -- HEADING OF BOXZONE
            MinZ = 28.5,                              -- MINZ OF BOXZONE
            MaxZ = 29.40,                             -- MAXZ OF BOXZONE
            Icon = 'fa-solid fa-box-archive',         -- ICON FOR TARGET
            Label = "Open Storage Fridge",            -- LABEL FOR TARGET
            Size = vec3(2.0, 1.0, 0.5),               -- SIZE OF BOXZONE FOR OX_TARGET
            StashSize = 10000000,                     -- STASH SIZE
            StashSlots = 64,                          -- STASH SLOTS
        },
    },
    Ingredients = {
        Location = vector3(252.99, -1023.53, 29.5), -- LOCATION FOR BOXZONE
        Height = 0.4,                               -- HEIGHT OF BOXZONE
        Width = 0.6,                                -- WIDTH OF BOXZONE
        Heading = 248.99,                           -- HEADING OF BOXZONE
        MinZ = 29.45,                               -- MINZ OF BOXZONE
        MaxZ = 29.7,                                -- MAXZ OF BOXZONE
        Icon = 'fa-solid fa-box-archive',           -- ICON FOR TARGET
        Label = "Open Ingredients Tray",            -- LABEL FOR TARGET
        Size = vec3(0.4, 0.6, 0.4),                 -- SIZE OF BOXZONE FOR OX_TARGET
        Items = {
            label = "Ingredients Tray",
            slots = 11,
            items = {
                [1] = { name = "icecubes", price = 0, amount = 100000, info = {}, type = "item", slot = 1, },
                [2] = { name = "fruitjuice", price = 0, amount = 100000, info = {}, type = "item", slot = 2, },
                [3] = { name = "mango", price = 0, amount = 100000, info = {}, type = "item", slot = 3, },
                [4] = { name = "peach", price = 0, amount = 100000, info = {}, type = "item", slot = 4, },
                [5] = { name = "lychee", price = 0, amount = 100000, info = {}, type = "item", slot = 5, },
                [6] = { name = "pineapple", price = 0, amount = 100000, info = {}, type = "item", slot = 6, },
                [7] = { name = "coconut", price = 0, amount = 100000, info = {}, type = "item", slot = 7, },
                [8] = { name = "strawberry", price = 0, amount = 100000, info = {}, type = "item", slot = 8, },
                [9] = { name = "passionfruit", price = 0, amount = 100000, info = {}, type = "item", slot = 9, },
                [10] = { name = "lemon", price = 0, amount = 100000, info = {}, type = "item", slot = 10, },
                [11] = { name = "almonds", price = 0, amount = 100000, info = {}, type = "item", slot = 11, },
            },
        },
    },
    SnackShelf = {
        Location = vector3(254.24, -1016.8, 29.4), -- LOCATION FOR BOXZONE
        Height = 0.8,                              -- HEIGHT OF BOXZONE
        Width = 0.8,                               -- WIDTH OF BOXZONE
        Heading = 338.82,                          -- HEADING OF BOXZONE
        MinZ = 28.75,                              -- MINZ OF BOXZONE
        MaxZ = 30.5,                               -- MAXZ OF BOXZONE
        Icon = 'fa-solid fa-box-archive',          -- ICON FOR TARGET
        Label = "Open Snack Shelf",                -- LABEL FOR TARGET
        Size = vec3(0.8, 0.8, 1.5),                -- SIZE OF BOXZONE FOR OX_TARGET
        Items = {
            label = "Snack Shelf",
            slots = 5,
            items = {
                [1] = { name = "chocolatedoughnut", price = 10, amount = 100000, info = {}, type = "item", slot = 1, },
                [2] = { name = "jamdoughnut", price = 10, amount = 100000, info = {}, type = "item", slot = 2, },
                [3] = { name = "custarddoughnut", price = 10, amount = 100000, info = {}, type = "item", slot = 3, },
                [4] = { name = "yumyum", price = 10, amount = 100000, info = {}, type = "item", slot = 4, },
                [5] = { name = "icedbun", price = 10, amount = 100000, info = {}, type = "item", slot = 5, },
            },
        },
    },
}
