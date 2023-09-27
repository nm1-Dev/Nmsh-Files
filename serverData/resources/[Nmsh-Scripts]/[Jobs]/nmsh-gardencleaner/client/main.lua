local HasJobStarted = false
local HasJob = true
local SetRandomLocation
local CarParked = false
local POINTS_DONE_IN_JOB = 0
local haveBinBag = false
local JobsToDo
local NumberToDo = 0
local geeky
local PropsBlips = {}
local ClothesOn = false
local blip
local QBCore = nil
local ESX = nil
local blipSY
local Player

if GetFrameWork() == 'ESX' then
    ESX = exports['es_extended']:getSharedObject()
elseif GetFrameWork() == 'QBCORE' then
    QBCore = exports['qb-core']:GetCoreObject()
end

Citizen.CreateThread(function()
	SpawnStartingPed()
    local Blip_Name = Config.Languages[Config.Lang]["BLIP_NAME"]
    blip = AddBlipForCoord(Config.Job.StartJob.Coords.x, Config.Job.StartJob.Coords.y, Config.Job.StartJob.Coords.z)
    SetBlipSprite(blip, Config.Job.StartJob.blip.SetBlipSprite)
    SetBlipDisplay(blip, Config.Job.StartJob.blip.SetBlipDisplay)
    SetBlipScale(blip, Config.Job.StartJob.blip.SetBlipScale)
    SetBlipColour(blip, Config.Job.StartJob.blip.SetBlipColour )
    SetBlipAsShortRange(blip, Config.Job.StartJob.blip.SetBlipAsShortRange )
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Blip_Name)
    EndTextCommandSetBlipName(blip)
end)

--MAIN CODE--

CreateThread(function()
	while true do
		Citizen.Wait(1000)
        if not Config.Jobs then
            HasJob = true
        elseif GetFrameWork() == "ESX" and ESX.GetPlayerData().job.name == Config.Jobs then
            HasJob = true
        elseif GetFrameWork() == "QBCORE" and QBCore.Functions.GetPlayerData().job.name == Config.Jobs then
            HasJob = true
        else
            HasJob = false
        end
    end
end)

CreateThread(function()
	while true do
        sleep = 1000

        if HasJob and HasJobStarted then
            sleep = 0
            -- JOB UPDATES --
            JobsToDo = #Config.JobWork[SetRandomLocation].BinBags + #Config.JobWork[SetRandomLocation].Charvest + #Config.JobWork[SetRandomLocation].LeafBlower
            NumberToDo = JobsToDo-POINTS_DONE_IN_JOB
            print(JobsToDo)
            print(Config.JobWork[SetRandomLocation].PayForOnePoint)
            -- END OF JOB UPDATES --

            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - Config.Job.CarControl.Coords)
            if distance < Config.Job.CarControl.DrawDistance+1 and IsPedInAnyVehicle(PlayerPedId()) then
                if distance < Config.Job.CarControl.DrawDistance-2 then
                    DrawMarker(23, Config.Job.CarControl.Coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.5, 3.5, 3.0, 136, 8, 8, 100, false, true, 2, false, nil, nil, false)
                    DrawText3Ds(Config.Job.CarControl.Coords, Config.Languages[Config.Lang]["TAKE_IN_CAR"])
                    if IsControlJustReleased(0,46) then
                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                        DeleteVehicle(vehicle)
                        DeleteWaypoint();
                        if NumberToDo == 0 then
                            Notify(Config.Languages[Config.Lang]["JOB_FINISH_GIVE_ME_THE_FUCKING_MONEY"]..''..tonumber(JobsToDo)*tonumber(Config.JobWork[SetRandomLocation].PayForOnePoint))
                            TriggerServerEvent("cs_gardencleaner:givemoney", JobsToDo, SetRandomLocation)
                        end
                        CarParked = false
                        HasJobStarted = false
                        SetRandomLocation = nil
                        POINTS_DONE_IN_JOB = 0
                        haveBinBag = false
                        JobsToDo = 0
                        NumberToDo = 0
                        geeky = nil

                        if Config.SpawnBack then
                            SetEntityCoords(GetPlayerPed(-1), Config.Job.StartJob.Coords.x, Config.Job.StartJob.Coords.y, Config.Job.StartJob.Coords.z, false, false, false, true)
                        end
                    end
                else
                    DrawMarker(23, Config.Job.CarControl.Coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.5, 3.5, 3.0, 255, 255, 255, 100, false, true, 2, false, nil, nil, false)
                end
            else
                sleep = 1500
            end
        end
        Citizen.Wait(sleep)
	end
