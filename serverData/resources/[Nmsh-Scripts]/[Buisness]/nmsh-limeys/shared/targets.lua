local QBCore = exports['qb-core']:GetCoreObject()

if Config.CoreSettings.Target.Type == 'qb' then
    exports['nmsh-target']:AddBoxZone("DutyZone", Config.InteractionLocations.Job.Duty.Location, Config.InteractionLocations.Job.Duty.Width, Config.InteractionLocations.Job.Duty.Height, {
        name = "DutyZone",
        heading = Config.InteractionLocations.Job.Duty.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.Job.Duty.MinZ,
        maxZ = Config.InteractionLocations.Job.Duty.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = "lusty94_limeys:client:ToggleDuty",
            icon = Config.InteractionLocations.Job.Duty.Icon,
            label = Config.InteractionLocations.Job.Duty.Label,
            job = Config.CoreSettings.Job.Name,
        }
        },
        distance = 2.0,
    })
    exports['nmsh-target']:AddBoxZone("BossMenuZone", Config.InteractionLocations.Job.BossMenu.Location, Config.InteractionLocations.Job.BossMenu.Width, Config.InteractionLocations.Job.BossMenu.Height, {
        name = "BossMenuZone",
        heading = Config.InteractionLocations.Job.BossMenu.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.Job.BossMenu.MinZ,
        maxZ = Config.InteractionLocations.Job.BossMenu.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = Config.CoreSettings.EventNames.BossMenu,
            icon = Config.InteractionLocations.Job.BossMenu.Icon,
            label = Config.InteractionLocations.Job.BossMenu.Label,
            job = Config.CoreSettings.Job.Name,
           
        }
        },
        distance = 2.0,
    })
    exports['nmsh-target']:AddBoxZone("PaymentZone", Config.InteractionLocations.Payment.Location, Config.InteractionLocations.Payment.Width, Config.InteractionLocations.Payment.Height, {
        name = "PaymentZone",
        heading = Config.InteractionLocations.Payment.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.Payment.MinZ,
        maxZ = Config.InteractionLocations.Payment.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = "lusty94_limeys:bill",
            icon = Config.InteractionLocations.Payment.Icon,
            label = Config.InteractionLocations.Payment.Label,
            job = Config.CoreSettings.Job.Name,
        }
        },
        distance = 2.0,
    })
    exports['nmsh-target']:AddBoxZone("CollectionTrayZone", Config.InteractionLocations.CollectionTray.Location, Config.InteractionLocations.CollectionTray.Width, Config.InteractionLocations.CollectionTray.Height, {
        name = "CollectionTrayZone",
        heading = Config.InteractionLocations.CollectionTray.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.CollectionTray.MinZ,
        maxZ = Config.InteractionLocations.CollectionTray.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = "lusty94_limeys:client:OpenCollectionTray",
            icon = Config.InteractionLocations.CollectionTray.Icon,
            label = Config.InteractionLocations.CollectionTray.Label,
        }
        },
        distance = 2.0,
    })
    exports['nmsh-target']:AddBoxZone("SmoothieMachineZone", Config.InteractionLocations.SmoothieMachine.Location, Config.InteractionLocations.SmoothieMachine.Width, Config.InteractionLocations.SmoothieMachine.Height, {
        name = "SmoothieMachineZone",
        heading = Config.InteractionLocations.SmoothieMachine.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.SmoothieMachine.MinZ,
        maxZ = Config.InteractionLocations.SmoothieMachine.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = "lusty94_limeys:client:SmoothieMenu",
            icon = Config.InteractionLocations.SmoothieMachine.Icon,
            label = Config.InteractionLocations.SmoothieMachine.Label,
            job = Config.CoreSettings.Job.Name,
        }
        },
        distance = 2.0,
    })
    exports['nmsh-target']:AddBoxZone("HotDrinksMachineZone", Config.InteractionLocations.HotDrinksMachine.Location, Config.InteractionLocations.HotDrinksMachine.Width, Config.InteractionLocations.HotDrinksMachine.Height, {
        name = "HotDrinksMachineZone",
        heading = Config.InteractionLocations.HotDrinksMachine.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.HotDrinksMachine.MinZ,
        maxZ = Config.InteractionLocations.HotDrinksMachine.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = "lusty94_limeys:client:HotDrinksMenu",
            icon = Config.InteractionLocations.HotDrinksMachine.Icon,
            label = Config.InteractionLocations.HotDrinksMachine.Label,
            job = Config.CoreSettings.Job.Name,
        }
        },
        distance = 2.0,
    })
    exports['nmsh-target']:AddBoxZone("StorageFridgeZone", Config.InteractionLocations.Storage.Fridge.Location, Config.InteractionLocations.Storage.Fridge.Width, Config.InteractionLocations.Storage.Fridge.Height, {
        name = "StorageFridgeZone",
        heading = Config.InteractionLocations.Storage.Fridge.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.Storage.Fridge.MinZ,
        maxZ = Config.InteractionLocations.Storage.Fridge.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = "lusty94_limeys:client:OpenStorageFridge",
            icon = Config.InteractionLocations.Storage.Fridge.Icon,
            label = Config.InteractionLocations.Storage.Fridge.Label,
            job = Config.CoreSettings.Job.Name,
        }
        },
        distance = 2.0,
    })
    exports['nmsh-target']:AddBoxZone("IngredientsTrayZone", Config.InteractionLocations.Ingredients.Location, Config.InteractionLocations.Ingredients.Width, Config.InteractionLocations.Ingredients.Height, {
        name = "IngredientsTrayZone",
        heading = Config.InteractionLocations.Ingredients.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.Ingredients.MinZ,
        maxZ = Config.InteractionLocations.Ingredients.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = "lusty94_limeys:client:IngredientsTray",
            icon = Config.InteractionLocations.Ingredients.Icon,
            label = Config.InteractionLocations.Ingredients.Label,
            job = Config.CoreSettings.Job.Name,
        }
        },
        distance = 2.0,
    })
    exports['nmsh-target']:AddBoxZone("SnackShelfZone", Config.InteractionLocations.SnackShelf.Location, Config.InteractionLocations.SnackShelf.Width, Config.InteractionLocations.SnackShelf.Height, {
        name = "SnackShelfZone",
        heading = Config.InteractionLocations.SnackShelf.Heading,
        debugPoly = Config.DebugPoly,
        minZ = Config.InteractionLocations.SnackShelf.MinZ,
        maxZ = Config.InteractionLocations.SnackShelf.MaxZ,
    }, {
        options = {
        {
            type = "client",
            event = "lusty94_limeys:client:SnackShelf",
            icon = Config.InteractionLocations.SnackShelf.Icon,
            label = Config.InteractionLocations.SnackShelf.Label,
            
        }
        },
        distance = 2.0,
    })
