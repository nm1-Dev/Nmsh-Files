local PlayerJob = {}
local onDuty = false
local currentGarage = 0
local currentHospital


-- Functions

local function IsArmoryWhitelist() -- being removed
    local retval = false

    if QBCore.Functions.GetPlayerData().job.type == 'leo' then
        retval = true
    end
    return retval
end

local function SetCarItemsInfo()
	local items = {}
	for _, item in pairs(Config.CarItems) do
		local itemInfo = QBCore.Shared.Items[item.name:lower()]
		items[item.slot] = {
			name = itemInfo["name"],
			amount = tonumber(item.amount),
			info = item.info,
			label = itemInfo["label"],
			description = itemInfo["description"] and itemInfo["description"] or "",
			weight = itemInfo["weight"],
			type = itemInfo["type"],
			unique = itemInfo["unique"],
			useable = itemInfo["useable"],
			image = itemInfo["image"],
			slot = item.slot,
		}
	end
	Config.CarItems = items
end


local function GetClosestPlayer()
    local closestPlayers = QBCore.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(PlayerPedId())

    for i = 1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = #(pos - coords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end

function TakeOutVehicle(vehicleInfo)
    local coords = Config.Locations["vehicle"][currentGarage]
    QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
        local veh = NetToVeh(netId)
        SetVehicleNumberPlateText(veh, Lang:t('info.amb_plate') .. tostring(math.random(1000, 9999)))
        SetEntityHeading(veh, coords.w)
        exports[Config.FuelScript]:SetFuel(veh, 100.0)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        if Config.VehicleSettings[vehicleInfo] ~= nil then
            QBCore.Shared.SetDefaultVehicleExtras(veh, Config.VehicleSettings[vehicleInfo].extras)
        end
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
    end, vehicleInfo, coords, true)
end

--[[function MenuGarage(currentSelection)
    --print(json.encode(currentSelection))
    local vehicleMenu = {
        {
            header = Lang:t('menu.garage_title'),
            isMenuHeader = true,
            icon = "fas fa-warehouse",
        }
    }

    local authorizedVehicles = Config.AuthorizedVehicles[QBCore.Functions.GetPlayerData().job.grade.level]
    for veh, label in pairs(authorizedVehicles) do
        vehicleMenu[#vehicleMenu+1] = {
            header = label,
            icon = "fa-solid fa-car",
            txt = "",
            params = {
                event = "ambulance:client:TakeOutVehicle",
                args = {
                    vehicle = veh,
                    currentSelection = currentSelection
                }
            }
        }
    end

    if IsArmoryWhitelist() then
        for veh, label in pairs(Config.WhitelistedVehicles) do
            vehicleMenu[#vehicleMenu+1] = {
                header = label,
                txt = "",
                params = {
                    event = "ambulance:client:TakeOutVehicle",
                    args = {
                        vehicle = veh,
                        currentSelection = currentSelection
                    }
                }
            }
        end
    end

    vehicleMenu[#vehicleMenu+1] = {
        header = Lang:t('menu.close'),
        txt = "",
        params = {
            event = "nmsh-menu:client:closeMenu"
        }

    }
    exports['nmsh-menu']:openMenu(vehicleMenu)
end]]

-- Events



