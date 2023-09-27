Config = {}

Config.Lang = 'en'
Config.FrameWork = 'QBCORE'  -- Only supports ESX and QBCORE
Config.Jobs = false          -- Put false for no job lock
Config.FixCarSpawnQB = false -- Set this to true if car is not spawning
Config.SpawnBack = true      -- Spawns player next to the ped when gives back the car

--- Vehicle ---
Config.UsingFuel = false
Config.JobCar = 'speedo4'

--- TARGET ---
Config.TargetName = 'nmsh-target'
Config.StartJobEmote = 'fa-solid fa-handshake-simple'
Config.ClothesJobEmote = 'fa-solid fa-shirt'

--- JOB SETTINGS ---
Config.PaymentType = "cash" --Name of payment type like `Bank, Cash, Money and etc` [ONLY FOR QBCORE]
Config.Job = {
    StartJob = {            -- Ped Location
        Coords = vector4(-1087.1871, -1277.4829, 5.8424 - 0.99, 207.8397),
        Ped = 'a_f_m_bevhills_02',
        blip = {
            SetBlipSprite = 354,
            SetBlipDisplay = 4,
            SetBlipScale = 0.8,
            SetBlipColour = 5,
            SetBlipAsShortRange = true,
        }
    },
    CarControl = { --Spawn/Detete Car
        Coords = vector3(-1109.0658, -1291.9574, 5.3421 - 0.89),
        heading = 207.2277,
        DrawDistance = 4.0
    }
}

Config.Clothes = {
    male = {
        components = { { ["component_id"] = 0, ["texture"] = 0, ["drawable"] = 0 },
            { ["component_id"] = 1, ["texture"] = 0, ["drawable"] = 0 },
            { ["component_id"] = 3, ["texture"] = 0, ["drawable"] = 30 },
            { ["component_id"] = 4, ["texture"] = 0, ["drawable"] = 36 },
            { ["component_id"] = 5, ["texture"] = 0, ["drawable"] = 0 },
            { ["component_id"] = 6, ["texture"] = 1, ["drawable"] = 56 },
            { ["component_id"] = 7, ["texture"] = 0, ["drawable"] = 0 },
            { ["component_id"] = 8, ["texture"] = 1, ["drawable"] = 59 },
            { ["component_id"] = 9, ["texture"] = 0, ["drawable"] = 0 },
            { ["component_id"] = 10, ["texture"] = 0, ["drawable"] = 0 },
            { ["component_id"] = 11, ["texture"] = 0, ["drawable"] = 56 }, },
    },
    female = {
        components = { { ["component_id"] = 0, ["texture"] = 0, ["drawable"] = 0 },
            { ["component_id"] = 1, ["texture"] = 0, ["drawable"] = 0 },
            { ["component_id"] = 3, ["texture"] = 0, ["drawable"] = 57 },
            { ["component_id"] = 4, ["texture"] = 0, ["drawable"] = 35 },
            { ["component_id"] = 5, ["texture"] = 0, ["drawable"] = 0 },
            { ["component_id"] = 6, ["texture"] = 1, ["drawable"] = 59 },
            { ["component_id"] = 7, ["texture"] = 0, ["drawable"] = 0 },
            { ["component_id"] = 8, ["texture"] = 1, ["drawable"] = 36 },
            { ["component_id"] = 9, ["texture"] = 0, ["drawable"] = 0 },
            { ["component_id"] = 10, ["texture"] = 0, ["drawable"] = 0 },
            { ["component_id"] = 11, ["texture"] = 1, ["drawable"] = 49 }, },
    }
}

Config.JobWork = {
    [1] = {
        PayForOnePoint = '1',
        ParkCarAt = vector3(-1603.0819, -364.4330, 45.6417 - 0.99),
        Blip = {
            SetBlipSprite = 354,
            SetBlipDisplay = 4,
            SetBlipScale = 0.8,
            SetBlipColour = 5,
            SetBlipAsShortRange = true,
        },
        BinBags = {
            [1] = vector3(-1604.6487, -344.0188, 49.2116),
            [2] = vector3(-1605.6732, -345.4971, 49.2128),
        },
        Charvest = {
            [1] = vector3(-1606.8596, -371.7873, 46.4499),
            [2] = vector3(-1608.4360, -370.1949, 46.4269),
        },
        LeafBlower = {
            [1] = vector3(-1606.19, -342.46, 49.21),
            [2] = vector3(-1606.98, -333.51, 49.22),
        },
    },
}

--- FUNCTIONS ---
function GetFrameWork()
    return Config.FrameWork
end

local QBCore = nil
local ESX = nil
if GetFrameWork() == 'ESX' then
    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(0)
        end
    end)
elseif GetFrameWork() == 'QBCORE' then
    QBCore = exports['qb-core']:GetCoreObject()
end
function SetCarFuel(callback_vehicle)
    if Config.UsingFuel then
        exports['nmsh-fuel']:SetFuel(callback_vehicle, '100')
    end
end

function Notify(message)
    if GetFrameWork() == 'ESX' then
        ESX.ShowNotification(message, false, false, w)
    elseif GetFrameWork() == 'QBCORE' then
        QBCore.Functions.Notify(message, "primary")
    end
end
