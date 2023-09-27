if IsDuplicityVersion() then -- Check if server sided
    if Scully.Framework == 'qb-core' then
        local QBCore = exports['qb-core']:GetCoreObject()

        Scully.Functions = {
            GetPlayerName = function(source)
                local xPlayer = QBCore.Functions.GetPlayer(source)
                if xPlayer.PlayerData.metadata.callsign == 'NO CALLSIGN' then
                    return '', string.sub(xPlayer.PlayerData.charinfo.firstname, 1, 1) .. '. ' .. xPlayer.PlayerData.charinfo.lastname
                else
                    return xPlayer.PlayerData.metadata.callsign .. ' | ', string.sub(xPlayer.PlayerData.charinfo.firstname, 1, 1) .. '. ' .. xPlayer.PlayerData.charinfo.lastname
                end
            end,
        }

        if Scully.UseItem then
            if Scully.AllowColours and Scully.UseItemColours then
                QBCore.Functions.CreateUseableItem('radio', function(source, item)
                    TriggerClientEvent('scully_radio:openRadio', source, 'default')
                end)
                QBCore.Functions.CreateUseableItem('radio_blue', function(source, item)
                    TriggerClientEvent('scully_radio:openRadio', source, 'blue')
                end)
                QBCore.Functions.CreateUseableItem('radio_brown', function(source, item)
                    TriggerClientEvent('scully_radio:openRadio', source, 'brown')
                end)
                QBCore.Functions.CreateUseableItem('radio_cherry', function(source, item)
                    TriggerClientEvent('scully_radio:openRadio', source, 'cherry')
                end)
                QBCore.Functions.CreateUseableItem('radio_green', function(source, item)
                    TriggerClientEvent('scully_radio:openRadio', source, 'green')
                end)
                QBCore.Functions.CreateUseableItem('radio_mint', function(source, item)
                    TriggerClientEvent('scully_radio:openRadio', source, 'mint')
                end)
                QBCore.Functions.CreateUseableItem('radio_orange', function(source, item)
                    TriggerClientEvent('scully_radio:openRadio', source, 'orange')
                end)
                QBCore.Functions.CreateUseableItem('radio_pink', function(source, item)
                    TriggerClientEvent('scully_radio:openRadio', source, 'pink')
                end)
                QBCore.Functions.CreateUseableItem('radio_purple', function(source, item)
                    TriggerClientEvent('scully_radio:openRadio', source, 'purple')
                end)
                QBCore.Functions.CreateUseableItem('radio_red', function(source, item)
                    TriggerClientEvent('scully_radio:openRadio', source, 'red')
                end)
                QBCore.Functions.CreateUseableItem('radio_yellow', function(source, item)
                    TriggerClientEvent('scully_radio:openRadio', source, 'yellow')
                end)
                QBCore.Functions.CreateUseableItem('radio_white', function(source, item)
                    TriggerClientEvent('scully_radio:openRadio', source, 'white')
                end)
            else
                QBCore.Functions.CreateUseableItem('radio', function(source, item)
                    TriggerClientEvent('scully_radio:openRadio', source)
                end)
            end
        end
    elseif Scully.Framework == 'es_extended' then
        local ESX = exports['es_extended']:getSharedObject()

        Scully.Functions = {
            GetPlayerName = function(source)
                local xPlayer = ESX.GetPlayerFromId(source)
                local firstName = xPlayer.get('firstName')
                if firstName then
                    return '', string.sub(firstName, 1, 1) .. '. ' .. xPlayer.get('lastName')
                else
                    return '', GetPlayerName(source)
                end
            end,
        }

        if Scully.UseItem then
            if Scully.AllowColours and Scully.UseItemColours then
                ESX.RegisterUsableItem('radio', function(source)
                    TriggerClientEvent('scully_radio:openRadio', source, 'default')
                end)
                ESX.RegisterUsableItem('radio_blue', function(source)
                    TriggerClientEvent('scully_radio:openRadio', source, 'blue')
                end)
                ESX.RegisterUsableItem('radio_brown', function(source)
                    TriggerClientEvent('scully_radio:openRadio', source, 'brown')
                end)
                ESX.RegisterUsableItem('radio_cherry', function(source)
                    TriggerClientEvent('scully_radio:openRadio', source, 'cherry')
                end)
                ESX.RegisterUsableItem('radio_green', function(source)
                    TriggerClientEvent('scully_radio:openRadio', source, 'green')
                end)
                ESX.RegisterUsableItem('radio_green', function(source)
                    TriggerClientEvent('scully_radio:openRadio', source, 'green')
                end)
                ESX.RegisterUsableItem('radio_orange', function(source)
                    TriggerClientEvent('scully_radio:openRadio', source, 'orange')
                end)
                ESX.RegisterUsableItem('radio_pink', function(source)
                    TriggerClientEvent('scully_radio:openRadio', source, 'pink')
                end)
                ESX.RegisterUsableItem('radio_purple', function(source)
                    TriggerClientEvent('scully_radio:openRadio', source, 'purple')
                end)
                ESX.RegisterUsableItem('radio_red', function(source)
                    TriggerClientEvent('scully_radio:openRadio', source, 'red')
                end)
                ESX.RegisterUsableItem('radio_yellow', function(source)
                    TriggerClientEvent('scully_radio:openRadio', source, 'yellow')
                end)
                ESX.RegisterUsableItem('radio_white', function(source)
                    TriggerClientEvent('scully_radio:openRadio', source, 'white')
                end)
            else
                ESX.RegisterUsableItem('radio', function(source)
                    TriggerClientEvent('scully_radio:openRadio', source, 'default')
                end)
            end
        end
    elseif Scully.Framework == 'scully_core' then
        Scully.Functions = {
            GetPlayerName = function(source)
                local xPlayer = exports.scully_core:GetPlayerDataFromId(source)
                if xPlayer.character then
                    return xPlayer.character.callsign .. ' | ', string.sub(xPlayer.character.firstname, 1, 1) .. '. ' .. xPlayer.character.lastname
                else
                    return '', GetPlayerName(source)
                end
            end,
        }
    else
        Scully.Functions = {
            GetPlayerName = function(source)
                return '', GetPlayerName(source)
            end,
        }

        RegisterNetEvent('scully_radio:getPermissions', function()
            local _source = source
            local permissions = {}
            for k, v in pairs(Scully.AcePerms) do
                if IsPlayerAceAllowed(_source, k) then
                    permissions[v] = true
                end
            end
            TriggerClientEvent('scully_radio:sendPermissions', _source, permissions)
        end)
    end