--RegisterNetEvent('ambulance:client:TakeOutVehicle', function(data)
  --  local vehicle = data.vehicle
    --TakeOutVehicle(vehicle)
--end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    if PlayerJob.name == 'ambulance' then
        onDuty = PlayerJob.onduty
        if PlayerJob.onduty then
            TriggerServerEvent("hospital:server:AddDoctor", PlayerJob.name)
        else
            TriggerServerEvent("hospital:server:RemoveDoctor", PlayerJob.name)
        end
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    exports.spawnmanager:setAutoSpawn(false)
    local ped = PlayerPedId()
    local player = PlayerId()
    CreateThread(function()
        Wait(5000)
        SetEntityMaxHealth(ped, 200)
        SetEntityHealth(ped, 200)
        SetPlayerHealthRechargeMultiplier(player, 0.0)
        SetPlayerHealthRechargeLimit(player, 0.0)
    end)
    CreateThread(function()
        Wait(1000)
        QBCore.Functions.GetPlayerData(function(PlayerData)
            PlayerJob = PlayerData.job
            onDuty = PlayerData.job.onduty
            SetPedArmour(PlayerPedId(), PlayerData.metadata["armor"])
            if (not PlayerData.metadata["inlaststand"] and PlayerData.metadata["isdead"]) then
                deathTime = Laststand.ReviveInterval
                OnDeath()
                DeathTimer()
            elseif (PlayerData.metadata["inlaststand"] and not PlayerData.metadata["isdead"]) then
                SetLaststand(true)
            else
                TriggerServerEvent("hospital:server:SetDeathStatus", false)
                TriggerServerEvent("hospital:server:SetLaststandStatus", false)
            end
            if PlayerJob.name == 'ambulance' and onDuty then
                TriggerServerEvent("hospital:server:AddDoctor", PlayerJob.name)
            end
        end)
    end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    if PlayerJob.name == 'ambulance' and onDuty then
        TriggerServerEvent("hospital:server:RemoveDoctor", PlayerJob.name)
    end
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    if PlayerJob.name == 'ambulance' and duty ~= onDuty then
        if duty then
            TriggerServerEvent("hospital:server:AddDoctor", PlayerJob.name)
        else
            TriggerServerEvent("hospital:server:RemoveDoctor", PlayerJob.name)
        end
    end

    onDuty = duty
end)

function Status()
    if isStatusChecking then
        local statusMenu = {
            {
                header = Lang:t('menu.status'),
                isMenuHeader = true
            }
        }
        for _, v in pairs(statusChecks) do
            statusMenu[#statusMenu + 1] = {
                header = v.label,
                txt = "",
                params = {
                    event = "hospital:client:TreatWounds",
                }
            }
        end
        statusMenu[#statusMenu + 1] = {
            header = Lang:t('menu.close'),
            txt = "",
            params = {
                event = "nmsh-menu:client:closeMenu"
            }
        }
        exports['nmsh-menu']:openMenu(statusMenu)
    end
end

RegisterNetEvent('hospital:client:CheckStatus', function()
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 5.0 then
        local playerId = GetPlayerServerId(player)
        QBCore.Functions.TriggerCallback('hospital:GetPlayerStatus', function(result)
            if result then
                for k, v in pairs(result) do
                    if k ~= "BLEED" and k ~= "WEAPONWOUNDS" then
                        statusChecks[#statusChecks + 1] = { bone = Config.BoneIndexes[k],
                            label = v.label .. " (" .. Config.WoundStates[v.severity] .. ")" }
                    elseif result["WEAPONWOUNDS"] then
                        for _, v2 in pairs(result["WEAPONWOUNDS"]) do
                            TriggerEvent('chat:addMessage', {
                                color = { 255, 0, 0 },
                                multiline = false,
                                args = { Lang:t('info.status'), QBCore.Shared.Weapons[v2].damagereason }
                            })
                        end
                    elseif result["BLEED"] > 0 then
                        TriggerEvent('chat:addMessage', {
                            color = { 255, 0, 0 },
                            multiline = false,
                            args = { Lang:t('info.status'),
                                Lang:t('info.is_status', { status = Config.BleedingStates[v].label }) }
                        })
                    else
                        QBCore.Functions.Notify(Lang:t('success.healthy_player'), 'success')
                    end
                end
                isStatusChecking = true
                Status()
            end
        end, playerId)
    else
        QBCore.Functions.Notify(Lang:t('error.no_player'), 'error')
    end
end)

RegisterNetEvent('hospital:client:RevivePlayer', function()
    local hasItem = QBCore.Functions.HasItem('firstaid')
    if hasItem then
        local player, distance = GetClosestPlayer()
        if player ~= -1 and distance < 5.0 then
            local playerId = GetPlayerServerId(player)
            QBCore.Functions.Progressbar("hospital_revive", Lang:t('progress.revive'), 5000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = healAnimDict,
                anim = healAnim,
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), healAnimDict, "exit", 1.0)
                QBCore.Functions.Notify(Lang:t('success.revived'), 'success')
                TriggerServerEvent("hospital:server:RevivePlayer", playerId)
            end, function() -- Cancel
                StopAnimTask(PlayerPedId(), healAnimDict, "exit", 1.0)
                QBCore.Functions.Notify(Lang:t('error.canceled'), "error")
            end)
        else
            QBCore.Functions.Notify(Lang:t('error.no_player'), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t('error.no_firstaid'), "error")
    end
end)

