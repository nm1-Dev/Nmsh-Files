function zf.getPlate(vehicle)
    if vehicle == 0 then return end
    return zf.trim(GetVehicleNumberPlateText(vehicle))
end