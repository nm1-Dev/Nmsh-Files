local QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}

CreateThread(function()
    Taco = AddBlipForCoord(13.02, -1604.21, 29.38)
    SetBlipSprite (Taco, 208)
    SetBlipDisplay(Taco, 4)
    SetBlipScale  (Taco, 0.5)
    SetBlipAsShortRange(Taco, true)
    SetBlipColour(Taco, 51)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Taco")
    EndTextCommandSetBlipName(Taco)
end) 

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PlayerJob = QBCore.Functions.GetPlayerData().job
        TacoZones()
    end
end)

AddEventHandler('onResourceStop', function(resourceName) 
    if GetCurrentResourceName() == resourceName then
        for k, v in pairs(Config.Zones) do
            exports['nmsh-target']:RemoveZone("taco"..k)
        end
        DeletePed(jobPed)
    end 
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    TacoZones()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    for k, v in pairs(Config.Zones) do
        exports['nmsh-target']:RemoveZone("taco"..k)
    end
    DeletePed(jobPed)
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(0)
    end
end

function TacoZones()
    for k, v in pairs(Config.Zones) do
        exports['nmsh-target']:AddCircleZone("taco"..k, v.coords, v.radius, {
            name = "taco"..k,
            debugPoly = false,
            useZ=true,
        }, {
            options = {
                {
                    type = "client",
                    event = v.event,
                    icon = v.icon,
                    label = v.label,
                    job = v.job,
                },
            },
            distance = 1.5
        })
    end
    if not DoesEntityExist(jobPed) then

	RequestModel(Config.GaragePed) while not HasModelLoaded(Config.GaragePed) do Wait(0) end

	jobPed = CreatePed(0, Config.GaragePed, Config.PedLocation, false, false)

	SetEntityAsMissionEntity(jobPed, true, true)
	SetPedFleeAttributes(jobPed, 0, 0)
	SetBlockingOfNonTemporaryEvents(jobPed, true)
	SetEntityInvincible(jobPed, true)
	FreezeEntityPosition(jobPed, true)
	loadAnimDict("amb@world_human_leaning@female@wall@back@holding_elbow@idle_a")        
	TaskPlayAnim(jobPed, "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", "idle_a", 8.0, 1.0, -1, 01, 0, 0, 0, 0)

	exports['nmsh-target']:AddTargetEntity(jobPed, { 
	    options = {
		{ 
		    type = "client",
		    event = "rt-taco:client:jobGarage",
		    icon = "fa-solid fa-clipboard-check",
		    label = "Garage",
		    job = "taco"
		},
		{ 
		    type = "client",
		    event = "rt-taco:client:storeGarage",
		    icon = "fa-solid fa-clipboard-check",
		    label = "Store Vehicle",
		    job = "taco"
		},
	    }, 
	    distance = 1.5, 
	})
    end
end

CreateThread(function()
    DecorRegister("t_vehicle", 1)
end)

RegisterNetEvent('rt-taco:client:jobGarage', function(vehicle)
    local vehicle = Config.Vehicle
    local coords = Config.VehicleSpawn
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        SetVehicleNumberPlateText(veh, "TACO"..tostring(math.random(1000, 9999)))
        DecorSetFloat(veh, "t_vehicle", 1)
        SetEntityAsMissionEntity(veh, true, true)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
        CurrentPlate = QBCore.Functions.GetPlate(veh)
        SetVehicleFuelLevel(veh, 100.0)
    end, coords, true)
end)

RegisterNetEvent('rt-taco:client:storeGarage', function()
    local veh = QBCore.Functions.GetClosestVehicle()
    if DecorExistOn((veh), "t_vehicle") then
        QBCore.Functions.DeleteVehicle(veh)
        QBCore.Functions.Notify("You returned the vehicle.", "success")
    else
        QBCore.Functions.Notify("This is not a work vehicle.", "error")
    end
end)
    
RegisterNetEvent("rt-taco:client:frontTray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "tacofoodtray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tacofoodtray1", {
        maxweight = 30000,
        slots = 12,
    })
end)

RegisterNetEvent("rt-taco:client:jobFridge1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "tacofridge1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tacofridge1", {
        maxweight = 3000000,
        slots = 30,
    })
end)

RegisterNetEvent("rt-taco:client:ingredientStore", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "taco", Config.Items)
end)

RegisterNetEvent('rt-taco:clientToggleDuty', function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("rt-taco:bill", function()
    local bill = exports['nmsh-input']:ShowInput({
        header = "Cash Register",
		submitText = "Charge",
        inputs = {
            {
                text = "Server ID(#)",
				name = "citizenid", 
                type = "text", 
                isRequired = true --
            },
            {
                text = "   Bill Price ($)",
                name = "billprice", 
                type = "number",
                isRequired = false
            }
			
        }
    })
    if bill ~= nil then
        if bill.citizenid == nil or bill.billprice == nil then 
            return 
        end
        TriggerServerEvent("rt-taco:server:billPlayer", bill.citizenid, bill.billprice)
    end
end)