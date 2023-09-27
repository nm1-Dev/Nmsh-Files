QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = LocalPlayer.state['isLoggedIn']
currentThermiteGate = 0
CurrentCops = 0
IsDrilling = false
local closestBank = 0
local inElectronickitZone = false
local copsCalled = false
local refreshed = false
local currentLocker = 0

-- Handlers

--- This will reset the bank doors to the position that they should be in, so if the bank is still open, it will open the door and vise versa
--- @return nil
local function ResetBankDoors()
    for k in pairs(Bank.SmallBanks) do
        local object = GetClosestObjectOfType(Bank.SmallBanks[k]["coords"]["x"], Bank.SmallBanks[k]["coords"]["y"], Bank.SmallBanks[k]["coords"]["z"], 5.0, Bank.SmallBanks[k]["object"], false, false, false)
        if not Bank.SmallBanks[k]["isOpened"] then
            SetEntityHeading(object, Bank.SmallBanks[k]["heading"].closed)
        else
            SetEntityHeading(object, Bank.SmallBanks[k]["heading"].open)
        end
    end
    if not Bank.BigBanks["paleto"]["isOpened"] then
        local paletoObject = GetClosestObjectOfType(Bank.BigBanks["paleto"]["coords"]["x"], Bank.BigBanks["paleto"]["coords"]["y"], Bank.BigBanks["paleto"]["coords"]["z"], 5.0, Bank.BigBanks["paleto"]["object"], false, false, false)
        SetEntityHeading(paletoObject, Bank.BigBanks["paleto"]["heading"].closed)
    else
        local paletoObject = GetClosestObjectOfType(Bank.BigBanks["paleto"]["coords"]["x"], Bank.BigBanks["paleto"]["coords"]["y"], Bank.BigBanks["paleto"]["coords"]["z"], 5.0, Bank.BigBanks["paleto"]["object"], false, false, false)
        SetEntityHeading(paletoObject, Bank.BigBanks["paleto"]["heading"].open)
    end
    if not Bank.BigBanks["pacific"]["isOpened"] then
        local pacificObject = GetClosestObjectOfType(Bank.BigBanks["pacific"]["coords"][2]["x"], Bank.BigBanks["pacific"]["coords"][2]["y"], Bank.BigBanks["pacific"]["coords"][2]["z"], 20.0, Bank.BigBanks["pacific"]["object"], false, false, false)
        SetEntityHeading(pacificObject, Bank.BigBanks["pacific"]["heading"].closed)
    else
        local pacificObject = GetClosestObjectOfType(Bank.BigBanks["pacific"]["coords"][2]["x"], Bank.BigBanks["pacific"]["coords"][2]["y"], Bank.BigBanks["pacific"]["coords"][2]["z"], 20.0, Bank.BigBanks["pacific"]["object"], false, false, false)
        SetEntityHeading(pacificObject, Bank.BigBanks["pacific"]["heading"].open)
    end
end

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    ResetBankDoors()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('nmsh-bankrobbery:server:GetConfig', function(config1, config2, config3)
        Bank.PowerStations = config1
        Bank.BigBanks = config2
        Bank.SmallBanks = config3
    end)
    ResetBankDoors()
    isLoggedIn = true
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

-- Functions

--- This will open the bank door of the paleto bank
--- @return nil
local function OpenPaletoDoor()
    Bank.DoorlockAction(4, false)
    local object = GetClosestObjectOfType(Bank.BigBanks["paleto"]["coords"]["x"], Bank.BigBanks["paleto"]["coords"]["y"], Bank.BigBanks["paleto"]["coords"]["z"], 5.0, Bank.BigBanks["paleto"]["object"], false, false, false)
    if object ~= 0 then
        SetEntityHeading(object, Bank.BigBanks["paleto"]["heading"].open)
    end
end

--- This will open the bank door of the pacific bank
--- @return nil
local function OpenPacificDoor()
    local object = GetClosestObjectOfType(Bank.BigBanks["pacific"]["coords"][2]["x"], Bank.BigBanks["pacific"]["coords"][2]["y"], Bank.BigBanks["pacific"]["coords"][2]["z"], 20.0, Bank.BigBanks["pacific"]["object"], false, false, false)
    local entHeading = Bank.BigBanks["pacific"]["heading"].closed
    if object ~= 0 then
        CreateThread(function()
            while entHeading > Bank.BigBanks["pacific"]["heading"].open do
                SetEntityHeading(object, entHeading - 10)
                entHeading -= 0.5
                Wait(10)
            end
        end)
    end
end

