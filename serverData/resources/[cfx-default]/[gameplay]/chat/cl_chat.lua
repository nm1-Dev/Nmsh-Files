local isRDR = not TerraingridActivate and true or false

local chatInputActive = false
local chatInputActivating = false
local chatLoaded = false
local _oocMuted = false

RegisterNetEvent('chatMessage')
RegisterNetEvent('chat:addTemplate')
RegisterNetEvent('chat:addMessage')
RegisterNetEvent('chat:addSuggestion')
RegisterNetEvent('chat:addSuggestions')
RegisterNetEvent('chat:addMode')
RegisterNetEvent('chat:removeMode')
RegisterNetEvent('chat:removeSuggestion')
RegisterNetEvent('chat:clear')
RegisterNetEvent('chat:muteOoc')

-- internal events
RegisterNetEvent('__cfx_internal:serverPrint')
RegisterNetEvent('_chat:messageEntered')


local colorTable = {}
colorTable[1] = {147, 62, 47}
colorTable[2] = {51, 112, 165}
colorTable[3] = {163, 62, 48}
colorTable[4] = {190, 97, 18}
colorTable[5] = {135, 103, 150}
colorTable[6] = {77, 36, 92}
colorTable[7] = {158, 71, 158}

local adminMessageChannels = {'feed', 'game', 'ooc', 'hidden', 'dispatch'}

local routedMessages = {
  {
    keywords = "dispatch",
    channel = "dispatch"
  },
  {
    keywords = {"system", "status"},
    channel = "game"
  }
}

local function checkRoutedMessage(msg)
  local msg = string.lower(msg)
  local match = false

  for _, route in ipairs(routedMessages) do
    if (type(route.keywords) == "table") then
      for _, keyword in ipairs(route.keywords) do
        if (string.find(msg, keyword)) then
          match = route.channel
        end
      end
    else
      if (string.find(msg, route.keywords)) then
        match = route.channel
      end
    end
  end

  return match
end

-- Channels: feed, game, ooc
-- authors: 
local i18nAuthors = {
  "SYSTEM",
  "PLAYER REPORT",
  "Admin",
  "Removed",
  "Owner",
  "Instructions",
  "Tenants",
  "Diamond Casino & Resort",
  "BILL",
  "Magic Effect",
  "Hospital",
  "Patients",
  "LS Water & Power",
  "DOC",
  "JAILED",
  "PAROLE",
  "State Alert",
  "EMAIL",
  "DISPATCH",
  "SEARCH - WEAPONS",
  "Evidence - WEAPONS",
  "console",
  "Goverment",
  "Driving History for",
  "SEARCH",
  "State Announcement",
  "STATUS",
  "Service",
  "BANKING",
}
Citizen.CreateThread(function()
  Wait(math.random(30000, 90000))
  for _, author in pairs(i18nAuthors) do
    TriggerEvent("i18n:translate", author, "chatMessageAuthor")
    Wait(500)
  end
end)
function chatMessage(author, color, text, channel, isAdminMessage, opts)
  if (channel == 'ooc') and _oocMuted then return end

  local args = { text }
  local _author = author
  if author ~= "" then
    table.insert(args, 1, author)
  end

  local hud = true
  if (color == 8) then
    TriggerEvent("phone:addnotification", author, text)
    return
  end

  local matchChannel = checkRoutedMessage(_author)
  
  if (matchChannel) then
    channel = matchChannel
  end

  channel = channel or 'feed'

  if (type(color) == "number") then
    if (colorTable[color]) then
      color = colorTable[color]
    else
      color = colorTable[2]
    end
  end

  if (isAdminMessage) then
    for _, v in pairs(adminMessageChannels) do
      SendNUIMessage({
        type = 'ON_MESSAGE',
        message = {
          color = color,
          multiline = true,
          args = args,
          mode = v
        }
      })
    end
  end 

  -- Append always to the main feed channel
  if (hud and not isAdminMessage) then
      if (channel ~= 'feed') then
        SendNUIMessage({
          type = 'ON_MESSAGE',
          message = {
            color = color,
            multiline = true,
            args = args,
            mode = 'feed'
          }
        })
      end

      SendNUIMessage({
        type = 'ON_MESSAGE',
        message = {
          color = color,
          multiline = true,
          args = args,
          mode = channel
        }
      })
  end
end
exports('chatMessage', chatMessage)
AddEventHandler('chatMessage', chatMessage)

AddEventHandler('chat:muteOoc', function()
  _oocMuted = not _oocMuted
end)

RegisterNetEvent('chat:showCID')
AddEventHandler('chat:showCID', function(cidInformation, pid)
  local person_src = pid
  local pid = GetPlayerFromServerId(person_src)
	local targetPed = GetPlayerPed(pid)
	local myCoords = GetEntityCoords(PlayerPedId())
  local targetCoords = GetEntityCoords(targetPed)
    if pid ~= -1 then
	    if GetDistanceBetweenCoords(myCoords, targetCoords, true) <= 1.5 then
        SendNUIMessage({
          type = 'ON_SHOWID',
          message = {
            multiline = true,
            licenseInfo = cidInformation,
            mode = 'feed'
          }
        })
        SendNUIMessage({
          type = 'ON_SHOWID',
          message = {
            multiline = true,
            licenseInfo = cidInformation,
            mode = 'game'
          }
        })
      end
    end
end)


