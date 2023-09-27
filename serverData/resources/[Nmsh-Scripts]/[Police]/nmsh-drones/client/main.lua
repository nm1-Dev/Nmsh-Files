Drones.SceneModels = {
  bag     = GetHashKey('hei_p_m_bag_var22_arm_s'),
  drone   = GetHashKey('ch_prop_arcade_drone_01a'),
  laptop  = GetHashKey('hei_prop_hst_laptop')
}

Drones.SceneAnimations = {
  [1] = {
    laptop  = 'hack_enter_laptop',
    drone   = 'hack_enter_card',
    bag     = 'hack_enter_suit_bag',
  },
  [2] = {
    laptop  = 'hack_loop_laptop',
    drone   = 'hack_loop_card',
    bag     = 'hack_loop_suit_bag',
  }
}

Drones.LoadModel = function(hash)
  RequestModel(hash)
  while not HasModelLoaded(hash) do Wait(0); end
end

Drones.LoadDict = function(dict)
  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do Wait(0); end
end

Drones.CreateObject = function(pos,hash,net)
  Drones.LoadModel(hash)
  local del_obj = GetClosestObjectOfType(pos.x,pos.y,pos.z,2.5,hash,false,true,true)
  if del_obj then
    SetEntityAsMissionEntity(del_obj,true,true)
    DeleteObject(del_obj)
  end
  local _object = CreateObject(hash,pos.x,pos.y,pos.z,net,true,true)
  if (type(pos) == "vector4") then
    SetEntityHeading(_object,pos.w)
  end
  return _object
end

Drones.SceneObjects = function()
  local pos = GetEntityCoords(PlayerPedId())
  local objects = {}
  for key,hash in pairs(Drones.SceneModels) do
    objects[key] = Drones.CreateObject(pos,hash,1)
    SetEntityAsMissionEntity(objects[key],true,true)
    SetEntityCollision(objects[key],false,false)
    SetModelAsNoLongerNeeded(hash)
  end
  return objects
end

Drones.PerformAnimation = function()  
  local ply_ped   = PlayerPedId()
  local ply_pos   = GetEntityCoords(ply_ped)
  local ply_head  = GetEntityHeading(ply_ped)
  local ply_fwd   = GetEntityForwardVector(ply_ped)
  local scene_objects = Drones.SceneObjects()

  Drones.BagVariation   = GetPedDrawableVariation(ply_ped,5)
  Drones.BagTexture     = GetPedTextureVariation(ply_ped,5)
  Drones.BagPalette     = GetPedPaletteVariation(ply_ped,5)

  SetPedComponentVariation(ply_ped,5,0,0,0)

  local pos   = (ply_pos + (ply_fwd * 0.9) + vector3(0.0,0.0,0.42)) 
  local rot   = vector3(0.0,0.0,ply_head)

  local scene_config_a  = Scenes.SceneConfig(pos,rot,2,0,0,1.0,0,1.0)
  local scene_config_b  = Scenes.SceneConfig(pos,rot,2,1,1,1.0,0,1.0)
  local scene_a         = Scenes.Create(scene_config_a)
  local scene_b         = Scenes.Create(scene_config_b)

  local anim_dict       = "anim@heists@ornate_bank@hack"
  local player_anim_a   = "hack_enter"
  local player_anim_b   = "hack_loop"

  local ped_config_a = Scenes.PedConfig(ply_ped,scene_a,anim_dict,player_anim_a,1.0,1.0,-1,0)
  local ped_config_b = Scenes.PedConfig(ply_ped,scene_b,anim_dict,player_anim_b,1.0,1.0,-1,0)
  Scenes.AddPed(ped_config_a)
  Scenes.AddPed(ped_config_b)

  for key,object in pairs(scene_objects) do
    local anim_a = Drones.SceneAnimations[1][key]
    local anim_b = Drones.SceneAnimations[2][key]
    local ent_config_a = Scenes.EntityConfig(object,scene_a,anim_dict,anim_a,1.0,1.0,0)
    local ent_config_b = Scenes.EntityConfig(object,scene_b,anim_dict,anim_b,1.0,1.0,0)
    Scenes.AddEntity(ent_config_a)
    Scenes.AddEntity(ent_config_b)
  end

  Scenes.Start(scene_a)

  Wait(7500)

  Scenes.Start(scene_b)
  return {scene_a,scene_b},scene_objects