end)

CreateThread(function()
	while true do
        sleep = 1000
        if HasJob and HasJobStarted then
            sleep = 0
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - Config.JobWork[SetRandomLocation].ParkCarAt)
            if distance < Config.Job.CarControl.DrawDistance+1 and IsPedInAnyVehicle(PlayerPedId()) and not CarParked then
                if distance < Config.Job.CarControl.DrawDistance-2 then
                    DrawMarker(23, Config.JobWork[SetRandomLocation].ParkCarAt, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.5, 3.5, 3.0, 136, 8, 8, 100, false, true, 2, false, nil, nil, false)
                    DrawText3Ds(Config.JobWork[SetRandomLocation].ParkCarAt, Config.Languages[Config.Lang]["PARK_THE_CAR"])
                    if IsControlJustReleased(0,46) then
                        Notify(Config.Languages[Config.Lang]["TALK_MIKE_INPLACE"])
                        CarParked = true
                        SpawnCharvest()
                        SpawnBinBags()
                        SpawnLeafs()
                        RemoveBlip(blipSY)
                    end
                else
                    DrawMarker(23, Config.JobWork[SetRandomLocation].ParkCarAt, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.5, 3.5, 3.0, 255, 255, 255, 100, false, true, 2, false, nil, nil, false)
                end
            else
                sleep = 1500
            end
        end
        Citizen.Wait(sleep)
	end
end)

RegisterNetEvent('cs_gardencleaner:startjob')
AddEventHandler('cs_gardencleaner:startjob', function()
        if HasJobStarted and not CarParked then
            HasJobStarted = false
            SetRandomLocation = nil
            CarParked = false
            POINTS_DONE_IN_JOB = 0
            haveBinBag = false
            JobsToDo = 0
            NumberToDo = 0
            geeky = nil
            RemoveBlip(blipSY)
        elseif not HasJobStarted then
            HasJobStarted = true
            local RandomLocal = math.random(1,#Config.JobWork)
            SpawnCar()
            SetNewWaypoint(Config.JobWork[RandomLocal].ParkCarAt.x, Config.JobWork[RandomLocal].ParkCarAt.y);
            SetRandomLocation = RandomLocal
            Notify(Config.Languages[Config.Lang]["TALK_MIKE_GOTOPLACE"])
            local Blip_Name = Config.Languages[Config.Lang]["BLIP_HOUSE"]
            blipSY = AddBlipForCoord(Config.JobWork[SetRandomLocation].ParkCarAt.x, Config.JobWork[SetRandomLocation].ParkCarAt.y, Config.JobWork[SetRandomLocation].ParkCarAt.z)
            SetBlipSprite(blipSY, Config.JobWork[SetRandomLocation].Blip.SetBlipSprite)
            SetBlipDisplay(blipSY, Config.JobWork[SetRandomLocation].Blip.SetBlipDisplay)
            SetBlipScale(blipSY, Config.JobWork[SetRandomLocation].Blip.SetBlipScale)
            SetBlipColour(blipSY, Config.JobWork[SetRandomLocation].Blip.SetBlipColour )
            SetBlipAsShortRange(blipSY, Config.JobWork[SetRandomLocation].Blip.SetBlipAsShortRange )
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Blip_Name)
            EndTextCommandSetBlipName(blipSY)
        else
            Notify(Config.Languages[Config.Lang]["INFO_FIRST_FINISH_JOB"])
        end
end)

