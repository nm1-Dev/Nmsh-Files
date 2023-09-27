if Config.Framework == "qb" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == "oldqb" then 
    QBCore = nil
end


local rodObj = nil
local first = true
local firstLevelCheck = false
local tutulanBalik = 0
local oltaSeviyesi = 0
currentXP = 0
local currentLevel = 1
local takeRewardsSpamProtect = 0
local menuOpenSpamProtection = 0
local fullName = ""

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	PlayerData = QBCore.Functions.GetPlayerData()
    Wait(5000)
    SendNUIMessage({
		type = 'setJS',
		tasks = Config.Tasks,
		customize = Config.Customize,
        levelReq = Config.Settings["needxpforlevelup"],
        upgradeRodPrices = Config.upgradeRodPrices,
        buyMarketItems = Config.buyMarketItems,
	})	
end)

if Config.Settings.canOpenWithCommand then 
    RegisterCommand(Config.Settings.menuOpenCommand, function()
        openMenu()
    end)
end

Citizen.CreateThread(function()
    if Config.Framework == "oldqb" then 
        while QBCore == nil do
            TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            Citizen.Wait(200)
        end
    elseif Config.Framework == "qb" then
		while QBCore == nil do
            Citizen.Wait(200)
        end
    end
    Wait(10000)
	PlayerData = QBCore.Functions.GetPlayerData()
	SendNUIMessage({
		type = 'setJS',
		tasks = Config.Tasks,
		customize = Config.Customize,
        levelReq = Config.Settings["needxpforlevelup"],
        upgradeRodPrices = Config.upgradeRodPrices,
        buyMarketItems = Config.buyMarketItems,
	})	

    for k, v in pairs(Config.upgradeRodArea) do 
        RequestModel(v.pedHash)
        while not HasModelLoaded(v.pedHash) do
            Wait(1)
        end
        local ped = CreatePed(v.pedName, v.pedHash, v.pedCoord.x, v.pedCoord.y, v.pedCoord.z, v.h + 0.0, false, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)

        if v.blipSettings.blip then 
            local blip = AddBlipForCoord(v.pedCoord)
            SetBlipSprite(blip, v.blipSettings.blipIcon)
            SetBlipDisplay(blip, 2)
            SetBlipScale(blip, 0.75)
            SetBlipColour(blip, v.blipSettings.blipColour)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.blipSettings.blipName)
            EndTextCommandSetBlipName(blip)
        end
    end

    for k, v in pairs(Config.marketArea) do 
        RequestModel(v.pedHash)
        while not HasModelLoaded(v.pedHash) do
            Wait(1)
        end
        local ped = CreatePed(v.pedName, v.pedHash, v.pedCoord.x, v.pedCoord.y, v.pedCoord.z, v.h + 0.0, false, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)

        if v.blipSettings.blip then 
            local blip = AddBlipForCoord(v.pedCoord)
            SetBlipSprite(blip, v.blipSettings.blipIcon)
            SetBlipDisplay(blip, 2)
            SetBlipScale(blip, 0.75)
            SetBlipColour(blip, v.blipSettings.blipColour)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.blipSettings.blipName)
            EndTextCommandSetBlipName(blip)
        end
    end

    for k, v in pairs(Config.fishMenuArea) do 
        RequestModel(v.pedHash)
        while not HasModelLoaded(v.pedHash) do
            Wait(1)
        end
        local ped = CreatePed(v.pedName, v.pedHash, v.pedCoord.x, v.pedCoord.y, v.pedCoord.z, v.h + 0.0, false, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)

        if v.blipSettings.blip then 
            local blip = AddBlipForCoord(v.pedCoord)
            SetBlipSprite(blip, v.blipSettings.blipIcon)
            SetBlipDisplay(blip, 2)
            SetBlipScale(blip, 0.75)
            SetBlipColour(blip, v.blipSettings.blipColour)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.blipSettings.blipName)
            EndTextCommandSetBlipName(blip)
        end
    end

    for k, v in pairs(Config.Zones) do 
        if v.blipSettings.blip then 
            local blip = AddBlipForCoord(v.coords)
            SetBlipSprite(blip, v.blipSettings.blipIcon)
            SetBlipDisplay(blip, 2)
            SetBlipScale(blip, 0.75)
            SetBlipColour(blip, v.blipSettings.blipColour)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.blipSettings.blipName)
            EndTextCommandSetBlipName(blip)
            if v.blipSettings.blipAlpha then
                blipDaire = AddBlipForRadius(v.coords, v.radius+0.0)
                SetBlipSprite(blipDaire, 9)
                SetBlipColour(blipDaire, v.blipSettings.blipAlphaColour)
                SetBlipAlpha(blipDaire, 80)
            end
        end
    end
