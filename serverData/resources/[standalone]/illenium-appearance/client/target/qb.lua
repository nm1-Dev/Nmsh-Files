if not Config.UseTarget then return end

if not Target.IsQB() then return end

function Target.RemoveZone(zone)
    exports["nmsh-target"]:RemoveZone(zone)
end

function Target.AddTargetEntity(entity, parameters)
    exports["nmsh-target"]:AddTargetEntity(entity, parameters)
end

function Target.AddBoxZone(name, coords, size, parameters)
    exports["nmsh-target"]:AddBoxZone(name, coords, size.x, size.y, {
        name = name,
        debugPoly = Config.Debug,
        minZ = coords.z - 2,
        maxZ = coords.z + 2,
        heading = coords.w
    }, parameters)
end

function Target.AddPolyZone(name, points, parameters)
    exports["nmsh-target"]:AddPolyZone(name, points, {
        name = name,
        debugPoly = Config.Debug,
        minZ = points[1].z - 2,
        maxZ = points[1].z + 2
    }, parameters)
end

function Target.IsTargetStarted()
    return GetResourceState("nmsh-target") == "started"
end
