local nmsh = exports['qb-core']:GetCoreObject()
local xSound = exports.xsound

nmsh.Functions.CreateUseableItem("boombox", function(source, item)
	local src = source
	local Player = nmsh.Functions.GetPlayer(src)
	Player.Functions.RemoveItem('boombox', 1, false)
	
	TriggerClientEvent('nmsh-boombox:client:placeBoombox', src)
	TriggerClientEvent('nmsh:Notify', src, 'You have just dropped the BoomBox', 'primary')
end)

RegisterNetEvent('nmsh-boombox:server:playMusic', function(song, entity, coords)
    local src = source
    xSound:PlayUrlPos(-1, tostring(entity), song, Config.DefaultVolume, coords)
    xSound:Distance(-1, tostring(entity), Config.radius)
    isPlaying = true
end)

RegisterNetEvent('nmsh-boombox:server:pickedup', function(entity)
	local src = source
	local Player = nmsh.Functions.GetPlayer(src)
    xSound:Destroy(-1, tostring(entity))
    if entity then
        Player.Functions.AddItem('boombox', 1, false)
        nmsh.Functions.Notify(src, 'Boombox returned back in to your inventory', 'success', 2500)
    end
end)

RegisterNetEvent('nmsh-boombox:server:stopMusic', function(data)
    local src = source
    xSound:Destroy(-1, tostring(data.entity))
    TriggerClientEvent('nmsh-boombox:client:playMusic', src)
end)

RegisterNetEvent('nmsh-boombox:server:pauseMusic', function(data)
    local src = source
    xSound:Pause(-1, tostring(data.entity))
end)

RegisterNetEvent('nmsh-boombox:server:resumeMusic', function(data)
    local src = source
    xSound:Resume(-1, tostring(data.entity))
end)

RegisterNetEvent('nmsh-boombox:server:changeVolume', function(volume, entity)
    local src = source
    if not tonumber(volume) then return end
    xSound:setVolume(-1, tostring(entity), volume)
end)