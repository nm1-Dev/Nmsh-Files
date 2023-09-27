Bank = Bank or {}

Bank.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use nmsh-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

-- This is the handler for the cop count, you can change this to anything you want as this is by default the nmsh-policejob event
RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

--- This function will be executed once a doorlock action is happening, so locking or unlocking a door
--- @param doorId number | string
--- @param setLocked boolean
--- @return nil
function Bank.DoorlockAction(doorId, setLocked)
    TriggerServerEvent('nmsh-doorlock:server:updateState', doorId, setLocked, false, false, true, false, false)
end

--- This function will be triggered once the hack is done
--- @param success boolean
--- @param bank number | string
--- @return nil
function Bank.OnHackDone(success, bank)
    TriggerEvent('mhacking:hide')
    if not success then return end
    TriggerServerEvent('nmsh-bankrobbery:server:setBankState', bank)
end

--- This will be triggered once an action happens that can drop evidence
--- @param pos vector3
--- @param chance number
--- @return nil
function Bank.OnEvidence(pos, chance)
    if math.random(1, 100) > chance or QBCore.Functions.IsWearingGloves() then return end
    TriggerServerEvent("evidence:server:CreateFingerDrop", pos)
end

--- This will be called each 10 seconds whilst drilling a safety deposit box
--- @return nil
function Bank.OnDrillingAction()
    TriggerServerEvent('hud:server:GainStress', math.random(4, 8))
end

--- This is triggered whenever a robbery call is made by the alarm of a bank
--- @param message string
--- @return nil
function Bank.OnPoliceAlert(message)
    -- TriggerServerEvent("police:server:policeAlert", message)
    TriggerEvent('')
end

--- This is called when the user is nearby an interaction that requires said items, this will trigger the box that shows what items you need
---
--- Format for `items`:
--- ```lua
--- {
---     [itemIndexNumber] = { name = 'itemName', image = 'itemImage' }
--- }
--- ```
--- @param items table | nil
--- @param show boolean
--- @return nil
function Bank.ShowRequiredItems(items, show)
    TriggerEvent('inventory:client:requiredItems', items, show)
end

Bank.MinimumPaletoPolice = 0
Bank.MinimumPacificPolice = 0
Bank.MinimumFleecaPolice = 0
Bank.MinimumThermitePolice = 0
Bank.OutlawCooldown = 5 -- The amount of minutes it takes for the cops to be able to be called again after they were called
