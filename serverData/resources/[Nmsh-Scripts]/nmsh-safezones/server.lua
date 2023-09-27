
function sendToDiscord(color, name, message, footer)
    local embed = {
              {
                  ["color"] = color,
                  ["title"] =  name,
                  ["description"] = message,
                  ["footer"] = {
                      ["text"] = footer,
                  },
              }
          }
      
        PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent("nmsh-safezone:log")
AddEventHandler("nmsh-safezone:log", function(status, name)
    local idJ = source
 if status then 
    sendToDiscord(16753920, "Entered SafeZone at "..name, "**Player Name: **" ..GetPlayerName(idJ), "nmsh-SAFEZONES")
else 
    sendToDiscord(16753920, "Exited SafeZone at "..name, "**Player Name: **" ..GetPlayerName(idJ), "nmsh-SAFEZONES")
end
end)