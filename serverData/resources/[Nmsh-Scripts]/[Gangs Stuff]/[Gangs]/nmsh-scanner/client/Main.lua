local QBCore = exports["qb-core"]:GetCoreObject()

local function ChannelsInRange(coords)
    local p = promise.new()
    QBCore.Functions.TriggerCallback("radio:RadiosInRange", function(r)
        p:resolve(r)
    end, coords)
    return Citizen.Await(p)
end

local function Scan()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local channels = ChannelsInRange(coords)

    local menu = {}

    menu[#menu+1] = {
        icon = "fa-solid fa-tower-broadcast",
        header = "Frequencies",
        isMenuHeader = true,
    }
    for k,v in pairs(channels) do
        menu[#menu+1] = {
            icon = "fa-solid fa-rss",
            header = v["min"].." MHz ~ "..v["max"].." MHz",
            disabled = true,
        }
    end
    exports["nmsh-menu"]:openMenu(menu)
end

RegisterNetEvent("radio:scan", function()
    QBCore.Functions.Progressbar("RadioScan", "Scanning", 7000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        Scan()
    end, function() -- Cancel						
    end)
end)
