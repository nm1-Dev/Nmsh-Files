local QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}

CreateThread(function()
    uwuCafe = AddBlipForCoord(-580.9502, -1065.8682, 22.3473)
    SetBlipSprite (uwuCafe, 489)
    SetBlipDisplay(uwuCafe, 4)
    SetBlipScale  (uwuCafe, 0.8)
    SetBlipAsShortRange(uwuCafe, true)
    SetBlipColour(uwuCafe, 8)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("UwU Cafe")
    EndTextCommandSetBlipName(uwuCafe)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PlayerJob = QBCore.Functions.GetPlayerData().job
        uwuZones()
    end
end)

AddEventHandler('onResourceStop', function(resourceName) 
    if GetCurrentResourceName() == resourceName then
        for k, v in pairs(Config.Zones) do
            exports['nmsh-target']:RemoveZone("uwucafe"..k)
        end
        DeletePed(jobPed)
    end 
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    uwuZones()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    for k, v in pairs(Config.Zones) do
        exports['nmsh-target']:RemoveZone("uwucafe"..k)
    end
    DeletePed(jobPed)
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(0)
    end
end

function uwuZones()
    for k, v in pairs(Config.Zones) do
        exports['nmsh-target']:AddCircleZone("uwucafe"..k, v.coords, v.radius, {
            name = "uwucafe"..k,
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
		    event = "nmsh-uwucafe:client:jobGarage",
		    icon = "fa-solid fa-clipboard-check",
		    label = "Garage",
		    job = "uwu"
		},
		{ 
		    type = "client",
		    event = "nmsh-uwucafe:client:storeGarage",
		    icon = "fa-solid fa-clipboard-check",
		    label = "Store Vehicle",
		    job = "uwu"
		},
	    }, 
	    distance = 1.5, 
	})
    end
end

CreateThread(function()
    DecorRegister("uwu_vehicle", 1)
end)

RegisterNetEvent('nmsh-uwucafe:client:jobGarage', function(vehicle)
    local vehicle = Config.Vehicle
    local coords = Config.VehicleSpawn
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        SetVehicleNumberPlateText(veh, "UWU"..tostring(math.random(1000, 9999)))
        SetVehicleColours(veh, 112, 112)
        SetVehicleLivery(veh, 15)
        DecorSetFloat(veh, "uwu_vehicle", 1)
        SetEntityAsMissionEntity(veh, true, true)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
        CurrentPlate = QBCore.Functions.GetPlate(veh)
        SetVehicleFuelLevel(veh, 100.0)
    end, coords, true)
end)

RegisterNetEvent('nmsh-uwucafe:client:storeGarage', function()
    local veh = QBCore.Functions.GetClosestVehicle()
    if DecorExistOn((veh), "uwu_vehicle") then
        QBCore.Functions.DeleteVehicle(veh)
        QBCore.Functions.Notify("You returned the vehicle.", "success")
    else
        QBCore.Functions.Notify("This is not a work vehicle.", "error")
    end
end)
    
RegisterNetEvent("nmsh-uwucafe:client:stash1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "uwuStash1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "uwuStash1", {
        maxweight = 50000,
        slots = 20,
    })
end)

RegisterNetEvent("nmsh-uwucafe:client:stash2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "uwuStash2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "uwuStash2", {
        maxweight = 50000,
        slots = 20,
    })
end)

RegisterNetEvent("nmsh-uwucafe:client:stash3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "uwuStash3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "uwuStash3", {
        maxweight = 50000,
        slots = 20,
    })
end)

RegisterNetEvent("nmsh-uwucafe:client:stash4", function()
    TriggerEvent("inventory:client:SetCurrentStash", "uwuStash4")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "uwuStash4", {
        maxweight = 50000,
        slots = 20,
    })
end)

RegisterNetEvent("nmsh-uwucafe:client:stash5", function()
    TriggerEvent("inventory:client:SetCurrentStash", "uwuStash5")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "uwuStash5", {
        maxweight = 50000,
        slots = 20,
    })
end)

RegisterNetEvent("nmsh-uwucafe:client:stash6", function()
    TriggerEvent("inventory:client:SetCurrentStash", "uwuStash6")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "uwuStash6", {
        maxweight = 50000,
        slots = 20,
    })
end)

RegisterNetEvent("nmsh-uwucafe:client:stash7", function()
    TriggerEvent("inventory:client:SetCurrentStash", "uwuStash7")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "uwuStash7", {
        maxweight = 50000,
        slots = 20,
    })
end)

RegisterNetEvent("nmsh-uwucafe:client:stash8", function()
    TriggerEvent("inventory:client:SetCurrentStash", "uwuStash8")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "uwuStash8", {
        maxweight = 50000,
        slots = 20,
    })
end)

RegisterNetEvent("nmsh-uwucafe:client:stash9", function()
    TriggerEvent("inventory:client:SetCurrentStash", "uwuStash9")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "uwuStash9", {
        maxweight = 50000,
        slots = 20,
    })
end)

RegisterNetEvent("nmsh-uwucafe:client:stash10", function()
    TriggerEvent("inventory:client:SetCurrentStash", "uwuStash10")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "uwuStash10", {
        maxweight = 50000,
        slots = 20,
    })
end)

RegisterNetEvent("nmsh-uwucafe:client:tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "uwuTray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "uwuTray1", {
        maxweight = 50000,
        slots = 20,
    })
end)

RegisterNetEvent("nmsh-uwucafe:client:tray2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "uwuTray2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "uwuTray2", {
        maxweight = 50000,
        slots = 20,
    })
end)

RegisterNetEvent("nmsh-uwucafe:client:tray3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "uwuTray3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "uwuTray3", {
        maxweight = 50000,
        slots = 20,
    })
end)

RegisterNetEvent("nmsh-uwucafe:client:refregiator", function()
    TriggerEvent("inventory:client:SetCurrentStash", "uwuRefregiator")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "uwuRefregiator", {
        maxweight = 50000,
        slots = 20,
    })
end)

RegisterNetEvent("nmsh-uwucafe:client:openShop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "uwuShop", Config.Items)
end)

RegisterNetEvent('nmsh-uwucafe:clientToggleDuty', function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("nmsh-uwucafe:bill", function()
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
        TriggerServerEvent("nmsh-uwucafe:server:billPlayer", bill.citizenid, bill.billprice)
    end
end)
