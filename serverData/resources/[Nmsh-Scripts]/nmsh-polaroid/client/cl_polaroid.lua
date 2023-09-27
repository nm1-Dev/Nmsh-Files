local QBCore = exports['qb-core']:GetCoreObject()
local onPolaroid = true
local Cam = 0
local fov_max = 40.0
local fov_min = 4.0
local ZoomSpeed = 2.0
local speed_lr = 5.0
local speed_ud = 5.0
local fov = (fov_max + fov_min) * 0.5
local polaroidProp = nil
local tabletObject = nil
local DisableShoots = false

---------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------FUNCTIONS--------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------

function RenderCam() 
    local ped = PlayerPedId()
    if not ( IsPedSittingInAnyVehicle( ped ) ) then
        local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        AttachCamToEntity(cam, ped, 0.0, 0.0, 1.0, true)
        SetCamRot(cam, 0.0, 0.0, GetEntityHeading(ped), 2)
        SetCamFov(cam, fov)
        RenderScriptCams(true, false, 0, true, false)
        FreezeEntityPosition(ped, true)
        onPolaroid = true
        Citizen.CreateThread(function() 
            while onPolaroid == true do
                Citizen.Wait(0)
                local zoomvalue = (1.0 / (fov_max - fov_min)) * (fov - fov_min)
                CheckInputRotation(cam, zoomvalue)
                HandleZoom(cam)
            end
        end)
    end
end

function disableControls()
    Citizen.CreateThread(function()
        while onPolaroid do
            Citizen.Wait(0)
            DisableControlAction(0, 322, true)
            DisableControlAction(0, 202, true)
            DisableControlAction(0, 200, true)
            DisableControlAction(0, 24, true)
        end
    end)
end

function CheckInputRotation(cam, zoomvalue)
    local rightAxisX = GetDisabledControlNormal(0, 220)
    local rightAxisY = GetDisabledControlNormal(0, 221)
    local rotation = GetCamRot(cam, 2)
    if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
        new_z = rotation.z + rightAxisX*-1.0*(speed_ud)*(zoomvalue+0.1)
        new_x = math.max(math.min(20.0, rotation.x + rightAxisY*-1.0*(speed_lr)*(zoomvalue+0.1)), -89.5)
        SetCamRot(cam, new_x, 0.0, new_z, 2)
        SetEntityHeading(PlayerPedId(),new_z)
    end
end

