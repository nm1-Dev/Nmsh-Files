



DatabaseQuery = function(query, parameters)
  if Config.Database == 'ghmattimysql' then
    local result = exports.ghmattimysql:executeSync(query, parameters)
    return result
  elseif Config.Database == 'oxmysql' then
    if string.find(query, "SELECT") then
      local result = MySQL.query.await(query, parameters)
      return result
    elseif string.find(query, "INSERT") then
      MySQL.insert(query, parameters)
    else
      MySQL.update(query, parameters)
    end
  elseif Config.Database == 'mysql-async' then
    if string.find(query, "SELECT") then
      local result = MySQL.Sync.fetchAll(query, parameters)
      return result
    elseif string.find(query, "INSERT") then
      MySQL.Sync.execute(query, parameters)
    else
      MySQL.Sync.execute(query, parameters)
    end
  end
end

function addZeroForLessThan10(number)
    if(number < 10) then
      return 0 .. number
    else
      return number
   end
end

function generateDateTime()
    local dateTimeTable = os.date('*t')
    local dateTime = dateTimeTable.year ..'/'.. addZeroForLessThan10(dateTimeTable.month) ..'/'.. 
    addZeroForLessThan10(dateTimeTable.day)
    return dateTime
end
   
function AddToDB(id, img, date, msg) 
  DatabaseQuery('INSERT INTO `polaroid` (`identifier`, `img`, `date`, `msg`) VALUES (?, ?, ?, ?)', {
    id,
    img,
    date,
    msg or ''
  })
end

function DelateFromDB(identifier, img)
  DatabaseQuery('DELETE FROM `polaroid` WHERE `identifier` = @identifier AND `img` = @img' , {
    ['@identifier'] = identifier,
    ['@img'] = img,
  })
end

RegisterNetEvent("polaroid:init")
AddEventHandler("polaroid:init",function(src)
  local identifier = GetIdentifier(src)
  local query = DatabaseQuery('SELECT * FROM `polaroid` WHERE `identifier` = @identifier', {['@identifier'] = identifier})
  TriggerClientEvent('nmsh-polaroid-spawn', src, query)
end)


RegisterNetEvent("nmsh-polaroid:delete:esxphoto")
AddEventHandler("nmsh-polaroid:delete:esxphoto", function(img)
  local src = source
  local identifier = GetIdentifier(src)
  DelateFromDB(identifier, img)
end)

RegisterNetEvent("nmsh-polaroid-uploadPhoto")
AddEventHandler("nmsh-polaroid-uploadPhoto",function(link)
  local time = generateDateTime()
  TriggerEvent("ps_polaroid:add",source, link, time)
end)

RegisterNetEvent("ps_polaroid:UpdatePhoto")
AddEventHandler("ps_polaroid:UpdatePhoto",function(photo)
  local identifier = GetIdentifier(source)
  DatabaseQuery('UPDATE polaroid SET msg = @msg WHERE identifier = @identifier AND img = @img ', {['@identifier'] = identifier, ['@msg'] = photo.msg, ['@img'] = photo.img})
end)

RegisterNetEvent("ps_polaroid:showAround")
RegisterNetEvent("ps_polaroid:showAround", function(info, players)
  for k,v in pairs(players) do
    TriggerClientEvent('ps_polaroid:showAroundClient', v, info)
  end
end)