RegisterNetEvent('cs_gardencleaner:charvest')
AddEventHandler('cs_gardencleaner:charvest', function(data)
    ClearPedTasks(GetPlayerPed(-1))
    TaskStartScenarioInPlace(GetPlayerPed(-1), "world_human_gardener_plant", 0, true)
    Citizen.Wait(5000)
    DeleteEntity(data.entity)
    ClearPedTasks(GetPlayerPed(-1))
    POINTS_DONE_IN_JOB = POINTS_DONE_IN_JOB+1
    Notify(Config.Languages[Config.Lang]["INFO_DONE"]..' '..POINTS_DONE_IN_JOB.."/"..JobsToDo)
    RemoveBlip(PropsBlips[data.entity])
    if NumberToDo == 0 then
        Notify(Config.Languages[Config.Lang]["INFO_DONE_JOB"]..''..JobsToDo*Config.JobWork[SetRandomLocation].PayForOnePoint)
    end
end)

RegisterNetEvent('cs_gardencleaner:LeafBlower')
AddEventHandler('cs_gardencleaner:LeafBlower', function(data)
    ClearPedTasks(GetPlayerPed(-1))
    TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_GARDENER_LEAF_BLOWER", 0, true)
    FreezeEntityPosition(GetPlayerPed(-1), true);
    Wait(17000)
    DeleteEntity(data.entity)
    ClearPedTasks(GetPlayerPed(-1))
    FreezeEntityPosition(GetPlayerPed(-1), false);
    ClearAreaOfObjects(GetEntityCoords(GetPlayerPed(-1)), 2.0, 0)
    POINTS_DONE_IN_JOB = POINTS_DONE_IN_JOB+1
    Notify(Config.Languages[Config.Lang]["INFO_DONE"]..' '..POINTS_DONE_IN_JOB.."/"..JobsToDo)
    RemoveBlip(PropsBlips[data.entity])
    if NumberToDo == 0 then
        Notify(Config.Languages[Config.Lang]["INFO_DONE_JOB"]..''..JobsToDo*Config.JobWork[SetRandomLocation].PayForOnePoint)
    end
end)

RegisterNetEvent('cs_gardencleaner:collecttrash')
AddEventHandler('cs_gardencleaner:collecttrash', function(data)
    ClearPedTasks(GetPlayerPed(-1))

    if not HasAnimDictLoaded("anim@move_m@trash") then
        RequestAnimDict("anim@move_m@trash")
    end
    while not HasAnimDictLoaded("anim@move_m@trash") do
        Citizen.Wait(0)
    end

    TaskPlayAnim(GetPlayerPed(-1), 'anim@move_m@trash', 'pickup', 1.0, -1.0,-1,2,0,0, 0,0)
    Citizen.Wait(1000)
    DeleteEntity(data.entity)
    ClearPedTasks(GetPlayerPed(-1))
    haveBinBag = true
    RemoveBlip(PropsBlips[data.entity])
    if not HasAnimDictLoaded("anim@heists@narcotics@trash") then
        RequestAnimDict("anim@heists@narcotics@trash")
    end
    while not HasAnimDictLoaded("anim@heists@narcotics@trash") do
        Citizen.Wait(0)
    end
    local boneindex = GetPedBoneIndex(PlayerPedId(-1), 57005)
    geeky = CreateObject(GetHashKey("hei_prop_heist_binbag"), 0, 0, 0, true, true, true)
    AttachEntityToEntity(geeky, PlayerPedId(-1), boneindex, 0.12, 0.0, 0.00, 25.0, 270.0, 180.0, true, true, false, true, 1, true)
    TaskPlayAnim(PlayerPedId(-1), 'anim@heists@narcotics@trash', 'walk', 1.0, -1.0,-1,49,0,0, 0,0)
    TriggerEvent("mt:missiontext", Config.Languages[Config.Lang]["INFO_BIN"])
end)

