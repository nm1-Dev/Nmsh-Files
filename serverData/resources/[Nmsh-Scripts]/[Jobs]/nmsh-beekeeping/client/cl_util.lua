local QBCore = exports['qb-core']:GetCoreObject()

local isPlacing = false
local object = nil
local objectCoords = nil

function placeObject(pObject, cb)
  local objectHash, playerPed = GetHashKey(pObject), PlayerPedId()
  local minV, maxV = GetModelDimensions(objectHash)
  
  local objectHeading = GetEntityHeading(playerPed)
  local objectCoords = centerCoords

  object = CreateObject(objectHash, centerCoords, 0, 0, 0)
  SetEntityCollision(object, false)
  LoadEntityModel(objectHash)

  local placed = false
  local isInvisible = false
  local canPlace = false

  isPlacing = true

  CreateThread(function()
    while isPlacing do
      local centerCoords = GetEntityCoords(playerPed) + (GetEntityForwardVector(playerPed) * 1.5)

      DisablePlayerFiring(PlayerPedId(), true)
      DisableControlAction(0, 24, true) -- Attack
      DisableControlAction(0, 142, true) -- MeleeAttackAlternate
      DisableControlAction(1, 38, true) --Key: E
      DisableControlAction(0, 44, true) --Key: Q

      if IsDisabledControlJustPressed(0, 177) then -- Escape
        stopPlacing()
      end

      if IsDisabledControlJustPressed(0, 174) then -- Right arrow key
          objectHeading = objectHeading + 5
          if objectHeading > 360 then objectHeading = 0.0 end
      end

      if IsDisabledControlJustPressed(0, 175) then
          objectHeading = objectHeading - 5 -- Left arrow key
          if objectHeading < 0 then objectHeading = 360.0 end
      end

      SetEntityCoords(object, centerCoords.x, centerCoords.y, centerCoords.z, 0.0, 0.0, 0.0, false)
      PlaceObjectOnGroundProperly_2(object)
      SetEntityHeading(object, objectHeading)

      local rayHandle = StartShapeTestBox(
        centerCoords,
        maxV - minV,
        GetEntityRotation(playerPed, 2),
        2,
        339,
        playerPed,
        4
      )
      local retval, hit, endCoords, _, materialHash, _ = GetShapeTestResultIncludingMaterial(rayHandle)
      if hit == 1 then
        canPlace = false
        if not isInvisible then
          SetObjectVisibilityState(object, true, function(pState)
            isInvisible = pState
          end)
        end
      else
        local rayHandle = StartExpensiveSynchronousShapeTestLosProbe(centerCoords.x, centerCoords.y, centerCoords.z, centerCoords.x, centerCoords.y, centerCoords.z - 2, 1, 0, 4)
        local retval, hit, endCoords, _, materialHash, _ = GetShapeTestResultIncludingMaterial(rayHandle)
        local properMaterial = MaterialHashes[tostring(materialHash)]
        canPlace = properMaterial
        if properMaterial and isInvisible then
          SetObjectVisibilityState(object, false, function(pState)
            isInvisible = pState
          end)
        elseif not properMaterial and not isInvisible then
          SetObjectVisibilityState(object, true, function(pState)
            isInvisible = pState
          end)
        end
      end

      if canPlace and IsControlJustPressed(0, 191) then -- Enter
        objectCoords = GetEntityCoords(object)
        objectHeading = GetEntityHeading(object)
        isPlacing = false
        placed = true
        if object then
          DeleteObject(object)
        end
      end
      Wait(0)
    end
    cb(placed, objectCoords, objectHeading)
  end)
end

function stopPlacing()
  if object then
    DeleteObject(object)
  end
  isPlacing = false
  placed = false
end

function LoadEntityModel(pModelHash)
  RequestModel(pModelHash)
  while not HasModelLoaded(pModelHash) do
      Wait(0)
  end
end

function SetObjectVisibilityState(pObject, pState, cb)
  if pState then
    SetEntityAlpha(pObject, 0, true)
  else
    ResetEntityAlpha(pObject)
  end
  cb(pState)
end

AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end
  if object then
    DeleteObject(object)
  end
end)
