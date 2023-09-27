local QBCore = exports[Config.Core]:GetCoreObject()
local BossNPC = nil
local BossBoxProp = nil
local BeggingBoxProp = nil
local BeggingGuiterProp = nil
local BossBlip = nil

local JobStarted = false
local BoxSpawned = false
local BeggingStarted = false

CreateThread(function()
    while true do 
        if BeggingStarted and not IsEntityPlayingAnim(PlayerPedId(), "switch@trevor@guitar_beatdown", "001370_02_trvs_8_guitar_beatdown_idle_busker", 3) then
            LoadAnimDict("switch@trevor@guitar_beatdown")
            TaskPlayAnim(PlayerPedId(), "switch@trevor@guitar_beatdown", "001370_02_trvs_8_guitar_beatdown_idle_busker", 5.0, -1, -1, 51, 0, false, false, false)
        end
        Wait(1500)
    end
end)

CreateThread(function()
    LoadModel(Config.BeggingBossModel)
    BossNPC = CreatePed(0, GetHashKey(Config.BeggingBossModel), Config.BeggingBossLoc, false, true)
    SetEntityAsMissionEntity(BossNPC, true, true)
    SetBlockingOfNonTemporaryEvents(BossNPC, true)
    SetEntityInvincible(BossNPC, true)
    Wait(1000)
    FreezeEntityPosition(BossNPC, true)

    local dict = 'anim@heists@box_carry@'
    local stage = "idle"

    LoadAnimDict(dict)
    TaskPlayAnim(BossNPC, dict, stage, 5.0, -1, -1, 50, 0, false, false, false)

    LoadModel(Config.BeggingBoxModel)
    BossBoxProp = CreateObject(GetHashKey(Config.BeggingBoxModel), Config.BeggingBossLoc, false, true, false)
    AttachEntityToEntity(BossBoxProp, BossNPC, GetPedBoneIndex(BossNPC, 18905), 0.20, 0.20, 0.28, -130.0, 110.0, 0.0, 20.0, true, true, false, true, 1, true)

    exports[Config.Target]:AddTargetEntity(BossNPC, { 
        options = { 
            { 
                icon = 'fas fa-briefcase', 
                label = 'Begging Menu',  
                event = "kael-beggar:client:beggingmenu",
            },
        },
        distance = 1.5, 
    })

    BossBlip = AddBlipForEntity(BossNPC)
    SetBlipSprite(BossBlip, 197)
    SetBlipColour(BossBlip, 2)
    SetBlipDisplay(BossBlip, 4)
    SetBlipScale(BossBlip, 0.6)
    SetBlipAsShortRange(BossBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Begging Boss')
    EndTextCommandSetBlipName(BossBlip)
end)

RegisterNetEvent("kael-beggar:client:beggingmenu", function()
    exports[Config.Menu]:openMenu({
        {
            header = 'Begging Menu',
            icon = 'fab fa-bitbucket',
            txt = "This is the Begging Menu",
            isMenuHeader = true,
        },
        {
            header = 'Start Begging!',
            txt = 'You can start begging any time!',
            icon = 'fab fa-creative-commons-nc',
            params = {
                event = 'kael-beggar:client:startbeggingjob',
            }
        },
        {
            header = 'Buy Items',
            txt = 'You can buy begging items!',
            icon = 'fab fa-btc',
            params = {
                event = 'kael-beggar:client:buyitemmenu',
            }
        },
    })
end)

RegisterNetEvent('kael-beggar:client:buyitemmenu', function()
    exports[Config.Menu]:openMenu({
        {
            header = 'Items Menu',
            icon = 'fab fa-btc',
            txt = "This is the item Menu",
            isMenuHeader = true,
        },
        {
            header = 'Begging Box',
            txt = 'Price: $' .. Config.BoxPrice,
            icon = 'fas fa-box-open',
            params = {
                event = 'kael-beggar:client:buyitems',
                args = {
                    item = 'begging_box',
                }
            }
        },
        {
            header = 'Guitar',
            txt = 'Price: $' .. Config.GuitarPrice,
            icon = 'fas fa-guitar',
            params = {
                event = 'kael-beggar:client:buyitems',
                args = {
                    item = 'begging_guitar',
                }
            }
        },
    })
end)

RegisterNetEvent("kael-beggar:client:startbeggingjob", function()
    QBCore.Functions.Notify("Permission Granted!", "success", 3000)
    JobStarted = true
end)

RegisterNetEvent("kael-beggar:client:beggingboxspawn", function()
    if not JobStarted then
        QBCore.Functions.Notify("You need to get permission from the boss!", "error", 3000)
        return false
    end

    if BoxSpawned then 
        QBCore.Functions.Notify("You already have a box placed!", "error", 3000)
        return false
    end
    
    QBCore.Functions.Progressbar("puttingbeggingbox", "Placing The Box..", 1500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = true,
        disableCombat = true,
    }, {
        animDict = "random@domestic",
        anim = "pickup_low",
        flags = 49,
    }, {}, {}, function() -- Done                
        local PlayerPed = PlayerPedId()
        local PlayerCoords = GetEntityCoords(PlayerPed)
        local ForwardCoords = GetEntityForwardVector(PlayerPed)
        local x, y, z = table.unpack(PlayerCoords + ForwardCoords * 0.8)

        LoadModel(Config.BeggingBoxModel)
        BeggingBoxProp = CreateObject(GetHashKey(Config.BeggingBoxModel), x, y, z, true, true, false)
        PlaceObjectOnGroundProperly(BeggingBoxProp)
        Wait(500)
        FreezeEntityPosition(BeggingBoxProp, true)
        BoxSpawned = true

        exports[Config.Target]:AddTargetEntity(BeggingBoxProp, { 
            options = { 
                { 
                    icon = 'fas fa-briefcase', 
                    label = 'Start Begging!',  
                    event = "kael-beggar:client:startbeggingonstreet",
                    canInteract = function(entity) 
                        if not BeggingStarted then return true end
                        return false
                    end,
                },
                { 
                    icon = 'fas fa-briefcase', 
                    label = 'Stop Begging!',  
                    event = "",
                    canInteract = function(entity) 
                        if BeggingStarted then return true end
                        return false
                    end,
                    action = function(entity)
                        BeggingStarted = false
                        DeleteEntity(BeggingGuiterProp)
                        ClearPedTasks(PlayerPedId())
                    end
                },
                { 
                    icon = 'fas fa-briefcase', 
                    label = 'Pickup Box',  
                    event = "",
                    canInteract = function(entity) 
                        if not BeggingStarted then return true end
                        return false
                    end,
                    action = function(entity)
                        BoxSpawned = false
                        DeleteEntity(BeggingBoxProp)
                    end
                },
            },
            distance = 1.5, 
        })
    end)
end)