elseif Config.CoreSettings.Target.Type == 'ox' then
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.Job.Duty.Location,
        size = Config.InteractionLocations.Job.Duty.Size,
        rotation = Config.InteractionLocations.Job.Duty.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                name = 'DutyZone',
                event = 'lusty94_limeys:client:ToggleDuty',
                label = Config.InteractionLocations.Job.Duty.Label,
                icon = Config.InteractionLocations.Job.Duty.Icon,
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.Job.BossMenu.Location,
        size = Config.InteractionLocations.Job.BossMenu.Size,
        rotation = Config.InteractionLocations.Job.BossMenu.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                name = 'BossMenuZone',
                event = Config.CoreSettings.EventNames.BossMenu,
                label = Config.InteractionLocations.Job.BossMenu.Label,
                icon = Config.InteractionLocations.Job.BossMenu.Icon,
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.Payment.Location,
        size = Config.InteractionLocations.Payment.Size,
        rotation = Config.InteractionLocations.Payment.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                name = 'PaymentZone',
                event = 'lusty94_limeys:bill',
                label = Config.InteractionLocations.Payment.Label,
                icon = Config.InteractionLocations.Payment.Icon,
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.CollectionTray.Location,
        size = Config.InteractionLocations.CollectionTray.Size,
        rotation = Config.InteractionLocations.CollectionTray.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                name = 'CollectionTrayZone',
                event = 'lusty94_limeys:client:OpenCollectionTray',
                label = Config.InteractionLocations.CollectionTray.Label,
                icon = Config.InteractionLocations.CollectionTray.Icon,
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.SmoothieMachine.Location,
        size = Config.InteractionLocations.SmoothieMachine.Size,
        rotation = Config.InteractionLocations.SmoothieMachine.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                name = 'SmoothieMachineZone',
                event = 'lusty94_limeys:client:SmoothieMenu',
                label = Config.InteractionLocations.SmoothieMachine.Label,
                icon = Config.InteractionLocations.SmoothieMachine.Icon,
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.HotDrinksMachine.Location,
        size = Config.InteractionLocations.HotDrinksMachine.Size,
        rotation = Config.InteractionLocations.HotDrinksMachine.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                name = 'HotDrinksMachineZone',
                event = 'lusty94_limeys:client:HotDrinksMenu',
                label = Config.InteractionLocations.HotDrinksMachine.Label,
                icon = Config.InteractionLocations.HotDrinksMachine.Icon,
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.Storage.Fridge.Location,
        size = Config.InteractionLocations.Storage.Fridge.Size,
        rotation = Config.InteractionLocations.Storage.Fridge.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                name = 'StorageFridgeZone',
                event = 'lusty94_limeys:client:OpenStorageFridge',
                label = Config.InteractionLocations.Storage.Fridge.Label,
                icon = Config.InteractionLocations.Storage.Fridge.Icon,
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.Ingredients.Location,
        size = Config.InteractionLocations.Ingredients.Size,
        rotation = Config.InteractionLocations.Ingredients.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                name = 'IngredientsTrayZone',
                event = 'lusty94_limeys:client:IngredientsTray',
                label = Config.InteractionLocations.Ingredients.Label,
                icon = Config.InteractionLocations.Ingredients.Icon,
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = Config.InteractionLocations.SnackShelf.Location,
        size = Config.InteractionLocations.SnackShelf.Size,
        rotation = Config.InteractionLocations.SnackShelf.Heading,
        debug = Config.DebugPoly,
        options = {
            {
                name = 'SnackShelfZone',
                event = 'lusty94_limeys:client:SnackShelf',
                label = Config.InteractionLocations.SnackShelf.Label,
                icon = Config.InteractionLocations.SnackShelf.Icon,
            }
        }
    })
elseif Config.CoreSettings.Target.Type == 'custom' then
-- inset custom target code here
end