end

Drones.CreateCam = function(attach_to)
  local camera = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 0.0,0.0,0.0, 0, 0, 0, 50 * 1.0)
  local min,max = GetModelDimensions(GetEntityModel(attach_to))

  SetCamActive(camera, true)
  RenderScriptCams(true, false, 0, true, false)
  AttachCamToEntity(camera,attach_to,0.0,0.0,-max.z/2,false)
  SetFocusEntity(attach_to,true)

  ClearTimecycleModifier()
  SetTimecycleModifier("eyeinthesky")
  SetTimecycleModifierStrength(0.1)

  return camera
end

Drones.CreateControls = function(abilities)
  local controls
  if type(abilities) == "string" then
    controls = {
      [1] = Config.Controls.Homing["cancel"],
      [2] = Config.Controls.Homing["disconnect"]
    }
  else
    controls = {
      [1] = Config.Controls.Drone["direction"],
      [2] = Config.Controls.Drone["heading"],
      [3] = Config.Controls.Drone["height"],
      [4] = Config.Controls.Drone["camera"],
      [5] = Config.Controls.Drone["zoom"],
    }

    if abilities.nightvision then
      table.insert(controls,Config.Controls.Drone["nightvision"])
    end

    if abilities.infared then
      table.insert(controls,Config.Controls.Drone["infared"])
    end

    if abilities.tazer then
      table.insert(controls,Config.Controls.Drone["tazer"])
    end

    if abilities.boost then
      table.insert(controls,Config.Controls.Drone["boost"])
    end

    if abilities.explosive then
      table.insert(controls,Config.Controls.Drone["explosive"])
    end

    table.insert(controls,Config.Controls.Drone["centercam"])
    table.insert(controls,Config.Controls.Drone["home"])
    table.insert(controls,Config.Controls.Drone["disconnect"])
  end

  return controls
end

Drones.SpawnDrone = function(drone_data,replace_object)
  DoScreenFadeOut(500)
  local controls = Drones.CreateControls(drone_data.abilities)
  Drones.ButtonsScaleform = Instructional.Create(controls)
  Wait(500)

  DeleteObject(replace_object)

  local drone_model = drone_data.model
  local ply_ped     = PlayerPedId()
  local ply_pos     = GetEntityCoords(ply_ped)
  local drone       = Drones.CreateObject(ply_pos,drone_model,1)
  local cam         = Drones.CreateCam(drone)

  SetEntityAsMissionEntity(drone,true,true)
  SetObjectPhysicsParams(drone,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0)

  local pos = GetEntityCoords(drone)
  local hed = GetEntityHeading(drone)
  local rot = GetEntityRotation(drone,2)

  local velocity = vector3(0.0,0.0,0.0)
  local rotation = vector3(0.0,0.0,0.0)

  Drones.DroneScaleform = Scaleforms.LoadMovie("DRONE_CAM")
  Scaleforms.PopBool(Drones.DroneScaleform,"SET_EMP_METER_IS_VISIBLE",0)
  Scaleforms.PopBool(Drones.DroneScaleform,"SET_INFO_LIST_IS_VISIBLE",0)
  Scaleforms.PopBool(Drones.DroneScaleform,"SET_SOUND_WAVE_IS_VISIBLE",0)
  Scaleforms.PopBool(Drones.DroneScaleform,"SET_TRANQUILIZE_METER_IS_VISIBLE",0)

  Scaleforms.PopBool(Drones.DroneScaleform,"SET_DETONATE_METER_IS_VISIBLE",   drone_data.abilities.explosive)
  Scaleforms.PopBool(Drones.DroneScaleform,"SET_SHOCK_METER_IS_VISIBLE",      drone_data.abilities.tazer)
  Scaleforms.PopBool(Drones.DroneScaleform,"SET_RETICLE_IS_VISIBLE",          drone_data.abilities.tazer)
  Scaleforms.PopBool(Drones.DroneScaleform,"SET_BOOST_METER_IS_VISIBLE",      drone_data.abilities.boost)
  Scaleforms.PopBool(Drones.DroneScaleform,"SET_HEADING_METER_IS_VISIBLE",1)
  Scaleforms.PopBool(Drones.DroneScaleform,"SET_ZOOM_METER_IS_VISIBLE",1)

  Scaleforms.PopInt(Drones.DroneScaleform,"SET_ZOOM",0)
  Scaleforms.PopInt(Drones.DroneScaleform,"SET_BOOST_PERCENTAGE",100)
  Scaleforms.PopInt(Drones.DroneScaleform,"SET_DETONATE_PERCENTAGE",100)
  Scaleforms.PopInt(Drones.DroneScaleform,"SET_SHOCK_PERCENTAGE",100)

  Scaleforms.PopInt(Drones.DroneScaleform,"SET_TRANQUILIZE_PERCENTAGE",100)
  Scaleforms.PopInt(Drones.DroneScaleform,"SET_EMP_PERCENTAGE",100)

  Scaleforms.PopMulti(Drones.DroneScaleform,"SET_ZOOM_LABEL",0,"DRONE_ZOOM_1")
  Scaleforms.PopMulti(Drones.DroneScaleform,"SET_ZOOM_LABEL",1,"")
  Scaleforms.PopMulti(Drones.DroneScaleform,"SET_ZOOM_LABEL",2,"DRONE_ZOOM_2")
  Scaleforms.PopMulti(Drones.DroneScaleform,"SET_ZOOM_LABEL",3,"")
  Scaleforms.PopMulti(Drones.DroneScaleform,"SET_ZOOM_LABEL",4,"DRONE_ZOOM_3")

  Drones.SoundID = GetSoundId()
  if Config.DroneSounds then
    PlaySoundFromEntity(Drones.SoundID, "Flight_Loop", drone, "DLC_BTL_Drone_Sounds", true, 0) 
  end

  DoScreenFadeIn(500)
  Drones.DroneControl(drone_data,drone,cam)