RegisterNetEvent('cs_gardencleaner:bin')
AddEventHandler('cs_gardencleaner:bin', function(data)
    haveBinBag = false
    POINTS_DONE_IN_JOB = POINTS_DONE_IN_JOB+1
    ClearPedTasksImmediately(GetPlayerPed(-1))
    TaskPlayAnim(GetPlayerPed(-1), 'anim@heists@narcotics@trash', 'throw_b', 1.0, -1.0,-1,2,0,0, 0,0)
    Citizen.Wait(700)
    DeleteObject(geeky)
    Citizen.Wait(2000)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    Notify(Config.Languages[Config.Lang]["INFO_DONE"]..' '..POINTS_DONE_IN_JOB.."/"..JobsToDo)
    if NumberToDo == 0 then
        Notify(Config.Languages[Config.Lang]["INFO_DONE_JOB"]..''..JobsToDo*Config.JobWork[SetRandomLocation].PayForOnePoint)
    end
end)

RegisterNetEvent("mt:missiontext")
AddEventHandler("mt:missiontext", function(text)
        ClearPrints()
        SetTextEntry_2("STRING")
        AddTextComponentString(text)
        DrawSubtitleTimed(5000, 1)
end)

RegisterNetEvent("cs_gardencleaner:putonclothes")
AddEventHandler("cs_gardencleaner:putonclothes", function()
    if ClothesOn then
        ChangeClothes()
    else
        ChangeClothes('work')
    end
end)


--- FUNCTIONS ---
function SpawnStartingPed()
    local model = Config.Job.StartJob.Ped
    RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(50)
	end
    spawnedPed = CreatePed(0, model, Config.Job.StartJob.Coords.x, Config.Job.StartJob.Coords.y, Config.Job.StartJob.Coords.z, Config.Job.StartJob.Coords.w, false, true)
    FreezeEntityPosition(spawnedPed, true)
    SetBlockingOfNonTemporaryEvents(spawnedPed, true)
    SetEntityInvincible(spawnedPed, true)

    exports[Config.TargetName]:AddTargetModel({GetHashKey('prop_dumpster_01a'), GetHashKey('prop_dumpster_02b'), GetHashKey('prop_dumpster_02a'), GetHashKey('prop_bin_08a')}, {
        options = {
            {
                event = "cs_gardencleaner:bin",
                icon = Config.StartJobEmote,
                label = Config.Languages[Config.Lang]["TARGET_PUTINBIN"],
                canInteract = function(entity)
                    if haveBinBag then
                        return true
                    end
                    return false
                end
            },
        },
        distance = 2.5
    })

    if not Config.job then
        exports[Config.TargetName]:AddTargetEntity(spawnedPed, {
            options = {
                {
                    event = "cs_gardencleaner:startjob",
                    icon = Config.StartJobEmote,
                    label = Config.Languages[Config.Lang]["TARGET_STARTJOB"],
                },
                {
                    event = "cs_gardencleaner:putonclothes",
                    icon = Config.ClothesJobEmote,
                    label = Config.Languages[Config.Lang]["TARGET_PUTONCLOTHES"],
                },
            },
            distance = 2.5
        })
    else 
        exports[Config.TargetName]:AddTargetEntity(spawnedPed, {
            options = {
                {
                    event = "cs_gardencleaner:startjob",
                    icon = Config.StartJobEmote,
                    label = Config.Languages[Config.Lang]["TARGET_STARTJOB"],
                    job = Config.Job
                },
                {
                    event = "cs_gardencleaner:putonclothes",
                    icon = Config.ClothesJobEmote,
                    label = Config.Languages[Config.Lang]["TARGET_PUTONCLOTHES"],
                    job = Config.Job
                },
            },
            distance = 2.5
        })
    end
end

