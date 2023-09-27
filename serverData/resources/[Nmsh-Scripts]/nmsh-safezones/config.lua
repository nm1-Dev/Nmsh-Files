Config = {}

Config.Discord = false -- Enable Discord Logs
Config.Webhook = "https://discord.com/api/webhooks/1128753032658694280/NRpO3KjTOKRfJVDbguVmIzN3GzegjZMTbXSQABiP2bWEA3Cxq_YbuuxHCeMfpZgQHpMy"

Config.AFKMessage = "Kicked For Being AFK For Too Long"


Config.Zones = {

    ["Garage"] = {
        Pos   = vector3(-297.0, -903.99, 31.71), -- Center Of The Zone
		Radius  = 50, -- Radius Of The Zone
        DisableWeapons = true, -- Disable Weapons In SafeZone (set to true to disable)
        SpeedLimit = true, -- Enable Speed Limit in SafeZone
        MaxSpeed = 20, -- Set Max Speed in SafeZone in KPH (Must set SpeedLimit to true)
        AFK = false, -- Kick on being AFK?
        AFKTimer = 10, -- Set Time for SafeZone till player will be kicked (Must set AFK to true)
        Notification = true, -- Enable SafeZone Message on Top
        Title = "You're in Safe Zone at Garage" -- Set Custom Message (Must set Notification to true)
	},

    ["Hospital"] = {
        Pos   = vector3(303.97, -585.84, 43.27), -- Center Of The Zone
		Radius  = 50, -- Radius Of The Zone
        DisableWeapons = true, -- Disable Weapons In SafeZone (set to true to disable)
        SpeedLimit = true, -- Enable Speed Limit in SafeZone
        MaxSpeed = 20, -- Set Max Speed in SafeZone in KPH (Must set SpeedLimit to true)
        AFK = false, -- Kick on being AFK?
        AFKTimer = 20, -- Set Time for SafeZone till player will be kicked (Must set AFK to true)
        Notification = true, -- Enable SafeZone Message on Top
        Title = "You're in Safe Zone at Hospital" -- Set Custom Message (Must set Notification to true)
	},
}