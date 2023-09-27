local QBCore = exports['qb-core']:GetCoreObject()
local useDebug = Config.Debug

local function removeItem(item, src)
   local Player = QBCore.Functions.GetPlayer(src)
   if Config.UseOxInv then
      exports.ox_inventory:RemoveItem(src, item, 1, nil)
      TriggerClientEvent('inventory:client:ItemBox', src, exports.ox_inventory:Items()[item], "remove")
   else
      if Player.Functions.GetItemByName(item) then
         Player.Functions.RemoveItem(item, 1)
         TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
         Player.Functions.AddItem(src, item, 1)
         TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
      end
   end
end

local function addItem(item, src)
   if Config.UseOxInv then
      exports.ox_inventory:AddItem(src, item, 1)
      TriggerClientEvent('inventory:client:ItemBox', src, exports.ox_inventory:Items()[item], "add")
   else
      local Player = QBCore.Functions.GetPlayer(src)
       Player.Functions.AddItem(src, item, 1)
       TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
   end
end

QBCore.Functions.CreateUseableItem(Config.DriftChipItem, function(source, item)
   if Config.UseOxInv then
      if item.metadata.durability == 0 then
         TriggerClientEvent('QBCore:Notify', source, 'The Drift Chip is out of juice', 'error')
         return
      end
   end
   local Player = GetPlayerPed(source)
   local vehicle = GetVehiclePedIsIn(Player, false)
   if vehicle then
      TriggerClientEvent('cw-driftchip:client:toggleDrift', source)
   end
end)

RegisterNetEvent('cw-driftchip:server:openbox', function()
   removeItem(Config.DriftChipBoxItem, source)
   -- addItem(Config.DriftChipItem, source)
end)

QBCore.Functions.CreateUseableItem(Config.DriftChipBoxItem, function(source, item)
   TriggerClientEvent('cw-driftchip:client:openbox', source)
end)
