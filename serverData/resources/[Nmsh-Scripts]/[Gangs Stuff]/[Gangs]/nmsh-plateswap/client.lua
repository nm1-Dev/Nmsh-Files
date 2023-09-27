local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("nmsh-plateswap:removePlate")
AddEventHandler("nmsh-plateswap:removePlate", function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local plate =  QBCore.Functions.GetPlate(vehicle)
    local vehCoords = GetEntityCoords(vehicle)
    local pos = GetEntityCoords(PlayerPedId())
    local close = #(pos - vehCoords) <= 3.5
    if plate == '' then
        QBCore.Functions.Notify('the plate is robbed', "error", 2500)
    else
        local news = string.sub(plate, 1, 4)
        if news == 'RNTA' then
            QBCore.Functions.Notify('This is rent vehicle', "error", 2500)
        else
            NetworkHasControlOfEntity(vehicle)
            NetworkRequestControlOfEntity(vehicle)
            if close then
                local result = exports['nmsh-inventory']:HasItem('plate_screwdriver') 
                if result then
                    local seconds = math.random(30,40)
                    local success = exports['new_lockpick']:StartLockPickCircle(seconds)
                    if success then
                        QBCore.Functions.Progressbar("plateremoval", "Removing Plate..", math.random(7500, 12000), false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                            anim = "machinic_loop_mechandplayer",
                            flags = 0,
                        }, {}, {}, function() -- Done
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('nmsh-plateswap:addPlate', plate)
                            Wait(500)
                            SetVehicleNumberPlateText(vehicle, '')
                            SetVehicleNumberPlateText(vehicle, '')
                            if math.random (1, 100) < 80 then
                                TriggerServerEvent("nmsh-plateswap:RemoveScrewdriverItem")
                            end
                        end, function() -- Cancel
                            ClearPedTasks(PlayerPedId())
                            QBCore.Functions.Notify("Process Canceled", "error")
                        end)
                    else
                        QBCore.Functions.Notify("Failed to remove plate", "error")
                    end
                else
                    QBCore.Functions.Notify("You don\'t have the right tools.", "error")
                end
            else
                QBCore.Functions.Notify('No vehicle nearby', "error", 2500)
            end
        end

    end
end)

RegisterNetEvent('nmsh-plateswap:installPlate')
AddEventHandler('nmsh-plateswap:installPlate', function(data, slot)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local plate =  QBCore.Functions.GetPlate(vehicle)
    local vehCoords = GetEntityCoords(vehicle)
    local pos = GetEntityCoords(PlayerPedId())
    local close = #(pos - vehCoords) <= 3.5
    NetworkHasControlOfEntity(vehicle)
    NetworkRequestControlOfEntity(vehicle)
    if close then
        if plate == '' then
            local result = exports['nmsh-inventory']:HasItem('plate_screwdriver') 
            if result then
                QBCore.Functions.Progressbar("installing", "Installing Plate..", math.random(7500, 12000), false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                    anim = "machinic_loop_mechandplayer",
                    flags = 0,
                }, {}, {}, function() -- Done
                    ClearPedTasks(PlayerPedId())
                    SetVehicleNumberPlateText(vehicle, data)
                    SetVehicleNumberPlateText(vehicle, data)
                    TriggerServerEvent('nmsh-plateswap:RemovePlate', plate, slot)
                    if math.random (1, 100) < 80 then
                        TriggerServerEvent("nmsh-plateswap:RemoveScrewdriverItem")
                    end
                end, function() -- Cancel
                    ClearPedTasks(PlayerPedId())
                    QBCore.Functions.Notify("Process Canceled", "error")
                end)
            else
                QBCore.Functions.Notify("You don\'t have the right tools.", "error")
            end
        else
            QBCore.Functions.Notify('You must remove vehicle plate first', "error", 2500)
        end
    else
        QBCore.Functions.Notify('No vehicle nearby', "error", 2500)
    end
end)