RegisterNetEvent('hospital:client:TreatWounds', function()
    local hasItem = QBCore.Functions.HasItem('bandage')
    if hasItem then
        local player, distance = GetClosestPlayer()
        if player ~= -1 and distance < 5.0 then
            local playerId = GetPlayerServerId(player)
            QBCore.Functions.Progressbar("hospital_healwounds", Lang:t('progress.healing'), 5000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = healAnimDict,
                anim = healAnim,
                flags = 16,
            }, {}, {}, function() -- Done
                StopAnimTask(PlayerPedId(), healAnimDict, "exit", 1.0)
                QBCore.Functions.Notify(Lang:t('success.helped_player'), 'success')
                TriggerServerEvent("hospital:server:TreatWounds", playerId)
            end, function() -- Cancel
                StopAnimTask(PlayerPedId(), healAnimDict, "exit", 1.0)
                QBCore.Functions.Notify(Lang:t('error.canceled'), "error")
            end)
        else
            QBCore.Functions.Notify(Lang:t('error.no_player'), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t('error.no_bandage'), "error")
    end
end)

local check = false
local function EMSControls(variable)
    CreateThread(function()
        check = true
        while check do
            if IsControlJustPressed(0, 38) then
                exports['qb-core']:KeyPressed(38)
                if variable == "sign" then
                    TriggerEvent('EMSToggle:Duty')
                elseif variable == "stash" then
                    TriggerEvent('nmsh-ambulancejob:stash')
                elseif variable == "armory" then
                    TriggerEvent('nmsh-ambulancejob:armory')
                elseif variable == "storeheli" then
                    TriggerEvent('nmsh-ambulancejob:storeheli')
                elseif variable == "takeheli" then
                    TriggerEvent('nmsh-ambulancejob:pullheli')
                elseif variable == "roof" then
                    TriggerEvent('nmsh-ambulancejob:elevator_main')
                elseif variable == "main" then
                    TriggerEvent('nmsh-ambulancejob:elevator_roof')
                elseif variable == "basement" then
                    TriggerEvent('nmsh-ambulancejob:elevator_basement')
                end
            end
        end
    end)
end

RegisterNetEvent('nmsh-ambulancejob:stash', function()
    if onDuty then
        TriggerServerEvent("inventory:server:OpenInventory", "stash",
            "ambulancestash_" .. QBCore.Functions.GetPlayerData().citizenid)
        TriggerEvent("inventory:client:SetCurrentStash", "ambulancestash_" .. QBCore.Functions.GetPlayerData().citizenid)
    end
end)

RegisterNetEvent('nmsh-ambulancejob:armory', function()
    if onDuty then
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "hospital", Config.Items)
    end
end)

local CheckVehicle = false
local function EMSVehicle(k)
    CheckVehicle = true
    CreateThread(function()
        while CheckVehicle do
                exports['qb-core']:KeyPressed(38)
                CheckVehicle = false
                local ped = PlayerPedId()
                if IsPedInAnyVehicle(ped, false) then
                    QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(ped))
                else
                    local currentVehicle = k
                    --MenuGarage(currentVehicle)
                    currentGarage = currentVehicle
                end
            Wait(1)
        end
    end)
end

RegisterNetEvent("ambulance:client:VehicleMenuHeader", function(data)
    local Menu = {
        {
            header = Lang:t('menu.garage_title'),
            isMenuHeader = true,
            icon = "fas fa-warehouse",
        }
    }
    for k,v in pairs(Config.VehicleTable) do
        Menu[#Menu+1] = {
            header = k:upper(),
            txt = "Select a Heli to fly with",
            icon = "fa-solid fa-shield",
            params = {
                event = "ambulance:client:veh-category-selected",
                args = {
                    category = k,
                    location = data.spawn,
                }
            }
        }
    end
    exports['nmsh-menu']:openMenu(Menu)
end)
   
RegisterNetEvent("ambulance:client:VehicleMenuHeader", function(data)
    local Menu = {
        {
            header = Lang:t('menu.garage_title'),
            isMenuHeader = true,
            icon = "fas fa-warehouse",
        }
    }
    for k,v in pairs(Config.VehicleTable) do
        Menu[#Menu+1] = {
            header = k:upper(),
            txt = "Select a Heli to fly with",
            icon = "fa-solid fa-shield",
            params = {
                event = "ambulance:client:veh-category-selected",
                args = {
                    category = k,
                    location = data.spawn,
                }
            }
        }
    end
    exports['nmsh-menu']:openMenu(Menu)
end)

