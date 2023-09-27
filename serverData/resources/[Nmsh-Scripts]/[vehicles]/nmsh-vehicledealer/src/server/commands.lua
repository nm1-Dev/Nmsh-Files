QBCore.Commands.Add("vehshop:create", "Create a Vehicle Shop",{}, false, function(source)
  TriggerClientEvent("VehicleShops:CreateNew", source)
end, "god")