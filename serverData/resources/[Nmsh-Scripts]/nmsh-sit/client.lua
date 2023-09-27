local QBCore = exports['qb-core']:GetCoreObject()

local debugProps, sitting, lastPos, currentSitCoords, currentScenario, occupied = {}
local curobjpos = nil
local playerPos = nil
local disableControls = false
local currentObj = nil

exports('sitting', function()
    return sitting
end)

local isLoggedIn = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

local function displayNUIText()
    SendNUIMessage({ type = "display", text = Config.GetUpText, color = 'rgb(0 155 255)' })
    Wait(0)
end

local function hideNUI()
    SendNUIMessage({ type = "hide" })
    Wait(0)
end

local function DrawTxt(x, y, width, height, scale, text, r, g, b, a, outline)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width / 2, y - height / 2 + 0.005)
end

Citizen.CreateThread(function()
    sleep = 0
    while true do
        Wait(sleep)
        if sitting then
            sleep = 0
            local playerPed = PlayerPedId()

            if not IsPedUsingScenario(playerPed, currentScenario) then
                TaskStartScenarioAtPosition(playerPed, currentScenario, curobjpos.x, curobjpos.y, curobjpos.z, GetEntityHeading(playerPed), 0, true, false)
                --wakeup()
            end

            if isCurDead then
                wakeup()
            end

            if IsControlPressed(0, 23) then
                if sitting then
                    wakeup()
                end
            end

        elseif not sitting then
            sleep = 2000
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1000)
        if isLoggedIn then
            if QBCore.Functions.GetPlayerData().metadata["isdead"] or QBCore.Functions.GetPlayerData().metadata["inlaststand"] then
                isCurDead = true
            else
                isCurDead = false
            end
        end
    end
end)

--CreateThread(function()
--	while true do
--		ped = PlayerPedId()
--		Wait(1000)
--	end
--end)


Citizen.CreateThread(function()
    local Sitables = {}

    for k, v in pairs(Config.Interactables) do
        local model = GetHashKey(v)
        table.insert(Sitables, model)
    end

    Citizen.Wait(100)
    exports['nmsh-target']:AddTargetModel(Sitables, {
        options = {
            {
                event = "nmsh-Sit:Sit",
                icon = "fas fa-chair",
                label = "Sit Down",
                entity = entity
            },
        },
       -- job = { "all" },
        distance = Config.MaxDistance
    })
    for k, v in pairs(Config.SitPoints) do
        exports['nmsh-target']:AddBoxZone("Sitpoint" .. k, vector3(v.coords.x, v.coords.y, v.coords.z), 0.75, 0.75, {
            name = "Sitpoint" .. k,
            heading = v.coords.w,
            debugPoly = false,
            minZ = v.coords.z - 0.5,
            maxZ = v.coords.z + 0.5,
        }, {
            options = {
                {
                    type = "client",
                    event = "nmsh-Sit:SitPoint",
                    icon = "fas fa-chair",
                    label = "Sit Down",
                    sitpoint = k,
                    coords = v.coords
                },
            },
            distance = 2.5
        })
    end
end)

RegisterNetEvent("nmsh-Sit:Sit", function(data)
    local playerPed = PlayerPedId()

    if sitting and not IsPedUsingScenario(playerPed, currentScenario) then
        wakeup()
    end

    if disableControls then
        DisableControlAction(1, 37, true)
    end

    local object, hash = data.entity, GetEntityModel(data.entity)

    for k, v in pairs(Config.Sitable) do
        if GetHashKey(k) == hash then
            sit(object, k, v)
            break
        end
    end
end)

RegisterNetEvent("nmsh-Sit:SitPoint", function(data)
    local playerPed = PlayerPedId()

    if sitting and not IsPedUsingScenario(playerPed, currentScenario) then
        wakeup()
    end

    if disableControls then
        DisableControlAction(1, 37, true)
    end

    sitpoint(data.sitpoint, data.coords)
end)


function wakeup()
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(PlayerPedId())

    hideNUI()

    TaskStartScenarioAtPosition(playerPed, currentScenario, 0.0, 0.0, 0.0, 180.0, 2, true, false)
    while IsPedUsingScenario(PlayerPedId(), currentScenario) do
        Citizen.Wait(100)
    end
    ClearPedTasks(playerPed)

    FreezeEntityPosition(playerPed, false)
    TriggerServerEvent('nmsh-sit:leavePlace', currentSitCoords)
    currentSitCoords, currentScenario = nil, nil
    sitting = false
    disableControls = false
end

function sit(object, modelName, data)
    if not HasEntityClearLosToEntity(PlayerPedId(), object, 17) then
        return
    end

    disableControls = true
    currentObj = object
    FreezeEntityPosition(object, true)

    playerPos = GetEntityCoords(PlayerPedId())
    curobjpos = GetEntityCoords(object)
    curobjpos = vector3(curobjpos.x, curobjpos.y, curobjpos.z + (playerPos.z - curobjpos.z) / 2)
    local objectCoords = curobjpos

    --print(objectCoords)

    QBCore.Functions.TriggerCallback('nmsh-sit:getPlace', function(occupied)
        if occupied then
            QBCore.Functions.Notify('Chair is being used.', 'error')
        else
            local playerPed = PlayerPedId()
            lastPos, currentSitCoords = GetEntityCoords(playerPed), objectCoords

            displayNUIText()
            TriggerServerEvent('nmsh-sit:takePlace', objectCoords)

            currentScenario = data.scenario
            TaskStartScenarioAtPosition(playerPed, currentScenario, curobjpos.x, curobjpos.y, curobjpos.z - data.verticalOffset, GetEntityHeading(object) + 180.0, 0, true, false)

            Citizen.Wait(2500)
            if GetEntitySpeed(PlayerPedId()) > 0 then
                ClearPedTasks(PlayerPedId())
                TaskStartScenarioAtPosition(playerPed, currentScenario, curobjpos.x, curobjpos.y, curobjpos.z - data.verticalOffset, GetEntityHeading(object) + 180.0, 0, true, true)
            end

            sitting = true
        end
    end, objectCoords)
end

function sitpoint(sitpoint, coords)
    disableControls = true

    playerPos = GetEntityCoords(PlayerPedId())
    curobjpos = coords
    local objectCoords = coords.x .. coords.y .. coords.z

    QBCore.Functions.TriggerCallback('nmsh-sit:getPlace', function(occupied)
        if occupied then
            QBCore.Functions.Notify('Someone is already sitting here.', 'error')
        else
            local playerPed = PlayerPedId()
            lastPos, currentSitCoords = GetEntityCoords(playerPed), objectCoords

            TriggerServerEvent('nmsh-sit:takePlace', objectCoords)

            currentScenario = 'PROP_HUMAN_SEAT_BENCH'
            TaskStartScenarioAtPosition(playerPed, currentScenario, coords.x, coords.y, coords.z, coords.w, 0, true, false)

            Citizen.Wait(2500)
            if GetEntitySpeed(PlayerPedId()) > 0 then
                ClearPedTasks(PlayerPedId())
                TaskStartScenarioAtPosition(playerPed, currentScenario, coords.x, coords.y, coords.z, coords.w, 0, true, true)
            end

            sitting = true
        end
    end, objectCoords)
end
