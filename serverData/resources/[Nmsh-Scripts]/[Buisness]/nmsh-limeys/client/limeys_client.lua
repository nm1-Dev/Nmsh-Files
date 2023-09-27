local QBCore = exports['qb-core']:GetCoreObject()



---------------------------------< CLEAR PEDS START >---------------------------

--THIS CLEARS THE MLO OF PEDS FROM THE CENTRE OF THE MLO AT A RADIUS OF 20.0 AS SOMETIMES PED SPAWN INSIDE THE BUILDING AND KEEP TRYING TO GO THROUGH WALLS
ClearAreaOfPeds(257.95, -1022.84, 29.31, 20.0, true)

---------------------------------< CLEAR PEDS END >---------------------------




-------------------------------------------< BLIP SECTION START >--------------------------------
--Blips
CreateThread(function()
    for k, v in pairs(Config.Blips) do
        if v.useblip then
            v.blip = AddBlipForCoord(v['coords'].x, v['coords'].y, v['coords'].z)
            SetBlipSprite(v.blip, v.id)
            SetBlipDisplay(v.blip, 4)
            SetBlipScale(v.blip, v.scale)
            SetBlipColour(v.blip, v.colour)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(v.title)
            EndTextCommandSetBlipName(v.blip)
        end
    end
end)
-------------------------------------------------< BLIP SECTION END >--------------------------------



---------------------------------------------------< JOB SECTION START >----------------------------------------
local onDuty = false
PlayerJob = {}


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
   QBCore.Functions.GetPlayerData(function(PlayerData)
       PlayerJob = PlayerData.job
   end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
   PlayerJob = JobInfo
   onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
   onDuty = duty
end)

RegisterNetEvent("lusty94_limeys:client:ToggleDuty")
AddEventHandler("lusty94_limeys:client:ToggleDuty", function()
   TriggerServerEvent("QBCore:ToggleDuty")
end)
---------------------------------------------------< JOB SECTION END >----------------------------------------




-------------------------------------------------< MAKING SMOOTHIES START >---------------------------------
--Prepare Mango Smoothie
RegisterNetEvent("lusty94_limeys:client:PrepareMangoSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:MangoSmoothie', function(HasItems)  
            if HasItems then
                QBCore.Functions.Progressbar("mango_smoothie", "Preparing Mango Smoothie", Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_limeys:server:CreateMangoSmoothie')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("You Prepared A Mango Smoothie!", "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Prepared Smoothie', 'You Prepared A Mango Smoothie!', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', 'You Prepared A Mango Smoothie!')
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Prepared Smoothie', 'You Prepared A Mango Smoothie!', 'success', Config.CoreSettings.Notify.Length.Success)
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'Cancelled') 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'You Are Missing Items')
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Must Be Clocked In To Work to Do This!", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not Signed In','You Must Be Clocked In To Work to Do This!', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Must Be Clocked In To Work To Do This!')
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not Signed In', 'You Must Be Clocked In To Work to Do This!', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end
end) 

--Prepare Peach Smoothie
RegisterNetEvent("lusty94_limeys:client:PreparePeachSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:PeachSmoothie', function(HasItems)  
            if HasItems then
                QBCore.Functions.Progressbar("peach_smoothie", "Preparing Peach Smoothie", Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_limeys:server:CreatePeachSmoothie')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("You Prepared A Peach Smoothie!", "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Prepared Smoothie', 'You Prepared A Peach Smoothie!', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', 'You Prepared A Peach Smoothie!')
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Prepared Smoothie', 'You Prepared A Peach Smoothie!', 'success', Config.CoreSettings.Notify.Length.Success)
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'Cancelled') 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'You Are Missing Items')
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Must Be Clocked In To Work to Do This!", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not Signed In','You Must Be Clocked In To Work to Do This!', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Must Be Clocked In To Work To Do This!')
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not Signed In', 'You Must Be Clocked In To Work to Do This!', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end
end) 