function SpawnCar()
    if GetFrameWork() == 'ESX' then
	    ESX.Game.SpawnVehicle(Config.JobCar, Config.Job.CarControl.Coords, Config.Job.CarControl.heading, function(callback_vehicle)
		    SetVehicleFixed(callback_vehicle)
		    SetVehicleDeformationFixed(callback_vehicle)
		    SetVehicleEngineOn(callback_vehicle, true, true)
		    SetCarFuel(callback_vehicle)
		    TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
	    end)
    elseif GetFrameWork() == 'QBCORE' and not Config.FixCarSpawnQB then
        QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
            local veh = NetToVeh(netId)
            SetEntityHeading(veh, Config.Job.CarControl.heading)
		    SetVehicleFixed(veh)
		    SetVehicleDeformationFixed(veh)
		    SetVehicleEngineOn(veh, true, true)
		    SetCarFuel(veh)
		    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        end, Config.JobCar, Config.Job.CarControl.Coords, true)
    elseif GetFrameWork() == 'QBCORE' and Config.FixCarSpawnQB then
        QBCore.Functions.SpawnVehicle(Config.JobCar, function(veh)
            SetEntityHeading(veh, Config.Job.CarControl.heading)
		    SetVehicleFixed(veh)
		    SetVehicleDeformationFixed(veh)
		    SetVehicleEngineOn(veh, true, true)
            SetCarFuel(veh)
            TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
            SetVehicleEngineOn(veh, true, true)
        end, Config.Job.CarControl.Coords, true)    
    end
end

function DrawText3Ds(coords, text)
    local onScreen,_x,_y=World3dToScreen2d(coords.x,coords.y,coords.z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.030+ factor, 0.03, 0, 0, 0, 150)
end

