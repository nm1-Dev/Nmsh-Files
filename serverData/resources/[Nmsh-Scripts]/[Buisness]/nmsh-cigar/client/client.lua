local QBCore = exports[Config.Core]:GetCoreObject()
local TreeObjects = {}

CreateThread(function()
    local WeedPolyZone = PolyZone:Create(Config.WeedSettings.PolyZone, {
        name = 'WeedPolyZone',
        minZ = Config.WeedSettings.MinZ,
        maxZ = Config.WeedSettings.MaxZ,
        debugPoly = Config.WeedSettings.Debug
    })
    
    WeedPolyZone:onPlayerInOut(function(isPointInside) 
        if isPointInside then
            SpawnTobaccoPlants()
        else 
            DespawnTobaccoPlants()
        end
    end)
    exports[Config.Target]:AddTargetModel(Config.WeedPlantModel, {
        options = {
            {
                type = "client",
                event = "",
                icon = "fas fa-seedling",
                label = "Pick Up Weed",
                action = function(entity) 
                    if not entity then return false end 
                    TriggerEvent("nmsh-cigar:client:PickUpTobacco", entity)
                end,
            },

        },
        distance = 2.0
    })

    exports[Config.Target]:AddBoxZone('Shop', vector3(26.65, -1108.14, 29.48), 1.6, 1, {
        name = 'Shop',
        heading=330,
        debugPoly=Config.Debug,
        minZ=26.68,
        maxZ=30.68
    }, {
        options = {
            {  
                event = "nmsh-cigar:server:OpenShop",
                icon = "fas fa-shop",
                label = "Access Shop",
            },
        },
        distance = 1.5
    })
    
    exports[Config.Target]:AddBoxZone('craftmenu', vector3(28.47, -1110.23, 28.48), 0.5, 0.5, {
    name = 'craftmenu',
    heading=333,
    debugPoly=Config.Debug,
    minZ=25.00,
    maxZ=28.48
    }, {
        options = {
            {  
                event = "nmsh-cigar:client:OpenMenu",
                icon = "fas fa-mortar-pestle",
                label = "Craft Cigar",
                job = "cigar",
            },
        },
        distance = 1.5
    })

    exports[Config.Target]:AddBoxZone('bossmenu', vector3(24.35, -1114.63, 29.48), 0.7, 0.5, {
        name = 'bossmenu',
        heading=0,
        debugPoly=Config.Debug,
        minZ=25.28,
        maxZ=29.28
        }, {
        options = {
            {  
                event = "nmsh-management:client:OpenMenu",
                icon = "fab fa-bootstrap",
                label = "Open BossMenu",
                job = {["cigar"] = 1}
            },
        },
        distance = 1.5
    })
end)

RegisterNetEvent("nmsh-cigar:client:PickUpTobacco", function(weedplant)
    TaskStartScenarioInPlace(PlayerPedId(), "world_human_gardener_plant", 0, true)
    QBCore.Functions.Progressbar("PickTobacco", "Picking Up Tobacco..", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("nmsh-cigar:server:PickUpTobacco")
        DeleteEntity(weedplant)
        ClearPedTasks(PlayerPedId())
    end) 
end)

RegisterNetEvent("nmsh-cigar:server:OpenShop", function()
    local products = Config.ShopItems
    local items = {}
    local ShopItems = {}    
    ShopItems.items = {}
    ShopItems.label = "cigar Shop"
    for i = 1, #products do
        items[#items + 1] = products[i]
    end
    ShopItems.items = items
    for k in pairs(ShopItems.items) do
        ShopItems.items[k].slot = k
    end
    TriggerServerEvent("inventory:server:OpenInventory", 'shop', "cigar Shop", ShopItems)
end)

RegisterNetEvent("nmsh-cigar:client:OpenMenu", function()
    local MenuProducts = {
        { 
            header = 'Make Cigar', 
            icon = 'fas fa-cannabis', 
            isMenuHeader = true, 
        },
    }
    for k, v in pairs(Config.Products) do
        MenuProducts[#MenuProducts + 1] = {
            header = QBCore.Shared.Items[k].label,
            txt = TextBuildForRequired(Config.Products[k].requiredItems),
            icon = k,
            params = {
                event = 'nmsh-cigar:client:makingItems',
                args = {
                    item = k
                }
            }
        }
    end
    exports[Config.Menu]:openMenu(MenuProducts)
end)

RegisterNetEvent('nmsh-cigar:client:makingItems', function(data) 
    QBCore.Functions.TriggerCallback("nmsh-cigar:server:makingcigar", function(cb)
        if cb then 
            TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", -1, true)
            QBCore.Functions.Progressbar("makeitem", "Making " .. QBCore.Shared.Items[data.item].label, 4000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
                TriggerServerEvent("nmsh-cigar:server:GiveCigar", data.item)
                QBCore.Functions.Notify("You Got " .. QBCore.Shared.Items[data.item].label, "success", 4000)
            end)
            ClearPedTasks(PlayerPedId())
        else 
            QBCore.Functions.Notify("You Don't Have Required Items", "error", 4000)
        end
    end, data.item)
end)

function SpawnTobaccoPlants()
    CreateThread(function()
        RequestModel(Config.WeedPlantModel)
        while not HasModelLoaded(Config.WeedPlantModel) do
            Wait(10)
        end

        for _, plant_croods in pairs(Config.WeedSettings.PlantSpawns) do
            local TobaccoPlant = CreateObject(Config.WeedPlantModel, plant_croods, false, true, false)
            TreeObjects[#TreeObjects + 1] = TobaccoPlant
            PlaceObjectOnGroundProperly(TobaccoPlant)
            FreezeEntityPosition(TobaccoPlant, true)
        end
    end)
end

function DespawnTobaccoPlants()
    for _, plant in pairs(TreeObjects) do 
        DeleteEntity(plant)
    end
end

function TextBuildForRequired(rItems)
    local TextBuild = ''
    for t = 1, #rItems do
        TextBuild = TextBuild .. "-".. QBCore.Shared.Items[rItems[t].name].label .. ' ' .. rItems[t].amount .. "x<br>"
    end
    return TextBuild
end

RegisterNetEvent('consumables:client:SmokeCuban', function()
    QBCore.Functions.Progressbar("smokecigar", "Smoking Cuben", 1500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cubancigar"], "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end)
end)

RegisterNetEvent('consumables:client:SmokeMoreCigar', function()
    QBCore.Functions.Progressbar("smokemorecigar", "Smoking More Cigar", 1500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["morecigar"], "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end)
end)