RegisterNetEvent("ambulance:client:TakeOutVehicle", function(data)
    local VehicleSpawnCoord = Config.Locations["vehicle"][data.currentSelection]["vehspawn"]
    local plate = "EMS".."-".. math.random(000, 999)

    QBCore.Functions.SpawnVehicle(data.model, function(veh)
        --print("callback")
        SetVehicleNumberPlateText(veh, plate)
        SetEntityHeading(veh, VehicleSpawnCoord.w)
        SetEntityAsMissionEntity(veh, true, true)
        SetCarItemsInfo()
        exports[Config.FuelScript]:SetFuel(veh, 100.0)
        TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(veh))
        TriggerServerEvent("inventory:server:addTrunkItems", QBCore.Functions.GetPlate(veh), Config.CarItems)
       -- TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
      -- TriggerServerEvent('nmsh-log:server:CreateLog', 'policegarage', 'PD Garage', 'pdgarage', "just take out a".. data.model .. "whit the plate of"..plate)
    end, vector3(VehicleSpawnCoord.x,VehicleSpawnCoord.y,VehicleSpawnCoord.z), true)
end)



local CheckHeli = false
local function EMSHelicopter(k)
    CheckHeli = true
    CreateThread(function()
        while CheckHeli do
            if IsControlJustPressed(0, 38) then
                exports['qb-core']:KeyPressed(38)
                CheckHeli = false
                local ped = PlayerPedId()
                if IsPedInAnyVehicle(ped, false) then
                    QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(ped))
                else
                    local currentHelictoper = k
                    local coords = Config.Locations["helicopter"][currentHelictoper]
                    QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
                        local veh = NetToVeh(netId)
                        SetVehicleNumberPlateText(veh, Lang:t('info.heli_plate') .. tostring(math.random(1000, 9999)))
                        SetEntityHeading(veh, coords.w)
                        SetVehicleLivery(veh, 1) -- Ambulance Livery
                        exports[Config.FuelScript]:SetFuel(veh, 100.0)
                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
                        SetVehicleEngineOn(veh, true, true)
                    end, Config.Helicopter, coords, true)
                end
            end
            Wait(1)
        end
    end)
end



RegisterNetEvent("ambulance:client:TakeOutCopter", function(data)
    local VehicleSpawnCoord = Config.Locations["helicopter"][data.currentSelection]["vehspawn"]
    local plate = "EMS".."-".."ZULU"

    QBCore.Functions.SpawnVehicle(data.model, function(veh)
        --print("callback")
        SetVehicleNumberPlateText(veh, plate)
        SetEntityHeading(veh, VehicleSpawnCoord.w)
        SetEntityAsMissionEntity(veh, true, true)
       -- SetCarItemsInfo()
        exports[Config.FuelScript]:SetFuel(veh, 100.0)
        SetVehicleLivery(veh, 1) -- Ambulance Livery
        TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(veh))
        --TriggerServerEvent("inventory:server:addTrunkItems", QBCore.Functions.GetPlate(veh), Config.CarItems)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
      -- TriggerServerEvent('nmsh-log:server:CreateLog', 'policegarage', 'PD Garage', 'pdgarage', "just take out a".. data.model .. "whit the plate of"..plate)
    end, vector3(VehicleSpawnCoord.x,VehicleSpawnCoord.y,VehicleSpawnCoord.z), true)
end)


RegisterNetEvent('nmsh-ambulancejob:elevator_basement', function()
    local ped = PlayerPedId()
    for k, _ in pairs(Config.Locations["main"]) do
        DoScreenFadeOut(500)
        while not IsScreenFadedOut() do
            Wait(10)
        end

        currentHospital = k

        local coords = Config.Locations["basement"][currentHospital]
        SetEntityCoords(ped, coords.x, coords.y, coords.z, 0, 0, 0, false)
        SetEntityHeading(ped, coords.w)

        Wait(100)

        DoScreenFadeIn(1000)
    end
end)

