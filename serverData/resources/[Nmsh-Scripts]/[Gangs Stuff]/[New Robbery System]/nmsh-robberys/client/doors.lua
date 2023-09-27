RegisterNetEvent('nmsh-bankrobbery:client:ClearTimeoutDoors', function()
    Bank.DoorlockAction(4, true)
    local PaletoObject = GetClosestObjectOfType(Bank.BigBanks["paleto"]["coords"]["x"], Bank.BigBanks["paleto"]["coords"]["y"], Bank.BigBanks["paleto"]["coords"]["z"], 5.0, Bank.BigBanks["paleto"]["object"], false, false, false)
    if PaletoObject ~= 0 then
        SetEntityHeading(PaletoObject, Bank.BigBanks["paleto"]["heading"].closed)
    end
    local object = GetClosestObjectOfType(Bank.BigBanks["pacific"]["coords"][2]["x"], Bank.BigBanks["pacific"]["coords"][2]["y"], Bank.BigBanks["pacific"]["coords"][2]["z"], 20.0, Bank.BigBanks["pacific"]["object"], false, false, false)
    if object ~= 0 then
        SetEntityHeading(object, Bank.BigBanks["pacific"]["heading"].closed)
    end
    for k in pairs(Bank.BigBanks["pacific"]["lockers"]) do
        Bank.BigBanks["pacific"]["lockers"][k]["isBusy"] = false
        Bank.BigBanks["pacific"]["lockers"][k]["isOpened"] = false
    end
    for k in pairs(Bank.BigBanks["paleto"]["lockers"]) do
        Bank.BigBanks["paleto"]["lockers"][k]["isBusy"] = false
        Bank.BigBanks["paleto"]["lockers"][k]["isOpened"] = false
    end
    Bank.BigBanks["paleto"]["isOpened"] = false
    Bank.BigBanks["pacific"]["isOpened"] = false
end)

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local PaletoDist = #(pos - Bank.BigBanks["paleto"]["coords"])
        local PacificDist = #(pos - Bank.BigBanks["pacific"]["coords"][2])
        if PaletoDist < 15 then
            if Bank.BigBanks["paleto"]["isOpened"] then
                Bank.DoorlockAction(4, false)
                local object = GetClosestObjectOfType(Bank.BigBanks["paleto"]["coords"]["x"], Bank.BigBanks["paleto"]["coords"]["y"], Bank.BigBanks["paleto"]["coords"]["z"], 5.0, Bank.BigBanks["paleto"]["object"], false, false, false)
                if object ~= 0 then
                    SetEntityHeading(object, Bank.BigBanks["paleto"]["heading"].open)
                end
            else
                Bank.DoorlockAction(4, true)
                local object = GetClosestObjectOfType(Bank.BigBanks["paleto"]["coords"]["x"], Bank.BigBanks["paleto"]["coords"]["y"], Bank.BigBanks["paleto"]["coords"]["z"], 5.0, Bank.BigBanks["paleto"]["object"], false, false, false)
                if object ~= 0 then
                    SetEntityHeading(object, Bank.BigBanks["paleto"]["heading"].closed)
                end
            end
        end

        -- Pacific Check
        if PacificDist < 50 then
            if Bank.BigBanks["pacific"]["isOpened"] then
                local object = GetClosestObjectOfType(Bank.BigBanks["pacific"]["coords"][2]["x"], Bank.BigBanks["pacific"]["coords"][2]["y"], Bank.BigBanks["pacific"]["coords"][2]["z"], 20.0, Bank.BigBanks["pacific"]["object"], false, false, false)
                if object ~= 0 then
                    SetEntityHeading(object, Bank.BigBanks["pacific"]["heading"].open)
                end
            else
                local object = GetClosestObjectOfType(Bank.BigBanks["pacific"]["coords"][2]["x"], Bank.BigBanks["pacific"]["coords"][2]["y"], Bank.BigBanks["pacific"]["coords"][2]["z"], 20.0, Bank.BigBanks["pacific"]["object"], false, false, false)
                if object ~= 0 then
                    SetEntityHeading(object, Bank.BigBanks["pacific"]["heading"].closed)
                end
            end
        end
        Wait(1000)
    end
end)
