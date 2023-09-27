local target
local export
if GetResourceState('nmsh-target') == 'started' then
    target = 'nmsh-target'
    export = exports['nmsh-target']
elseif GetResourceState('ox_target') == 'started' then
    target = 'ox_target'
    export = exports['ox_target']
end

function zf.addZone(name, coords, length, width, options, targetoptions)
    if target == 'nmsh-target' then
        return export:AddBoxZone(name, coords, length, width, options, targetoptions)
    elseif target == 'ox_target' then
        return export:addBoxZone({
            coords = coords,
            size = vector3(length, width, (options.maxZ - options.minZ)),
            rotation = options.heading,
            debug = option.debugPoly,
            options = targetoptions
        })
    end
end

function zf.addEntity(entity, targetoptions)
    if target == 'nmsh-target' then
        return export:AddTargetEntity(entity, targetoptions)
    elseif target == 'ox_target' then
        return export:addTargetEntity(entity, targetoptions)
    end
end

function zf.addModel(models, targetoptions)
    if target == 'nmsh-target' then
        return export:AddTargetModel(models, targetoptions)
    elseif target == 'ox_target' then
        return export:addModel(models, targetoptions)
    end
end

function zf.removeZone(name)
    if target == 'nmsh-target' then
        return export:RemoveZone(name)
    elseif target == 'ox_target' then
        return export:removeZone(name)
    end
end

function zf.removeEntity(entities, options)
    if target == 'nmsh-target' then
        return export:RemoveTargetEntity(entities, options)
    elseif target == 'ox_target' then
        return export:removeEntity(entities, options)
    end
end

function zf.removeModel(models, options)
    if target == 'nmsh-target' then
        return export:RemoveTargetModel(models, options)
    elseif target == 'ox_target' then
        return export:removeModel(models, options)
    end
end

function zf.spawnPed(data)
    if target == 'nmsh-target' then
        return export:SpawnPed(data)
    elseif target == 'ox_target' then
        -- zf.addZone()
    end
end
