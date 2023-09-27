if GetResourceState('ox_target') == 'started' or GetResourceState('nmsh-target') ~= 'started' or not Config.UseTarget then return end

local Zones = {}

function AddModel(models, options)
    local optionsNames = {}
    for i=1, #options do 
        optionsNames[i] = options[i].name
    end
    RemoveModel(models, optionsNames)
    exports['nmsh-target']:AddTargetModel(models, {options = options, distance = 2.5})
end

function RemoveModel(models, optionsNames)
    exports['nmsh-target']:RemoveTargetModel(models, optionsNames)
end

function AddTargetZone(coords, radius, options)
    local index
    repeat
        index = "prison_coord_" .. math.random(1, 999999999)
    until not Zones[index]
    for i=1, #options do 
        if options[i].onSelect then
            options[i].action = options[i].onSelect
            options[i].onSelect = nil
        end
    end
    exports['nmsh-target']:AddCircleZone(index, coords, radius, {name = index}, {
        options = options
    })
    return index
end

function RemoveTargetZone(index)
    Zones[index] = nil
    exports['nmsh-target']:RemoveZone(index)
end