else
    local PlayerData = {}
    if Scully.Framework == 'qb-core' then
        local QBCore = exports['qb-core']:GetCoreObject()
        PlayerData = QBCore.Functions.GetPlayerData()

        RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
            PlayerData = QBCore.Functions.GetPlayerData()
        end)

        RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
            PlayerData = {}
            TriggerEvent('scully_radio:leaveChannel', true)
        end)

        RegisterNetEvent('QBCore:Player:SetPlayerData', function(newData)
            PlayerData = QBCore.Functions.GetPlayerData()
        end)

        RegisterNetEvent('QBCore:Client:OnJobUpdate', function(newJob)
            PlayerData.job = newJob
        end)

        RegisterNetEvent('qb-radio:onRadioDrop', function()
            TriggerEvent('scully_radio:leaveChannel', true)
        end)

        Scully.Functions = {
            HasAccess = function(channel)
                return Scully.WhitelistedAccess[channel][PlayerData.job.name]
            end,
            HasItem = function(item, cb)
                local hasItem = false
                for k, v in pairs(PlayerData.items) do
                    if v.name == item then
                        if PlayerData.items[k].amount > 0 then
                            hasItem = true
                            break
                        end
                    end
                end
                cb(hasItem)
            end,
            ShowNotification = function(text)
                if string.match(text, '~g~') then
                    QBCore.Functions.Notify(string.gsub(text, '~g~', ''), 'success')
                elseif string.match(text, '~r~') then
                    QBCore.Functions.Notify(string.gsub(text, '~r~', ''), 'error')
                else
                    QBCore.Functions.Notify(text, 'success')
                end
            end
        }
    elseif Scully.Framework == 'es_extended' then
        local ESX = exports['es_extended']:getSharedObject()
        PlayerData = ESX.GetPlayerData()

        RegisterNetEvent('esx:playerLoaded', function(newData)
            LocalPlayer.state:set('isLoggedIn', true, false)
            PlayerData = newData
        end)

        RegisterNetEvent('esx:onPlayerLogout', function()
            LocalPlayer.state:set('isLoggedIn', false, false)
            PlayerData = {}
            TriggerEvent('scully_radio:leaveChannel', true)
        end)

        RegisterNetEvent('esx:setPlayerData', function(key, val)
            if GetInvokingResource() == 'es_extended' then
                PlayerData[key] = val
            end
        end)

        RegisterNetEvent('esx:addInventoryItem', function(item, count)
            for k, v in ipairs(PlayerData.inventory) do
                if v.name == item then
                    PlayerData.inventory[k].count = count
                    break
                end
            end
        end)

        RegisterNetEvent('esx:removeInventoryItem', function(item, count)
            local foundRadio = false
            for k, v in ipairs(PlayerData.inventory) do
                if v.name == item then
                    PlayerData.inventory[k].count = count
                end
                if string.match(v.name, 'radio') then
                    if PlayerData.inventory[k].count > 0 then
                        foundRadio = true
                    end
                end
            end
            if not foundRadio then
                TriggerEvent('scully_radio:leaveChannel', true)
            end
        end)

        RegisterNetEvent('esx:setJob', function(JobInfo)
            PlayerData.job = JobInfo
        end)

        Scully.Functions = {
            HasAccess = function(channel)
                return Scully.WhitelistedAccess[channel][PlayerData.job.name]
            end,
            HasItem = function(item, cb)
                local hasItem = false
                for k, v in pairs(PlayerData.inventory) do
                    if v.name == item then
                        if PlayerData.inventory[k].count > 0 then
                            hasItem = true
                            break
                        end
                    end
                end
                cb(hasItem)
            end,
            ShowNotification = function(text)
                ESX.ShowNotification(text)
            end
        }
    elseif Scully.Framework == 'scully_core' then
        RegisterNetEvent('playerSpawned', function()
            LocalPlayer.state:set('isLoggedIn', true, false)
        end)

        Scully.Functions = {
            HasAccess = function(channel)
                local myJob = 'unemployed'
                if exports.scully_core:GetJobStatus('police') then
                    myJob = 'police'
                elseif exports.scully_core:GetJobStatus('ems') then
                    myJob = 'ems'
                end
                return Scully.WhitelistedAccess[channel][myJob]
            end,
            HasItem = function(item, cb)
                cb(true)
            end,
            ShowNotification = function(text)
                TriggerEvent('scully:core:shownotification', text)
            end
        }
    else
        CreateThread(function()
            TriggerServerEvent('scully_radio:getPermissions')
        end)

        RegisterNetEvent('scully_radio:sendPermissions', function(permissions)
            PlayerData.permissions = permissions
        end)

        RegisterNetEvent('playerSpawned', function()
            LocalPlayer.state:set('isLoggedIn', true, false)
        end)

        Scully.Functions = {
            HasAccess = function(channel)
                local isAllowed = false
                for k, v in ipairs(Scully.WhitelistedAccess[channel]) do
                    for _, myJob in ipairs(PlayerData.permissions) do
                        if v == myJob then
                            isAllowed = true
                            break
                        end
                    end
                end
                return isAllowed
            end,
            HasItem = function(item, cb)
                cb(true)
            end,
            ShowNotification = function(text)
                SetNotificationTextEntry('STRING')
                AddTextComponentString(text)
                DrawNotification(true, true)
            end
        }
    end
end