RegisterNetEvent('nmsh-ambulancejob:elevator_roof', function()
    local ped = PlayerPedId()
    for k, _ in pairs(Config.Locations["roof"]) do
        DoScreenFadeOut(500)
        while not IsScreenFadedOut() do
            Wait(10)
        end

        currentHospital = k

        local coords = Config.Locations["main"][currentHospital]
        SetEntityCoords(ped, coords.x, coords.y, coords.z, 0, 0, 0, false)
        SetEntityHeading(ped, coords.w)

        Wait(100)

        DoScreenFadeIn(1000)
    end
end)

RegisterNetEvent('ambulance:client:veh-category-selected', function(data)
    local newtable = data.category
    local result = Config.VehicleTable[newtable]
    if not result then return end
    local Menu = {
        {
            header = Lang:t('menu.garage_title'),
            isMenuHeader = true,
            icon = "fas fa-warehouse",
        }
    }
    for k,v in pairs(result) do
        Menu[#Menu+1] = {
            header = v:upper(),
            txt = "",
            icon = "fa-solid fa-shield",
            params = {
                event = "ambulance:client:TakeOutVehicle",
                args = {
                    currentSelection = data.location,
                    model = v,
                }
            }
        }
    end
    exports['nmsh-menu']:openMenu(Menu)
end)

RegisterNetEvent("ambulance:client:CopterMenu", function(data)
    local heli = Config.Helicopters
    local copterlist = {}
    copterlist[#copterlist + 1] = { -- create non-clickable header button
        isMenuHeader = true,
        header = 'Helicopter Garage',
        icon = 'fa-solid fa-shield'
    }
    for k,v in pairs(heli) do -- loop through our table
        copterlist[#copterlist + 1] = { -- insert data from our loop into the menu
            header = k,
            txt = 'Yeah they are definitely '..v,
            icon = 'fa-solid fa-helicopter',
            params = {
                event = 'ambulance:client:TakeOutCopter', -- event name
                args = {
                    currentSelection = data.spawn,
                    model = v,
                }
            }
        }
    end
    exports['nmsh-menu']:openMenu(copterlist) -- open our menu
end)

RegisterNetEvent('nmsh-ambulancejob:elevator_main', function()
    local ped = PlayerPedId()
    for k, _ in pairs(Config.Locations["main"]) do
        DoScreenFadeOut(500)
        while not IsScreenFadedOut() do
            Wait(10)
        end

        currentHospital = k

        local coords = Config.Locations["roof"][currentHospital]
        SetEntityCoords(ped, coords.x, coords.y, coords.z, 0, 0, 0, false)
        SetEntityHeading(ped, coords.w)

        Wait(100)

        DoScreenFadeIn(1000)
    end
end)

RegisterNetEvent('nmsh-ambulancejob:elevator_basement-main', function()
    local ped = PlayerPedId()
    for k, _ in pairs(Config.Locations["basement"]) do
        DoScreenFadeOut(500)
        while not IsScreenFadedOut() do
            Wait(10)
        end

        currentHospital = k

        local coords = Config.Locations["main"][currentHospital]
        SetEntityCoords(ped, coords.x, coords.y, coords.z, 0, 0, 0, false)
        SetEntityHeading(ped, coords.w)

        Wait(100)

        DoScreenFadeIn(1000)
    end
end)

RegisterNetEvent('EMSToggle:Duty', function()
    onDuty = not onDuty
    TriggerServerEvent("QBCore:ToggleDuty")
    --TriggerServerEvent("police:server:UpdateBlips")
end)


