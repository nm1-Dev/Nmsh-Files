local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local spawnped = false
local sex = polas350

RegisterNetEvent('QBCore:client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function (Player)
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:client:OnJobUpdate', function (job)
    PlayerJob = job
end)

exports['nmsh-target']:AddBoxZone("pdheli", vector3(463.34, -982.05, 43.69), 1, 1, {
    name="pdheli",
    heading=0,
    --debugPoly=true,
    minZ=40.69,
    maxZ=44.69,
}, {
	options = {
		{
            type = "client",
            event = "heligarage:menuopen",
			icon = "fa-solid fa-warehouse",
			label = "Heli Garage",
			job = "police",
		},
	},
	distance = 2.5
})



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        for k, v in pairs(Config.PdPedLoc) do
            local pos = GetEntityCoords(PlayerPedId())
            local dist = #(v.Cords - pos)
            if dist < 40 and spawnped == false then
                TriggerEvent('spawn:npc',v.Cords,v.h)
                spawnped = true
            end
            if dist >= 35 then 
                spawnped = false
                DeletePed(npc)
            end
        end
    end
end)



RegisterNetEvent('spawn:npc')
AddEventHandler('spawn:npc', function(coords,heading)
    local hash = GetHashKey(Config.PolicePed)
    if not HasModelLoaded(hash) then
        RequestModel(hash)
        Wait(150)
    end
    while not HasModelLoaded(hash) do
        Wait(150)
    end
    spawnped = true
    npc = CreatePed(5, hash, coords, heading, false, false)
    FreezeEntityPosition(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityInvincible(npc, true)
    loadAnimDict("amb@world_human_drug_dealer_hard@male@base")
    while not TaskPlayAnim(npc, "amb@world_human_drug_dealer_hard@male@base", "base", 8.0, 1.0, -1, 17, 0, 0, 0) do
    Wait(1000)
    end
end)

function loadAnimDict(dict)
    while ( not HasAnimDictLoaded(dict)) do
        RequestAnimDict( dict )
        Citizen.Wait(5)
    end
end

function closeMenuFull()
    exports['nmsh-menu']:closeMenu()
end

RegisterNetEvent('emsgarage:heli')
AddEventHandler('emsgarage:heli', function()
    porno = "emsaw139"
    local coords = { ["x"] = 352.03, ["y"] = -587.89, ["z"] = 74.16, ["h"] = 77.4 } --Change this to wherever you want to car to spawn
    QBCore.Functions.SpawnVehicle(porno, function(veh)
            SetVehicleNumberPlateText(veh, "EMS"..tostring(math.random(1000, 9999)))
            exports['nmsh-fuel']:SetFuel(veh, 100.0)
            SetEntityHeading(veh, coords.h)
            SetVehicleModKit(veh, 0)
            SetVehicleLivery(veh, 0)
            SetVehicleDirtLevel(veh, 0.0)
            TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
            QBCore.Functions.Notify("Aracı teslim aldın")
        -- end
    end, coords, true)
end)

RegisterNetEvent('policegarage:lspd')
AddEventHandler('policegarage:lspd', function()
    vehicle = "polas350"
    local coords = { ['x'] = 449.13, ['y'] = -981.56, ['z'] = 43.69, ['h'] = 81.35 } --Change this to wherever you want to car to spawn
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
            SetVehicleNumberPlateText(veh, "LSPD"..tostring(math.random(1000, 9999)))
            exports['nmsh-fuel']:SetFuel(veh, 100.0)
            SetEntityHeading(veh, coords.h)
            SetVehicleModKit(veh, 0)
            SetVehicleLivery(veh, 0)
            SetVehicleDirtLevel(veh, 0.0)
            TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
            QBCore.Functions.Notify("Aracı teslim aldın")
        -- end
    end, coords, true)
end)

