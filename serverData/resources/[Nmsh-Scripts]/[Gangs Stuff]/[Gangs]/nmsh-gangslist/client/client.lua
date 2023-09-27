local nmsh = exports[Nmsh.FilesSetup.CoreName]:GetCoreObject()
local PlayerGang = nmsh.Functions.GetPlayerData().gang
local listOpened = false
local New = ""

AddEventHandler('onResourceStart', function(resource)--if you restart the resource
    if resource == GetCurrentResourceName() then
        Wait(200)
        PlayerGang = nmsh.Functions.GetPlayerData().gang
    end
end)

RegisterNetEvent(Nmsh.FilesSetup.CoreTriggerName..':Client:OnPlayerLoaded', function()
    PlayerGang = nmsh.Functions.GetPlayerData().gang
end)

RegisterNetEvent(Nmsh.FilesSetup.CoreTriggerName..':Client:OnGangUpdate', function(InfoGang)
    PlayerGang = InfoGang
    if listOpened then
        listOpened = false
        SendNUIMessage({
            action = 'close',
        })
    end
end)

RegisterCommand('+openganglist', function()
    if Nmsh.Gangs[PlayerGang.name] == nil then return print('You cannot open the menu') end
    if PlayerGang.name == Nmsh.Gangs[PlayerGang.name].role then
        nmsh.Functions.TriggerCallback('nmsh-gangmenu:server:GetGangMember', function(gangers, gangTotal)
            local html = ""
            if #gangers > 0 then
                for k, v in ipairs(gangers) do 
                    -- if v.vehicle ~= nil and v.vehicle ~= 0 then
                        local ped = GetPlayerPed(GetPlayerFromServerId(v.id))
                        local Vehicle = GetVehiclePedIsIn(ped)
                        local Vehicleclass = GetVehicleClass(Vehicle)
                        gangers[k].Vehicleclass = Vehicleclass

                        local vehIcon = ""
                        if gangers[k].Vehicleclass == 1 or gangers[k].Vehicleclass == 2 or gangers[k].Vehicleclass == 3 or gangers[k].Vehicleclass == 4 or gangers[k].Vehicleclass == 5 or gangers[k].Vehicleclass == 6 or gangers[k].Vehicleclass == 7 or gangers[k].Vehicleclass == 11 then
                            vehIcon = 'fas fa-car'
                        elseif gangers[k].Vehicleclass == 8 then
                            vehIcon = 'fas fa-motorcycle'
                        elseif gangers[k].Vehicleclass == 9 then
                            vehIcon = 'fas fa-truck-monster'
                        elseif gangers[k].Vehicleclass == 10 then
                            vehIcon = 'fas fa-truck-ramp-box'
                        elseif gangers[k].Vehicleclass == 12 then
                            vehIcon = 'fas fa-van-shuttle'
                        elseif gangers[k].Vehicleclass == 13 then
                            vehIcon = 'fas fa-person-biking'
                        elseif gangers[k].Vehicleclass == 14 then
                            vehIcon = 'fas fa-ship vehicles'
                        elseif gangers[k].Vehicleclass == 15 then
                            vehIcon = 'fas fa-helicopter'
                        elseif gangers[k].Vehicleclass == 16 then
                            vehIcon = 'fas fa-jet-fighter'
                        elseif gangers[k].Vehicleclass == 17 then
                            vehIcon = 'fas fa-taxi'
                        elseif gangers[k].Vehicleclass == 18 then
                            vehIcon = 'fas fa-car-on'
                        elseif gangers[k].Vehicleclass == 19 then
                            vehIcon = 'fas fa-truck-field'
                        elseif gangers[k].Vehicleclass == 20 then
                            vehIcon = 'fas fa-truck-moving'
                        elseif gangers[k].Vehicleclass == 21 then
                            vehIcon = 'fas fa-train-tram'
                        elseif gangers[k].Vehicleclass == 0 then
                            vehIcon = 'fas fa-person'
                        end
                    -- end
                    html = html .. '<div class="gangmember"><span id="radio">' .. v.radioC .. '</span> | <span class="name">' .. v.name ..  '</span> | <span>' .. v.grade .. '</span> | <span id="vehicleicon"><i class="'..vehIcon..'"></i></span></div>'
                end
                New = html
                if not listOpened then
                    listOpened = true
                    SendNuiMessage(json.encode({
                        action = 'open',
                        gangInfo = PlayerGang,
                        gangImage = Nmsh.Gangs[PlayerGang.name].Image,
                        gangColor = Nmsh.Gangs[PlayerGang.name].Color,
                        ShowRadio = Nmsh.Gangs[PlayerGang.name].ShowRadio,
                        ShowCarStatus = Nmsh.Gangs[PlayerGang.name].ShowCarStatus,
                        gangTotal = gangTotal,
                        gangers = New
                    }))
                else
                    listOpened = false
                    SendNUIMessage({
                        action = 'close',
                    })
                end
            end
        end, PlayerGang.name)
    end
end)

RegisterKeyMapping('+openganglist', 'Gangs List', 'keyboard', Nmsh.Settings.OpenKeyBind)