
local QBCore = exports['qb-core']:GetCoreObject()
local inside = false
local currentHouse = nil
local closestHouse
local inRange
local lockpicking = false
local houseObj = {}
local POIOffsets = nil
local usingAdvanced = false
local requiredItemsShowed = false
local requiredItems = {}
local CurrentCops = 0
local openingDoor = false
local SucceededAttempts = 0
local NeededAttempts = 4

-- Functions

local function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job

    if PlayerJob.name == "police" then
      
    end
end)

local function openHouseAnim()
    loadAnimDict("anim@heists@keycard@")
    TaskPlayAnim( PlayerPedId(), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
    Wait(400)
    ClearPedTasks(PlayerPedId())
end

local function enterRobberyHouse(house, JobInfo)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
    openHouseAnim()
    Wait(250)
    local coords = { x = House.Houses[house]["coords"].x, y = House.Houses[house]["coords"].y, z = House.Houses[house]["coords"].z - House.MinZOffset}
    if House.Houses[house]["tier"] == 1 then
        data = exports['nmsh-interior']:CreateCaravanShell(coords)
	end
	if House.Houses[house]["tier"] == 2 then 
        data = exports['nmsh-interior']:CreateLesterShell(coords)
	end
	if House.Houses[house]["tier"] == 3 then
        data = exports['nmsh-interior']:CreateTrevorsShell(coords) 
    end
	if House.Houses[house]["tier"] == 4 then 
        data = exports['nmsh-interior']:CreateHouseRobbery(coords)
    end
	if House.Houses[house]["tier"] == 5 then 
        data = exports['nmsh-interior']:CreateFurniMotelModern(coords)
    end
	if House.Houses[house]["tier"] == 6 then
	data = exports['nmsh-interior']:CreateMichael(coords)
	end
    Wait(100)
    houseObj = data[1]
    POIOffsets = data[2]
    inside = true
    currentHouse = house
    Wait(500)
    TriggerEvent('nmsh-weathersync:client:DisableSync')
	if QBCore.Functions.GetPlayerData().job.name == "police"  then 
		QBCore.Functions.Notify("Be Careful. There may be someone here", "success") 
	else
		local chance = math.random(1,100)
		local weapchance = math.random(1,100)
		if chance <= House.pedspawnchance then 
			local current = House.Ped
			RequestModel(current)
			while not HasModelLoaded(current) do
				Wait(0)
			end
			homeowner = CreatePed(26, current, House.Houses[house]["ped"].x, House.Houses[house]["ped"].y,House.Houses[house]["ped"].z-1, 90.0, true, true)
			NetworkRegisterEntityAsNetworked(homeowner)
			networkID = NetworkGetNetworkIdFromEntity(homeowner)
			SetNetworkIdCanMigrate(networkID, true)
			SetNetworkIdExistsOnAllMachines(networkID, true)
			SetPedRandomComponentVariation(homeowner)
			SetPedRandomProps(homeowner)
			SetEntityAsMissionEntity(homeowner)
			SetEntityVisible(homeowner, true)
			SetPedRelationshipGroupHash(homeowner)
			SetPedAccuracy(homeowner)
			SetPedArmour(homeowner)
			SetPedCanSwitchWeapon(homeowner, true)
			SetPedFleeAttributes(homeowner, false)
			if weapchance <= House.weapononechance then
				GiveWeaponToPed(homeowner, House.Weaponone, 1, false, true)
				TaskCombatPed(homeowner, PlayerPedId(), 0, 16)
				SetPedCombatAttributes(homeowner, 46, true)
			else 
				GiveWeaponToPed(homeowner, House.Weapontwo, 1, false, true)
				TaskCombatPed(homeowner, PlayerPedId(), 0, 16)
				SetPedCombatAttributes(homeowner, 46, true)
			end 
			
		end
	end
	
end


local function leaveRobberyHouse(house)
    local ped = PlayerPedId()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
    openHouseAnim()
    Wait(250)
    DoScreenFadeOut(250)
    Wait(500)
    exports['nmsh-interior']:DespawnInterior(houseObj, function()
        TriggerEvent('nmsh-weathersync:client:EnableSync')
        Wait(250)
        DoScreenFadeIn(250)
        SetEntityCoords(ped, House.Houses[house]["coords"].x, House.Houses[house]["coords"].y, House.Houses[house]["coords"].z + 0.5)
        SetEntityHeading(ped, House.Houses[house]["coords"].h)
        inside = false
        currentHouse = nil
    end)
end

local function PoliceCall()
    local chance = 75
    if GetClockHours() >= 1 and GetClockHours() <= 6 then
        chance = 25
    end
    if math.random(1, 100) <= chance then
        exports['nmsh-dispatch']:HouseRobbery()
    end
end

local function lockpickFinish(success) 
	if success then
		TriggerServerEvent('nmsh-houserobbery:server:enterHouse', closestHouse)
		QBCore.Functions.Notify("It worked!", "success", 2500)
	else
		if usingAdvanced then
			local itemInfo = QBCore.Shared.Items["advancedlockpick"]
			if math.random(1, 100) < 20 then
				TriggerServerEvent("QBCore:Server:RemoveItem", "advancedlockpick", 1)
				TriggerEvent('inventory:client:ItemBox', itemInfo, "remove")
			end
		else
			local itemInfo = QBCore.Shared.Items["lockpick"]
			if math.random(1, 100) < 40 then
				TriggerServerEvent("QBCore:Server:RemoveItem", "advancedlockpick", 1)
				TriggerEvent('inventory:client:ItemBox', itemInfo, "remove")
			end
		end
		QBCore.Functions.Notify("It did not work..", "error", 2500)
	end
end


local function LockpickDoorAnim()
    openingDoor = true
    CreateThread(function()
        while true do
            if openingDoor then
                TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            else
                StopAnimTask(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
                break
            end
            Wait(1000)
        end
    end)
end

local function IsWearingHandshoes()
    local armIndex = GetPedDrawableVariation(PlayerPedId(), 3)
    local model = GetEntityModel(PlayerPedId())
    local retval = true
    if model == `mp_m_freemode_01` then
        if House.MaleNoGloves[armIndex] ~= nil and House.MaleNoGloves[armIndex] then
            retval = false
        end
    else
        if House.FemaleNoGloves[armIndex] ~= nil and House.FemaleNoGloves[armIndex] then
            retval = false
        end
    end
    return retval
end

local function searchCabin(cabin)
    local ped = PlayerPedId()
    local Skillbar = exports['nmsh-skillbar']:GetSkillbarObject()
    if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
        local pos = GetEntityCoords(PlayerPedId())
        TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
    end
    LockpickDoorAnim()
    TriggerServerEvent('nmsh-houserobbery:server:SetBusyState', cabin, currentHouse, true)
    FreezeEntityPosition(ped, true)
    IsLockpicking = true
    Skillbar.Start({
        duration = math.random(7500, 15000),
        pos = math.random(10, 30),
        width = math.random(10, 20),
    }, function()
        if SucceededAttempts + 1 >= NeededAttempts then
            openingDoor = false
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent('nmsh-houserobbery:server:searchCabin', cabin, currentHouse)
            House.Houses[currentHouse]["furniture"][cabin]["searched"] = true
            TriggerServerEvent('nmsh-houserobbery:server:SetBusyState', cabin, currentHouse, false)
            SucceededAttempts = 0
            FreezeEntityPosition(ped, false)
            SetTimeout(500, function()
                IsLockpicking = false
            end)
        else
            Skillbar.Repeat({
                duration = math.random(700, 1250),
                pos = math.random(10, 40),
                width = math.random(10, 13),
            })
            SucceededAttempts = SucceededAttempts + 1
        end
    end, function()
        openingDoor = false
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('nmsh-houserobbery:server:SetBusyState', cabin, currentHouse, false)
        QBCore.Functions.Notify("Process Canceled..", "error", 3500)
        SucceededAttempts = 0
        FreezeEntityPosition(ped, false)
        SetTimeout(500, function()
            IsLockpicking = false
        end)
    end)
end

-- Events

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('nmsh-houserobbery:server:GetHouseConfig', function(HouseConfig)
        House.Houses = HouseConfig
    end)
end)

RegisterNetEvent('nmsh-houserobbery:client:ResetHouseState', function(house)
    House.Houses[house]["opened"] = false
    for k, v in pairs(House.Houses[house]["furniture"]) do
        v["searched"] = false
    end
end)

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

RegisterNetEvent('nmsh-houserobbery:client:enterHouse', function(house)
    enterRobberyHouse(house)
end)

RegisterNetEvent('nmsh-houserobbery:client:setHouseState', function(house, state)
    House.Houses[house]["opened"] = state
end)

RegisterNetEvent('nmsh-houserobbery:client:setCabinState', function(house, cabin, state)
    House.Houses[house]["furniture"][cabin]["searched"] = state
end)

RegisterNetEvent('nmsh-houserobbery:client:SetBusyState', function(cabin, house, bool)
    House.Houses[house]["furniture"][cabin]["isBusy"] = bool
end)

RegisterNetEvent('lockpicks:UseLockpick', function(isAdvanced)
local hours = GetClockHours()
    if hours >= House.MinimumTime or hours <= House.MaximumTime then
        usingAdvanced = isAdvanced
        if usingAdvanced then
            if closestHouse ~= nil then
                if House.Houses[closestHouse]["tier"] == 1 or House.Houses[closestHouse]["tier"] == 2 or House.Houses[closestHouse]["tier"] == 3 or House.Houses[closestHouse]["tier"] == 4 then
                    if CurrentCops >= House.MinimumHouseRobberyPolice then
                        if not House.Houses[closestHouse]["opened"] then
                                PoliceCall()
                                TriggerEvent('nmsh-lockpick:client:openLockpick', lockpickFinish)
                                if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
                                local pos = GetEntityCoords(PlayerPedId())
                                TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
                                end
                        else
                            QBCore.Functions.Notify("The door is already open..", "error", 3500)
                        end
                    else
                        QBCore.Functions.Notify("Not enough Police..", "error", 3500)
                    end
                else
                QBCore.Functions.Notify("They Have A Better Security System Here", "error", 3500)    
                end
            end    
        end
    
    end    
end)

RegisterNetEvent('nmsh-houserobbery:client:househacking', function()
local hours = GetClockHours()
if hours >= House.MinimumTime or hours <= House.MaximumTime then
	if House.Houses[closestHouse]["tier"] == 5 then
		exports['nmsh-ui']:VarHack(function(success)
		if success then
			if closestHouse ~= nil then
				if CurrentCops >= House.MinimumHouseRobberyPolice then
					if not House.Houses[closestHouse]["opened"] then
							PoliceCall()
							TriggerServerEvent('nmsh-houserobbery:server:enterHouse', closestHouse)
							TriggerServerEvent('nmsh-houserobbery:server:removehousehacking')
							if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
							local pos = GetEntityCoords(PlayerPedId())
							TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
							end
					else
						QBCore.Functions.Notify("The door is already open..", "error", 3500)
					end
				else
					QBCore.Functions.Notify("Not enough Police..", "error", 3500)
				end
			end
		else
			if math.random(1,100) <= 15 then
				TriggerServerEvent('nmsh-houserobbery:server:removehousehacking')
			end
		end
		end, 3, 6)
	end
end	
end)

RegisterNetEvent('nmsh-houserobbery:client:mansionhacking', function()
local hours = GetClockHours()
if hours >= House.MinimumTime or hours <= House.MaximumTime then
	if House.Houses[closestHouse]["tier"] == 6 then
		exports['nmsh-ui']:Scrambler(function(success)
			if success then
				if closestHouse ~= nil then
					if CurrentCops >= House.MinimumHouseRobberyPolice then
						if not House.Houses[closestHouse]["opened"] then
								PoliceCall()
								TriggerServerEvent('nmsh-houserobbery:server:enterHouse', closestHouse)
								TriggerServerEvent('nmsh-houserobbery:server:removemansionhacking')
								if math.random(1, 100) <= 85 and not IsWearingHandshoes() then
								local pos = GetEntityCoords(PlayerPedId())
								TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
								end
						else
							QBCore.Functions.Notify("The door is already open..", "error", 3500)
						end
					else
						QBCore.Functions.Notify("Not enough Police..", "error", 3500)
					end
				end
			else
				if math.random(1,100) <= 15 then
					TriggerServerEvent('nmsh-houserobbery:server:removemansionhacking')
				end
			end
		end, "numeric", 20, 0)
	end
end	
end)
-- Threads

CreateThread(function()
    Wait(500)
    requiredItems = {
        [1] = {name = QBCore.Shared.Items["advancedlockpick"]["name"], image = QBCore.Shared.Items["advancedlockpick"]["image"]},
        [2] = {name = QBCore.Shared.Items["screwdriverset"]["name"], image = QBCore.Shared.Items["screwdriverset"]["image"]},
    }
	requiredItems2 = {
        [1] = {name = QBCore.Shared.Items["houselaptop"]["name"], image = QBCore.Shared.Items["houselaptop"]["image"]},
    }
	requiredItems3 = {
        [1] = {name = QBCore.Shared.Items["mansionlaptop"]["name"], image = QBCore.Shared.Items["mansionlaptop"]["image"]},
    }

    while true do
        inRange = false
        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)
        closestHouse = nil
        if QBCore ~= nil then
            local hours = GetClockHours()
             if hours >= House.MinimumTime or hours <= House.MaximumTime then
                if not inside then
                    for k, v in pairs(House.Houses) do
						if House.Houses[k]["tier"] == 1 or House.Houses[k]["tier"] == 2 or House.Houses[k]["tier"] == 3 or House.Houses[k]["tier"] == 4 then
							dist = #(PlayerPos - vector3(House.Houses[k]["coords"]["x"], House.Houses[k]["coords"]["y"], House.Houses[k]["coords"]["z"]))
							if dist <= 1.5 then
								closestHouse = k
								inRange = true
								if CurrentCops >= House.MinimumHouseRobberyPolice then
									if House.Houses[k]["opened"] then
										DrawText3Ds(House.Houses[k]["coords"]["x"], House.Houses[k]["coords"]["y"], House.Houses[k]["coords"]["z"], '~g~E~w~ - To Enter')
										if IsControlJustPressed(0, 38) then
											enterRobberyHouse(k)
										end
									else
										if House.ShowItems == true then
											if not requiredItemsShowed then
												requiredItemsShowed = true
												TriggerEvent('inventory:client:requiredItems', requiredItems, true)
											end
										end
									end
								end
							end
						elseif House.Houses[k]["tier"] == 5 then
						 dist = #(PlayerPos - vector3(House.Houses[k]["coords"]["x"], House.Houses[k]["coords"]["y"], House.Houses[k]["coords"]["z"]))
							if dist <= 1.5 then
								closestHouse = k
								inRange = true
								if CurrentCops >= House.MinimumHouseRobberyPolice then
									if House.Houses[k]["opened"] then
										DrawText3Ds(House.Houses[k]["coords"]["x"], House.Houses[k]["coords"]["y"], House.Houses[k]["coords"]["z"], '~g~E~w~ - To Enter')
										if IsControlJustPressed(0, 38) then
											enterRobberyHouse(k)
										end
									else
										if House.ShowItems == true then
											if not requiredItemsShowed then
												requiredItemsShowed = true
												TriggerEvent('inventory:client:requiredItems', requiredItems2, true)
											end
										end	
									end	
								end
							end
						elseif House.Houses[k]["tier"] == 6 then
						 dist = #(PlayerPos - vector3(House.Houses[k]["coords"]["x"], House.Houses[k]["coords"]["y"], House.Houses[k]["coords"]["z"]))
							if dist <= 1.5 then
								closestHouse = k
								inRange = true
								if CurrentCops >= House.MinimumHouseRobberyPolice then
									if House.Houses[k]["opened"] then
										DrawText3Ds(House.Houses[k]["coords"]["x"], House.Houses[k]["coords"]["y"], House.Houses[k]["coords"]["z"], '~g~E~w~ - To Enter')
										if IsControlJustPressed(0, 38) then
											enterRobberyHouse(k)
										end
									else
										if House.ShowItems == true then
											if not requiredItemsShowed then
												requiredItemsShowed = true
												TriggerEvent('inventory:client:requiredItems', requiredItems3, true)
											end
										end
									end
								end
							end
						end
                    end
                end
            end
            if inside then Wait(1000) end
            if not inRange then
                if requiredItemsShowed then
                    requiredItemsShowed = false
                    TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                end
                Wait(1000)
            end
        end
        Wait(5)
    end
end)

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        if inside then
            if #(pos - vector3(House.Houses[currentHouse]["coords"]["x"] + POIOffsets.exit.x, House.Houses[currentHouse]["coords"]["y"] + POIOffsets.exit.y, House.Houses[currentHouse]["coords"]["z"] - House.MinZOffset + POIOffsets.exit.z)) < 1.5 then-- 1.5
                DrawText3Ds(House.Houses[currentHouse]["coords"]["x"] + POIOffsets.exit.x, House.Houses[currentHouse]["coords"]["y"] + POIOffsets.exit.y, House.Houses[currentHouse]["coords"]["z"] - House.MinZOffset + POIOffsets.exit.z, '~g~E~w~ - To leave home')
                if IsControlJustPressed(0, 38) then
                    leaveRobberyHouse(currentHouse)
                end
            end
            for k, v in pairs(House.Houses[currentHouse]["furniture"]) do
                if #(pos - vector3(House.Houses[currentHouse]["coords"]["x"] + House.Houses[currentHouse]["furniture"][k]["coords"]["x"], House.Houses[currentHouse]["coords"]["y"] + House.Houses[currentHouse]["furniture"][k]["coords"]["y"], House.Houses[currentHouse]["coords"]["z"] + House.Houses[currentHouse]["furniture"][k]["coords"]["z"] - House.MinZOffset)) < 1 then 
                    if not House.Houses[currentHouse]["furniture"][k]["searched"] then
                        if not House.Houses[currentHouse]["furniture"][k]["isBusy"] then
                            DrawText3Ds(House.Houses[currentHouse]["coords"]["x"] + House.Houses[currentHouse]["furniture"][k]["coords"]["x"], House.Houses[currentHouse]["coords"]["y"] + House.Houses[currentHouse]["furniture"][k]["coords"]["y"], House.Houses[currentHouse]["coords"]["z"] + House.Houses[currentHouse]["furniture"][k]["coords"]["z"] - House.MinZOffset, '~g~E~w~ - '..House.Houses[currentHouse]["furniture"][k]["text"])
                            if not IsLockpicking then
                                if IsControlJustReleased(0, 38) then
                                    searchCabin(k)
                                end
                            end
                        else
                            DrawText3Ds(House.Houses[currentHouse]["coords"]["x"] + House.Houses[currentHouse]["furniture"][k]["coords"]["x"], House.Houses[currentHouse]["coords"]["y"] + House.Houses[currentHouse]["furniture"][k]["coords"]["y"], House.Houses[currentHouse]["coords"]["z"] + House.Houses[currentHouse]["furniture"][k]["coords"]["z"] - House.MinZOffset, 'Searching..')
                        end
                    else
                        DrawText3Ds(House.Houses[currentHouse]["coords"]["x"] + House.Houses[currentHouse]["furniture"][k]["coords"]["x"], House.Houses[currentHouse]["coords"]["y"] + House.Houses[currentHouse]["furniture"][k]["coords"]["y"], House.Houses[currentHouse]["coords"]["z"] + House.Houses[currentHouse]["furniture"][k]["coords"]["z"] - House.MinZOffset, 'Empty..')
                    end
                end
            end
        end
        if not inside then
            Wait(5000)
        end
        Wait(3)
    end
end)

-- Util Command (can be commented out - used for setting new spots in the config)

RegisterCommand('gethroffset', function()
    local coords = GetEntityCoords(PlayerPedId())
    local houseCoords = vector3(
        House.Houses[currentHouse]["coords"]["x"],
        House.Houses[currentHouse]["coords"]["y"],
        House.Houses[currentHouse]["coords"]["z"] - House.MinZOffset
    )
    if inside then
        local xdist = coords.x - houseCoords.x
        local ydist = coords.y - houseCoords.y
        local zdist = coords.z - houseCoords.z
        print('X: '..xdist)
        print('Y: '..ydist)
        print('Z: '..zdist)
    end
end) 

