----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local TargetName = Config.CoreSettings.TargetName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--


--<!>-- NOTIFICATIONS --<!>--
-- Notifications
RegisterNetEvent('nmsh-ganglocs:notify', function(msg,type)
    Core.Functions.Notify(msg,type)
end)
--<!>-- NOTIFICATIONS --<!>--

--<!>-- JOB CHECK --<!>--
function ServiceJob(player)
    local pJob = Core.Functions.GetPlayerData().job
    for i = 1, #Config.Services, 1 do
        if pJob.onduty and pJob.name == Config.Services[i].name and pJob.grade.level >= Config.Services[i].grade then
            return true
        else 
            return false
        end
    end
end
--<!>-- JOB CHECK --<!>--

--<!>-- TARGETING --<!>--
for k, v in pairs(Config.Locations.Stash) do
    local player = PlayerPedId()
    exports[TargetName]:AddCircleZone('gangstash_'..k, v.coords, v.radius, { 
            name= 'gangstash_'..k, 
            debugPoly= v.debugPoly, 
            useZ= v.useZ, 
        },{ 
        options = { 
            {
                event = 'nmsh-ganglocs:cl:OpenStash',
                icon = Language.Targeting['stashicon'],
                label = Language.Targeting['stashlabel'],
                gang = {[k] = v.grade},
                stash = v.label,
                size = v.size,
                slots = v.slots,
                force = false
            },
            {
                event = 'nmsh-ganglocs:cl:OpenStash',
                icon = Language.Targeting['raidicon'],
                label = Language.Targeting['raidlabel'],
                canInteract = function(entity)
                    if ServiceJob() then
                        return true
                    end
                end,
                stash = v.label,
                size = v.size,
                slots = v.slots,
                raidtime = v.raidtime,
                force = true
            },
        },
        distance = v.distance
    })
end
--<!>-- TARGETING --<!>--

--<!>-- OPEN STASH --<!>--
RegisterNetEvent('nmsh-ganglocs:cl:OpenStash', function(data)
    local player = PlayerPedId()
    if not data.force then
        TriggerEvent('inventory:client:SetCurrentStash', data.stash)
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', data.stash, {
            maxweight = data.size,
            slots = data.slots,
        })
    else
        Core.Functions.Progressbar(data.stash, Language.Stashes['forceentry'], data.raidtime*1000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
        }, {
            animDict = Config.Animations.Raid.Dict,
            anim = Config.Animations.Raid.Anim,
            flags = Config.Animations.Raid.Flags,
        }, {}, {}, function()
            TriggerEvent('inventory:client:SetCurrentStash', data.stash)
            TriggerServerEvent('inventory:server:OpenInventory', 'stash', data.stash, {
                maxweight = data.size,
                slots = data.slots,
            })
            ClearPedTasks(player)
        end, function()
            TriggerEvent('inventory:client:busy:status', false)
            TriggerEvent('nmsh-ganglocs:notify', Language.Shared['cancel'], 'error')
            ClearPedTasks(player)
        end)
    end
end)
--<!>-- OPEN STASH --<!>--