CreateThread(function()

    for k, v in pairs(Config.Locations["vehicle"]) do 

        QBCore.Functions.LoadModel(Config.GaragePed)
            while not HasModelLoaded(Config.GaragePed) do
                Wait(100)
            end
            GaragePed = CreatePed(0, Config.GaragePed, v.pedspawn.x, v.pedspawn.y, v.pedspawn.z-1.0, v.w, false, true)
            TaskStartScenarioInPlace(GaragePed, true)
            FreezeEntityPosition(GaragePed, true)
            SetEntityInvincible(GaragePed, true)
            SetBlockingOfNonTemporaryEvents(GaragePed, true)
            TaskStartScenarioInPlace(GaragePed, Config.GaragePedScenario, 0, true)
        
        exports['nmsh-target']:AddBoxZone("name", vector3(v.pedspawn.x, v.pedspawn.y, v.pedspawn.z-1), 1.0, 1.0, { -- The name has ambulance:client:TakeOutVehicle to be unique, the coords a vector3 as shown, the 1.5 is the length of the boxzone and the 1.6 is the width of the boxzone, the length and width have to be float values
        name = "vehicle" .. k,
        debugPoly = Config.Debug,
        heading = v.pedspawn.w,
        minZ = v.pedspawn.z - 1.0,
        maxZ = v.pedspawn.z + 1.0,
        }, {
            options = {
                {
                    icon = 'fa-solid fa-warehouse',
                    label = 'Open Garage',
                    type = "client",
                    event = "ambulance:client:VehicleMenuHeader",
                    job = "ambulance",
                    spawn = k

                },
                {
                    icon = 'fa-solid fa-car',
                    label = 'Store Vehicle',
                    type = "client",
                    event  = "police:client:returnveh",
                    job = "ambulance",
                }
            },
            distance = 4.0
        })
    end

    for k, v in pairs(Config.Locations["helicopter"]) do
            QBCore.Functions.LoadModel(Config.HeliPed)
                while not HasModelLoaded(Config.HeliPed) do
                    Wait(100)
                end
                heliped = CreatePed(0, Config.HeliPed, v.pedspawn.x, v.pedspawn.y, v.pedspawn.z-1.0, v.pedspawn.w, false, true)
                TaskStartScenarioInPlace(heliped, true)
                FreezeEntityPosition(heliped, true)
                SetEntityInvincible(heliped, true)
                SetBlockingOfNonTemporaryEvents(heliped, true)
                TaskStartScenarioInPlace(heliped, Config.HeliPedScenario, 0, true)
            
            exports['nmsh-target']:AddBoxZone("heli" .. k, vector3(v.pedspawn.x, v.pedspawn.y, v.pedspawn.z-1), 1.0, 1.0, { 
            name = "heli" .. k,
            debugPoly = Config.Debug,
            heading = v.pedspawn.w,
            minZ = v.pedspawn.z - 1.0,
            maxZ = v.pedspawn.z + 1.0,
        }, {
            options = {
                {
                    icon = 'fa-solid fa-helicopter',
                    label = 'Open Helicopter Hangar',
                    type = "client",
                    event = "ambulance:client:CopterMenu",
                    job = "ambulance",
                    spawn = k
    
                },
                {
                    icon = 'fa-solid fa-car',
                    label = 'Store Vehicle',
                    type = "client",
                    event  = "police:client:returnveh",
                    job = "ambulance",
                }
            },
            distance = 4.0
        })
        
    end
end)

