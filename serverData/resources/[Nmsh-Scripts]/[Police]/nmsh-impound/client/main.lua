local QBCore = exports['qb-core']:GetCoreObject()
local bones = {'bonnet', 'boot'}

CreateThread(function()
    exports['nmsh-target']:AddTargetBone(bones, {
        options = {
            ["Impound"] = {
                icon = "fas fa-lock",
                label = "Impound Request",
                event = "nmsh-impound:client:OpenImpoundMenu",
                distance = 1.3
            }
        }
    })
end)


RegisterNetEvent('nmsh-impound:client:OpenImpoundMenu', function()
    exports['nmsh-menu']:openMenu({
        {
            header = "Vehicle Scuff",
            txt = "Vehicle in an unrecoverable state.",
            params = {
                event = "nmsh-impound:client:VehicleScuff",
            }
        },
        {
            header = "Parking Violation",
            txt = "Vehicle parked in an restricted or unauthorized place.",
            params = {
                event = "nmsh-impound:client:ParkingViolation",
            }
        },
        {
            header = "Police Impound",
            txt = "Sends vehicle to police impound lot.",
            params = {
                event = "nmsh-impound:client:PDImpound",
            }
        },
    })
end)

RegisterNetEvent('nmsh-impound:client:VehicleScuff', function()
    QBCore.Functions.Progressbar("random_task", "Requesting Impound...", 7000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
     }, {
     }, {}, {}, function() -- Done
        TriggerServerEvent("nmsh-impound:server:VehicS")
        QBCore.Functions.Notify("Impound Request Accepted", "success")
     end, function() -- Cancel
     end)
end)

RegisterNetEvent('nmsh-impound:client:ParkingViolation', function()
    QBCore.Functions.Progressbar("random_task", "Requesting Impound...", 7000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
     }, {
     }, {}, {}, function() -- Done
        TriggerServerEvent("nmsh-impound:server:ParkingVio")
     end, function() -- Cancel
     end)
end)

RegisterNetEvent('nmsh-impound:client:PDImpound', function()
    TriggerServerEvent("nmsh-impound:server:PDIm")
    QBCore.Functions.Notify("Impound Request Accepted", "success")
end)