function SpawnLeafs()
    local playerPos = GetEntityCoords(GetPlayerPed(-1), true)		
    for i=1, #Config.JobWork[SetRandomLocation].LeafBlower do
    local model = GetHashKey('prop_veg_crop_04_leaf')
    RequestModel(model)
    while (not HasModelLoaded(model)) do
        Wait(1)
    end
    local p = CreateObject(model, Config.JobWork[SetRandomLocation].LeafBlower[i].x, Config.JobWork[SetRandomLocation].LeafBlower[i].y, Config.JobWork[SetRandomLocation].LeafBlower[i].z-1.80, true, true, true)
    SetModelAsNoLongerNeeded(model)
    SetEntityAsMissionEntity(p, true, true);
    FreezeEntityPosition(p, true)
    SetEntityInvincible(p, true)

    PropsBlips[p] = AddBlipForCoord(Config.JobWork[SetRandomLocation].LeafBlower[i].x, Config.JobWork[SetRandomLocation].LeafBlower[i].y, Config.JobWork[SetRandomLocation].LeafBlower[i].z)
    SetBlipSprite(PropsBlips[p], 1)
    SetBlipDisplay(PropsBlips[p], 4)
    SetBlipScale(PropsBlips[p], 0.4)
    SetBlipColour(PropsBlips[p], 5)
    SetBlipAsShortRange(PropsBlips[p], true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('LeafBlower')
    EndTextCommandSetBlipName(PropsBlips[p])

    exports[Config.TargetName]:AddTargetEntity(p, {
        options = {
            {
                event = "cs_gardencleaner:LeafBlower",
                icon = Config.StartJobEmote,
                label = Config.Languages[Config.Lang]["TARGET_START_LEAFS"],
                canInteract = function(entity)
                    if not haveBinBag and HasJobStarted then
                        return true
                    end
                    return false
                end
            },
        },
        distance = 2.5
    })
end
end
function SpawnCharvest()
		local playerPos = GetEntityCoords(GetPlayerPed(-1), true)		
		for i=1, #Config.JobWork[SetRandomLocation].Charvest do
        local model = GetHashKey('prop_plant_01b')
        RequestModel(model)
        while (not HasModelLoaded(model)) do
            Wait(1)
        end
		local p = CreateObject(model, Config.JobWork[SetRandomLocation].Charvest[i].x, Config.JobWork[SetRandomLocation].Charvest[i].y, Config.JobWork[SetRandomLocation].Charvest[i].z-1.30, true, true, true)
        SetModelAsNoLongerNeeded(model)
        SetEntityAsMissionEntity(p, true, true);
        FreezeEntityPosition(p, true)
		SetEntityInvincible(p, true)

        PropsBlips[p] = AddBlipForCoord(Config.JobWork[SetRandomLocation].Charvest[i].x, Config.JobWork[SetRandomLocation].Charvest[i].y, Config.JobWork[SetRandomLocation].Charvest[i].z)
        SetBlipSprite(PropsBlips[p], 1)
        SetBlipDisplay(PropsBlips[p], 4)
        SetBlipScale(PropsBlips[p], 0.4)
        SetBlipColour(PropsBlips[p], 5)
        SetBlipAsShortRange(PropsBlips[p], true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Charvest')
        EndTextCommandSetBlipName(PropsBlips[p])

        exports[Config.TargetName]:AddTargetEntity(p, {
            options = {
                {
                    event = "cs_gardencleaner:charvest",
                    icon = Config.StartJobEmote,
                    label = Config.Languages[Config.Lang]["TARGET_START_CHARVEST"],
                    canInteract = function(entity)
                        if not haveBinBag and HasJobStarted then
                            return true
                        end
                        return false
                    end
                },
            },
            distance = 2.5
        })
	end
end
function SpawnBinBags()
    local playerPos = GetEntityCoords(GetPlayerPed(-1), true)		
    for i=1, #Config.JobWork[SetRandomLocation].BinBags do
    local model = GetHashKey('prop_rub_binbag_sd_02')
    RequestModel(model)
    while (not HasModelLoaded(model)) do
        Wait(1)
    end
    local p = CreateObject(model, Config.JobWork[SetRandomLocation].BinBags[i].x, Config.JobWork[SetRandomLocation].BinBags[i].y, Config.JobWork[SetRandomLocation].BinBags[i].z-0.99, true, true, true)
    SetModelAsNoLongerNeeded(model)
    FreezeEntityPosition(p, true)
    SetEntityAsMissionEntity(p, true, true);
    SetEntityInvincible(p, true)

    PropsBlips[p] = AddBlipForCoord(Config.JobWork[SetRandomLocation].BinBags[i].x, Config.JobWork[SetRandomLocation].BinBags[i].y, Config.JobWork[SetRandomLocation].BinBags[i].z)
    SetBlipSprite(PropsBlips[p], 1)
    SetBlipDisplay(PropsBlips[p], 4)
    SetBlipScale(PropsBlips[p], 0.4)
    SetBlipColour(PropsBlips[p], 5)
    SetBlipAsShortRange(PropsBlips[p], true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Bin Bag')
    EndTextCommandSetBlipName(PropsBlips[p])

    exports[Config.TargetName]:AddTargetEntity(p, {
        options = {
            {
                event = "cs_gardencleaner:collecttrash",
                icon = Config.StartJobEmote,
                label = Config.Languages[Config.Lang]["TARGET_START_BINBAGS"],
                canInteract = function(entity)
                    if not haveBinBag and HasJobStarted then
                        return true
                    end
                    return false
                end
            },
        },
        distance = 2.5
    })
    end
end

function ChangeClothes(type) 
    if type == "work" then
        local gender
        if GetFrameWork() == 'ESX' then
        TriggerEvent('skinchanger:getSkin', function(skin)
            gender = skin.sex
        end)
        elseif GetFrameWork() == 'QBCORE' then
            local Player = QBCore.Functions.GetPlayerData()
            gender = Player.charinfo.gender
        end
        local PlayerPed = PlayerPedId()
        ClothesOn = true
        if gender == 0 then
            for k,v in pairs(Config.Clothes.male.components) do
                SetPedComponentVariation(PlayerPed, v["component_id"], v["drawable"], v["texture"], 0)
            end
        else
            for k,v in pairs(Config.Clothes.female.components) do
                SetPedComponentVariation(PlayerPed, v["component_id"], v["drawable"], v["texture"], 0)
            end
        end
    else       
        ClothesOn = false 
        if GetFrameWork() == 'ESX' then
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
            end)
        elseif GetFrameWork() == 'QBCORE' then
            TriggerServerEvent('qb-clothes:loadPlayerSkin')
        end
    end
end
