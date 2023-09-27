local dealer = nil

RegisterNUICallback('CloseMenu', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('LaunderMoney', function(data)
    local dealer = GetClosestDealer()
    TriggerCallBack('ren-laundering:get:back:money', function(result)  
        SetNuiFocus(false, false)
        if result >= data then 
            TriggerServerEvent('ren-laundering:launder:money', dealer, data)
            return 
        end
        SentNotify('You don\'t have this amount of money', 'error')            
    end, dealer)
end)

CreateThread(function()
    for i = 1, #Laundering do 
        RegisterPed(Laundering[i].Dealer, Laundering[i].Blip)
    end
end)

RegisterPed = function(data, blipData)
    LoadModel(data.model)
    dealer = CreatePed(4, data.model, data.pos, data.heading, false, true)  

    AddTarget(dealer, {
        {
            name = 'Dealer',
            event = "ren-laundering:launder:money",
            icon = "fas fa-user-secret",
            label = "Launder money"
        }
    })

    SetEntityAsMissionEntity(dealer, true, false)
    FreezeEntityPosition(dealer, true)
    SetPedCanRagdoll(dealer, false)
    TaskSetBlockingOfNonTemporaryEvents(dealer, 1)
    SetBlockingOfNonTemporaryEvents(dealer, 1)
    SetPedFleeAttributes(dealer, 0, 0)
    SetPedCombatAttributes(dealer, 17, 1)
    SetEntityInvincible(dealer, true)
    SetPedSeeingRange(dealer, 0)    

    if blipData.show then 
        local blip = AddBlipForCoord(data.pos)
        SetBlipSprite(blip, blipData.sprite)
        SetBlipColour(blip, blipData.colour)
        SetBlipScale(blip, blipData.scale)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Money laundering dealer")
        EndTextCommandSetBlipName(blip)
    end
end

LoadModel = function(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(1)
    end
end

GetClosestDealer = function()
    local PlayerPos = GetEntityCoords(PlayerPedId())

    for i = 1, #Laundering do 
        local dealer = Laundering[i].Dealer
        local dist = #(PlayerPos - dealer.pos)

        if dist < 2 then 
            return i 
        end
    end    

    return false
end

RegisterNetEvent('ren-laundering:launder:money', function()
    local dealer = GetClosestDealer()
    TriggerCallBack('ren-laundering:get:back:money', function(result)  
        SetNuiFocus(true, true)
        SendNUIMessage({type = "open", MoneyAmount = result})
    end, dealer)
end)