function EnableSubmix()
    SetAudioSubmixEffectRadioFx(0, 0)
    SetAudioSubmixEffectParamInt(0, 0, `default`, 1)
    SetAudioSubmixEffectParamFloat(0, 0, `freq_low`, 1250.0)
    SetAudioSubmixEffectParamFloat(0, 0, `freq_hi`, 8500.0)
    SetAudioSubmixEffectParamFloat(0, 0, `fudge`, 0.5)
    SetAudioSubmixEffectParamFloat(0, 0, `rm_mix`, 19.0)
end

function DisableSubmix()
    SetAudioSubmixEffectRadioFx(0, 0)
    SetAudioSubmixEffectParamInt(0, 0, `enabled`, 0)
end

local soundmix = false
CreateThread(function()
    while true do
        Wait(5000)
        ped = PlayerPedId()
        currentVehicle = GetVehiclePedIsIn(ped, false)
        local vehmodel = GetEntityModel(currentVehicle)
        if IsThisModelAHeli(vehmodel) or IsThisModelAPlane(vehmodel) then
            if IsPedInAnyVehicle(ped, false) then
                if GetIsVehicleEngineRunning(currentVehicle) then
                    if soundmix == false then
                        EnableSubmix()
                        soundmix = true
                        print("Submix Aktviert")
                    end
                else
                    if soundmix == true then
                        DisableSubmix()
                        soundmix = false
                    end
                end
            else
                if soundmix == true then
                    DisableSubmix()
                    soundmix = false
                end
            end
        end
        if not IsPedInAnyVehicle(ped, false) then
            DisableSubmix()
            soundmix = false
        end
    end
end)