end

Drones.DroneControl = function(drone_data,drone,camera)
  local ply_ped = PlayerPedId()
  local ply_pos = GetEntityCoords(ply_ped)
  local ply_fwd = GetEntityForwardVector(ply_ped)

  local pos = ply_pos + ply_fwd

  local zoom = 0
  local head = 0.0
  local boost = 100.0
  local explosive = 100.0
  local tazer = 100.0

  local rotation_momentum = 0.0
  local movement_momentum = vector3(0.0,0.0,0.0)
  local camera_rotation = vector3(0.0,0.0,0.0)

  Drones.DisplayRadar = (not IsRadarHidden())
  DisplayRadar(false)

  while true do
    local forward,right,up,p = GetEntityMatrix(drone)
    local dist = Vdist(ply_pos,p)

    DisableAllControlActions(0)
    SetEntityNoCollisionEntity(ply_ped,drone,true)

    if not IsEntityPlayingAnim(PlayerPedId(),"anim@heists@ornate_bank@hack","hack_loop",3) then
      TaskPlayAnim(PlayerPedId(),"anim@heists@ornate_bank@hack","hack_loop",8.0,8.0,-1,2,false,false,false)
    end

    --
    -- Boost
    --
    local boosted = false
    if drone_data.abilities.boost then
      if IsDisabledControlPressed(0,Config.Controls.Drone["boost"].codes[1]) and boost > 1.0 then
        boost = math.max(1.0,boost - (Config.BoostDrain * GetFrameTime()))
        boosted = true
      else
        boost = math.min(100.0,boost + (Config.BoostFill * GetFrameTime()))
      end
      Scaleforms.PopInt(Drones.DroneScaleform,"SET_BOOST_PERCENTAGE",math.floor(boost))
    end

    --
    -- Drone Movement
    --
    local did_move = false
    local max_boost = (Config.MaxVelocity * drone_data.stats.speed)
    if boosted then
      max_boost = max_boost * Config.BoostSpeed
    end
    if IsDisabledControlPressed(0,Config.Controls.Drone["direction"].codes[1]) then
      movement_momentum = V3ClampMagnitude(movement_momentum + (forward * drone_data.stats.agility),max_boost)
      did_move = true
    end

    if IsDisabledControlPressed(0,Config.Controls.Drone["direction"].codes[2]) then
      movement_momentum = V3ClampMagnitude(movement_momentum - (forward * drone_data.stats.agility),max_boost)
      did_move = true
    end

    if IsDisabledControlPressed(0,Config.Controls.Drone["direction"].codes[3]) then
      movement_momentum = V3ClampMagnitude(movement_momentum - (right * drone_data.stats.agility),max_boost)
      did_move = true
    end

    if IsDisabledControlPressed(0,Config.Controls.Drone["direction"].codes[4]) then
      movement_momentum = V3ClampMagnitude(movement_momentum + (right * drone_data.stats.agility),max_boost)
      did_move = true
    end

    if IsDisabledControlPressed(0,Config.Controls.Drone["height"].codes[1]) then
      movement_momentum = V3ClampMagnitude(movement_momentum - (up * drone_data.stats.agility),max_boost)
      did_move = true
    end

    if IsDisabledControlPressed(0,Config.Controls.Drone["height"].codes[2]) then
      movement_momentum = V3ClampMagnitude(movement_momentum + (up * drone_data.stats.agility),max_boost)
      did_move = true
    end

    --
    -- Cam Rotation
    --
    if IsDisabledControlPressed(0,Config.Controls.Drone["camera"].codes[1]) then
      camera_rotation = camera_rotation + (vector3(0.0,0.0,1.0) / math.max(2,zoom))
    end

    if IsDisabledControlPressed(0,Config.Controls.Drone["camera"].codes[3]) then
      camera_rotation = camera_rotation - (vector3(0.0,0.0,1.0) / math.max(2,zoom))
    end

    if IsDisabledControlPressed(0,Config.Controls.Drone["camera"].codes[2]) then
      camera_rotation = camera_rotation - (vector3(1.0,0.0,0.0) / math.max(2,zoom))
    end

    if IsDisabledControlPressed(0,Config.Controls.Drone["camera"].codes[4]) then
      camera_rotation = camera_rotation + (vector3(1.0,0.0,0.0) / math.max(2,zoom))
    end

    --
    -- Drone Heading
    --
    if IsDisabledControlPressed(0,Config.Controls.Drone["heading"].codes[1]) then
      rotation_momentum = math.max(-1.5,rotation_momentum - 0.02)
    elseif IsDisabledControlPressed(0,Config.Controls.Drone["heading"].codes[2]) then
      rotation_momentum = math.min(1.5,rotation_momentum + 0.02)
    else
      if rotation_momentum > 0.0 then
        rotation_momentum = math.max(0.0,rotation_momentum - 0.04)
      elseif rotation_momentum < 0.0 then
        rotation_momentum = math.min(0.0,rotation_momentum + 0.04)
      end
    end

    --
    -- Zoom
    --
    if IsDisabledControlJustPressed(0,Config.Controls.Drone["zoom"].codes[1]) then
      zoom = math.max(0,(zoom or 0) - 1)
      Scaleforms.PopInt(Drones.DroneScaleform,"SET_ZOOM",zoom)

      SetCamFov(camera,50.0 - (10.0 * zoom))
    end
    
    if IsDisabledControlJustPressed(0,Config.Controls.Drone["zoom"].codes[2]) then
      zoom = math.min(4,(zoom or 0) + 1)
      Scaleforms.PopInt(Drones.DroneScaleform,"SET_ZOOM",zoom)

      SetCamFov(camera,50.0 - (10.0 * zoom))
    end

    --
    -- Nightvision
    --
    if drone_data.abilities.nightvision and IsDisabledControlJustPressed(0,Config.Controls.Drone["nightvision"].codes[1]) then
      if not NightvisionEnabled then
        NightvisionEnabled = true
        SetNightvision(true)
      else
        NightvisionEnabled = false
        SetNightvision(false)
      end
    end

    --
    -- Infared
    --
    if drone_data.abilities.infared and IsDisabledControlJustPressed(0,Config.Controls.Drone["infared"].codes[1]) then
      if not InfaredEnabled then
        InfaredEnabled = true
        SetSeethrough(true)
      else
        InfaredEnabled = false
        SetSeethrough(false)
      end
    end

    --
    -- Tazer
    --
    if drone_data.abilities.tazer then
      if IsDisabledControlJustPressed(0,Config.Controls.Drone["tazer"].codes[1]) and tazer >= 100.0 then
        tazer = 1.0
        local right,forward,up,p = GetCamMatrix(camera)
        forward = forward * 10.0

        SetCanAttackFriendly(PlayerPedId(), true, false)
        SetCanAttackFriendly(drone, true, false)
        NetworkSetFriendlyFireOption(true)
        Wait(0)

        ShootSingleBulletBetweenCoords(p.x,p.y,p.z, p.x+forward.x, p.y+forward.y, p.z+forward.z, 1000, false, GetHashKey('WEAPON_STUNGUN'), PlayerPedId(), true, true, 100.0)   
      else
        tazer = math.min(100.0,tazer + (Config.TazerFill * GetFrameTime()))
      end
      Scaleforms.PopInt(Drones.DroneScaleform,"SET_SHOCK_PERCENTAGE",math.floor(tazer))
    end

    --
    -- Explosive
    --
    if drone_data.abilities.explosive then
      if IsDisabledControlJustPressed(0,Config.Controls.Drone["explosive"].codes[1]) and explosive >= 100.0 then
        local pos = GetEntityCoords(drone)
        Drones.Disconnect(drone,true)
        Drones.DestroyCam(camera)
        AddExplosion(pos.x,pos.y,pos.z,1,1.0,true,false,1.0)
        return
      else
        explosive = math.min(100.0,explosive + (1.0 * GetFrameTime()))
      end
      Scaleforms.PopInt(Drones.DroneScaleform,"SET_DETONATE_PERCENTAGE",math.floor(explosive))
    end

    --
    -- Default Cam Position
    --
    if IsDisabledControlPressed(0,Config.Controls.Drone["centercam"].codes[1]) then
      camera_rotation = vector3(0.0,0.0,0.0)
    end

    --
    -- Return Home
    --
    if IsDisabledControlPressed(0,Config.Controls.Drone["home"].codes[1]) then
      ShowHelpNotification("Returning home.")
      PointCamAtEntity(camera,PlayerPedId(),0.0,0.0,0.0,1)

      local continue_flying = false
      local dist = Vdist(GetEntityCoords(drone),GetEntityCoords(PlayerPedId()))
      local controls = Drones.CreateControls("home")
      Drones.ButtonsScaleform = Instructional.Create(controls)

      Wait(100)
      while dist > 3.0 do
        local ply_ped   = PlayerPedId()
        local drone_pos = GetEntityCoords(drone)
        local ply_pos   = GetEntityCoords(ply_ped)
        local direction = -V3ClampMagnitude((drone_pos - ply_pos) * 10.0,(Config.MaxVelocity * drone_data.stats.speed))

        DisableAllControlActions(0)
        SetEntityNoCollisionEntity(ply_ped,drone,true)

        ApplyForceToEntity(drone,0,direction.x,direction.y,20.0 + (V2Dist(drone_pos,ply_pos) <= 5.0 and direction.z or 0.0), 0.0,0.0,0.0, 0, 0,1,1,0,1)

        DrawScaleformMovieFullscreen(Drones.ButtonsScaleform,255,255,255,255,0)
        DrawScaleformMovieFullscreen(Drones.DroneScaleform,255,255,255,255,0)

        if IsDisabledControlJustReleased(0,Config.Controls.Homing["cancel"].codes[1]) then
          continue_flying = true
          Wait(100)
          break
        elseif IsDisabledControlJustReleased(0,Config.Controls.Homing["disconnect"].codes[1]) then
          Wait(100)
          break
        end
        
        dist = Vdist(drone_pos,ply_pos)
        SetTimecycleModifierStrength(dist / drone_data.stats.range)
        Wait(0)
      end
      
      if not continue_flying then
        Drones.Disconnect(drone)
        Drones.DestroyCam(camera)
        return
      else
        local controls = Drones.CreateControls(drone_data.abilities)
        Drones.ButtonsScaleform = Instructional.Create(controls)
        StopCamPointing(camera)
      end
    end

    --
    -- Disconnect Drone
    --
    if IsDisabledControlJustReleased(0,Config.Controls.Drone["disconnect"].codes[1]) then
      Drones.Disconnect(drone)
      Drones.DestroyCam(camera)
      return
    end

    --
    -- Drone Movement
    --
    local boost_val = Config.BoostSpeed
    head = head + (rotation_momentum * drone_data.stats.agility)

    if not did_move then
      if V3Magnitude(movement_momentum) > 0.0 then
        movement_momentum = movement_momentum - ((movement_momentum / 10.0) * drone_data.stats.agility)
      end
    end

    ApplyForceToEntity(drone,0,movement_momentum.x,movement_momentum.y,20.0 + movement_momentum.z, 0.0,0.0,0.0, 0, 0,1,1,0,1)
    SetEntityHeading(drone,head)
    SetCamRot(camera,camera_rotation.x,camera_rotation.y,camera_rotation.z+head,2)

    --
    -- Scaleform
    --
    SetTimecycleModifierStrength(dist / drone_data.stats.range)
    DrawScaleformMovieFullscreen(Drones.ButtonsScaleform,255,255,255,255,0)
    DrawScaleformMovieFullscreen(Drones.DroneScaleform,255,255,255,255,0)

    Wait(0)
  end
