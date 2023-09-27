error = function(...) end

KashCharacters  = {}
KashPlayers     = {}

Config = (Config or {
  StockStolenPedVehicles    = false,
  StockStolenPlayerVehicles = false, 
})

Warehouse = (Warehouse or {  
  entry = vector4(-281.71,-2656.73,6.41, 46.00),
  exit  = vector4(-1243.92,-3023.24,-48.48, 90.00),

  defaults = {
    gridStart   = vector3(-1281.30,-3042.80,-48.48),
    gridHead    = 0.0,

    gridWidth   = 7,
    gridLength  = 6,

    gridSpacingX = 4.98,
    gridSpacingY = 8.00,

    randomPriceVariation = 10, -- % random variation
  },

  purchasedSpawns = {
    vector4(-283.40,-2647.91,6.0,46.0),
    vector4(-286.43,-2649.76,6.0,46.0),
    vector4(-288.64,-2652.12,6.0,46.0),
    vector4(-290.94,-2654.26,6.0,46.0),
    vector4(-293.12,-2656.53,6.0,46.0),
  },
})

KashChosen = function(charId)
  local _source = source
  KashCharacters[_source] = charId
  local xPlayer = QBCore.Functions.GetPlayer(_source)

  -- local identifier = (KashCharacters[_source] and KashCharacters[_source]..":" or '')..xPlayer.PlayerData.license


  KashPlayers[identifier] = {src = _source, id = xPlayer.PlayerData.citizenid}
end


GetDatabaseName = function()
  local dbconvar = GetConvar('mysql_connection_string', 'Empty')
  if not dbconvar or dbconvar == "Empty" then 
    error("Local dbconvar is empty."); 
    return false
  else
    local strStart,strEnd = string.find(dbconvar, "database=")
    if not strStart or not strEnd then
      local oStart,oEnd = string.find(dbconvar,"mysql://")
      if not oStart or not oEnd then
        error("Incorrect mysql_connection_string.")
        return false
      else
        local hostStart,hostEnd = string.find(dbconvar,"@",oEnd)
        local dbStart,dbEnd = string.find(dbconvar,"/",hostEnd+1)
        local eStart,eEnd = string.find(dbconvar,"?")
        local _end = (eEnd and eEnd-1 or dbconvar:len())
        local dbName = string.sub(dbconvar, dbEnd + 1, _end) 
        return dbName
      end
    else
      local dbStart,dbEnd = string.find(dbconvar,";",strEnd)
      local dbName = string.sub(dbconvar, strEnd + 1, (dbEnd and dbEnd-1 or dbconvar:len())) 
      return dbName
    end    
  end
end

Init = function()
  VehicleShops = {}
  WarehouseVehicles = {}
  local dbName = GetDatabaseName()
  if dbName then
    SqlFetch("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA=@table AND TABLE_NAME=@name",{['@table'] = dbName,['@name']  = (Config and Config.VehiclesTable or "player_vehicles")},function(r0)
      if type(r0) == "table" and r0[1] and r0[1].TABLE_NAME == (Config and Config.VehiclesTable or "player_vehicles") then
        SqlFetch("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA=@table AND TABLE_NAME=@name",{['@table'] = dbName,['@name']  = (Config and Config.ShopTable or "vehicle_shops")},function(r1)
          if type(r1) == "table" and r1[1] and r1[1].TABLE_NAME == (Config and Config.ShopTable or "vehicle_shops") then
                SqlFetch("SELECT * FROM "..(Config and Config.ShopTable or "vehicle_shops"),{},function(shopData)
                  for k,v in pairs(shopData) do
                    if v and v.locations and v.locations ~= '' and v.employees and v.employees ~= '' and v.stock and v.displays and v.displays ~= '' then
                      VehicleShops[v.name] = {
                        owner = (v.owner ~= "none" and v.owner or false),
                        charid = v.charid,
                        name = v.name,
                        locations = json.decode(v.locations),
                        employees = json.decode(v.employees),
                        stock     = json.decode(v.stock),
                        displays  = json.decode(v.displays),
                        funds     = v.funds,
                        price     = v.price,
                      }
                    end
                  end                 
                  vehData = QBCore.Shared.VehiclesModels
                    for k,v in pairs(vehData) do
                      if v.shop	== 'luxury' then	

                        v.price = v.price - v.price * 0.3

                        table.insert(WarehouseVehicles,{
                          name = v.name,
                          model = v.model,
                          price = v.price
                        })

                      end
                    end
                    ModReady = true
                    print("Ready.")
                    RefreshVehicles()             
                end)  
              end
        end)
      end
    end)
  end