end)

local performansCd = 1000
Citizen.CreateThread(function()
    while true do
        local pos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.fishMenuArea) do 
            if #(v.pedCoord - pos) < 3 then 
                performansCd = 1
                DrawText3D(v.pedCoord.x, v.pedCoord.y, v.pedCoord.z+2, v.drawText)
                if #(v.pedCoord - pos) < 2 then 
                    if IsControlJustReleased(0, 38) then 
                        openMenu()
                    end
                end
            end
        end

        for k, v in pairs(Config.upgradeRodArea) do 
            if #(v.pedCoord - pos) < 3 then 
                performansCd = 1
                DrawText3D(v.pedCoord.x, v.pedCoord.y, v.pedCoord.z+2, v.drawText)
                if #(v.pedCoord - pos) < 2 then 
                    if IsControlJustReleased(0, 38) then 
                        SetNuiFocus(true,true)
                        SendNUIMessage({
                            type = 'openUpgradeUi',
                            customize = Config.Customize,
                            levelReq = Config.Settings["needxpforlevelup"],
                            upgradeRodPrices = Config.upgradeRodPrices,
                            buyMarketItems = Config.buyMarketItems,
                        })
                    end
                end
            end
        end

        for k, v in pairs(Config.marketArea) do 
            if #(v.pedCoord - pos) < 3 then 
                performansCd = 1
                DrawText3D(v.pedCoord.x, v.pedCoord.y, v.pedCoord.z+2, v.drawText)
                if #(v.pedCoord - pos) < 2 then 
                    if IsControlJustReleased(0, 38) then 
                        SetNuiFocus(true,true)
                        if first then 
                            QBCore.Functions.TriggerCallback("ak4y-advancedFishing:getPlayerDetails", function(result)
                                first = false
                                local firstName = result.charInfo.firstname ~= nil and result.charInfo.firstname or ""
                                local lastName = result.charInfo.lastname ~= nil and result.charInfo.lastname or ""
                                fullName = firstName..' '..lastName
                                SendNUIMessage({
                                    type = 'openMarketUiFirst',
                                    userDetails = result.resultData,
                                    tasks = Config.Tasks,
                                    fishes = Config.Fishes,
                                    fullName = fullName,
                                    sellMenu = Config.sellMenuItems,
                                    customize = Config.Customize,
                                    levelReq = Config.Settings["needxpforlevelup"],
                                    upgradeRodPrices = Config.upgradeRodPrices,
                                    buyMarketItems = Config.buyMarketItems,
                                })
                            end)
                        else
                            SendNUIMessage({
                                type = 'openMarketUi',
                                fishes = Config.Fishes,
                                fullName = fullName,
                                sellMenu = Config.sellMenuItems,
                                customize = Config.Customize,
                                levelReq = Config.Settings["needxpforlevelup"],
                                upgradeRodPrices = Config.upgradeRodPrices,
                                buyMarketItems = Config.buyMarketItems,
                            })
                        end
                    end
                end
            end
        end
        Citizen.Wait(performansCd)
    end
end)

function openMenu()
    if menuOpenSpamProtection < GetGameTimer() then 
		menuOpenSpamProtection = menuOpenSpamProtection + 1000
		QBCore.Functions.TriggerCallback("ak4y-advancedFishing:getPlayerDetails", function(result)
			SetNuiFocus(true,true)
			if first then 
				first = false
                local firstName = result.charInfo.firstname ~= nil and result.charInfo.firstname or ""
                local lastName = result.charInfo.lastname ~= nil and result.charInfo.lastname or ""
                fullName = firstName..' '..lastName
				SendNUIMessage({
					type = 'openUiFirst',
					userDetails = result.resultData,
                    fishes = Config.Fishes,
					tasks = Config.Tasks,
                    sellMenu = Config.sellMenuItems,
                    customize = Config.Customize,
                    levelReq = Config.Settings["needxpforlevelup"],
                    upgradeRodPrices = Config.upgradeRodPrices,
                    buyMarketItems = Config.buyMarketItems,
                    
				})	
                if not firstLevelCheck then 
                    firstLevelCheck = true
                    currentXP = result.resultData.currentXP
                    getLevel()
                end
			else
				SendNUIMessage({
					type = 'openUi',
					userDetails = result.resultData,
                    fishes = Config.Fishes,
					tasks = Config.Tasks,
                    customize = Config.Customize,
                    levelReq = Config.Settings["needxpforlevelup"],
                    upgradeRodPrices = Config.upgradeRodPrices,
                    buyMarketItems = Config.buyMarketItems,
				})	
			end
		end)
	end