end

Drones.DestroyCam = function(cam)
  local ply_ped   = PlayerPedId()
  SetFocusEntity(ply_ped)
  ClearTimecycleModifier()  
  RenderScriptCams(false,true,500,0,0)
  Wait(500)

  DestroyCam(cam)
end

Drones.Disconnect = function(drone,destroy)
  local ply_pos   = GetEntityCoords(PlayerPedId())
  local drone_pos = GetEntityCoords(drone)

  if not destroy and Vdist(drone_pos,ply_pos) <= 10.0 then
    local Player = QBCore.Functions.GetPlayerData()
    TriggerServerEvent("grw_drones:server:DroneReturned", Player.source)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["drone"], "add")
    ShowHelpNotification("Drone returned.")
  elseif destroyed then
    ShowHelpNotification("Drone destroyed.")
    TriggerServerEvent("Drones:Explode",GetEntityModel(drone))
  else
    ShowHelpNotification("Drone abandoned.")
    local pos = GetGroundZ(drone_pos) + vector3(0.0,0.0,0.8)
    TriggerServerEvent("Drones:Disconnect",GetEntityModel(drone),pos)
  end

  StopSound(Drones.SoundID)
  ReleaseSoundId(Drones.SoundID)
  Drones.SoundID = nil

  DisplayRadar(Drones.DisplayRadar)

  SetSeethrough(false)
  SetNightvision(false)
  DeleteObject(drone)