--Prepare Lychee Smoothie
RegisterNetEvent("lusty94_limeys:client:PrepareLycheeSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:LycheeSmoothie', function(HasItems)  
            if HasItems then
                QBCore.Functions.Progressbar("lychee_smoothie", "Preparing Lychee Smoothie", Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_limeys:server:CreateLycheeSmoothie')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("You Prepared A Lychee Smoothie!", "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Prepared Smoothie', 'You Prepared A Lychee Smoothie!', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', 'You Prepared A Lychee Smoothie!')
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Prepared Smoothie', 'You Prepared A Lychee Smoothie!', 'success', Config.CoreSettings.Notify.Length.Success)
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'Cancelled') 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'You Are Missing Items')
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Must Be Clocked In To Work to Do This!", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not Signed In','You Must Be Clocked In To Work to Do This!', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Must Be Clocked In To Work To Do This!')
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not Signed In', 'You Must Be Clocked In To Work to Do This!', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end
end) 

--Prepare Pineapple Smoothie
RegisterNetEvent("lusty94_limeys:client:PreparePineappleSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:PineappleSmoothie', function(HasItems)  
            if HasItems then
                QBCore.Functions.Progressbar("pineapple_smoothie", "Preparing Pineapple Smoothie", Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_limeys:server:CreatePineappleSmoothie')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("You Prepared A Pineapple Smoothie!", "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Prepared Smoothie', 'You Prepared A Pineapple Smoothie!', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', 'You Prepared A Pineapple Smoothie!')
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Prepared Smoothie', 'You Prepared A Pineapple Smoothie!', 'success', Config.CoreSettings.Notify.Length.Success)
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'Cancelled') 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'You Are Missing Items')
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Must Be Clocked In To Work to Do This!", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not Signed In','You Must Be Clocked In To Work to Do This!', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Must Be Clocked In To Work To Do This!')
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not Signed In', 'You Must Be Clocked In To Work to Do This!', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end
end)

--Prepare Coconut Smoothie
RegisterNetEvent("lusty94_limeys:client:PrepareCoconutSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:CoconutSmoothie', function(HasItems)  
            if HasItems then
                QBCore.Functions.Progressbar("coconut_smoothie", "Preparing Coconut Smoothie", Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_limeys:server:CreateCoconutSmoothie')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("You Prepared A Coconut Smoothie!", "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Prepared Smoothie', 'You Prepared A Coconut Smoothie!', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', 'You Prepared A Coconut Smoothie!')
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Prepared Smoothie', 'You Prepared A Coconut Smoothie!', 'success', Config.CoreSettings.Notify.Length.Success)
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'Cancelled') 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'You Are Missing Items')
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Must Be Clocked In To Work to Do This!", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not Signed In','You Must Be Clocked In To Work to Do This!', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Must Be Clocked In To Work To Do This!')
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not Signed In', 'You Must Be Clocked In To Work to Do This!', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end
end) 

--Prepare Strawberry Smoothie
RegisterNetEvent("lusty94_limeys:client:PrepareStrawberrySmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:StrawberrySmoothie', function(HasItems)  
            if HasItems then
                QBCore.Functions.Progressbar("strawberry_smoothie", "Preparing Strawberry Smoothie", Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_limeys:server:CreateStrawberrySmoothie')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("You Prepared A Strawberry Smoothie!", "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Prepared Smoothie', 'You Prepared A Strawberry Smoothie!', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', 'You Prepared A Strawberry Smoothie!')
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Prepared Smoothie', 'You Prepared A Strawberry Smoothie!', 'success', Config.CoreSettings.Notify.Length.Success)
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'Cancelled') 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'You Are Missing Items')
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Must Be Clocked In To Work to Do This!", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not Signed In','You Must Be Clocked In To Work to Do This!', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Must Be Clocked In To Work To Do This!')
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not Signed In', 'You Must Be Clocked In To Work to Do This!', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end
end)

--Prepare PassionFruit Smoothie
RegisterNetEvent("lusty94_limeys:client:PreparePassionFruitSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:PassionFruitSmoothie', function(HasItems)  
            if HasItems then
                QBCore.Functions.Progressbar("passionFruit_smoothie", "Preparing Passion Fruit Smoothie", Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_limeys:server:CreatePassionFruitSmoothie')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("You Prepared A Passion Fruit Smoothie!", "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Prepared Smoothie', 'You Prepared A Passion Fruit Smoothie!', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', 'You Prepared A Passion Fruit Smoothie!')
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Prepared Smoothie', 'You Prepared A Passion Fruit Smoothie!', 'success', Config.CoreSettings.Notify.Length.Success)
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'Cancelled') 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'You Are Missing Items')
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Must Be Clocked In To Work to Do This!", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not Signed In','You Must Be Clocked In To Work to Do This!', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Must Be Clocked In To Work To Do This!')
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not Signed In', 'You Must Be Clocked In To Work to Do This!', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end
end) 

