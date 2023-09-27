QBCore = exports['qb-core']:GetCoreObject()
Scully.Radio = {
    ServerID = GetPlayerServerId(PlayerId()),
    isOpen = false,
    channel = 0,
    volume = 50,
    radioProp = nil,
    radioColour = Scully.RadioColour,
    radioColours = {
        [1] = 'default',
        [2] = 'blue',
        [3] = 'brown',
        [4] = 'cherry',
        [5] = 'green',
        [6] = 'mint',
        [7] = 'orange',
        [8] = 'pink',
        [9] = 'purple',
        [10] = 'red',
        [11] = 'yellow',
        [12] = 'white'
    }
}

function Scully.Radio.JoinChannel(newChannel)
    local channel = tonumber(newChannel)
    if Scully.WhitelistedAccess[math.floor(channel)] then
        if Scully.Functions.HasAccess(math.floor(channel)) then
            Scully.Radio.channel = channel
            SendNUIMessage({type = 'playerList', action = 'clear'})
            if Scully.EnableList and Scully.ShowSelf then
                TriggerServerEvent('scully_radio:addPlayerToRadio', Scully.Radio.ServerID)
            end
            exports['pma-voice']:setRadioChannel(channel)
            local channelName = 'Frequency: ' .. channel
            if Scully.UseCustomChannelNames then
                if Scully.ChannelNames[channel] then
                    if string.len(Scully.ChannelNames[channel]) < 8 then
                        channelName = 'Channel: ' .. Scully.ChannelNames[channel]
                    end
                end
            end
            SendNUIMessage({type = 'changedChannel', channel = channelName})
        else
            Scully.Functions.ShowNotification('~r~You aren\'t allowed to join this frequency!')
        end
    else
        Scully.Radio.channel = channel
        SendNUIMessage({type = 'playerList', action = 'clear'})
        if Scully.EnableList and Scully.ShowSelf then
            TriggerServerEvent('scully_radio:addPlayerToRadio', Scully.Radio.ServerID)
        end
        exports['pma-voice']:setRadioChannel(channel)
        local channelName = 'Frequency: ' .. channel
        if Scully.UseCustomChannelNames then
            if Scully.ChannelNames[channel] then
                if string.len(Scully.ChannelNames[channel]) < 8 then
                    channelName = 'Channel: ' .. Scully.ChannelNames[channel]
                end
            end
        end
        SendNUIMessage({type = 'changedChannel', channel = channelName})
    end
end

function Scully.Radio.LeaveChannel(powerOff)
    if Scully.Radio.channel > 0 then
        Scully.Radio.channel = 0
        exports['pma-voice']:setRadioChannel(0)
        exports['pma-voice']:setVoiceProperty('radioEnabled', false)
        if powerOff then
            SendNUIMessage({type = 'powerOff', channel = 'Frequency: None'})
        else
            SendNUIMessage({type = 'changedChannel', channel = 'Frequency: None'})
        end
    end
end

function Scully.Radio.RadioAnim(enable)
    local playerPed = PlayerPedId()
    if enable then
        RequestAnimDict('cellphone@')
        while not HasAnimDictLoaded('cellphone@') do
            Wait(0)
        end
        Scully.Radio.radioProp = CreateObject(`prop_cs_hand_radio`, 0, 0, 0, true, true, true)
        AttachEntityToEntity(Scully.Radio.radioProp, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
        TaskPlayAnim(playerPed, 'cellphone@', 'cellphone_text_read_base', 8.0, -8.0, -1, 50, 0, 0, 0, 0)
    else
        StopAnimTask(playerPed, 'cellphone@', 'cellphone_text_read_base', 8.0)
        RemoveAnimDict('cellphone@')
        DeleteEntity(Scully.Radio.radioProp)
    end
end

function Scully.Radio.ToggleRadio(enable)
    Scully.Radio.isOpen = enable
    SetNuiFocus(enable, enable)
    if Scully.RadioAnims then
        Scully.Radio.RadioAnim(enable)
    end
    SendNUIMessage({
        type = 'openradio',
        enable = enable,
        colour = Scully.Radio.radioColour,
        edit = Scully.EnableEditing,
        playerId = Scully.Radio.ServerID
    })
end

RegisterNetEvent('scully_radio:openRadio', function(colour)
    if colour then
        Scully.Radio.radioColour = colour
    end
	Scully.Radio.ToggleRadio(true)
end)

RegisterNetEvent('scully_radio:joinChannel', function(channel)
    if type(channel) == 'table' then
        channel = data.channel
    end
	Scully.Radio.JoinChannel(channel)
end)

RegisterNetEvent('scully_radio:leaveChannel', function(powerOff)
	Scully.Radio.LeaveChannel(powerOff)
end)

AddEventHandler('onClientResourceStart', function(resourceName)
	if resourceName == GetCurrentResourceName() then
        if LocalPlayer.state.radioChannel then
            if LocalPlayer.state.radioChannel > 0 then
                exports['pma-voice']:setRadioChannel(0)
                exports['pma-voice']:setVoiceProperty('radioEnabled', false)
            end
        end
	end
end)

if Scully.AllowColours and not Scully.UseItemColours then
    if Scully.ColourCommand ~= '' then
        RegisterCommand(Scully.ColourCommand, function(_, args)
            if args[1] then
                local newColour = tonumber(args[1])
                if newColour then
                    if Scully.Radio.radioColours[newColour] then
                        Scully.Radio.radioColour = Scully.Radio.radioColours[newColour]
                        Scully.Functions.ShowNotification('~g~Your radio has been changed to ' .. Scully.Radio.radioColour .. '!')
                        if Scully.Radio.isOpen then
                            Scully.Radio.ToggleRadio(false)
                        end
                    end
                end
            end
        end)
    end
end

if Scully.UseKeybind ~= '' then
    RegisterCommand('radio', function()
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
            if HasItem then
                Scully.Radio.ToggleRadio(true)
            else
                QBCore.Functions.Notify('You dont have a Radio', 'error')
            end
        end, 'radio')
    end)
    RegisterKeyMapping('radio', 'Open Radio', 'keyboard', Scully.UseKeybind)