-- Convar turns into a boolean
if Config.UseTarget then
    CreateThread(function()
        for k, v in pairs(Config.Locations["duty"]) do
            QBCore.Functions.LoadModel(Config.DutyPed)
            while not HasModelLoaded(Config.DutyPed) do
                Wait(100)
            end
            dutyPed = CreatePed(0, Config.DutyPed, v.x, v.y, v.z-1.5, v.w, false, true)
            TaskStartScenarioInPlace(dutyPed, true)
            FreezeEntityPosition(dutyPed, true)
            SetEntityInvincible(dutyPed, true)
            SetBlockingOfNonTemporaryEvents(dutyPed, true)
            TaskStartScenarioInPlace(dutyPed, Config.DutyPedScenario, 0, true)


            exports['nmsh-target']:AddBoxZone("emsDuty".. k, vector3(v.x, v.y, v.z-1.0), 1.0, 1.0, { -- The name has to be unique, the coords a vector3 as shown, the 1.5 is the length of the boxzone and the 1.6 is the width of the boxzone, the length and width have to be float values
            name = "emsDuty".. k, -- This is the name of the zone recognized by PolyZone, this has to be unique so it doesn't mess up with other zones
            heading = v.w, -- The heading of the boxzone, this has to be a float value
            debugPoly = Config.Debug, -- This is for enabling/disabling the drawing of the box, it accepts only a boolean value (true or false), when true it will draw the polyzone in green
            minZ = v.z -1.0, -- This is the bottom of the boxzone, this can be different from the Z value in the coords, this has to be a float value
            maxZ = v.z +1.0, -- This is the top of the boxzone, this can be different from the Z value in the coords, this has to be a float value
          }, {
            options = { 
              { 
              type = "client",
              event = "EMSToggle:Duty",
              icon = "fa fa-clipboard",
              label = "Sign In/Off duty",
              job = "ambulance"
            }
           },
             distance = 1.2,
            })
            
        end
        for k, v in pairs(Config.Locations["stash"]) do
            exports['nmsh-target']:AddBoxZone("stash" .. k, vector3(v.x, v.y, v.z-1), 1, 1, {
                name = "stash" .. k,
                debugPoly = Config.Debug,
                heading = -20,
                minZ = v.z - 2,
                maxZ = v.z + 2,
            }, {
                options = {
                    {
                        type = "client",
                        event = "nmsh-ambulancejob:stash",
                        icon = "fa fa-hand",
                        label = "Open Stash",
                        job = "ambulance",
                    }
                },
                distance = 2.0
            })
        end
        for k, v in pairs(Config.Locations["armory"]) do
            QBCore.Functions.LoadModel(Config.ArmoryPed)
            while not HasModelLoaded(Config.ArmoryPed) do
                Wait(100)
            end
            ArmoryPed = CreatePed(0, Config.ArmoryPed, v.x, v.y, v.z-1.0, v.w, false, true)
            TaskStartScenarioInPlace(ArmoryPed, true)
            FreezeEntityPosition(ArmoryPed, true)
            SetEntityInvincible(ArmoryPed, true)
            SetBlockingOfNonTemporaryEvents(ArmoryPed, true)
            TaskStartScenarioInPlace(ArmoryPed, Config.ArmoryPedScenario, 0, true)

            exports['nmsh-target']:AddBoxZone("armory" .. k, vector3(v.x, v.y, v.z-1), 1, 1, {
                name = "armory" .. k,
                debugPoly = Config.Debug,
                heading = v.w,
                minZ = v.z - 1.0,
                maxZ = v.z + 1.0,
            }, {
                options = {
                    {
                        type = "client",
                        event = "nmsh-ambulancejob:armory",
                        icon = "fa fa-hand",
                        label = "Open Armory",
                        job = "ambulance"
                    }
                },
                distance = 1.5
            })
        end
        for k, v in pairs(Config.Locations["roof"]) do
            exports['nmsh-target']:AddBoxZone("roof" .. k, vector3(v.x, v.y, v.z), 2, 2, {
                name = "roof" .. k,
                debugPoly = Config.Debug,
                heading = -20,
                minZ = v.z - 2,
                maxZ = v.z + 2,
            }, {
                options = {
                    {
                        type = "client",
                        event = "nmsh-ambulancejob:elevator_roof",
                        icon = "fas fa-hand-point-up",
                        label = "Take Elevator",
                        job = "ambulance"
                    },
                },
                distance = 8
            })
        end
        for k, v in pairs(Config.Locations["main"]) do
            exports['nmsh-target']:AddBoxZone("main" .. k, vector3(v.x, v.y, v.z), 1.5, 1.5, {
                name = "main" .. k,
                debugPoly = Config.Debug,
                heading = -20,
                minZ = v.z - 2,
                maxZ = v.z + 2,
            }, {
                options = {
                    {
                        type = "client",
                        event = "nmsh-ambulancejob:elevator_main",
                        icon = "fas fa-hand-point-up",
                        label = "Take Elevator Up",
                        job = "ambulance"
                    },
                    {
                        type = "client",
                        event = "nmsh-ambulancejob:elevator_basement",
                        icon = "fas fa-hand-point-down",
                        label = "Take Elevator Down",
                        job = "ambulance"
                    }
                },
                distance = 8
            })
        end
        for k, v in pairs(Config.Locations["basement"]) do
            exports['nmsh-target']:AddBoxZone("basement" .. k, vector3(v.x, v.y, v.z), 1.5, 1.5, {
                name = "basement" .. k,
                debugPoly = Config.Debug,
                heading = -20,
                minZ = v.z - 2,
                maxZ = v.z + 2,
            }, {
                options = {
                    {
                        type = "client",
                        event = "nmsh-ambulancejob:elevator_basement-main",
                        icon = "fas fa-hand-point-up",
                        label = "Take Elevator Up",
                        job = "ambulance"
                    },
                },
                distance = 8
            })
        end
    end)
