Config = {}
function L(cd) if Locales[Config.Language][cd] then return Locales[Config.Language][cd] else print('Locale is nil ('..cd..')') end end


Config.Language = 'EN' --[ 'EN' / 'FR' / 'ES' ] You can add your own locales to the Locales.lua. But make sure to add it here.

Config.Framework = 'qbcore'
Config.NotificationType = { --[ 'esx' / 'qbcore' / 'mythic_old' / 'mythic_new' / 'chat' / 'other' ] Choose your notification script.
    server = 'qbcore',
    client = 'qbcore' 
}

Config.Command = {
    OpenUI = 'time', --The command for staff to open the UI.
    Perms = { --You decide which permission groups can use the staff command ^.
        ['qbcore'] = {'god', 'admin'},
    }
}
--███╗   ███╗ █████╗ ██╗███╗   ██╗
--████╗ ████║██╔══██╗██║████╗  ██║
--██╔████╔██║███████║██║██╔██╗ ██║
--██║╚██╔╝██║██╔══██║██║██║╚██╗██║
--██║ ╚═╝ ██║██║  ██║██║██║ ╚████║
--╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝
Config.TsunamiWarning = true --Do you want to enable the tsunami warning countdown just before a server restart?
Config.TsunamiWarning_time = 2 --(in minutes) How long the tsunami warning should last. Read the docs for more info.

Config.TimeCycleSpeed = 5 --(in seconds) Changing this value will effects the day/night time cycle, decreasing slows it down, incresing speeds it up. Right now its similar to the default gta5 time cycle.
Config.DynamicWeather_time = 10 --(in minutes) If dynamic weather is enabled, this value is how long until the weather changes.
Config.RainChance = 10 --The percent chance for it to rain out of 100.
Config.SnowChance = 1 --The percent chance for it to snow out of 100.
Config.ThunderChance = 20 --The percent chance for it to thunder when raining out of 100.
Config.VehicleBlackoutEffect = false --Do you want the lights on vehicles to be turned off during blackouts?

Config.WeatherGroups = { --These are the weather groups, it will cycle through each group from left to right making sure it cycles through low intensity rain to high intensity for example (48 mins for 1 full day cycle).
    [1] = {'CLEAR', 'OVERCAST','EXTRASUNNY', 'CLOUDS'},--clear
    [2] = {'CLEARING', 'RAIN', 'NEUTRAL', 'THUNDER'},--rain
    [3] = {'SMOG', 'FOGGY'},--foggy
    [4] = {'SNOWLIGHT', 'SNOW', 'BLIZZARD', 'XMAS'},--snow
}