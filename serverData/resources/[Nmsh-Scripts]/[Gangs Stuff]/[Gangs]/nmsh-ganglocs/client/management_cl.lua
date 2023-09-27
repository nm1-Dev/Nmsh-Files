----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local TargetName = Config.CoreSettings.TargetName
local ManagementEvent = Config.CoreSettings.ManagementEvent
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- TARGETING --<!>--
for k, v in pairs(Config.Locations.Management) do
    exports[TargetName]:AddCircleZone('gangmanage_'..k, v.coords, v.radius, { 
            name= 'gangmanage_'..k, 
            debugPoly= v.debugPoly, 
            useZ= v.useZ, 
        },{ 
        options = { 
            {
                event = ManagementEvent,
                icon = Language.Targeting['managementicon'],
                label = Language.Targeting['managementlabel'],
                gang = {[k] = v.grade}
            },
        },
        distance = v.distance
    })
end
--<!>-- TARGETING --<!>--