end

getLevel = function()
    local neededEXP = Config.Settings["needxpforlevelup"]
    if (currentXP >= neededEXP) then
        currentLevel = currentLevel + math.floor(currentXP / neededEXP);
        currentXP = currentXP % neededEXP;
    end
end

RegisterNUICallback('closeMenu', function(data, cb)
	SetNuiFocus(false, false)
end)

RegisterNUICallback('takeRewards', function(data, cb)
	if takeRewardsSpamProtect < GetGameTimer() then 
		takeRewardsSpamProtect = GetGameTimer() + 1000
		QBCore.Functions.TriggerCallback("ak4y-advancedFishing:rewards", function(result)
			cb(result)
            if result then 
                addXP(tonumber(data.xp))
            end
		end, data)
    else
        cb(false)
	end
end)

local buyItemSpamProtectx = 0
RegisterNUICallback('buyItem', function(data, cb)
    if buyItemSpamProtectx < GetGameTimer() then 
		buyItemSpamProtectx = GetGameTimer() + 500
        QBCore.Functions.TriggerCallback("ak4y-advancedFishing:buyItem", function(result)
            cb(result)
        end, data)
    end
end)

local sellItemSpamProtectx = 0
RegisterNUICallback('sellItem', function(data, cb)
    if sellItemSpamProtectx < GetGameTimer() then 
		sellItemSpamProtectx = GetGameTimer() + 500

        QBCore.Functions.TriggerCallback("ak4y-advancedFishing:sellItem", function(result)
            cb(result)
        end, data)

    end
end)

local upgradeSpamProtect = 0
RegisterNUICallback('upgradeRod', function(data, cb)
	if upgradeSpamProtect < GetGameTimer() then 
		upgradeSpamProtect = GetGameTimer() + 500
		QBCore.Functions.TriggerCallback("ak4y-advancedFishing:upgradeRod", function(result)
			cb(result)
		end, data)
	end
end)

addXP = function(xp)
	QBCore.Functions.TriggerCallback("ak4y-advancedFishing:addXP", function(result)
		if result then 
            currentXP = currentXP + xp
			SendNUIMessage({
				type = 'updateXP',
				amount = tonumber(xp)
			})	
		end
	end, xp)
end

local fishing, isDead, pressKey, pressKeyNow, catching, busy = false, false, false, false, false, false
local keySelect, key, bait = "Aşağı Ok", "", "none"

RegisterNetEvent('ak4y-advancedFishing:start')
AddEventHandler('ak4y-advancedFishing:start', function(rodLevel)
    if not fishing then

        local playerPed = PlayerPedId()
            if not IsPedInAnyVehicle(playerPed) and not IsPedSwimming(playerPed) then
                local pos = GetEntityCoords(playerPed)
                zoneData = nil

                for k, v in pairs(Config.Zones) do 
                    if #(v.coords - pos) < v.radius then 
                        zoneData = v
                        break
                    end
                end

                if zoneData then
                    SendNUIMessage({type = "fishing", state = true})
                    if not firstLevelCheck then 
                        QBCore.Functions.TriggerCallback("ak4y-advancedFishing:getPlayerDetails", function(result)
                            firstLevelCheck = true
                            currentXP = result.resultData.currentXP
                            getLevel()
                        end)
                    end
                    RequestAnimDict('amb@world_human_stand_fishing@idle_a') 
                    while not HasAnimDictLoaded('amb@world_human_stand_fishing@idle_a') do 
                        Citizen.Wait(1) 
                    end
                    oltaSeviyesi = rodLevel
                    fishing = true
                    rodObj = AttachEntityToPed('prop_fishing_rod_01',60309, 0,0,0, 0,0,0)
                    -- TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_STAND_FISHING", 0, true)
                    TaskPlayAnim(PlayerPedId(), 'amb@world_human_stand_fishing@idle_a', 'idle_b', 8.0, 8.0, -1, 1, 1, 0, 0, 0)
                    FreezeEntityPosition(playerPed, true)
                    bait = "none"
                    SendNUIMessage({type = "setBait", bait = "none"})
                    -- SendNUIMessage({action = "open", bait = bait})
                else
                    QBCore.Functions.Notify(Config.Language.youCantFishHere)
                end
            else
                QBCore.Functions.Notify(Config.Language.somethingStoppingFish)
            end
    end
end)