--Prepare Lemon Smoothie
RegisterNetEvent("lusty94_limeys:client:PrepareLemonSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:LemonSmoothie', function(HasItems)  
            if HasItems then
                QBCore.Functions.Progressbar("lemon_smoothie", "Preparing Lemon Smoothie", Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_limeys:server:CreateLemonSmoothie')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("You Prepared A Lemon Smoothie!", "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Prepared Smoothie', 'You Prepared A Lemon Smoothie!', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', 'You Prepared A Lemon Smoothie!')
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Prepared Smoothie', 'You Prepared A Lemon Smoothie!', 'success', Config.CoreSettings.Notify.Length.Success)
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'Cancelled') 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'You Are Missing Items')
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Must Be Clocked In To Work to Do This!", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not Signed In','You Must Be Clocked In To Work to Do This!', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Must Be Clocked In To Work To Do This!')
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not Signed In', 'You Must Be Clocked In To Work to Do This!', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end
end)  

--Prepare Almond Smoothie
RegisterNetEvent("lusty94_limeys:client:PrepareAlmondSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:AlmondSmoothie', function(HasItems)  
            if HasItems then
                QBCore.Functions.Progressbar("almond_smoothie", "Preparing Almond Smoothie", Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_limeys:server:CreateAlmondSmoothie')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("You Prepared A Almond Smoothie!", "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Prepared Smoothie', 'You Prepared A Almond Smoothie!', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', 'You Prepared A Almond Smoothie!')
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Prepared Smoothie', 'You Prepared A Almond Smoothie!', 'success', Config.CoreSettings.Notify.Length.Success)
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'Cancelled') 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'You Are Missing Items')
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Must Be Clocked In To Work to Do This!", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not Signed In','You Must Be Clocked In To Work to Do This!', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Must Be Clocked In To Work To Do This!')
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not Signed In', 'You Must Be Clocked In To Work to Do This!', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end
end) 
-------------------------------------------------< MAKING SMOOTHIES END >-----------------------------------




-------------------------------------------------< MAKING HOT DRINKS START >-----------------------------------
--Prepare Tea
RegisterNetEvent("lusty94_limeys:client:PrepareTea", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:CoffeeCup', function(HasItems)  
            if HasItems then
                QBCore.Functions.Progressbar("prepare_tea", "Preparing Cup of Tea", Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_limeys:server:CreateTea')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("You Prepared A Cup of Tea!", "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Prepared Smoothie', 'You Prepared A Cup of Tea!', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', 'You Prepared A Cup of Tea!')
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Prepared Smoothie', 'You Prepared A Cup of Tea!', 'success', Config.CoreSettings.Notify.Length.Success)
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'Cancelled') 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'You Are Missing Items')
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Must Be Clocked In To Work to Do This!", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not Signed In','You Must Be Clocked In To Work to Do This!', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Must Be Clocked In To Work To Do This!')
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not Signed In', 'You Must Be Clocked In To Work to Do This!', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end
end) 

--Prepare Coffee
RegisterNetEvent("lusty94_limeys:client:PrepareCoffee", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:CoffeeCup', function(HasItems)  
            if HasItems then
                QBCore.Functions.Progressbar("prepare_coffee", "Preparing Cup of Coffee", Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_limeys:server:CreateCoffee')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("You Prepared A Cup of Coffee!", "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Prepared Smoothie', 'You Prepared A Cup of Coffee!', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', 'You Prepared A Cup of Coffee!')
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Prepared Smoothie', 'You Prepared A Cup of Coffee!', 'success', Config.CoreSettings.Notify.Length.Success)
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'Cancelled') 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'You Are Missing Items')
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Must Be Clocked In To Work to Do This!", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not Signed In','You Must Be Clocked In To Work to Do This!', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Must Be Clocked In To Work To Do This!')
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not Signed In', 'You Must Be Clocked In To Work to Do This!', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end
end) 

