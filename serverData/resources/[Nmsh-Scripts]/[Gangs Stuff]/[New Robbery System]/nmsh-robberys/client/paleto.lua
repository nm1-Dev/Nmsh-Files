local inBankCardAZone = false
local currentLocker = 0
local copsCalled = false

-- Functions

--- This will load an animation dictionary so you can play an animation in that dictionary
--- @param dict string
--- @return nil
local function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end
end

-- Events

RegisterNetEvent('nmsh-bankrobbery:UseBankcardA', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    Bank.OnEvidence(pos, 85)
    if not inBankCardAZone then return end
    QBCore.Functions.TriggerCallback('nmsh-bankrobbery:server:isRobberyActive', function(isBusy)
        if not isBusy then
            if CurrentCops >= Bank.MinimumPaletoPolice then
                if not Bank.BigBanks["paleto"]["isOpened"] then
                    Bank.ShowRequiredItems(nil, false)
                    loadAnimDict("anim@gangops@facility@servers@")
                    TaskPlayAnim(ped, 'anim@gangops@facility@servers@', 'hotwire', 3.0, 3.0, -1, 1, 0, false, false, false)
                    QBCore.Functions.Progressbar("security_pass", Lang:t("general.validating_bankcard"), math.random(5000, 10000), false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function() -- Done
                        StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
                        TriggerServerEvent('nmsh-bankrobbery:server:setBankState', 'paleto')
                        TriggerServerEvent('nmsh-bankrobbery:server:removeBankCard', '01')
                        Bank.DoorlockAction(4, false)
                        if copsCalled or not Bank.BigBanks["paleto"]["alarm"] then return end
                        TriggerServerEvent("nmsh-bankrobbery:server:callCops", "paleto", 0, pos)
                        copsCalled = true
                    end, function() -- Cancel
                        StopAnimTask(ped, "anim@gangops@facility@servers@", "hotwire", 1.0)
                        QBCore.Functions.Notify(Lang:t("error.cancel_message"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("error.bank_already_open"), "error")
                end
            else
                QBCore.Functions.Notify(Lang:t("error.minimum_police_required", {police = Bank.MinimumPaletoPolice}), "error")
            end
        else
            QBCore.Functions.Notify(Lang:t("error.security_lock_active"), "error", 5500)
        end
    end)
end)

-- Threads

CreateThread(function()
    local bankCardAZone = BoxZone:Create(Bank.BigBanks["paleto"]["coords"], 1.0, 1.0, {
        name = 'paleto_coords_bankcarda',
        heading = Bank.BigBanks["paleto"]["coords"].closed,
        minZ = Bank.BigBanks["paleto"]["coords"].z - 1,
        maxZ = Bank.BigBanks["paleto"]["coords"].z + 1,
        debugPoly = false
    })
    bankCardAZone:onPlayerInOut(function(inside)
        inBankCardAZone = inside
        if inside and not Bank.BigBanks["paleto"]["isOpened"] then
            Bank.ShowRequiredItems({
                [1] = {name = QBCore.Shared.Items["security_card_01"]["name"], image = QBCore.Shared.Items["security_card_01"]["image"]}
            }, true)
        else
            Bank.ShowRequiredItems({
                [1] = {name = QBCore.Shared.Items["security_card_01"]["name"], image = QBCore.Shared.Items["security_card_01"]["image"]}
            }, false)
        end
    end)
    local thermite1Zone = BoxZone:Create(Bank.BigBanks["paleto"]["thermite"][1]["coords"], 1.0, 1.0, {
        name = 'paleto_coords_thermite_1',
        heading = Bank.BigBanks["paleto"]["heading"].closed,
        minZ = Bank.BigBanks["paleto"]["thermite"][1]["coords"].z - 1,
        maxZ = Bank.BigBanks["paleto"]["thermite"][1]["coords"].z + 1,
        debugPoly = false
    })
    thermite1Zone:onPlayerInOut(function(inside)
        if inside and not Bank.BigBanks["paleto"]["thermite"][1]["isOpened"] then
            currentThermiteGate = Bank.BigBanks["paleto"]["thermite"][1]["doorId"]
            Bank.ShowRequiredItems({
                [1] = {name = QBCore.Shared.Items["thermite"]["name"], image = QBCore.Shared.Items["thermite"]["image"]},
            }, true)
        else
            if currentThermiteGate == Bank.BigBanks["paleto"]["thermite"][1]["doorId"] then
                currentThermiteGate = 0
                Bank.ShowRequiredItems({
                    [1] = {name = QBCore.Shared.Items["thermite"]["name"], image = QBCore.Shared.Items["thermite"]["image"]},
                }, false)
            end
        end
    end)
    for k in pairs(Bank.BigBanks["paleto"]["lockers"]) do
        if Bank.UseTarget then
            exports['nmsh-target']:AddBoxZone('paleto_coords_locker_'..k, Bank.BigBanks["paleto"]["lockers"][k]["coords"], 1.0, 1.0, {
                name = 'paleto_coords_locker_'..k,
                heading = Bank.BigBanks["paleto"]["heading"].closed,
                minZ = Bank.BigBanks["paleto"]["lockers"][k]["coords"].z - 1,
                maxZ = Bank.BigBanks["paleto"]["lockers"][k]["coords"].z + 1,
                debugPoly = false
            }, {
                options = {
                    {
                        action = function()
                            openLocker("paleto", k)
                        end,
                        canInteract = function()
                            return not IsDrilling and Bank.BigBanks["paleto"]["isOpened"] and not Bank.BigBanks["paleto"]["lockers"][k]["isBusy"] and not Bank.BigBanks["paleto"]["lockers"][k]["isOpened"]
                        end,
                        icon = 'fa-solid fa-vault',
                        label = Lang:t("general.break_safe_open_option_target"),
                    },
                },
                distance = 1.5
            })
        else
            local lockerZone = BoxZone:Create(Bank.BigBanks["paleto"]["lockers"][k]["coords"], 1.0, 1.0, {
                name = 'paleto_coords_locker_'..k,
                heading = Bank.BigBanks["paleto"]["heading"].closed,
                minZ = Bank.BigBanks["paleto"]["lockers"][k]["coords"].z - 1,
                maxZ = Bank.BigBanks["paleto"]["lockers"][k]["coords"].z + 1,
                debugPoly = false
            })
            lockerZone:onPlayerInOut(function(inside)
                if inside and not IsDrilling and Bank.BigBanks["paleto"]["isOpened"] and not Bank.BigBanks["paleto"]["lockers"][k]["isBusy"] and not Bank.BigBanks["paleto"]["lockers"][k]["isOpened"] then
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
    if not Bank.UseTarget then
        while true do
            local sleep = 1000
            if isLoggedIn then
                if currentLocker ~= 0 and not IsDrilling and Bank.BigBanks["paleto"]["isOpened"] and not Bank.BigBanks["paleto"]["lockers"][currentLocker]["isBusy"] and not Bank.BigBanks["paleto"]["lockers"][currentLocker]["isOpened"] then
                    sleep = 0
                    if IsControlJustPressed(0, 38) then
                        exports['qb-core']:KeyPressed()
                        Wait(500)
                        exports['qb-core']:HideText()
                        if CurrentCops >= Bank.MinimumPaletoPolice then
                            openLocker("paleto", currentLocker)
                        else
                            QBCore.Functions.Notify(Lang:t("error.minimum_police_required", {police = Bank.MinimumPaletoPolice}), "error")
                        end
                        sleep = 1000
                    end
                end
            end
            Wait(sleep)
        end
    end
end)
