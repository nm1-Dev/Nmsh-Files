Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if (IsPlayerFreeAiming(PlayerId())) then
            SendNUIMessage("xhairShow")
        elseif not (IsPlayerFreeAiming(PlayerId())) then
            SendNUIMessage("xhairHide")
        end
    end
end)