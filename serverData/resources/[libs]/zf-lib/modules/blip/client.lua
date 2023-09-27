Blips = {}
JobBlips = {}
GangBlips = {}

function zf.registerBlip(coords, label, sprite, colour, scale, display)
    local res = GetInvokingResource()
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, sprite)
    SetBlipDisplay(blip, display)
    SetBlipScale(blip, scale)
    SetBlipColour(blip, colour)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(label)
    EndTextCommandSetBlipName(blip)
    
    if Blips[res] and Blips[res].blips then
        Blips[res].blips[#Blips[res].blips + 1] = blip
    else
        Blips[res] = {}
        Blips[res].blips = {}
        Blips[res].blips[#Blips[res].blips + 1] = blip
    end
end

function zf.registerJobBlip(job, coords, label, sprite, colour, scale, display)
end

function zf.registerGangBlip(gang, coords, label, sprite, colour, scale, display)
end

local function removeJobBlip()
end

local function removeGangBlip()
end

local function removeResourceBlips(resname)
    if Blips[resname] and Blips[resname].blips then
        for id,blip in pairs(Blips[resname].blips) do
            RemoveBlip(blip)
        end
        Blips[resname] = {}
    end

    if JobBlips[resname] and JobBlips[resname].blips then
        for id,blip in pairs(JobBlips[resname].blips) do
            RemoveBlip(blip)
        end
        JobBlips[resname] = {}
    end

    if GangBlips[resname] and GangBlips[resname].blips then
        for id,blip in pairs(GangBlips[resname].blips) do
            RemoveBlip(blip)
        end
        GangBlips[resname] = {}
    end
end

AddEventHandler('onResourceStop', function(resname)
    if Blips[resname] or JobBlips[resname] or GangBlips[resname] then
        removeResourceBlips(resname)
    end
end)