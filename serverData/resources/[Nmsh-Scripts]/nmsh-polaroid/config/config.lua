Config = {}

Config.Framework = 'qbcore'  -- 'esx(not ready yet)' or 'qbcore'
Config.Database = 'oxmysql'  -- 'oxmysql' or 'mysql-async' or 'ghmattimysql'
Config.DebugCommand = true
Config.PrintingTime = 8000
Config.ScreenShotBasicResourceName = 'screenshot-basic'

Config.ProgressbarPrinting = function()
    exports['gate-taskbar']:taskBar(Config.PrintingTime, "Printing")  --You can use your own progressbar
end