--Prepare HotChocolate
RegisterNetEvent("lusty94_limeys:client:PrepareHotChocolate", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:CoffeeCup', function(HasItems)  
            if HasItems then
                QBCore.Functions.Progressbar("prepare_hotchocolate", "Preparing Cup of Hot Chocolate", Config.CoreSettings.ProgressBar.Times.PrepareSmoothies, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "amb@prop_human_parking_meter@female@base",
                    anim = "base_female",
                    flags = 41,
                }, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('lusty94_limeys:server:CreateHotChocolate')
                        if Config.CoreSettings.Notify.Type == 'qb' then
                            QBCore.Functions.Notify("You Prepared A Cup of Hot Chocolate!", "success", Config.CoreSettings.Notify.Length.Success)
                        elseif Config.CoreSettings.Notify.Type == 'okok' then
                            exports['okokNotify']:Alert('Prepared Smoothie', 'You Prepared A Cup of Hot Chocolate!', Config.CoreSettings.Notify.Length.Success, 'success', Config.CoreSettings.Notify.Sound)
                        elseif Config.CoreSettings.Notify.Type == 'mythic' then
                            exports['mythic_notify']:DoHudText('success', 'You Prepared A Cup of Hot Chocolate!')
                        elseif Config.CoreSettings.Notify.Type == 'boii' then
                            exports['boii_ui']:notify('Prepared Smoothie', 'You Prepared A Cup of Hot Chocolate!', 'success', Config.CoreSettings.Notify.Length.Success)
                        end
                end, function()
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("Cancelled", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Cancelled','Cancelled', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'Cancelled') 
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Cancelled', 'Cancelled', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end)
                else
                    ClearPedTasks(PlayerPedId())
                    if Config.CoreSettings.Notify.Type == 'qb' then
                        QBCore.Functions.Notify("You Are Missing Items", "error", Config.CoreSettings.Notify.Length.Error)
                    elseif Config.CoreSettings.Notify.Type == 'okok' then
                        exports['okokNotify']:Alert('Missing Items','You Are Missing Items', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
                    elseif Config.CoreSettings.Notify.Type == 'mythic' then
                        exports['mythic_notify']:DoHudText('error', 'You Are Missing Items')
                    elseif Config.CoreSettings.Notify.Type == 'boii' then
                        exports['boii_ui']:notify('Missing Items', 'You Are Missing Items', 'error', Config.CoreSettings.Notify.Length.Error)
                    end
                end
            end)
    else 
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Must Be Clocked In To Work to Do This!", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not Signed In','You Must Be Clocked In To Work to Do This!', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic' then
            exports['mythic_notify']:DoHudText('error', 'You Must Be Clocked In To Work To Do This!')
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not Signed In', 'You Must Be Clocked In To Work to Do This!', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end
end) 
-------------------------------------------------< MAKING HOT DRINKS END >-----------------------------------




-----------------------------------------------------< STASHES SECTION START >---------------------------------------------------
RegisterNetEvent("lusty94_limeys:client:OpenCollectionTray", function()
    TriggerEvent("inventory:client:SetCurrentStash", "collectiontray")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "collectiontray", {
        maxweight = Config.InteractionLocations.CollectionTray.StashSize,
        slots = Config.InteractionLocations.CollectionTray.StashSlots,
    })
end)

RegisterNetEvent("lusty94_limeys:client:OpenStorageFridge", function()
    if onDuty then
        TriggerEvent("inventory:client:SetCurrentStash", "limeysdrinksfridge")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "limeysdrinksfridge", {
            maxweight = Config.InteractionLocations.Storage.Fridge.StashSize,
            slots = Config.InteractionLocations.Storage.Fridge.StashSlots,
        })
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Must Be Clocked In To Work to Do This!", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not Signed In','You Must Be Clocked In To Work to Do This!', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic'  then
            exports['mythic_notify']:DoHudText('error', 'You Must Be Clocked In To Work To Do This!')
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not Signed In', 'You Must Be Clocked In To Work to Do This!', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end
end)