else
    CreateThread(function()
        local signPoly = {}
        for k, v in pairs(Config.Locations["duty"]) do
            signPoly[#signPoly + 1] = BoxZone:Create(vector3(vector3(v.x, v.y, v.z)), 1.5, 1, {
                name = "sign" .. k,
                debugPoly = Config.Debug,
                heading = -20,
                minZ = v.z - 2,
                maxZ = v.z + 2,
            })
        end

        local signCombo = ComboZone:Create(signPoly, { name = "signcombo", debugPoly = false })
        signCombo:onPlayerInOut(function(isPointInside)
            if isPointInside and PlayerJob.name == "ambulance" then
                if not onDuty then
                    exports['qb-core']:DrawText(Lang:t('text.onduty_button'), 'left')
                    EMSControls("sign")
                else
                    exports['qb-core']:DrawText(Lang:t('text.offduty_button'), 'left')
                    EMSControls("sign")
                end
            else
                check = false
                exports['qb-core']:HideText()
            end
        end)

        local stashPoly = {}
        for k, v in pairs(Config.Locations["stash"]) do
            stashPoly[#stashPoly + 1] = BoxZone:Create(vector3(vector3(v.x, v.y, v.z)), 1, 1, {
                name = "stash" .. k,
                debugPoly = Config.Debug,
                heading = -20,
                minZ = v.z - 2,
                maxZ = v.z + 2,
            })
        end

        local stashCombo = ComboZone:Create(stashPoly, { name = "stashCombo", debugPoly = false })
        stashCombo:onPlayerInOut(function(isPointInside)
            if isPointInside and PlayerJob.name == "ambulance" then
                if onDuty then
                    exports['qb-core']:DrawText(Lang:t('text.pstash_button'), 'left')
                    EMSControls("stash")
                end
            else
                check = false
                exports['qb-core']:HideText()
            end
        end)

        local armoryPoly = {}
        for k, v in pairs(Config.Locations["armory"]) do
            armoryPoly[#armoryPoly + 1] = BoxZone:Create(vector3(vector3(v.x, v.y, v.z)), 1, 1, {
                name = "armory" .. k,
                debugPoly = Config.Debug,
                heading = 70,
                minZ = v.z - 2,
                maxZ = v.z + 2,
            })
        end

        local armoryCombo = ComboZone:Create(armoryPoly, { name = "armoryCombo", debugPoly = false })
        armoryCombo:onPlayerInOut(function(isPointInside)
            if isPointInside and PlayerJob.name == "ambulance" then
                if onDuty then
                    exports['qb-core']:DrawText(Lang:t('text.armory_button'), 'left')
                    EMSControls("armory")
                end
            else
                check = false
                exports['qb-core']:HideText()
            end
        end)

        local roofPoly = {}
        for k, v in pairs(Config.Locations["roof"]) do
            roofPoly[#roofPoly + 1] = BoxZone:Create(vector3(vector3(v.x, v.y, v.z)), 2, 2, {
                name = "roof" .. k,
                debugPoly = Config.Debug,
                heading = 70,
                minZ = v.z - 2,
                maxZ = v.z + 2,
            })
        end

        local roofCombo = ComboZone:Create(roofPoly, { name = "roofCombo", debugPoly = false })
        roofCombo:onPlayerInOut(function(isPointInside)
            if isPointInside and PlayerJob.name == "ambulance" then
                if onDuty then
                    exports['qb-core']:DrawText(Lang:t('text.elevator_main'), 'left')
                    EMSControls("main")
                else
                    exports['qb-core']:DrawText(Lang:t('error.not_ems'), 'left')
                end
            else
                check = false
                exports['qb-core']:HideText()
            end
        end)

        local mainPoly = {}
        for k, v in pairs(Config.Locations["main"]) do
            mainPoly[#mainPoly + 1] = BoxZone:Create(vector3(vector3(v.x, v.y, v.z)), 1.5, 1.5, {
                name = "main" .. k,
                debugPoly = Config.Debug,
                heading = 70,
                minZ = v.z - 2,
                maxZ = v.z + 2,
            })
        end

        local mainCombo = ComboZone:Create(mainPoly, { name = "mainPoly", debugPoly = false })
        mainCombo:onPlayerInOut(function(isPointInside)
            if isPointInside and PlayerJob.name == "ambulance" then
                if onDuty then
                    exports['qb-core']:DrawText(Lang:t('text.elevator_roof'), 'left')
                    EMSControls("roof")
                else
                    exports['qb-core']:DrawText(Lang:t('error.not_ems'), 'left')
                end
            else
                check = false
                exports['qb-core']:HideText()
            end
        end)
    end)
end