RegisterNetEvent("kael-beggar:client:startbeggingonstreet", function()
    QBCore.Functions.TriggerCallback("kael-beggar:server:checkbeggingguitar", function(Check)
        if Check then 
            local PlayerPed = PlayerPedId()
            local PlayerCoords = GetEntityCoords(PlayerPed)
            LoadAnimDict("switch@trevor@guitar_beatdown")
            TaskPlayAnim(PlayerPed, "switch@trevor@guitar_beatdown", "001370_02_trvs_8_guitar_beatdown_idle_busker", 5.0, -1, -1, 51, 0, false, false, false)

            LoadModel("prop_acc_guitar_01")
            BeggingGuiterProp = CreateObject(GetHashKey("prop_acc_guitar_01"), PlayerCoords, true, true, false)
            AttachEntityToEntity(BeggingGuiterProp, PlayerPed, GetPedBoneIndex(PlayerPed, 24818), -0.05, 0.31, 0.1, 0.0, 20.0, 150.0, 20.0, true, true, false, true, 1, true)
            BeggingStarted = true
            CallNpcAudiance()
        end
    end)    
end)


RegisterNetEvent("kael-beggar:client:buyitems", function(data)
    QBCore.Functions.TriggerCallback("kael-beggar:server:checkmoneyforitem", function(D)
        if D then 
            TriggerEvent("kael-beggar:client:buyitemmenu")
        end
    end, data.item)
end)