RegisterNetEvent('policegarage:bcso')
AddEventHandler('policegarage:bcso', function()
    vehicle = "polas350"
    local coords = { ['x'] = 449.13, ['y'] = -981.56, ['z'] = 43.69, ['h'] = 81.35 } --Change this to wherever you want to car to spawn
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
            SetVehicleNumberPlateText(veh, "BCSO"..tostring(math.random(1000, 9999)))
            exports['nmsh-fuel']:SetFuel(veh, 100.0)
            SetEntityHeading(veh, coords.h)
            SetVehicleModKit(veh, 0)
            SetVehicleLivery(veh, 1)
            SetVehicleDirtLevel(veh, 0.0)
            TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
            QBCore.Functions.Notify("Aracı teslim aldın")
        -- end
    end, coords, true)
end)


RegisterNetEvent('policegarage:sasp')
AddEventHandler('policegarage:sasp', function()
    vehicle = "polas350"
    local coords = { ['x'] = 449.13, ['y'] = -981.56, ['z'] = 43.69, ['h'] = 81.35 } --Change this to wherever you want to car to spawn
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
            SetVehicleNumberPlateText(veh, "SASP"..tostring(math.random(1000, 9999)))
            exports['nmsh-fuel']:SetFuel(veh, 100.0)
            SetEntityHeading(veh, coords.h)
            SetVehicleModKit(veh, 0)
            SetVehicleLivery(veh, 2)
            SetVehicleDirtLevel(veh, 0.0)
            TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
            QBCore.Functions.Notify("Aracı teslim aldın")
        -- end
    end, coords, true)
end)


RegisterNetEvent('policegarage:storecar')
AddEventHandler('policegarage:storecar', function()
local car = GetVehiclePedIsIn(PlayerPedId(),true)
DeleteVehicle(car)
DeleteEntity(car)
if car == 0 then 
    QBCore.Functions.Notify("Yakınlarda araç yok!")
    else 
        QBCore.Functions.Notify("Aracı park ettin")
    end
end)

RegisterNetEvent('pono31')
AddEventHandler('pono31', function()
    local helimenu = {
        {
            header = "Kapat",
            event = "nmsh-menu:closeMenu",
            back = true
        },
        {
            header = "EMS Helikopterini Al",
            event = "emsgarage:heli",
            icon = "fa-solid fa-store",
            submenu = true
        },
        {
            header = "PD Helikopterini Teslim Et",
            event = "policegarage:storecar",
            icon = "fas fa-circle-chevron-left",
            submenu = true
        },
    }
    
    exports["nmsh-menu"]:createMenu(helimenu)
end)

RegisterNetEvent('heligarage:menuopen')
AddEventHandler('heligarage:menuopen', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData.job.grade.level == 5 or PlayerData.job.grade.level == 6 or PlayerData.job.grade.level == 7 then
    local helimenu = {
        {
            header = "Kapat",
            event = "nmsh-menu:closeMenu",
            back = true
        },
        {
            header = "PD Helikopterleri",
            event = "sex123",
            icon = "fa-solid fa-store",
            submenu = true
        },
        {
            header = "PD Helikopterini Teslim Et",
            event = "policegarage:storecar",
            icon = "fas fa-circle-chevron-left",
            submenu = true
        },
    }
    
    exports["nmsh-menu"]:createMenu(helimenu)
else
    QBCore.Functions.Notify("Erişimin yok")
end
end)

RegisterNetEvent('sex123')
AddEventHandler('sex123', function()
    local heliliv = {
        {
            header = "Geri Dön",
            event = "heligarage:menuopen",
            back = true
        },
        {
            header = "PD",
            event = "policegarage:lspd",
            icon = "fa fa-helicopter",
            submenu = true
        },
        {
            header = "BCSO",
            event = "policegarage:bcso",
            icon = "fa fa-helicopter",
            submenu = true
        },
        {
            header = "SASP",
            event = "policegarage:sasp",
            icon = "fa fa-helicopter",
            submenu = true
        },
    }
    
    exports["nmsh-menu"]:createMenu(heliliv)
end)