RegisterCommand("runplate", function(source,args)
    PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData.job.name == "police" then    
        exports["nmsh-second-dispatch"]:dispatchadd("Flagged Vehicle:" .. args[1])
    else
        QBCore.Functions.Notify("You are not police man", "error")
    end
end)

RegisterCommand("10-11", function()
    PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData.job.name == "police" then
        local icon = 189 -- https://docs.fivem.net/docs/game-references/blips/
        exports["nmsh-second-dispatch"]:policedead("10-11A", "Police Injured!", icon)
    else
        QBCore.Functions.Notify("Polis değilsin", "error")
    end
end)

RegisterCommand("callsign", function(source, args)
    if PlayerData.job.name == 'police' or PlayerData.job.name == "ambulance" then
        local hasitem = QBCore.Functions.HasItem('gps', 1)
        if hasitem then
            exports["nmsh-second-dispatch"]:callsign_command(args[1], args[2])
        else
            QBCore.Functions.Notify("Üzerinde GPS yok!", "error")
        end
    else
        exports["mythic_notify"]:SendAlert("inform", "You need to clock in.", 5000)
    end
end)

RegisterCommand("open-dp", function()
    openMenu()
end)

RegisterCommand("map", function()
    SendNUIMessage({
        action = "map"
    })
end)

Citizen.CreateThread(function()
    RegisterKeyMapping("map", "open the map hocam", "keyboard", "M")
    RegisterKeyMapping("open-dp", "open the menu hocam", "keyboard", "O")
end)