local QBCore = exports["qb-core"]:GetCoreObject()

QBCore.Functions.CreateUseableItem("radioscanner", function(source, item)
    local src = source
    TriggerClientEvent("radio:scan", src)
end)

QBCore.Functions.CreateCallback("radio:RadiosInRange", function(source, cb, coords)
    local players = QBCore.Functions.GetQBPlayers()
    local channels = {}
    for k, v in pairs(players) do
        local pcoords = GetEntityCoords(GetPlayerPed(v.PlayerData.source))
        local distance = #(coords - pcoords)
        if distance <= Config.ScannerRange then
            local state = Player(v.PlayerData.source).state
            local channel = state["radioChannel"]
            if channel ~= 0 then
                channels[channel] = {
                    min = (channel - math.random(1, Config.GuessRangeMin)), 
                    max = (channel + math.random(1, Config.GuessRangeMax))
                }
            end
        end
    end
    cb(channels)
end)
