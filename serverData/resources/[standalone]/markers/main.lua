Markers = {}

Markers.Registered = {}

Markers.BlipColors = {
  ["white"] = {255,255,255},
  ["red"] = {255,0,0},
  ["green"] = {0,255,0},
  ["blue"] = {7,143,240},
}

Markers.TextColors = {
  ["red"] = "~r~",
  ["green"] = "~g~",
  ["blue"] = "~b~"
}

Markers.ControlChars = {
  [47] = "G",
  [37] = "E",
  [38] = "E",
}

Markers.Init = function()
  Markers.Update()
end

Markers.AddControlCharacter = function(key_code,character_label)
  Markers.ControlChars[key_code] = character_label
end

Markers.AddTextColor = function(color,label)
  Markers.TextColors[color] = label
end

Markers.AddBlipColor = function(color,r,g,b)  
  Markers.BlipColors[color] = {r,g,b}
end

Markers.DrawText3D = function(x,y,z, text, d)
  coords = vector3(x,y,z)

  local camCoords = GetGameplayCamCoords()
  local distance = #(coords - camCoords)

  if not size then size = 1 end
  if not font then font = 1 end

  local dist = Vdist(GetEntityCoords(GetPlayerPed(-1)),coords)

  local scale = (size / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100
  scale = scale * fov

  SetTextScale(0.0 * scale, 0.55 * scale)
  SetTextFont(font)
  SetTextColour(255, 255, 255, math.floor(math.max(0.0,255 / math.max(1.0, dist/(d / 10) )) ))
  SetTextDropshadow(0, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(true)

  SetDrawOrigin(coords, 0)
  BeginTextCommandDisplayText('STRING')
  AddTextComponentSubstringPlayerName(text)
  EndTextCommandDisplayText(0.0, 0.0)
  ClearDrawOrigin()
end

Markers.Update = function()
  while true do
    local wait_time = 1000
    local pos = GetEntityCoords(GetPlayerPed(-1))
    for k,v in pairs(Markers.Registered) do
      local dist = Vdist(pos.x,pos.y,pos.z,v.location.x,v.location.y,v.location.z)
      dist = (type(dist) == "number" and dist > 0.0 and dist or 99999.99)

      if dist < 50.0 then
        wait_time = 0
        blipCol = Markers.BlipColors[v.color]
        if v.display then 
          local pos = (v.location.xyz + v.m_offset.xyz)
          DrawMarker(v.type, pos.x,pos.y,pos.z, 0.0,0.0,0.0, 0.0,0.0,0.0, v.scale.x,v.scale.y,v.scale.z, blipCol[1],blipCol[2],blipCol[3],math.floor(math.max(0.0,50 / math.max(1.0,dist/3))), false,true,2)
        end

        if dist < (v.drawdist or 20.0) and dist > v.distance then
          local pos = (v.location.xyz + v.t_offset.xyz)
          Markers.DrawText3D(pos.x,pos.y,pos.z, v.maintext,(v.drawdist or 20.0))
        elseif dist < v.distance then
          local pos = (v.location.xyz + v.t_offset.xyz)
          Markers.DrawText3D(pos.x,pos.y,pos.z, v.ctrltext,(v.drawdist or 20.0))

          if v.control and IsControlJustReleased(0,v.control) then
            if v.callback then 
              v.callback(table.unpack(v.args)); 
            end
          end
        end
      end
    end
    Wait(wait_time)
  end
end

Markers.AddMarker = function(marker,callback)
  local id = #Markers.Registered+1
  local textCol = Markers.TextColors[(marker.color or "green")]
  local ctrlChar = Markers.ControlChars[(marker.control or 47)]
  Markers.Registered[id] = {
    display  = marker.display,
    location = vector3(marker.location.x,marker.location.y,marker.location.z),
    maintext = marker.maintext,
    drawdist = (marker.drawdist or false),
    subtext  = (marker.subtext or false),
    ctrltext = "["..textCol..ctrlChar.."~s~] "..(marker.maintext)..(marker.subtext and " ["..textCol..marker.subtext.."~s~]" or "~s~"),
    color    = (marker.color or "white"),
    control  = (marker.control or 47),
    scale    = (marker.scale or vector3(1.2,1.2,1.2)),
    distance = (marker.distance or 1.0),
    callback = (marker.callback or false),
    args     = (marker.args or false),
    type     = (marker.type or 1),
    m_offset = (marker.m_offset or vector3(0.0,0.0,-1.5)),
    t_offset = (marker.t_offset or vector3(0.0,0.0,0.2)),
  }
  if callback then
    callback(id)
  end
end

Markers.RemoveMarker = function(id)
  Markers.Registered[id] = nil
end

Citizen.CreateThread(Markers.Init)

AddEventHandler("Markers:Add",Markers.AddMarker)
AddEventHandler("Markers:Remove",Markers.RemoveMarker)