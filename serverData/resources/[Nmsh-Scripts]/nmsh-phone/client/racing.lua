local QBCore = exports['qb-core']:GetCoreObject()

-- NUI Callback

RegisterNUICallback('GetAvailableRaces', function(_, cb)
    QBCore.Functions.TriggerCallback('nmsh-lapraces:server:GetRaces', function(Races)
        cb(Races)
    end)
end)

RegisterNUICallback('JoinRace', function(data, cb)
    TriggerServerEvent('nmsh-lapraces:server:JoinRace', data.RaceData)
    cb("ok")
end)

RegisterNUICallback('LeaveRace', function(data, cb)
    TriggerServerEvent('nmsh-lapraces:server:LeaveRace', data.RaceData)
    cb("ok")
end)

RegisterNUICallback('StartRace', function(data, cb)
    TriggerServerEvent('nmsh-lapraces:server:StartRace', data.RaceData.RaceId)
    cb("ok")
end)

RegisterNUICallback('SetAlertWaypoint', function(data, cb)
    local coords = data.alert.coords
    QBCore.Functions.Notify('GPS set: '..data.alert.title, "primary")
    SetNewWaypoint(coords.x, coords.y)
    cb("ok")
end)

RegisterNUICallback('GetRaces', function(_, cb)
    QBCore.Functions.TriggerCallback('nmsh-lapraces:server:GetListedRaces', function(Races)
        cb(Races)
    end)
end)

RegisterNUICallback('GetTrackData', function(data, cb)
    QBCore.Functions.TriggerCallback('nmsh-lapraces:server:GetTrackData', function(TrackData, CreatorData)
        TrackData.CreatorData = CreatorData
        cb(TrackData)
    end, data.RaceId)
end)

RegisterNUICallback('SetupRace', function(data, cb)
    TriggerServerEvent('nmsh-lapraces:server:SetupRace', data.RaceId, tonumber(data.AmountOfLaps))
    cb("ok")
end)

RegisterNUICallback('HasCreatedRace', function(_, cb)
    QBCore.Functions.TriggerCallback('nmsh-lapraces:server:HasCreatedRace', function(HasCreated)
        cb(HasCreated)
    end)
end)

RegisterNUICallback('IsInRace', function(_, cb)
    local InRace = exports['nmsh-lapraces']:IsInRace()
    cb(InRace)
end)

RegisterNUICallback('IsAuthorizedToCreateRaces', function(data, cb)
    QBCore.Functions.TriggerCallback('nmsh-lapraces:server:IsAuthorizedToCreateRaces', function(IsAuthorized, NameAvailable)
        local sendData = {
            IsAuthorized = IsAuthorized,
            IsBusy = exports['nmsh-lapraces']:IsInEditor(),
            IsNameAvailable = NameAvailable,
        }
        cb(sendData)
    end, data.TrackName)
end)

RegisterNUICallback('StartTrackEditor', function(data, cb)
    TriggerServerEvent('nmsh-lapraces:server:CreateLapRace', data.TrackName)
    cb("ok")
end)

RegisterNUICallback('GetRacingLeaderboards', function(_, cb)
    QBCore.Functions.TriggerCallback('nmsh-lapraces:server:GetRacingLeaderboards', function(Races)
        cb(Races)
    end)
end)

RegisterNUICallback('RaceDistanceCheck', function(data, cb)
    QBCore.Functions.TriggerCallback('nmsh-lapraces:server:GetRacingData', function(RaceData)
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local checkpointcoords = RaceData.Checkpoints[1].coords
        local dist = #(coords - vector3(checkpointcoords.x, checkpointcoords.y, checkpointcoords.z))
        if dist <= 115.0 then
            if data.Joined then
                TriggerEvent('nmsh-lapraces:client:WaitingDistanceCheck')
            end
            cb(true)
        else
            QBCore.Functions.Notify('You\'re too far away from the race. GPS set.', "error", 5000)
            SetNewWaypoint(checkpointcoords.x, checkpointcoords.y)
            cb(false)
        end
    end, data.RaceId)
end)

RegisterNUICallback('IsBusyCheck', function(data, cb)
    if data.check == "editor" then
        cb(exports['nmsh-lapraces']:IsInEditor())
    else
        cb(exports['nmsh-lapraces']:IsInRace())
    end
end)

RegisterNUICallback('CanRaceSetup', function(_, cb)
    QBCore.Functions.TriggerCallback('nmsh-lapraces:server:CanRaceSetup', function(CanSetup)
        cb(CanSetup)
    end)
end)

-- Events

RegisterNetEvent('nmsh-phone:client:RaceNotify', function(message)
    TriggerEvent('nmsh-phone:client:CustomNotification',
        "Racing",
        message,
        "fas fa-flag-checkered",
        "#353b48",
        3500
    )
end)

RegisterNetEvent('nmsh-phone:client:UpdateLapraces', function()
    SendNUIMessage({
        action = "UpdateRacingApp",
    })
end)