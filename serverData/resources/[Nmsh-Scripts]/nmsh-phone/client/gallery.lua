-- NUI Callback

RegisterNUICallback('GetGalleryData', function(_, cb)
    local data = PhoneData.Images
    cb(data)
end)

RegisterNUICallback('DeleteImage', function(image,cb)
    TriggerServerEvent('nmsh-phone:server:RemoveImageFromGallery',image)
    Wait(400)
    TriggerServerEvent('nmsh-phone:server:getImageFromGallery')
    cb(true)
end)

-- Events

RegisterNetEvent('nmsh-phone:refreshImages', function(images)
    PhoneData.Images = images
end)