--- This is triggered once the hack at a small bank is done
--- @param success boolean
--- @return nil
local function OnHackDone(success)
    Bank.OnHackDone(success, closestBank)
end

--- This will load an animation dictionary so you can play an animation in that dictionary
--- @param dict string
--- @return nil
local function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end
end

--- This will open the bank door of any small bank
--- @param bankId number
--- @return nil
local function OpenBankDoor(bankId)
    local object = GetClosestObjectOfType(Bank.SmallBanks[bankId]["coords"]["x"], Bank.SmallBanks[bankId]["coords"]["y"], Bank.SmallBanks[bankId]["coords"]["z"], 5.0, Bank.SmallBanks[bankId]["object"], false, false, false)
    local entHeading = Bank.SmallBanks[bankId]["heading"].closed
    if object ~= 0 then
        CreateThread(function()
            while entHeading ~= Bank.SmallBanks[bankId]["heading"].open do
                SetEntityHeading(object, entHeading - 10)
                entHeading -= 0.5
                Wait(10)
            end
        end)
    end
end

--- This will trigger the sequence of opening a safe locker of a bank
--- @param bankId string | number
--- @param lockerId number
--- @return nil
function openLocker(bankId, lockerId) -- Globally Used
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    Bank.OnEvidence(pos, 65)
    TriggerServerEvent('nmsh-bankrobbery:server:setLockerState', bankId, lockerId, 'isBusy', true)
    if bankId == "paleto" then
        local hasItem = Bank.HasItem("drill")
        if hasItem then
            loadAnimDict("anim@heists@fleeca_bank@drilling")
            TaskPlayAnim(ped, 'anim@heists@fleeca_bank@drilling', 'drill_straight_idle', 3.0, 3.0, -1, 1, 0, false, false, false)
            local DrillObject = CreateObject(`hei_prop_heist_drill`, pos.x, pos.y, pos.z, true, true, true)
            AttachEntityToEntity(DrillObject, ped, GetPedBoneIndex(ped, 57005), 0.14, 0, -0.01, 90.0, -90.0, 180.0, true, true, false, true, 1, true)
            IsDrilling = true
            QBCore.Functions.Progressbar("open_locker_drill", Lang:t("general.breaking_open_safe"), math.random(18000, 30000), false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
                StopAnimTask(ped, "anim@heists@fleeca_bank@drilling", "drill_straight_idle", 1.0)
                DetachEntity(DrillObject, true, true)
                DeleteObject(DrillObject)
                TriggerServerEvent('nmsh-bankrobbery:server:setLockerState', bankId, lockerId, 'isOpened', true)
                TriggerServerEvent('nmsh-bankrobbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
                TriggerServerEvent('nmsh-bankrobbery:server:recieveItem', 'paleto', bankId, lockerId)
                QBCore.Functions.Notify(Lang:t("success.success_message"), "success")
                SetTimeout(500, function()
                    IsDrilling = false
                end)
            end, function() -- Cancel
                StopAnimTask(ped, "anim@heists@fleeca_bank@drilling", "drill_straight_idle", 1.0)
                TriggerServerEvent('nmsh-bankrobbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
                DetachEntity(DrillObject, true, true)
                DeleteObject(DrillObject)
                QBCore.Functions.Notify(Lang:t("error.cancel_message"), "error")
                SetTimeout(500, function()
                    IsDrilling = false
                end)
            end)
        else
            QBCore.Functions.Notify(Lang:t("error.safe_too_strong"), "error")
            TriggerServerEvent('nmsh-bankrobbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
        end
    elseif bankId == "pacific" then
        local hasItem = Bank.HasItem("drill")
        if hasItem then
            loadAnimDict("anim@heists@fleeca_bank@drilling")
            TaskPlayAnim(ped, 'anim@heists@fleeca_bank@drilling', 'drill_straight_idle', 3.0, 3.0, -1, 1, 0, false, false, false)
            local DrillObject = CreateObject(`hei_prop_heist_drill`, pos.x, pos.y, pos.z, true, true, true)
            AttachEntityToEntity(DrillObject, ped, GetPedBoneIndex(ped, 57005), 0.14, 0, -0.01, 90.0, -90.0, 180.0, true, true, false, true, 1, true)
            IsDrilling = true
            QBCore.Functions.Progressbar("open_locker_drill", Lang:t("general.breaking_open_safe"), math.random(18000, 30000), false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
                StopAnimTask(ped, "anim@heists@fleeca_bank@drilling", "drill_straight_idle", 1.0)
                DetachEntity(DrillObject, true, true)
                DeleteObject(DrillObject)

                TriggerServerEvent('nmsh-bankrobbery:server:setLockerState', bankId, lockerId, 'isOpened', true)
                TriggerServerEvent('nmsh-bankrobbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
                TriggerServerEvent('nmsh-bankrobbery:server:recieveItem', 'pacific', bankId, lockerId)
                QBCore.Functions.Notify(Lang:t("success.success_message"), "success")
                SetTimeout(500, function()
                    IsDrilling = false
                end)
            end, function() -- Cancel
                StopAnimTask(ped, "anim@heists@fleeca_bank@drilling", "drill_straight_idle", 1.0)
                TriggerServerEvent('nmsh-bankrobbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
                DetachEntity(DrillObject, true, true)
                DeleteObject(DrillObject)
                QBCore.Functions.Notify(Lang:t("error.cancel_message"), "error")
                SetTimeout(500, function()
                    IsDrilling = false
                end)
            end)
        else
            QBCore.Functions.Notify(Lang:t("error.safe_too_strong"), "error")
            TriggerServerEvent('nmsh-bankrobbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
        end
    else
        IsDrilling = true
        loadAnimDict("anim@gangops@facility@servers@")
        TaskPlayAnim(ped, 'anim@gangops@facility@servers@', 'hotwire', 3.0, 3.0, -1, 1, 0, false, false, false)
        QBCore.Functions.Progressbar("open_locker", Lang:t("general.breaking_open_safe"), math.random(27000, 37000), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
            TriggerServerEvent('nmsh-bankrobbery:server:setLockerState', bankId, lockerId, 'isOpened', true)
            TriggerServerEvent('nmsh-bankrobbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
            TriggerServerEvent('nmsh-bankrobbery:server:recieveItem', 'small', bankId, lockerId)
            QBCore.Functions.Notify(Lang:t("success.success_message"), "success")
            SetTimeout(500, function()
                IsDrilling = false
            end)
        end, function() -- Cancel
            StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
            TriggerServerEvent('nmsh-bankrobbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
            QBCore.Functions.Notify(Lang:t("error.cancel_message"), "error")
            SetTimeout(500, function()
                IsDrilling = false
            end)
        end)
    end
    CreateThread(function()
        while IsDrilling do
            Bank.OnDrillingAction()
            Wait(10000)
        end
    end)
end

-- Events

RegisterNetEvent('electronickit:UseElectronickit', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    Bank.OnEvidence(pos, 85)
    if closestBank == 0 or not inElectronickitZone then return end
    QBCore.Functions.TriggerCallback('nmsh-bankrobbery:server:isRobberyActive', function(isBusy)
        if not isBusy then
            if CurrentCops >= Bank.MinimumFleecaPolice then
                if not Bank.SmallBanks[closestBank]["isOpened"] then
                    local hasItem = Bank.HasItem({"laptop_green"})
                    if hasItem then
                        Bank.ShowRequiredItems({
                            [1] = {name = QBCore.Shared.Items["laptop_green"]["name"], image = QBCore.Shared.Items["laptop_green"]["image"]},
                        }, false)
                        loadAnimDict("anim@gangops@facility@servers@")
                        TaskPlayAnim(ped, 'anim@gangops@facility@servers@', 'hotwire', 3.0, 3.0, -1, 1, 0, false, false, false)
                        QBCore.Functions.Progressbar("hack_gate", Lang:t("general.connecting_hacking_device"), math.random(5000, 10000), false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {}, {}, {}, function() -- Done
                            StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
                            TriggerServerEvent('nmsh-bankrobbery:server:removeElectronicKit')
                            TriggerEvent("mhacking:show")
                            TriggerEvent("mhacking:start", math.random(6, 7), math.random(12, 15), OnHackDone)
                            if copsCalled or not Bank.SmallBanks[closestBank]["alarm"] then return end
                            TriggerServerEvent("nmsh-bankrobbery:server:callCops", "small", closestBank, pos)
                            copsCalled = true
                            SetTimeout(60000 * Bank.OutlawCooldown, function() copsCalled = false end)
                        end, function() -- Cancel
                            StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
                            QBCore.Functions.Notify(Lang:t("error.cancel_message"), "error")
                        end)
                    else
                        QBCore.Functions.Notify(Lang:t("error.missing_item"), "error")
                    end
                else
                    QBCore.Functions.Notify(Lang:t("error.bank_already_open"), "error")
                end
            else
                QBCore.Functions.Notify(Lang:t("error.minimum_police_required", {police = Bank.MinimumFleecaPolice}), "error")
            end
        else
            QBCore.Functions.Notify(Lang:t("error.security_lock_active"), "error", 5500)
        end
    end)
end)

RegisterNetEvent('nmsh-bankrobbery:client:setBankState', function(bankId)
    if bankId == "paleto" then
        Bank.BigBanks["paleto"]["isOpened"] = true
        OpenPaletoDoor()
    elseif bankId == "pacific" then
        Bank.BigBanks["pacific"]["isOpened"] = true
        OpenPacificDoor()
    else
        Bank.SmallBanks[bankId]["isOpened"] = true
        OpenBankDoor(bankId)
    end
end)

RegisterNetEvent('nmsh-bankrobbery:client:enableAllBankSecurity', function()
    for k in pairs(Bank.SmallBanks) do
        Bank.SmallBanks[k]["alarm"] = true
    end
end)

RegisterNetEvent('nmsh-bankrobbery:client:disableAllBankSecurity', function()
    for k in pairs(Bank.SmallBanks) do
        Bank.SmallBanks[k]["alarm"] = false
    end
end)

RegisterNetEvent('nmsh-bankrobbery:client:BankSecurity', function(key, status)
    if type(key) == 'table' and table.type(key) == 'array' then
        for _, v in pairs(key) do
            Bank.SmallBanks[v]["alarm"] = status
        end
    elseif type(key) == 'number' then
        Bank.SmallBanks[key]["alarm"] = status
    else
        error(Lang:t("error.wrong_type", {receiver = 'nmsh-bankrobbery:client:BankSecurity', argument = "key", receivedType = type(key), receivedValue = key, expected = "table/array"}))
    end
end)

RegisterNetEvent('nmsh-bankrobbery:client:setLockerState', function(bankId, lockerId, state, bool)
    if bankId == "paleto" then
        Bank.BigBanks["paleto"]["lockers"][lockerId][state] = bool
    elseif bankId == "pacific" then
        Bank.BigBanks["pacific"]["lockers"][lockerId][state] = bool
    else
        Bank.SmallBanks[bankId]["lockers"][lockerId][state] = bool
    end
end)

RegisterNetEvent('nmsh-bankrobbery:client:ResetFleecaLockers', function(BankId)
    Bank.SmallBanks[BankId]["isOpened"] = false
    for k in pairs(Bank.SmallBanks[BankId]["lockers"]) do
        Bank.SmallBanks[BankId]["lockers"][k]["isOpened"] = false
        Bank.SmallBanks[BankId]["lockers"][k]["isBusy"] = false
    end
end)

RegisterNetEvent('nmsh-bankrobbery:client:robberyCall', function(type, coords)
    if not isLoggedIn then return end
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    if PlayerJob.name ~= "police" or not PlayerJob.onduty then return end
    if type == "small" then
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        -- Bank.OnPoliceAlert(Lang:t("general.fleeca_robbery_alert"))
        exports['nmsh-dispatch']:FleecaBankRobbery(camId)
    elseif type == "paleto" then
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Wait(100)
        PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
        Wait(100)
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Wait(100)
        PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
        -- Bank.OnPoliceAlert(Lang:t("general.paleto_robbery_alert"))
        exports['nmsh-dispatch']:PaletoBankRobbery(camId)
    elseif type == "pacific" then
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Wait(100)
        PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
        Wait(100)
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Wait(100)
        PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
        Bank.OnPoliceAlert(Lang:t("general.pacific_robbery_alert"))
        exports['nmsh-dispatch']:PacificBankRobbery(camId)
    end
    local transG = 250
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, 487)
    SetBlipColour(blip, 4)
    SetBlipDisplay(blip, 4)
    SetBlipAlpha(blip, transG)
    SetBlipScale(blip, 1.2)
    SetBlipFlashes(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(Lang:t("general.bank_robbery_police_call"))
    EndTextCommandSetBlipName(blip)
    while transG ~= 0 do
        Wait(180 * 4)
        transG = transG - 1
        SetBlipAlpha(blip, transG)
        if transG == 0 then
            SetBlipSprite(blip, 2)
            RemoveBlip(blip)
            return
        end
    end
end)

-- Threads

CreateThread(function()
    while true do
        if closestBank ~= 0 then
            if not refreshed then
                ResetBankDoors()
                refreshed = true
            end
        else
            refreshed = false
        end
        Wait(1000)
    end
end)

CreateThread(function()
    while true do -- This is kept for the ResetBankDoors function to be executed outside of the polyzone
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local inRange = false
        if isLoggedIn then
            for k, v in pairs(Bank.SmallBanks) do
                local dist = #(pos - v["coords"])
                if dist < 15 then
                    closestBank = k
                    inRange = true
                end
            end
            if not inRange then closestBank = 0 end
        end
        Wait(1000)
    end
end)

CreateThread(function()
    for i = 1, #Bank.SmallBanks do
        local bankZone = BoxZone:Create(Bank.SmallBanks[i]["coords"], 1.0, 1.0, {
            name = 'fleeca_'..i..'_coords_electronickit',
            heading = Bank.SmallBanks[i]["coords"].closed,
            minZ = Bank.SmallBanks[i]["coords"].z - 1,
            maxZ = Bank.SmallBanks[i]["coords"].z + 1,
            debugPoly = false
        })
        bankZone:onPlayerInOut(function(inside)
            inElectronickitZone = inside
            if inside and not Bank.SmallBanks[i]["isOpened"] then
                Bank.ShowRequiredItems({
                    [1] = {name = QBCore.Shared.Items["laptop_green"]["name"], image = QBCore.Shared.Items["laptop_green"]["image"]},
                }, true)
            else
                Bank.ShowRequiredItems({
                    [1] = {name = QBCore.Shared.Items["laptop_green"]["name"], image = QBCore.Shared.Items["laptop_green"]["image"]},
                }, false)
            end
        end)
        for k in pairs(Bank.SmallBanks[i]["lockers"]) do
            if Bank.UseTarget then
                exports['nmsh-target']:AddBoxZone('fleeca_'..i..'_coords_locker_'..k, Bank.SmallBanks[i]["lockers"][k]["coords"], 1.0, 1.0, {
                    name = 'fleeca_'..i..'_coords_locker_'..k,
                    heading = Bank.SmallBanks[i]["heading"].closed,
                    minZ = Bank.SmallBanks[i]["lockers"][k]["coords"].z - 1,
                    maxZ = Bank.SmallBanks[i]["lockers"][k]["coords"].z + 1,
                    debugPoly = false
                }, {
                    options = {
                        {
                            action = function()
                                openLocker(closestBank, k)
                            end,
                            canInteract = function()
                                return closestBank ~= 0 and not IsDrilling and Bank.SmallBanks[i]["isOpened"] and not Bank.SmallBanks[i]["lockers"][k]["isOpened"] and not Bank.SmallBanks[i]["lockers"][k]["isBusy"]
                            end,
                            icon = 'fa-solid fa-vault',
                            label = Lang:t("general.break_safe_open_option_target"),
                        },
                    },
                    distance = 1.5
                })
            else
                local lockerZone = BoxZone:Create(Bank.SmallBanks[i]["lockers"][k]["coords"], 1.0, 1.0, {
                    name = 'fleeca_'..i..'_coords_locker_'..k,
                    heading = Bank.SmallBanks[i]["heading"].closed,
                    minZ = Bank.SmallBanks[i]["lockers"][k]["coords"].z - 1,
                    maxZ = Bank.SmallBanks[i]["lockers"][k]["coords"].z + 1,
                    debugPoly = false
                })
                lockerZone:onPlayerInOut(function(inside)
                    if inside and closestBank ~= 0 and not IsDrilling and Bank.SmallBanks[i]["isOpened"] and not Bank.SmallBanks[i]["lockers"][k]["isOpened"] and not Bank.SmallBanks[i]["lockers"][k]["isBusy"] then
                        exports['qb-core']:DrawText(Lang:t("general.break_safe_open_option_drawtext"), 'right')
                        currentLocker = k
                    else
                        if currentLocker == k then
                            currentLocker = 0
                            exports['qb-core']:HideText()
                        end
                    end
                end)
            end
        end
    end
    if not Bank.UseTarget then
        while true do
            local sleep = 1000
            if isLoggedIn then
                for i = 1, #Bank.SmallBanks do
                    if currentLocker ~= 0 and not IsDrilling and Bank.SmallBanks[i]["isOpened"] and not Bank.SmallBanks[i]["lockers"][currentLocker]["isOpened"] and not Bank.SmallBanks[i]["lockers"][currentLocker]["isBusy"] then
                        sleep = 0
                        if IsControlJustPressed(0, 38) then
                            exports['qb-core']:KeyPressed()
                            Wait(500)
                            exports['qb-core']:HideText()
                            if CurrentCops >= Bank.MinimumFleecaPolice then
                                openLocker(closestBank, currentLocker)
                            else
                                QBCore.Functions.Notify(Lang:t("error.minimum_police_required", {police = Bank.MinimumFleecaPolice}), "error")
                            end
                            sleep = 1000
                        end
                    end
                end
            end
            Wait(sleep)
        end
    end
end)
