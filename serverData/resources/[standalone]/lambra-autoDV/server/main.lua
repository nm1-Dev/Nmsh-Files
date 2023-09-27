--[[CONFIG]]
local deleteTimer = 160 --time in Minutes

-----------------------------------------

--[[Core]]
CreateThread(function()
    while true do
        Wait(deleteTimer * 60000)
        TriggerClientEvent('chat:addMessage', -1, { color = { 255, 0, 0 }, args = {'Warning', 'Inactive vehicles will be deleted in 1MIN'}})
        Wait(45000)--time in MS
        TriggerClientEvent('chat:addMessage', -1, { color = { 255, 0, 0 }, args = {'Warning', 'Inactive vehicles will be deleted in 15 SECS'}})
        Wait(10000)--time in MS
        TriggerClientEvent('chat:addMessage', -1, { color = { 255, 0, 0 }, args = {'Warning', 'Inactive vehicles will be deleted in 5 SECS'}})
        Wait(5000)--time in MS

        for i, veh in pairs(GetAllVehicles()) do --Checks for any existent vehicle, even inside other buckets/dimensions
            if HasVehicleBeenOwnedByPlayer(veh) then -- Wont delete showroom vehicles (Cars marked as "SetVehicleHasBeenOwnedByPlayer" false)
                if not isVehicleOccupied(veh) then
                    DeleteEntity(veh)
                end
            end
        end
        TriggerClientEvent('chat:addMessage', -1, { color = { 255, 0, 0 }, args = {'Warning', 'All Inactive vehicles got deleted'}})
    end
end)



function isVehicleOccupied(veh)
    for seat = -1, 6 do --Searchs for every seat
        if GetPedInVehicleSeat(veh, seat) ~= 0 then --Check if there is a ped sitting
            return true --return vehicle is occupied
        end
    end
    return false --vehicle is empty
end