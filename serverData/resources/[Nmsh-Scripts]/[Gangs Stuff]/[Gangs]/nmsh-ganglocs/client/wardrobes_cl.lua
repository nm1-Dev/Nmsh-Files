----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local TargetName = Config.CoreSettings.TargetName
local ClothingEvent = Config.CoreSettings.ClothingEvent
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- TARGETING --<!>--
for k, v in pairs(Config.Locations.Wardrobe) do
    exports[TargetName]:AddCircleZone('gangwardrobe_'..k, v.coords, v.radius, { 
            name= 'gangwardrobe_'..k, 
            debugPoly= v.debugPoly, 
            useZ= v.useZ, 
        },{ 
        options = { 
            {
                event = ClothingEvent,
                icon = Language.Targeting['wardrobeicon'],
                label = Language.Targeting['wardrobelabel'],
                gang = {[k] = v.grade}
            },
        },
        distance = v.distance
    })
end
--<!>-- TARGETING --<!>--
