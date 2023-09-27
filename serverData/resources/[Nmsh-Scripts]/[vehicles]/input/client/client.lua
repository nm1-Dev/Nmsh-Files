local callback = false

Open = function(header,style,cb)
  callback = cb
  SetNuiFocus(true,true)
  SendNUIMessage({
    type   = ("open"),
    header = (header or "Input"),
    style  = (style or "Native")
  })
end

Posted = function(data)
  SetNuiFocus(false,false)
  if callback then
    callback(data.message)
  end
end

RegisterNUICallback('post', Posted)

AddEventHandler('Input:Open',Open)
exports("Open",Open)