function CallNpcAudiance()
    while true do 
        if BeggingStarted then 
            local PlayerPed = PlayerPedId()
            local PlayerCoords = GetEntityCoords(PlayerPed)
            local BoxCoords = GetEntityCoords(BeggingBoxProp)
            local IgnoredPeds = {}
            if next(IgnoredPeds) == nil then
                for _, player in ipairs(GetActivePlayers()) do
                    local ped = GetPlayerPed(player)
                    IgnoredPeds[#IgnoredPeds+1] = ped
                end
            end
            local NPCAudPed, NPCDistence = QBCore.Functions.GetClosestPed(BoxCoords, IgnoredPeds)

            if NPCDistence < 15 then
                TaskGoToCoordAnyMeans(NPCAudPed, BoxCoords, 1.0, 0, false, 1, 0.0)
                repeat 
                    Wait(10)
                until (IsEntityAtCoord(NPCAudPed, BoxCoords, 1.0, 1.0, 1.0, false, false, 0))            
                ClearPedTasks(NPCAudPed)
                SetEntityAsMissionEntity(NPCAudPed, true, true)
                SetBlockingOfNonTemporaryEvents(NPCAudPed, true)
                TaskLookAtEntity(NPCAudPed, PlayerPed, 5500.0, 2048, 3)
                TaskTurnPedToFaceEntity(NPCAudPed, BeggingBoxProp, 5500)
                Wait(3000)
                LoadAnimDict("amb@world_human_cheering@male_a")
                TaskPlayAnim(NPCAudPed, "amb@world_human_cheering@male_a", "base", 5.0, -1, -1, 51, 0, false, false, false)
                Wait(5000)

                ClearPedTasks(NPCAudPed)
                local MomeyModel = "p_banknote_onedollar_s"
                LoadModel(MomeyModel)
                local MoneyProp = CreateObject(GetHashKey(MomeyModel), GetEntityCoords(NPCAudPed), false, true, false)
                AttachEntityToEntity(MoneyProp, NPCAudPed, GetPedBoneIndex(NPCAudPed, 6286), 0.13, 0.0, 0.0, 0.0, 0.0, 90.0, 20.0, true, true, false, true, 1, true)

                LoadAnimDict("random@domestic")
                TaskPlayAnim(NPCAudPed, "random@domestic", "pickup_low", 5.0, -1, -1, 50, 0, false, false, false)
                local token = math.random(1, 9999)
                local amount = token
                TriggerServerEvent("kael-beggar:server:giverewardmoney", amount)
                Wait(1000)
                DeleteEntity(MoneyProp)

                Wait(2000)
                ClearPedTasks(NPCAudPed)
                SetEntityAsMissionEntity(NPCAudPed, false, false)
                SetEntityAsNoLongerNeeded(NPCAudPed)
            end
        end        
        Wait(20000)
    end
end




function LoadModel(model)
    RequestModel(GetHashKey(model))
    while not HasModelLoaded(GetHashKey(model)) do
        Wait(0)
    end
end

function LoadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

RegisterNetEvent("onResourceStop", function()
    DeleteEntity(BossNPC)
    DeleteEntity(BossBoxProp)
    DeleteEntity(BeggingBoxProp)
    DeleteEntity(BeggingGuiterProp)
    RemoveBlip(BossBlip)
end)

-- RegisterCommand("mon", function()
--     local MomeyModel = "p_banknote_onedollar_s"
--     LoadModel(MomeyModel)
--     local MoneyProp = CreateObject(GetHashKey(MomeyModel), GetEntityCoords(NPCAudPed), false, true, false)
--     AttachEntityToEntity(MoneyProp, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 6286), 0.13, 0.0, 0.0, 0.0, 0.0, 90.0, 20.0, true, true, false, true, 1, true)
    
--     Wait(5000)
--     DeleteEntity(MoneyProp)
-- end)