AddEventHandler('__cfx_internal:serverPrint', function(msg)
  if (msg == "") then return end
  SendNUIMessage({
    type = 'ON_MESSAGE',
    message = {
      color = {255,50,50},
      multiline = true,
      args = {"Print", msg},
    }
  })
end)

-- addMessage
local addMessage = function(message)
  local hud = true
  if hud then
    local msg = type(message) == 'table' and (message.args[2]) or message
    local author = type(message) == 'table' and message.args[1] or 'SYSTEM'
    local color = type(message) == 'table' and message.color or colorTable[2]
    local channel = type(message) == 'table' and message.channel or 'feed'
    local isAdminMessage = type(message) == 'table' and message.isAdminMessage or false

    chatMessage(author, color, msg, channel, isAdminMessage)
  end
end
-- exports('addMessage', addMessage)
AddEventHandler('chat:addMessage', addMessage)

-- addSuggestion
local addSuggestion = function(name, help, params)
  SendNUIMessage({
    type = 'ON_SUGGESTION_ADD',
    suggestion = {
      name = name,
      help = help,
      params = params or nil
    }
  })
end
exports('addSuggestion', addSuggestion)
AddEventHandler('chat:addSuggestion', addSuggestion)

AddEventHandler('chat:addSuggestions', function(suggestions)
  for _, suggestion in ipairs(suggestions) do
    SendNUIMessage({
      type = 'ON_SUGGESTION_ADD',
      suggestion = suggestion
    })
  end
end)

AddEventHandler('chat:removeSuggestion', function(name)
  SendNUIMessage({
    type = 'ON_SUGGESTION_REMOVE',
    name = name
  })
end)

AddEventHandler('chat:addMode', function(mode)
  SendNUIMessage({
    type = 'ON_MODE_ADD',
    mode = mode
  })
end)

AddEventHandler('chat:removeMode', function(name)
  SendNUIMessage({
    type = 'ON_MODE_REMOVE',
    name = name
  })
end)

AddEventHandler('chat:addTemplate', function(id, html)
  SendNUIMessage({
    type = 'ON_TEMPLATE_ADD',
    template = {
      id = id,
      html = html
    }
  })
end)

AddEventHandler('chat:clear', function(name)
  SendNUIMessage({
    type = 'ON_CLEAR'
  })
end)

local function stringSplit(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t={}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end
local function stringJoin(tbl)
  local str = tbl[1]
  for k, v in pairs(tbl) do
    if k ~= 1 then
      str = str .. " " .. v
    end
  end
  return str
end
RegisterNUICallback('chatResult', function(data, cb)
  chatInputActive = false
  SetNuiFocus(false)

  if not data.canceled then
    local id = PlayerId()

    --deprecated
    local r, g, b = 0, 0x99, 255

    local message = data.message
    if string.sub(message, 1, 1) ~= "/" then
        message = "/" .. message
    end
    local args = stringSplit(message, " ")
    local cmd = args[1]
    cmd = string.lower(cmd)
    args[1] = cmd
    message = stringJoin(args)

    if message:sub(1, 1) == '/' then
      ExecuteCommand(message:sub(2))
    else
      TriggerServerEvent('_chat:messageEntered', GetPlayerName(id), { r, g, b }, message, data.mode)
    end
  end

  cb('ok')
end)

-- local msgCount2 = 0
-- local scary2 = 0
-- local scaryloop2 = false
-- local dicks2 = 0
-- local dicks3 = 0
-- local dicks = 0

-- local ped = PlayerPedId()
-- local isInVehicle = IsPedInAnyVehicle(ped, true)

-- function DrawText3DTest(x,y,z, text, dicks,power)

--   local onScreen,_x,_y=World3dToScreen2d(x,y,z + 0.1)
--   local px,py,pz=table.unpack(GetGameplayCamCoords())
--   if dicks > 255 then
--       dicks = 255
--   end
--   if onScreen then
--       SetTextScale(0.35, 0.35)
--       SetTextFont(4)
--       SetTextProportional(1)
--       SetTextColour(255, 255, 255, 215)
--       SetTextDropshadow(0, 0, 0, 0, 155)
--       SetTextEdge(1, 0, 0, 0, 250)
--       SetTextDropShadow()
--       SetTextOutline()
--       SetTextEntry("STRING")
--       SetTextCentre(1)
--       AddTextComponentString(text)
--        SetTextColour(255, 255, 255, dicks)

--       DrawText(_x,_y)
--       local factor = (string.len(text)) / 250
--       if dicks < 115 then
--            DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 11, 1, 11, dicks)
--       else
--            DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 11, 1, 11, 115)
--       end

--   end
-- end

