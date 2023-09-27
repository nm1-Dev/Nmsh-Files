TableCount = function(tab)
  local c = 0
  for k,v in pairs(tab) do if v then c = c + 1; end; end
  return c
end

Tab2Vec = function(tab)
  if tab.w or tab.h or tab.heading then
    return vector4(tab.x,tab.y,tab.z,(tab.w or tab.h or tab.heading))
  else
    return vector3(tab.x,tab.y,tab.z)
  end
end

Vec2Tab = function(vec)
  return (type(vec) == "vector3" and {x = vec.x, y = vec.y, z = vec.z} or {x = vec.x, y = vec.y, z = vec.z, heading = vec.w})
end

-- DrawText3D = function(x,y,z, text, d)
--   coords = vector3(x,y,z)

--   local camCoords = GetGameplayCamCoords()
--   local distance = #(coords - camCoords)

--   if not size then size = 1 end
--   if not font then font = 1 end

--   local dist = Vdist(GetEntityCoords(PlayerPedId()),coords)

--   local scale = (size / distance) * 2
--   local fov = (1 / GetGameplayCamFov()) * 100
--   scale = scale * fov

--   SetTextScale(0.0 * scale, 0.55 * scale)
--   SetTextFont(font)
--   SetTextColour(255, 255, 255, math.floor(math.max(0.1,255 / math.max(1.0, dist/(d / 10) )) ))
--   SetTextDropshadow(0, 0, 0, 0, 255)
--   SetTextDropShadow()
--   SetTextOutline()
--   SetTextCentre(true)

--   SetDrawOrigin(coords, 0)
--   BeginTextCommandDisplayText('STRING')
--   AddTextComponentSubstringPlayerName(text)
--   EndTextCommandDisplayText(0.0, 0.0)
--   ClearDrawOrigin()
-- end



DrawText3D = function(x,y,z, text, d)
  local coords = vector3(x,y,z)
	AddTextEntry('esxFloatingHelpNotification', text)
	SetFloatingHelpTextWorldPosition(1, coords)
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
	BeginTextCommandDisplayHelp('esxFloatingHelpNotification')
	EndTextCommandDisplayHelp(2, false, false, -1)
end

GetMoveScaleform = function()
  local scaleform = RequestScaleformMovie('instructional_buttons')
  while not HasScaleformMovieLoaded(scaleform) do Citizen.Wait(0) end

  PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
  PopScaleformMovieFunctionVoid()

  PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
  PushScaleformMovieFunctionParameterInt(200)
  PopScaleformMovieFunctionVoid()

  PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
  PushScaleformMovieFunctionParameterInt(0)
  InstructionButton(GetControlInstructionalButton(0, Controls["Moving_Vehicle"].xUp, true))
  InstructionButton(GetControlInstructionalButton(0, Controls["Moving_Vehicle"].xDown, true))
  InstructionButtonMessage("xPos +/-")
  PopScaleformMovieFunctionVoid()

  PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
  PushScaleformMovieFunctionParameterInt(1)
  InstructionButton(GetControlInstructionalButton(0, Controls["Moving_Vehicle"].yUp, true))
  InstructionButton(GetControlInstructionalButton(0, Controls["Moving_Vehicle"].yDown, true))
  InstructionButtonMessage("yPos +/-")
  PopScaleformMovieFunctionVoid()

  PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
  PushScaleformMovieFunctionParameterInt(2)
  InstructionButton(GetControlInstructionalButton(0, Controls["Moving_Vehicle"].zUp, true))
  InstructionButton(GetControlInstructionalButton(0, Controls["Moving_Vehicle"].zDown, true))
  InstructionButtonMessage("zPos +/-")
  PopScaleformMovieFunctionVoid()

  PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
  PushScaleformMovieFunctionParameterInt(3)
  InstructionButton(GetControlInstructionalButton(0, Controls["Moving_Vehicle"].rotLeft, true))
  InstructionButton(GetControlInstructionalButton(0, Controls["Moving_Vehicle"].rotRight, true))
  InstructionButtonMessage("zRot +/-")
  PopScaleformMovieFunctionVoid()

  PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
  PushScaleformMovieFunctionParameterInt(4)
  InstructionButton(GetControlInstructionalButton(0, Controls["Moving_Vehicle"].ground, true))
  InstructionButtonMessage("Ground")
  PopScaleformMovieFunctionVoid()

  PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
  PushScaleformMovieFunctionParameterInt(5)
  InstructionButton(GetControlInstructionalButton(0, Controls["Moving_Vehicle"].cancel, true))
  InstructionButtonMessage("Cancel")
  PopScaleformMovieFunctionVoid()

  PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
  PushScaleformMovieFunctionParameterInt(6)
  InstructionButton(GetControlInstructionalButton(0, Controls["Moving_Vehicle"].place, true))
  InstructionButtonMessage("Place")
  PopScaleformMovieFunctionVoid()

  PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
  PopScaleformMovieFunctionVoid()

  PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
  PushScaleformMovieFunctionParameterInt(0)
  PushScaleformMovieFunctionParameterInt(0)
  PushScaleformMovieFunctionParameterInt(0)
  PushScaleformMovieFunctionParameterInt(80)
  PopScaleformMovieFunctionVoid()

  return scaleform
end

InstructionButton = function(ControlButton)
  N_0xe83a3e3557a56640(ControlButton)
end

InstructionButtonMessage = function(text)
  BeginTextCommandScaleformString("STRING")
  AddTextComponentScaleform(text)
  EndTextCommandScaleformString()
end
