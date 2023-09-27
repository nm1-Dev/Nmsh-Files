local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    for id, zone in ipairs(HiveZones) do
        exports["nmsh-zones"]:AddCircleZone("nmsh-beekeeping:bee_zone", zone[1], zone[2],{
            zoneEvents={"nmsh-beekeeping:trigger_zone"},
            data = {
                id = id,
            },
        })
    end
end)