end

Citizen.CreateThread(function()
  ClearTimecycleModifier()
  ClearPedTasks(PlayerPedId())
  SetFocusEntity(PlayerPedId())
end)

RegisterNetEvent("grw_drones:client:UseDrone")
AddEventHandler("grw_drones:client:UseDrone", function() 
  TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["drone"], "remove")
  Drones.Use(Config.Drones[1])
end)

Drones.Use = function(drone_data)
  Drones.SceneModels["drone"] = drone_data.model

  local scenes,scene_objects = Drones.PerformAnimation()
  Drones.SpawnDrone(drone_data,scene_objects["drone"])
  Wait(1000)
  for _,object in pairs(scene_objects) do
    SetEntityAsMissionEntity(object,true,true)
    DeleteObject(object)
  end  
  for _,scene in pairs(scenes) do
    Scenes.Stop(scene)
  end
  Wait(1000)
  FreezeEntityPosition(PlayerPedId(),false)
  ClearPedTasks(PlayerPedId())
  SetPedComponentVariation(PlayerPedId(),5,Drones.BagVariation,Drones.BagTexture,Drones.BagTexture)
end

Drones.GetPlayerJobName = function()
  return (QBCore.Functions.GetPlayerData().job.name)
end

RegisterNetEvent("Drones:UseDrone")
AddEventHandler("Drones:UseDrone", Drones.Use)