end

RefreshVehicles = function()
  local randomDefault = function(curPicked)
  local vehicle = WarehouseVehicles[math.random(#WarehouseVehicles)]
  while curPicked[vehicle] do 
    vehicle = WarehouseVehicles[math.random(#WarehouseVehicles)]; Wait(0); 
  end
  return vehicle
  end
  if type(Warehouse) ~= "table" or type(Warehouse.defaults) ~= "table" or 
  not Warehouse.defaults.gridLength or 
  not Warehouse.defaults.gridWidth  or
  not Warehouse.defaults.gridStart  then
    -- print("Error finding Warehouse.defaults value.")
    return
  end

  PickedVehicles = {}
  ShopVehicles = {}
  for x=Warehouse.defaults.gridStart.x,Warehouse.defaults.gridStart.x+(Warehouse.defaults.gridWidth * Warehouse.defaults.gridSpacingX),Warehouse.defaults.gridSpacingX do
    for y=Warehouse.defaults.gridStart.y,Warehouse.defaults.gridStart.y+(Warehouse.defaults.gridLength * Warehouse.defaults.gridSpacingY),Warehouse.defaults.gridSpacingY do
      local here = vector4(x,y,Warehouse.defaults.gridStart.z,Warehouse.defaults.gridHead)
      local vehicle = randomDefault(PickedVehicles)
      local price = vehicle.price + (vehicle.price * math.floor((math.random(Warehouse.defaults.randomPriceVariation) / 100)))
      table.insert(ShopVehicles,{model = vehicle.model,name = vehicle.name,price = price,pos = here})
      PickedVehicles[vehicle] = true
    end
  end

  TriggerClientEvent("VehicleShops:WarehouseRefresh",-1,ShopVehicles)
  Wait(24 * 60 * 60 * 60 * 1000)
  RefreshVehicles()
end

WaitForReady = function()
  while not ModReady do Wait(0); end
end

GetVehicleShops = function(source,callback)
  WaitForReady()
  callback({shops = VehicleShops, vehicles = ShopVehicles},KashCharacters[source])
end

CreateShop = function(name,locations,price)
  VehicleShops[#VehicleShops+1] = {
    owner = false,
    name = name,
    locations = locations,
    employees = {},
    stock = {},
    displays = {},
    funds = 0,
    price = math.max(1,tonumber(price))
  }

  TriggerClientEvent("VehicleShops:Sync",-1,VehicleShops)
  SqlExecute("INSERT INTO "..(Config and Config.ShopTable or "vehicle_shops").." SET owner='none',name=@name,locations=@locations,employees='{}',stock='{}',displays='{}',funds=0,price=@price",{['@name'] = name, ['@locations'] = json.encode(locations),['@price'] = math.max(1,tonumber(price))})
end

PurchaseShop = function(source,callback,shop)
  local _source = source
  local xPlayer = QBCore.Functions.GetPlayer(_source)
  local can_buy = false

  if  xPlayer.PlayerData.money.cash  >= VehicleShops[shop].price then
    xPlayer.Functions.RemoveMoney("cash",VehicleShops[shop].price)
    can_buy = true
  elseif xPlayer.PlayerData.money.bank >= VehicleShops[shop].price then
    xPlayer.Functions.RemoveMoney("bank",VehicleShops[shop].price)
    can_buy = true
  end

  if can_buy then
    local identifier = xPlayer.PlayerData.citizenid
    VehicleShops[shop].owner = identifier
    TriggerClientEvent("VehicleShops:Sync",-1,VehicleShops)
    SqlExecute("UPDATE "..(Config and Config.ShopTable or "vehicle_shops").." SET owner=@owner WHERE name=@name",{['@name'] = VehicleShops[shop].name, ['@owner'] = identifier})
    callback(true)
  else
    callback(false)
  end
end

GetVehicleOwner = function(source,callback,plate)
  SqlFetch('SELECT * FROM player_vehicles WHERE plate=@plate',{['@plate'] = plate},function(data)
    local owner = false
    if data and data[1] and (data[1].plate == plate or plate:match(data[1].plate)) then
      owner = data[1].citizenid
    end
    callback(owner)
  end)
end

StockedVehicle = function(vehProps,shopId,doDelete)
  if doDelete then
    SqlExecute("DELETE FROM player_vehicles WHERE plate=@plate",{['@plate'] = vehProps.plate})
  end
  
  table.insert(VehicleShops[shopId].stock,{vehicle = vehProps})
  TriggerClientEvent("VehicleShops:Sync",-1,VehicleShops)
  SqlExecute("UPDATE "..(Config and Config.ShopTable or "vehicle_shops").." SET stock=@stock WHERE name=@name",{['@stock'] = json.encode(VehicleShops[shopId].stock), ['@name'] = VehicleShops[shopId].name})
end



VehiclePurchased = function(shopId,vehId,props)
  local xplauyerc = QBCore.Functions.GetPlayer(source)
  local vehiclemodel = QBCore.Shared.VehiclesModels[props.model].model
  local plate = GeneratePlate()
    VehicleShops[shopId].funds = VehicleShops[shopId].funds - ShopVehicles[vehId].price
    TriggerClientEvent("VehicleShops:Sync",-1,VehicleShops)
    SqlExecute("UPDATE "..(Config and Config.ShopTable or "vehicle_shops").." SET funds=@funds WHERE name=@name",{['@funds'] = VehicleShops[shopId].funds, ['@name'] = VehicleShops[shopId].name})



    MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
      xplauyerc.PlayerData.license,
      xplauyerc.PlayerData.citizenid,
      vehiclemodel,
      props.model,
      '{"model":-114291515,"modFrame":-1,"modTurbo":false,"modAerials":-1,"windowsbroken":{"6":true,"7":false,"4":false,"5":false,"2":false,"3":false,"0":false,"1":false},"xenonColor":255,"modTank":-1,"modBrakes":-1,"modDashboard":-1,"modBackWheels":-1,"fuelLevel":60.36894583904539,"neonColor":[255,255,255],"modRightFender":-1,"modArmor":-1,"modCustomTiresF":false,"modGrille":-1,"interiorColor":0,"pearlescentColor":0,"modSteeringWheel":-1,"plate":"41YRN484","modEngineBlock":-1,"modTrunk":-1,"dirtLevel":0.0,"modRoof":-1,"modCustomTiresR":false,"modSmokeEnabled":false,"color1":38,"extras":[],"modShifterLeavers":-1,"modHorns":-1,"modWindows":-1,"tankHealth":1000.0592475178704,"bodyHealth":1000.0592475178704,"modHydrolic":-1,"neonEnabled":[false,false,false,false],"tyreSmokeColor":[255,255,255],"modRearBumper":-1,"dashboardColor":0,"modSeats":-1,"health":1000.0592475178704,"color2":0,"modArchCover":-1,"modDial":-1,"modHood":-1,"windowTint":-1,"modSideSkirt":-1,"modFender":-1,"bulletprooftires":false,"modOrnaments":-1,"modPlateHolder":-1,"modTrimA":-1,"wheelColor":27,"modAPlate":-1,"modSpoilers":-1,"modTrimB":-1,"modVanityPlate":-1,"modLivery":-1,"modSuspension":-1,"tiresburst":[],"doorsmissing":{"4":false,"5":false,"2":false,"3":false,"0":false,"1":false},"wheels":6,"modFrontBumper":-1,"lockstatus":1,"modEngine":-1,"modFrontWheels":-1,"modStruts":-1,"engineHealth":1000.0592475178704,"plateIndex":3,"modExhaust":-1,"modTransmission":-1,"modAirFilter":-1,"modXenon":false,"modSpeakers":-1,"modDoorSpeaker":-1}',
      plate,
      'motelgarage',
      0
    })
    TriggerClientEvent('nmsh-vehicledealer:client:buyShowroomVehicle', xplauyerc.PlayerData.source, vehiclemodel, plate)

    -- SqlExecute("INSERT INTO player_vehicles SET license=@owner,citizenid = '"..xplauyerc.PlayerData.citizenid.."' ,plate=@plate,mods=@vehicle,state=@state,vehicle = '"..vehiclemodel.."', hash = '"..props.model.."'",{['@owner'] = xplauyerc.PlayerData.license,['@plate'] = props.plate,['@vehicle'] = json.encode(props), ['@state'] = '0'   })
end


CopyTable = function(tab)
  local r = {}
  for k,v in pairs(tab) do
    if type(v) == "table" then
      r[k] = CopyTable(v)
    else
      r[k] = v
    end
  end
  return r
end

SetDisplayed = function(shop,veh,pos)
  local vehData = CopyTable(VehicleShops[shop].stock[veh])
  vehData.location = pos
  VehicleShops[shop].displays[vehData.vehicle.plate] = vehData
  for k,v in pairs(VehicleShops[shop].stock) do
    if v.vehicle.plate == vehData.vehicle.plate then
      table.remove(VehicleShops[shop].stock,k)
      break
    end
  end
  SqlExecute("UPDATE "..(Config and Config.ShopTable or "vehicle_shops").." SET stock=@stock,displays=@displays WHERE name=@name",{['@stock'] = json.encode(VehicleShops[shop].stock), ['@displays'] = json.encode(VehicleShops[shop].displays), ['@name'] = VehicleShops[shop].name})
  TriggerClientEvent("VehicleShops:Sync",-1,VehicleShops)
end

RemoveDisplay = function(shop,veh)
  local vehData = CopyTable(VehicleShops[shop].displays[veh])
  vehData.price = nil
  table.insert(VehicleShops[shop].stock,vehData)
  for k,v in pairs(VehicleShops[shop].displays) do
    if vehData.vehicle.plate == v.vehicle.plate then
      VehicleShops[shop].displays[k] = nil
    end
  end
  SqlExecute("UPDATE "..(Config and Config.ShopTable or "vehicle_shops").." SET stock=@stock,displays=@displays WHERE name=@name",{['@stock'] = json.encode(VehicleShops[shop].stock), ['@displays'] = json.encode(VehicleShops[shop].displays), ['@name'] = VehicleShops[shop].name})
  TriggerClientEvent("VehicleShops:RemoveDisplay",-1,shop,veh,VehicleShops)
end



SetPrice = function(veh,shop,price)
  VehicleShops[shop].displays[veh].price = price  
  TriggerClientEvent("VehicleShops:Sync",-1,VehicleShops)
  SqlExecute("UPDATE "..(Config and Config.ShopTable or "vehicle_shops").." SET displays=@displays WHERE name=@name",{['@displays'] = json.encode(VehicleShops[shop].displays), ['@name'] = VehicleShops[shop].name})
end

TryBuy = function(source, callback, shop, veh, plate, class)
  local xPlayer      = QBCore.Functions.GetPlayer(source)
  local vehicle      = VehicleShops[shop].displays[veh]
  local can_purchase = false
  if xPlayer.PlayerData.money.cash >= vehicle.price then
    can_purchase = true
    xPlayer.Functions.RemoveMoney("cash", vehicle.price)
  elseif xPlayer.PlayerData.money.bank >= vehicle.price then
    can_purchase = true
    xPlayer.Functions.RemoveMoney("bank", vehicle.price)
  end

  if can_purchase then
    local identifier         = xPlayer.PlayerData.license
    local vehiclemodel       = QBCore.Shared.VehiclesModels[plate.model].model
    VehicleShops[shop].funds = VehicleShops[shop].funds + vehicle.price
    TriggerEvent("VehicleShops:PurchaseComplete", identifier, VehicleShops[shop].displays[veh].vehicle.plate)
    SqlExecute("INSERT INTO player_vehicles SET license=@owner,citizenid = '" .. xPlayer.PlayerData.citizenid .. "',vehicle = '" .. vehiclemodel .. "',hash = '" .. plate.model .. "',plate=@plate,mods=@vehicle,state = 0", {
      ['@owner'] = xPlayer.PlayerData.license,
      ['@plate'] = VehicleShops[shop].displays[veh].vehicle.plate,
      ['@vehicle'] = json.encode(VehicleShops[shop].displays[veh].vehicle)
    })
    VehicleShops[shop].displays[veh] = nil
    SqlExecute("UPDATE " .. (Config and Config.ShopTable or "vehicle_shops") .. " SET stock=@stock,displays=@displays,funds=@funds WHERE name=@name", {
      ['@stock'] = json.encode(VehicleShops[shop].stock),
      ['@displays'] = json.encode(VehicleShops[shop].displays),
      ['@funds'] = VehicleShops[shop].funds,
      ['@name'] = VehicleShops[shop].name
    })
    TriggerClientEvent("VehicleShops:RemoveDisplay", -1, shop, veh, VehicleShops)
    TriggerEvent("VehicleShops:PurchasedVehicle", plate, class)
    callback(true)
  else
    callback(false, "You can't afford that.")
  end
end

DriveVehicle = function(source,callback,shop,veh)
  local vehData = CopyTable(VehicleShops[shop].stock[veh])
  local vehiclemodel = QBCore.Shared.VehiclesModels[vehData.vehicle.model].model
  for k,v in pairs(VehicleShops[shop].stock) do
    if v.vehicle.plate == vehData.vehicle.plate then
      table.remove(VehicleShops[shop].stock,k)
      break
    end
  end
  -- local xplayer = QBCore.Functions.GetPlayer(source)
  local license = GetOfflineLicence(VehicleShops[shop].owner)
  SqlExecute("INSERT INTO player_vehicles SET license=@license ,citizenid = @owner,plate=@plate,vehicle = '"..vehiclemodel.."',hash = '"..vehData.vehicle.model.."',mods=@vehicle,state = 0",{['@license'] = license,['@owner'] = VehicleShops[shop].owner,['@plate'] = vehData.vehicle.plate,['@vehicle'] = json.encode(vehData.vehicle)})
  TriggerClientEvent("VehicleShops:Sync",-1,VehicleShops)
  callback(true)
end

local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GeneratePlate()
  local plate = QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
  local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
  if result then
      return GeneratePlate()
  else
      return plate:upper()
  end
end

GetRandomNumber = function(length)
  math.randomseed(GetGameTimer())
  if length > 0 then
    return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
  else
    return ''
  end
end

GetRandomLetter = function(length)
  math.randomseed(GetGameTimer())
  if length > 0 then
    return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
  else
    return ''
  end
end



AddFunds = function(shop_key,amount)
  local _source = source
  local xPlayer = QBCore.Functions.GetPlayer(_source)
  local can_purchase = false
  if xPlayer.PlayerData.money.cash >= amount then
    can_purchase = true  
    xPlayer.Functions.RemoveMoney("cash",amount)
  elseif xPlayer.PlayerData.money.bank >= amount then     
    can_purchase = true
    xPlayer.Functions.RemoveMoney("bank",amount) 
  end

  if can_purchase then      
    VehicleShops[shop_key].funds = VehicleShops[shop_key].funds + amount
    SqlExecute("UPDATE "..(Config and Config.ShopTable or "vehicle_shops").." SET funds=funds + @amount WHERE name=@name",{['@amount'] = amount, ['@name'] = VehicleShops[shop_key].name})
    TriggerClientEvent("VehicleShops:Sync",-1,VehicleShops)
    TriggerClientEvent("QBCore:Notify",_source,"You added "..amount.."$ to the shops funds", 'success')
  else
    TriggerClientEvent("QBCore:Notify",_source,"You can't afford that", 'error')
  end
end

TakeFunds = function(shop_key, amount)
  local _source = source
  if VehicleShops[shop_key].funds >= amount then
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local identifier = xPlayer.PlayerData.citizenid
    if identifier == VehicleShops[shop_key].owner then
      xPlayer.Functions.AddMoney("bank", amount) 
      VehicleShops[shop_key].funds = VehicleShops[shop_key].funds - amount
      SqlExecute("UPDATE "..(Config and Config.ShopTable or "vehicle_shops").." SET funds=funds - @amount WHERE name=@name",{['@amount'] = amount, ['@name'] = VehicleShops[shop_key].name})
      TriggerClientEvent("VehicleShops:Sync",-1,VehicleShops)
      TriggerClientEvent("QBCore:Notify",_source,"You took "..amount.."$ from the shops funds", 'success')
    end
  else
    TriggerClientEvent("QBCore:Notify",_source,"The shop doesn't have that many funds", 'error')
  end
end

HirePlayer = function(shop_key,target_id)
  local mPlayer = QBCore.Functions.GetPlayer(source)
  local xPlayer = QBCore.Functions.GetPlayer(target_id)
  local mIdentifier = (KashCharacters[source] and KashCharacters[source]..":" or '')..mPlayer.PlayerData.citizenid

  
  local shop = VehicleShops[shop_key]
  if shop and shop.owner and shop.owner == mIdentifier then

    SqlFetch('SELECT charinfo FROM `players` WHERE `citizenid` = @citizenid', {['@citizenid'] = xPlayer.PlayerData.citizenid}, function(result)  
      local identifier = (KashCharacters[target_id] and KashCharacters[target_id]..":" or '')..xPlayer.PlayerData.citizenid

      for k,employe in pairs(shop.employees) do
        if employe.identifier == identifier then
              TriggerClientEvent("QBCore:Notify",src,"..The person has already been hired", "error")
            return
        end
      end

      table.insert(VehicleShops[shop_key].employees,{

        identifier = identifier,

        identity   = {firstname = json.decode(result[1].charinfo).firstname, lastname = json.decode(result[1].charinfo).lastname}

      })
      SqlExecute("UPDATE "..(Config and Config.ShopTable or "vehicle_shops").." SET employees=@employees WHERE name=@name",{['@employees'] = json.encode(VehicleShops[shop_key].employees), ['@name'] = VehicleShops[shop_key].name})

      TriggerClientEvent("VehicleShops:Sync",-1,VehicleShops)

    end)

    
  end
end

FirePlayer = function(shop_key,target_id)
  local mPlayer = QBCore.Functions.GetPlayer(source)
  local mIdentifier = (KashCharacters[source] and KashCharacters[source]..":" or '')..mPlayer.PlayerData.citizenid
  local shop = VehicleShops[shop_key]
  if shop and shop.owner and shop.owner == mIdentifier then
    for k,v in pairs(VehicleShops[shop_key].employees) do
      if v.identifier == target_id then
        table.remove(VehicleShops[shop_key].employees,k)
        break
      end
    end
    SqlExecute("UPDATE "..(Config and Config.ShopTable or "vehicle_shops").." SET employees=@employees WHERE name=@name",{['@employees'] = json.encode(VehicleShops[shop_key].employees), ['@name'] = VehicleShops[shop_key].name})
    TriggerClientEvent("VehicleShops:Sync",-1,VehicleShops)
  end
end

PayPlayer = function(shop_key,target_id,amount)
  local mPlayer = QBCore.Functions.GetPlayer(source)
  local mIdentifier = (KashCharacters[source] and KashCharacters[source]..":" or '')..mPlayer.PlayerData.citizenid
  local shop = VehicleShops[shop_key]
  if shop and shop.owner and shop.owner == mIdentifier and shop.funds >= amount then
    amount = math.floor(amount)
    for k,v in pairs(VehicleShops[shop_key].employees) do
      if v.identifier == target_id then
        xPlayer = QBCore.Functions.GetPlayerByCitizenId(target_id)

        if KashPlayers[target_id] then

          xPlayer = QBCore.Functions.GetPlayer(KashPlayers[target_id].src)

        else
          
          xPlayer = QBCore.Functions.GetPlayerByCitizenId(target_id)

        end
        
        if xPlayer then
          xPlayer.Functions.AddMoney((Config and Config.BankAccountName or "bank"),amount)
          shop.funds = shop.funds - amount
          TriggerClientEvent("QBCore:Notify",source,string.format("Payed %s %s $%i.",v.identity.firstname,v.identity.lastname,amount))
          SqlExecute("UPDATE "..(Config and Config.ShopTable or "vehicle_shops").." SET funds=funds - @amount WHERE name=@name",{['@amount'] = amount, ['@name'] = VehicleShops[shop_key].name})
          TriggerClientEvent("VehicleShops:Sync",-1,VehicleShops)
        else
          TriggerClientEvent("QBCore:Notify",source,"Player is not online.")
        end
        break
      end
    end
  end
end

GetCount = function(shop_key)
  local shop = VehicleShops[shop_key]
  local count = 0
    for k,v in pairs(VehicleShops[shop_key].employees) do
        xPlayer = QBCore.Functions.GetPlayerByCitizenId(v.identifier)
        if xPlayer then
          count = count + 1
        end
 
    end
    return count
end
GetLocation = function(shop_key)
  local shop = VehicleShops[shop_key]
  local count = 0
    for k,v in pairs(VehicleShops[shop_key].employees) do
        xPlayer = QBCore.Functions.GetPlayerByCitizenId(v.identifier)
        if xPlayer then
          count = count + 1
        end
 
    end
    return count
end

GetLocationY = function(shop_key)
  return VehicleShops[shop_key].locations.blip.y
end

GetLocationX = function(shop_key)
    return VehicleShops[shop_key].locations.blip.x
end

exports('GetCount', GetCount)
exports('GetLocationY', GetLocationY)
exports('GetLocationX', GetLocationX)

QBCore.Functions.CreateCallback("VehicleShops:GetVehicleShops", GetVehicleShops)
QBCore.Functions.CreateCallback("VehicleShops:GetVehicleOwner", GetVehicleOwner)
QBCore.Functions.CreateCallback("VehicleShops:GenerateNewPlate", GeneratePlate)
QBCore.Functions.CreateCallback("VehicleShops:TryBuy", TryBuy)
QBCore.Functions.CreateCallback("VehicleShops:PurchaseShop", PurchaseShop)
QBCore.Functions.CreateCallback("VehicleShops:DriveVehicle", DriveVehicle)

RegisterNetEvent("VehicleShops:Create")
AddEventHandler("VehicleShops:Create", CreateShop)

RegisterNetEvent("VehicleShops:AddFunds")
AddEventHandler("VehicleShops:AddFunds", AddFunds)

RegisterNetEvent("VehicleShops:TakeFunds")
AddEventHandler("VehicleShops:TakeFunds", TakeFunds)

RegisterNetEvent("VehicleShops:StockedVehicle")
AddEventHandler("VehicleShops:StockedVehicle", StockedVehicle)

RegisterNetEvent("VehicleShops:SetDisplayed")
AddEventHandler("VehicleShops:SetDisplayed", SetDisplayed)

RegisterNetEvent("VehicleShops:SetPrice")
AddEventHandler("VehicleShops:SetPrice", SetPrice)

RegisterNetEvent("VehicleShops:HirePlayer")
AddEventHandler("VehicleShops:HirePlayer", HirePlayer)

RegisterNetEvent("VehicleShops:FirePlayer")
AddEventHandler("VehicleShops:FirePlayer", FirePlayer)

RegisterNetEvent("VehicleShops:PayPlayer")
AddEventHandler("VehicleShops:PayPlayer", PayPlayer)

RegisterNetEvent("VehicleShops:VehiclePurchased")
AddEventHandler("VehicleShops:VehiclePurchased", VehiclePurchased)

RegisterNetEvent("VehicleShops:RemoveDisplay")
AddEventHandler("VehicleShops:RemoveDisplay", RemoveDisplay)

RegisterNetEvent("kashactersS:CharacterChosen")
AddEventHandler("kashactersS:CharacterChosen", KashChosen)

CreateThread(Init)



QBCore.Functions.CreateCallback("nmsh-VehicleShops:server:checkVehicleOwner", function(source, cb, plate)--Call from nmsh-vehiclesales
  local src = source
  local pData = QBCore.Functions.GetPlayer(src)
  MySQL.Async.fetchAll('SELECT * FROM player_vehicles WHERE plate = ? AND citizenid = ?',{plate, pData.PlayerData.citizenid}, function(result)
      if result[1] then
          cb(true)
      else
          cb(false)
      end
  end)
end)

function GetOfflineLicence(citizenid)
  if citizenid then
      local PlayerData = MySQL.Sync.prepare('SELECT * FROM players where citizenid = ?', {citizenid})
      if PlayerData then

    return PlayerData.license or 'player char is deleted'
  end
  end
  return nil
end