AddEventHandler("lusty94_limeys:client:IngredientsTray", function()
    if onDuty then
        if Config.CoreSettings.Shop.Type == 'qb'then
            TriggerServerEvent("inventory:server:OpenInventory", "shop", "IngredientsTray", Config.InteractionLocations.Ingredients.Items)
        elseif Config.CoreSettings.Shop.Type == 'jim' then
            TriggerServerEvent("jim-shops:ShopOpen", "shop", "IngredientsTray", Config.InteractionLocations.Ingredients.Items)
        end
    else
        if Config.CoreSettings.Notify.Type == 'qb' then
            QBCore.Functions.Notify("You Must Be Clocked In To Work to Do This!", "error", Config.CoreSettings.Notify.Length.Error)
        elseif Config.CoreSettings.Notify.Type == 'okok' then
            exports['okokNotify']:Alert('Not Signed In','You Must Be Clocked In To Work to Do This!', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound) 
        elseif Config.CoreSettings.Notify.Type == 'mythic'  then
            exports['mythic_notify']:DoHudText('error', 'You Must Be Clocked In To Work To Do This!')
        elseif Config.CoreSettings.Notify.Type == 'boii' then
            exports['boii_ui']:notify('Not Signed In', 'You Must Be Clocked In To Work to Do This!', 'error', Config.CoreSettings.Notify.Length.Error)
        end
    end
end)

AddEventHandler("lusty94_limeys:client:SnackShelf", function()
    if Config.CoreSettings.Shop.Type == 'qb' then
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "SnackShelf", Config.InteractionLocations.SnackShelf.Items)
    elseif Config.CoreSettings.Shop.Type == 'jim' then
        TriggerServerEvent("jim-shops:ShopOpen", "shop", "SnackShelf", Config.InteractionLocations.SnackShelf.Items)
    end
end)
-----------------------------------------------------< STASHES SECTION END >---------------------------------------------------







-----------------------------------------------------< BILLING SECTION START >---------------------------------------------------
RegisterNetEvent("lusty94_limeys:client:bill")
AddEventHandler("lusty94_limeys:bill", function()
        if onDuty then
            local bill = exports['nmsh-input']:ShowInput({
                header = "Create Invoice",
                submitText = "Send Invoice",
                inputs = {
                    {
                        text = "Server ID(#)",
                        name = "citizenid", -- name of the input should be unique otherwise it might override
                        type = "text", -- type of the input
                        isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                    },
                    {
                        text = "Total Bill Price: "..Config.InteractionLocations.Payment.CashSymbol, -- text you want to be displayed as a place holder
                        name = "billprice", -- name of the input should be unique otherwise it might override
                        type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                        isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                    }
                    
                }
            })
            if bill ~= nil then
                if bill.citizenid == nil or bill.billprice == nil then 
                    return 
                end
                TriggerServerEvent("lusty94_limeys:server:bill:player", bill.citizenid, bill.billprice)
            end
        else
            if Config.CoreSettings.Notify.Type == 'qb' then
                QBCore.Functions.Notify("You Must Be Clocked In To Work to Do This!", "error", Config.CoreSettings.Notify.Length.Error)
            elseif Config.CoreSettings.Notify.Type == 'okok' then
                exports['okokNotify']:Alert('Not Signed In','You Must Be Clocked In To Work to Do This!', Config.CoreSettings.Notify.Length.Error, 'error', Config.CoreSettings.Notify.Sound)
            elseif Config.CoreSettings.Notify.Type == 'mythic'  then
                exports['mythic_notify']:DoHudText('error', 'You Must Be Clocked In To Work To Do This!')
            elseif Config.CoreSettings.Notify.Type == 'boii' then
                exports['boii_ui']:notify('Not Signed In', 'You Must Be Clocked In To Work to Do This!', 'error', Config.CoreSettings.Notify.Length.Error)
            end
        end
end)
-----------------------------------------------------< BILLING SECTION END >---------------------------------------------------




AddEventHandler('onResourceStop', function(resourceName) if resourceName ~= GetCurrentResourceName() then return end
if (GetCurrentResourceName() ~= resourceName) then
end
    print('^5--<^3!^5>-- ^7Lusty94 ^5| ^5--<^3!^5>-- ^Limeys V1.0.0 Stopped Successfully ^5--<^3!^5>--^7')
    exports['nmsh-target']:RemoveZone("DutyZone")
    exports['nmsh-target']:RemoveZone("BossMenuZone")
    exports['nmsh-target']:RemoveZone("PaymentZone")
    exports['nmsh-target']:RemoveZone("CollectionTrayZone")
    exports['nmsh-target']:RemoveZone("SmoothieMachineZone")
    exports['nmsh-target']:RemoveZone("HotDrinksMachineZone")
    exports['nmsh-target']:RemoveZone("StorageFridgeZone")
    exports['nmsh-target']:RemoveZone("IngredientsTrayZone")
    exports['nmsh-target']:RemoveZone("SnackShelfZone")
end)