function AttachEntityToPed(prop,bone_ID,x,y,z,RotX,RotY,RotZ)
	BoneID = GetPedBoneIndex(PlayerPedId(), bone_ID)
	obj = CreateObject(GetHashKey(prop),  1729.73,  6403.90,  34.56,  true,  true,  true)
	vX,vY,vZ = table.unpack(GetEntityCoords(PlayerPedId()))
	xRot, yRot, zRot = table.unpack(GetEntityRotation(PlayerPedId(),2))
	AttachEntityToEntity(obj,  PlayerPedId(),  BoneID, x,y,z, RotX,RotY,RotZ,  false, false, false, false, 2, true)
	return obj
end

Citizen.CreateThread(function()
    while true do
        local time = 1000
        if fishing then
            if not pressKey then
                pressKey = true
                time = 1
                Citizen.Wait(math.random(10000, 20000))
                catching = false
                if fishing then
                    QBCore.Functions.Notify(Config.Language.movementOnRod)
                    Citizen.Wait(1000)
                    SetNuiFocus(true, false)
                    SendNUIMessage({
                        type = 'startGame',
                    })
                end
            end
        end
        Citizen.Wait(time)
    end
end)

Citizen.CreateThread(function()
    while true do
        local time = 1000
        if fishing then
            time = 1
            if IsControlJustReleased(0, 73) or IsControlJustReleased(0, 178) then -- DEL, X
                fishingStop(false)
            end
            if IsEntityInWater(playerPed) or GetEntitySpeed(playerPed) > 3 then
                fishingStop(false)
            end
        end
        Citizen.Wait(time)
    end
end)

function fishingStop(bool)
    if fishing then
        key = ""
        pressKey = false
        pressKeyNow = false
        if bool then
            QBCore.Functions.Notify(Config.Language.missedFish, "error")
            if math.random(1,2) == 1 and bait ~= "none" then
                bait = "none"
                SendNUIMessage({type = "setBait", bait = "none"})
                QBCore.Functions.Notify(Config.Language.noLeftBait, "error")
            end
        else
            SendNUIMessage({type = "fishing", state = false})
            SetNuiFocus(false, false)
            SendNUIMessage({
                type = 'stopGame',
            })
            local playerPed = PlayerPedId()
            fishing = false
            QBCore.Functions.Notify(Config.Language.fishingHBStopped, "error")
            ClearPedTasksImmediately(PlayerPedId())
            ClearPedSecondaryTask(PlayerPedId())
            DeleteEntity(rodObj)
            DeleteObject(rodObj)
            FreezeEntityPosition(playerPed, false)
            -- SendNUIMessage({action = "close"})
        end
    end
end