-- RegisterNetEvent('scaryLoop2')
-- AddEventHandler('scaryLoop2', function()
-- if scaryloop2 then return end
-- scaryloop2 = true
-- while scary2 > 0 do
--   if msgCount2 > 2.6 then
--     scary2 = 0
--  end
--  Citizen.Wait(1)
--  scary2 = scary2 - 1
-- end
-- dicks2 = 0
-- scaryloop2 = false
-- scary2 = 0
-- msgCount2 = 0
-- end)

-- Citizen.CreateThread( function()
--     while true do
--         Wait(1000)
--         ped = PlayerPedId()
--         isInVehicle = IsPedInAnyVehicle(ped, true)
--     end
-- end)

-- RegisterCommand('me', function(source, args)
--   local Coords = GetEntityCoords(PlayerPedId())
--   local text = '' -- edit here if you want to change the language : EN: the person / FR: la personne
--   for i = 1,#args do
--       text = text .. ' ' .. args[i]
--   end
--   text = text .. ''
--   TriggerServerEvent('3dme:shareDisplay', text, Coords)
-- end)

-- RegisterNetEvent('Do3DText')
-- AddEventHandler("Do3DText", function(text, source, Coords)

--   local lCoords = GetEntityCoords(PlayerPedId())
--   local distIs  = Vdist(lCoords.x, lCoords.y, Coords.z, Coords.x, Coords.y, Coords.z)
--   if(distIs <= 6) then
--       TriggerEvent('DoHudTextCoords', GetPlayerFromServerId(source), text)
--   end
-- end)



-- RegisterNetEvent('DoHudTextCoords')
-- AddEventHandler('DoHudTextCoords', function(mePlayer, text)
--   dicks2 = 600
--   msgCount2 = msgCount2 + 0.22
--   local mycount2 = msgCount2

--   scary2 = 600 - (msgCount2 * 100)
--   TriggerEvent("scaryLoop2")
--   local power2 = true
--   while dicks2 > 0 do

--       dicks2 = dicks2 - 1
--       local plyCoords2 = GetEntityCoords(PlayerPedId())
--       local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
--       local dist = Vdist2(coordsMe, plyCoords2)

--       output = dicks2

--       if output > 255 then
--           output = 255
--       end
--       if dist < 500 then
--           if HasEntityClearLosToEntity(PlayerPedId(), GetPlayerPed(mePlayer), 17 ) then

--               if not isInVehicle and GetFollowPedCamViewMode() == 0 then
--                   DrawText3DTest(coordsMe["x"],coordsMe["y"],coordsMe["z"]+(mycount2/2) - 0.2, text, output,power2)
--               elseif not isInVehicle and GetFollowPedCamViewMode() == 4 then
--                   DrawText3DTest(coordsMe["x"],coordsMe["y"],coordsMe["z"]+(mycount2/7) - 0.1, text, output,power2)
--               elseif GetFollowPedCamViewMode() == 4 then
--                   DrawText3DTest(coordsMe["x"],coordsMe["y"],coordsMe["z"]+(mycount2/7) - 0.2, text, output,power2)
--               else
--                   DrawText3DTest(coordsMe["x"],coordsMe["y"],coordsMe["z"]+mycount2 - 1.25, text, output,power2)
--               end
--           end
--       end

--       Citizen.Wait(1)
--   end

-- end)

RegisterNUICallback('loaded', function(data, cb)
  TriggerServerEvent('chat:init')

  chatLoaded = true

  cb('ok')
end)

local CHAT_HIDE_STATES = {
  SHOW_WHEN_ACTIVE = 0,
  ALWAYS_SHOW = 1,
  ALWAYS_HIDE = 2
}

Citizen.CreateThread(function()
  SetTextChatEnabled(false)
  SetNuiFocus(false)

  local lastChatHideState = -1
  local origChatHideState = -1

  while true do
    Wait(0)

    if not chatInputActive then
      if IsControlPressed(0, isRDR and `INPUT_MP_TEXT_CHAT_ALL` or 245) --[[ INPUT_MP_TEXT_CHAT_ALL ]] then
        chatInputActive = true
        chatInputActivating = true

        SendNUIMessage({
          type = 'ON_OPEN'
        })
      end
    end

    if chatInputActivating then
      if not IsControlPressed(0, isRDR and `INPUT_MP_TEXT_CHAT_ALL` or 245) then
        SetNuiFocus(true)

        chatInputActivating = false
      end
    end

    if chatLoaded then
      local forceHide = IsScreenFadedOut() or IsPauseMenuActive()
      local wasForceHide = false

      if chatHideState ~= CHAT_HIDE_STATES.ALWAYS_HIDE then
        if forceHide then
          origChatHideState = chatHideState
          chatHideState = CHAT_HIDE_STATES.ALWAYS_HIDE
        end
      elseif not forceHide and origChatHideState ~= -1 then
        chatHideState = origChatHideState
        origChatHideState = -1
        wasForceHide = true
      end

      if chatHideState ~= lastChatHideState then
        lastChatHideState = chatHideState

        SendNUIMessage({
          type = 'ON_SCREEN_STATE_CHANGE',
          hideState = chatHideState,
          fromUserInteraction = not forceHide and not isFirstHide and not wasForceHide
        })

        isFirstHide = false
      end
    end
  end
end)