end

if Scully.HideListCommand ~= '' then
    RegisterCommand(Scully.HideListCommand, function()
        SendNUIMessage({
            type = 'playerList', 
            action = 'toggle'
        })
    end)
end

RegisterNUICallback('radioOn', function(data, cb)
    exports['pma-voice']:setVoiceProperty('radioEnabled', true)
    exports['pma-voice']:setVoiceProperty('micClicks', Scully.MicClicks)
    PlaySound(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', 0, 0, 1)
    SendNUIMessage({
        type = 'playerList', 
        action = 'display',
        show = Scully.EnableList
    })
end)

RegisterNUICallback('changeInfo', function(data, cb)
    if not Scully.EnableEditing then return end
    if data.value then
        if data.value ~= '' then
            TriggerServerEvent('scully_radio:updateRadioInfo', data.type, data.value)
            Scully.Functions.ShowNotification('~g~You updated your ' .. data.type .. ' to ' .. data.value .. '!') --------------------------------------------
            TriggerServerEvent('log_discord', data.type, data.value)
        end
    end
end)

RegisterNUICallback('joinChannel', function(data, cb)
    Scully.Radio.JoinChannel(data.channel)
end)

RegisterNUICallback('leaveChannel', function(data, cb)
    PlaySound(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', 0, 0, 1)
    Scully.Radio.LeaveChannel()
end)

RegisterNUICallback('VolUp', function(data, cb)
    if Scully.Radio.volume < 100 then
        PlaySound(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', 0, 0, 1)
        Scully.Radio.volume = Scully.Radio.volume + 10
        exports['pma-voice']:setRadioVolume(Scully.Radio.volume)
    end
end)

RegisterNUICallback('VolDown', function(data, cb)
    if Scully.Radio.volume > 10 then
        PlaySound(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', 0, 0, 1)
        Scully.Radio.volume = Scully.Radio.volume - 10
        exports['pma-voice']:setRadioVolume(Scully.Radio.volume)
    end
end)

RegisterNUICallback('close', function(data, cb)
    Scully.Radio.ToggleRadio(false)
end)

-- radio list shit
if Scully.EnableList then
    RegisterNetEvent('pma-voice:addPlayerToRadio', function(player)
        TriggerServerEvent('scully_radio:addPlayerToRadio', player)
    end)
    
    RegisterNetEvent('pma-voice:removePlayerFromRadio', function(player)
        TriggerServerEvent('scully_radio:removePlayerFromRadio', player)
    end)

    if Scully.ShowSelf then
        RegisterNetEvent("pma-voice:radioActive", function(talking)
            SendNUIMessage({
                type = 'playerList', 
                action = 'talking',
                playerId = Scully.Radio.ServerID,
                isTalking = talking
            })
        end)
    end
    
    RegisterNetEvent('pma-voice:setTalkingOnRadio', function(player, talking)
        TriggerServerEvent('scully_radio:setTalkingOnRadio', player, talking)
    end)

    RegisterNetEvent('scully_radio:updateRadioInfo', function(player, name)
        if player == Scully.Radio.ServerID then
            name = name .. ' (You)'
        end
        SendNUIMessage({
            type = 'playerList', 
            action = 'update',
            playerId = player,
            playerName = name
        })
    end)
    
    RegisterNetEvent('scully_radio:addPlayerToRadio', function(player, name)
        if player == Scully.Radio.ServerID then
            name = name .. ' (You)'
        end
        SendNUIMessage({
            type = 'playerList', 
            action = 'add',
            playerId = player,
            playerName = name
        })
    end)
    
    RegisterNetEvent('scully_radio:removePlayerFromRadio', function(player)
        if player == Scully.Radio.ServerID then return end
        SendNUIMessage({
            type = 'playerList', 
            action = 'remove',
            playerId = player
        })
    end)
    
    RegisterNetEvent('scully_radio:setTalkingOnRadio', function(player, talking)
        SendNUIMessage({
            type = 'playerList', 
            action = 'talking',
            playerId = player,
            isTalking = talking
        })
    end)
end