local successSpam = 0
RegisterNUICallback('successGame', function(data, cb)
    if successSpam < GetGameTimer() then 
        successSpam = GetGameTimer() + 1000
        key = ""
        catching = true
        pressKey = false
        pressKeyNow = false
        local random = 95
        local rod = false
        tutulanBalik = tutulanBalik + 1
        if tutulanBalik >= Config.Settings.addxpafterXcatch then
            local kazanilanXP = math.random(Config.Settings.addXP.min, Config.Settings.addXP.max)
            QBCore.Functions.Notify("After "..tutulanBalik.." successful catching you get "..kazanilanXP.."XP!")
            addXP(kazanilanXP)
            tutulanBalik = 0
        end
        getLevel()
        Wait(5)
        local myChance = math.random(1,100)
        local trashChange = zoneData.trashChance
        local randomItem = nil
        local tolerance = 20

        if bait == "none" then 
            trashChange = trashChange + Config.Settings.addTrashWithoutBait
        end

        if myChance < trashChange then -- ? TASH ITEM GIVE
            local randomItemChance = math.random(1, #(zoneData.items.trashItems))
            randomItem = zoneData.items.trashItems[randomItemChance]
        else -- ? NOT TRASH
            local rareChance = math.random(1,100)
            if rareChance < zoneData.rareChance then -- ? RARE ITEM GIVE 
                local myTolerance = 0
                while randomItem == nil do 
                    local randomItemChance = math.random(1, #(zoneData.items.rare.rodLevel[oltaSeviyesi]))
                    local selectedItem = zoneData.items.rare.rodLevel[oltaSeviyesi][randomItemChance]
                    if Config.FishLevels[selectedItem] ~= nil and currentLevel >= Config.FishLevels[selectedItem] then 
                            randomItem = selectedItem
                    else
                        if myTolerance >= tolerance then 
                            local randomItemChance = math.random(1, #(zoneData.items.trashItems))
                            randomItem = zoneData.items.trashItems[randomItemChance]
                            break 
                        end
                        myTolerance = myTolerance + 1
                    end
                    Citizen.Wait(10)
                end
            else -- ? NORMAL ITEM GIVE
                if bait == Config.Settings.illegalBaitName then -- ! İLLEGAL İTEM ALANI
                    local myTolerance = 0
                    while randomItem == nil do 
                        local randomItemChance = math.random(1, #(zoneData.items.illegal.rodLevel[oltaSeviyesi]))
                        local selectedItem = zoneData.items.illegal.rodLevel[oltaSeviyesi][randomItemChance]
                        if Config.FishLevels[selectedItem] ~= nil and currentLevel >= Config.FishLevels[selectedItem] then 
                                randomItem = selectedItem
                        else
                            if myTolerance >= tolerance then 
                                local randomItemChance = math.random(1, #(zoneData.items.trashItems))
                                randomItem = zoneData.items.trashItems[randomItemChance]
                                break 
                            end
                            myTolerance = myTolerance + 1
                        end
                        Citizen.Wait(10)
                    end
                else -- ! NORMAL ITEM ALANI
                    local myTolerance = 0
                    while randomItem == nil do 
                        local randomItemChance = math.random(1, #(zoneData.items.normal.rodLevel[oltaSeviyesi]))
                        local selectedItem = zoneData.items.normal.rodLevel[oltaSeviyesi][randomItemChance]
                        if Config.FishLevels[selectedItem] ~= nil and currentLevel >= Config.FishLevels[selectedItem] then 
                                randomItem = selectedItem
                        else
                            if myTolerance >= tolerance then 
                                local randomItemChance = math.random(1, #(zoneData.items.trashItems))
                                randomItem = zoneData.items.trashItems[randomItemChance]
                                break 
                            end
                            myTolerance = myTolerance + 1
                        end
                        Citizen.Wait(10)
                    end
                end
            end
        end


        if bait ~= "none" and myChance < Config.Settings.eatBaitChance then 
            bait = "none"
            QBCore.Functions.Notify(Config.Language.eatBaitText)
            SendNUIMessage({type = "setBait", bait = "none"})
        end

        if randomItem ~= nil then
            QBCore.Functions.Notify(randomItem .. " " .. Config.Language.catchFish)
            for k, v in pairs(Config.Tasks) do 
                if randomItem == v.itemName then 
                    TriggerServerEvent('ak4y-advancedFishing:addTaskCount', randomItem)
                    break
                end
            end
            TriggerServerEvent("ak4y-advancedFishing:addItem", randomItem)
            TriggerServerEvent('ak4y-battlepass:taskCountAdd:standart', 3, 1)
            TriggerServerEvent('ak4y-battlepass:taskCountAdd:premium', 4, 1)
        end
    end
end)

local failGameSpam = 0
RegisterNUICallback('failGame', function(data, cb)
    if failGameSpam < GetGameTimer() then 
        failGameSpam = failGameSpam + 1000
        SetNuiFocus(false, false)
        fishingStop(true)
    end
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.28, 0.28)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 245)
    SetTextOutline(true)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end


RegisterNetEvent('ak4y-advancedFishing:setBait')
AddEventHandler('ak4y-advancedFishing:setBait', function(baitType, baitName, label)
    if fishing then 
        if baitType == "fish" then -- Köepek Balığı
            bait = baitType
            SendNUIMessage({type = "setBait", bait = label})
            TriggerServerEvent('ak4y-advancedFishing:removeBait', baitName)
        elseif baitType == "illegal" then
            local pos = GetEntityCoords(PlayerPedId())
            illegal = false

            for k, v in pairs(Config.Zones) do 
                if #(v.coords - pos) < v.radius then 
                    illegal = v.illegal
                    break
                end
            end

            if illegal then 
                bait = baitType
                SendNUIMessage({type = "setBait", bait = label})
                TriggerServerEvent('ak4y-advancedFishing:removeBait', baitName)
            else
                QBCore.Functions.Notify(Config.Language.illegalCant)
            end
        end
    else
        QBCore.Functions.Notify(Config.Language.useBaitNotFishing)
    end
end)

