-- -- [ Code ] --

-- RegisterNetEvent('nmsh-smallresources/server/error-log', function(Resource, Args)
--     SendToDiscord("```Error in "..Resource..'```', Args)
-- end)

-- -- [ Functions ] --

-- function SendToDiscord(Name, Args)
--     local connect = {
--           {
--               ["color"] = 16711680,
--               ["title"] = ""..Name.."",
--               ["description"] = Args,
--               ["footer"] = {
--                   ["text"] = "Nmsh Logs",
--               },
--           }
--       }
--     PerformHttpRequest('https://discord.com/api/webhooks/1127357787509370891/aavR8Q91sHA29I6fOUbUvvljTfCxz04o2HaVPSVkZbrtoKKF_CcMPZIEVaFgRuJ_IsZo', function(err, text, headers) end, 
--     'POST', json.encode({username = "Mercy - Error Log", embeds = connect, avatar_url = "https://i.imgur.com/omxrzjn.png"}), { ['Content-Type'] = 'application/json' })
-- end