function HandleZoom(cam)
    local lPed = PlayerPedId()
    if not ( IsPedSittingInAnyVehicle( lPed ) ) then

        if IsControlJustPressed(0,241) then 
            fov = math.max(fov - ZoomSpeed, fov_min)
        end
        if IsControlJustPressed(0,242) then
            fov = math.min(fov + ZoomSpeed, fov_max)
        end
        local current_fov = GetCamFov(cam)
        if math.abs(fov-current_fov) < 0.1 then
            fov = current_fov
        end
        SetCamFov(cam, current_fov + (fov - current_fov)*0.05)
        if IsControlJustPressed(0, 38) and DisableShoots == false then
            DisableShoots = true
            local result = TriggerServerCallback {eventName = 'ps_polaroid:GetWebhook', args = {}}
            if result then
                exports[Config.ScreenShotBasicResourceName]:requestScreenshotUpload(tostring(result), "files[]", function(data)
                    local image = json.decode(data)
                    fov = (fov_max + fov_min) * 0.5
                    RenderScriptCams(false, false, 0, true, false)
                    DestroyCam(cam, false)
                    SetSeethrough(false)
                    SetNuiFocus(false, false)
                    SendReactMessage('CloseCamera', {})
                    ClearExtraTimecycleModifier()
                    DisableShoots = false
                    onPolaroid = false
                    DeleteEntity(polaroidProp)
                    polaroidProp = nil
                    FreezeEntityPosition(lPed, false);
                    LoadAnimationDic("friends@fra@ig_1")
                    TaskPlayAnim(lPed, "friends@fra@ig_1", "base_idle", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
                    -- Config.ProgressbarPrinting()
                    QBCore.Functions.Progressbar("print", 'Printing', 5000, false, true, {
                        disableMovement = false,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = false,
                    }, {}, {}, {}, function() -- Done
                        StopAnimTask(lPed, "friends@fra@ig_1", "base_idle", 1.0)
                        TriggerServerEvent('nmsh-polaroid-uploadPhoto', image.attachments[1].proxy_url)
                        ClearPedTasks(lPed)
                    end, function() -- Cancel
                        StopAnimTask(lPed, "friends@fra@ig_1", "base_idle", 1.0)
                        ClearPedTasks(lPed)
                    end)
                end)
            else
                DestroyCamerasFunction()
                print('[ERROR] - Your screenshot-basic is not working properly')
            end
        end
        if IsDisabledControlPressed(0, 322) then
            DestroyCamerasFunction()
        end
        if IsDisabledControlJustReleased(0, 24) then
            SetNuiFocus(true, true)
            SetCursorLocation(0.8, 0.5)
            SendReactMessage('PolaroidLook', {show = true})
        end
    else
        DestroyCamerasFunction()
    end
end

function DestroyCamerasFunction()
    fov = (fov_max + fov_min) * 0.5
    RenderScriptCams(false, false, 0, true, false)
    DestroyCam(cam, false)
    SetSeethrough(false)
    SendReactMessage('CloseCamera', {})
    FreezeEntityPosition(PlayerPedId(), false);
    ClearExtraTimecycleModifier()
    SetNuiFocus(false, false)
    Citizen.Wait(1000)
    onPolaroid = false
    DeleteEntity(polaroidProp)
    polaroidProp = nil
    ClearPedTasks(PlayerPedId())
end

function CreatePolaroid() 
    local playerPed = PlayerPedId()
    local dict = "amb@world_human_seat_wall_tablet@female@base"
    RequestAnimDict(dict)
    if polaroidProp == nil then
        polaroidProp = CreateObject(GetHashKey('polaroid'), GetEntityCoords(playerPed), 1, 1, 1)
        AttachEntityToEntity(polaroidProp, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, 0.0, 0.03, 130.0, -85.0, 0.0, true, true, false, false, true, true)
    end
    while not HasAnimDictLoaded(dict) do Citizen.Wait(100) end
    if not IsEntityPlayingAnim(playerPed, dict, 'base', 3) then
        TaskPlayAnim(playerPed, dict, "base", 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
    end
end

function LoadAnimationDic(dict)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(0)
        end
    end
end

function GetPlayersFromCoords(coords, distance)
    local players = GetActivePlayers()
    local ped = PlayerPedId()
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    distance = distance or 5
    local closePlayers = {}
    for _, player in pairs(players) do
        local target = GetPlayerPed(player)
        local targetCoords = GetEntityCoords(target)
        local targetdistance = #(targetCoords - coords)
        if targetdistance <= distance then
            closePlayers[#closePlayers + 1] = GetPlayerServerId(player)
        end
    end
    return closePlayers
end

local function OpenAlbumAnim()
    ClearPedTasksImmediately()
    LoadAnimationDic("amb@code_human_in_bus_passenger_idles@female@tablet@base")
    TaskPlayAnim(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "base", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
    if tabletObject == nil then
        tabletObject = CreateObject(GetHashKey('p_ringbinder_01_s'), GetEntityCoords(PlayerPedId()), 1, 1, 1)
        AttachEntityToEntity(tabletObject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.1, 0.025, -0.15, -0.0, 100.0, -90.0, 1, 1, 0, 1, 0, 1)
    end
end

local function RemoveAlbumAnim()
    Citizen.Wait(1000)
    StopAnimTask(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "base", 1.0)
    DeleteEntity(tabletObject)
    tabletObject = nil
end

function SendReactMessage(action, data)
    SendNUIMessage({
        action = action,
        data = data
    })
end

---------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------HANDLERS---------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("nmsh-polaroid-uploadPhoto")
AddEventHandler("nmsh-polaroid-uploadPhoto",function(img, date, msg)
    local info = {img = img, msg = msg, date = date} 
    SendReactMessage('SetPhotos', {photos = info})
end)

RegisterNetEvent("nmsh-polaroid-spawn")
AddEventHandler("nmsh-polaroid-spawn",function(info)
    SendReactMessage('SpawnMSG', {photos = info})
    SendReactMessage('ESXMODE', {mode = true})
end)

RegisterNetEvent("ps:openPolaroid")
AddEventHandler("ps:openPolaroid",function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        print('You are in a vehicle')
        return 
    end
    if not DisableShoots then
        SendReactMessage('OpenCamera');
        RenderCam()
        disableControls()
        CreatePolaroid()
    end
end)

RegisterNetEvent("ps:openAlbum")
AddEventHandler("ps:openAlbum",function()
    if not DisableShoots then
        SetNuiFocus(true, true)
        SendReactMessage('OpenBinderPolaroid');
        OpenAlbumAnim()
    end
end)

RegisterNetEvent("ps_polaroid:showAroundClient")
AddEventHandler("ps_polaroid:showAroundClient",function(data)
    SendReactMessage('showOther', {img = data.img, msg = data.msg, date = data.date})
    Citizen.Wait(5000)
    SendReactMessage('closePhotoApp')
end)

RegisterNUICallback("CameraEffect", function(data, cb) 
    local inf = data.props.effect
    if inf == 'close' then
        SetNuiFocus(false, false)
        SendReactMessage('PolaroidLook', {show = false})
    elseif inf == 'none' then
        print('none')
    elseif inf == 'removefilter' then
        ClearExtraTimecycleModifier()
    else
        local effect = data.props.effect
        if (effect == 'SPECIAL_NOIR') then
            RegisterNoirScreenEffectThisFrame()
            SetExtraTimecycleModifier('NG_filmnoir_BW01')
        else
            SetExtraTimecycleModifier(tostring(data.props.effect))
        end
    end
    cb({})
end)

RegisterNUICallback("CloseAlbumPolaroid", function(data, cb) 
    SetNuiFocus(false, false)
    Citizen.Wait(1000)
    RemoveAlbumAnim()
    cb({})
end)

RegisterNUICallback("SendToInventory", function(data, cb) 
    local photo = data.PhotoInfo
    TriggerServerEvent('ps_polaroid:GetFromAlbum', photo.img, photo.date, photo.msg)
    cb({})
end)

RegisterNUICallback("nmsh-polaroid:delete:esxphoto", function(data, cb) 
    local photo = data.PhotoInfo
    TriggerServerEvent('nmsh-polaroid:delete:esxphoto', photo.img)
    cb({})
end)

RegisterNUICallback("ShowToOthers", function(data, cb) 
    local photo = data.id
    local player = PlayerPedId()
    local polaroidProp = CreateObject(GetHashKey('prop_cs_polaroid'), GetEntityCoords(player), 1, 1, 1)
    AttachEntityToEntity(polaroidProp, player, GetPedBoneIndex(player, 28422), 0.15, 0.055, -0.025, 170.0, 0.0, -240.0, true, true, false, false, true, true)
    SendReactMessage('showOther', {img = photo.img, msg = photo.msg, date = photo.date})
    TriggerServerEvent("ps_polaroid:showAround", data.id, GetPlayersFromCoords(GetEntityCoords(PlayerPedId())))
    LoadAnimationDic("paper_1_rcm_alt1-9")
    TaskPlayAnim(PlayerPedId(), "paper_1_rcm_alt1-9", "player_one_dual-9", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
    Citizen.Wait(5000)
    SendReactMessage('closePhotoApp')
    StopAnimTask(PlayerPedId(), "paper_1_rcm_alt1-9", "player_one_dual-9", 1.0)
    DeleteEntity(polaroidProp)
    cb({})
end)

RegisterNUICallback("UpdatePhoto", function(data, cb) 
    local photo = data.data
    TriggerServerEvent('ps_polaroid:UpdatePhoto', photo)
    cb({})
end)


RegisterNUICallback("GetPlayers", function(data, cb) 
    cb({players = GetPlayersFromCoords(GetEntityCoords(PlayerPedId()))})
end)

RegisterNUICallback("SendToClient", function(data, cb) 
    local data = data.data
    TriggerServerEvent('ps_polaroid:GivePlayer', data)
    cb({})
end)