-- Core init
local nmsh = exports[Nmsh.CoreName]:GetCoreObject()
PlayerGang = {}

RegisterNetEvent(Nmsh.CoreTriggerName..':Client:OnPlayerLoaded')
AddEventHandler(Nmsh.CoreTriggerName..':Client:OnPlayerLoaded', function()
    addZones()
end)

Citizen.CreateThread(function()
    Wait(1000)
    nmsh.Functions.TriggerCallback('nmsh-gang_rooms:server:GetConfig', function(Rooms)
        Nmsh.Rooms = Rooms
    end)
end)

RegisterNetEvent('nmsh-gang_rooms:client:Refresh')
AddEventHandler('nmsh-gang_rooms:client:Refresh', function(room)
    Nmsh.Rooms = room
end)

-- Hotel Blip
Citizen.CreateThread(function()
    local label = 'Mafia Hotel'
    blip = AddBlipForCoord(Nmsh.Reception.coords.x, Nmsh.Reception.coords.y, Nmsh.Reception.coords.z)
    SetBlipSprite(blip, 475)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, 0.8)
    SetBlipColour(blip, 46)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(label)
    EndTextCommandSetBlipName(blip)
end)


-- Reception
CreateThread(function()
    local Reception = Nmsh.Reception
    exports[Nmsh.TargetName]:AddBoxZone("Reception", vector3(Reception.coords.x, Nmsh.Reception.coords.y, Reception.coords.z), 2.5, 1, {
        name = "Reception",
        debugPoly = false,
        heading = Reception.heading,
        minZ = Reception.coords.z - 1,
        maxZ = Reception.coords.z + 1,
    }, {
        options = {
            {
                type = "client",
                event = "nmsh-gang_rooms:client:ReceptionMenu",
                icon = "fa fa-hand",
                label = "Hotel Reception"
            },
            {
                type = "client",
                event = "nmsh-gang_rooms:client:GiveNewKey",
                icon = "fa fa-key",
                label = "Request Room New Key"
            },
        },
        distance = 2.0
    })
    RequestModel(Reception.ped)
        while not HasModelLoaded(Reception.ped) do
        Wait(1000)
    end
    ReceptionMan = CreatePed(0, Reception.ped, Reception.coords.x, Reception.coords.y, Reception.coords.z - 1, Reception.heading, false, false) -- change here the cords for the ped 
    SetPedFleeAttributes(ReceptionMan, 0, 0)
    SetPedDiesWhenInjured(ReceptionMan, false)
    TaskStartScenarioInPlace(ReceptionMan, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
    SetPedKeepTask(ReceptionMan, true)
    SetBlockingOfNonTemporaryEvents(ReceptionMan, true)
    SetEntityInvincible(ReceptionMan, true)
    FreezeEntityPosition(ReceptionMan, true)
end)


RegisterNetEvent('nmsh-gang_rooms:client:ReceptionMenu', function()
    local PlayerData = nmsh.Functions.GetPlayerData()
    if PlayerData.gang.grade.level >= 3 then
        local menu = {}
        nmsh.Functions.TriggerCallback('nmsh-gang_rooms:server:GetConfig', function(Rooms)
            Nmsh.Rooms = Rooms
        end)
        for k, v in pairs(Nmsh.Rooms) do
            if not Nmsh.Rooms[k].isOwned then
                menu[#menu + 1] = {
                    header = "Hotel Room "..k.."",
                    txt = "Rent this room for "..Nmsh.RoomRentCost.." $",
                    params = {
                        event = "nmsh-gang_rooms:client:NewRoomRent",
                        args = {
                            room = k
                        }
                    }
                }
            end
        end
        if #menu <= 0 then 
            nmsh.Functions.Notify('All hotels rooms has been rented', 'info', 3000)
            return 
        end
        exports[Nmsh.MenuName]:openMenu(menu)
    else
        nmsh.Functions.Notify("You can't rent a room here this hotel only for gangs boss", 'error', 3500)
    end
end)

RegisterNetEvent('nmsh-gang_rooms:client:NewRoomRent', function(data)
    local room = data.room
    if Nmsh.Rooms[room] ~= nil then
        nmsh.Functions.TriggerCallback('nmsh-gang_rooms:server:CheckOwned', function(boolean)
            if boolean then
                local Menu = {
                    {
                        header ='Confirm Room Rent #'..room,
                        txt = "Room contract registration price: "..Nmsh.RoomRentCost.."$ <br> Room Daily Rental Costs: "..Nmsh.DailyRental.."$",
                        disabled = true
                    },
                    {
                        header ='Yes',
                        params = {
                            event = "nmsh-gang_rooms:client:rentRoom",
                            args = {
                                Room = room,
                            }
                        }
                    },
                    {
                        header ='No',
                        params = {
                            event = "",
                        }
                    },
                    
                }
                exports[Nmsh.MenuName]:openMenu(Menu)
            else
                nmsh.Functions.Notify('You already have a room', 'info', 3000)
            end
        end)
    end
end)

RegisterNetEvent('nmsh-gang_rooms:client:rentRoom', function(data)
    TriggerServerEvent('nmsh-gang_rooms:server:rentRoom', data.Room)
end)

-- Box Zones Add
RegisterCommand('s', function()
    addZones()
end)
function addZones()
    for k, v in pairs(Nmsh.Rooms) do 
        local ZoneName = "Locker"..k
        exports[Nmsh.TargetName]:AddBoxZone(ZoneName, vector3(v.locker.coords.x, v.locker.coords.y, v.locker.coords.z), v.locker.width, v.locker.hight, {
            name= ZoneName,
            heading= v.locker.heading,
            debugPoly = false,
            minZ= v.locker.minZ,
            maxZ= v.locker.maxZ
            }, {
            options = {
                {
                    event = 'nmsh-gang_rooms:client:LockerOpen',
                    icon = "far fa-box",
                    label = "Locker",
                },
            },
            distance = 2.0,
        })
    end
end

RegisterNetEvent('nmsh-gang_rooms:client:LockerOpen', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local locker = nil
    for k,v in pairs(Nmsh.Rooms) do
        local distance = #(coords - Nmsh.Rooms[k].locker.coords)
        if distance < 2.5 then
            locker = k
            if Nmsh.Rooms[locker].isOwned then
                nmsh.Functions.TriggerCallback('nmsh-gang_rooms:server:canOpenLocker', function(canOpen, isOwner)
                    if canOpen then
                        local Menu = {
                            {
                                header = "Access Locker",
                                params = {
                                    event = "nmsh-gang_rooms:client:MenuOpen",
                                    args = {
                                        locker = locker,
                                        isOwner = isOwner
                                    }
                                }
                            },
                        }
                        exports[Nmsh.MenuName]:openMenu(Menu)
                    else
                        nmsh.Functions.Notify("You dont have access to open this locker", "error", 3000)
                    end
                end, locker)
            else
                nmsh.Functions.Notify("You dont have access to open this locker", "error", 3000)
            end
        end
    end
end)

RegisterNetEvent('nmsh-gang_rooms:client:OpenLockerInv', function(data)
    local lockerNum = data.locker
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Hotel locker"..lockerNum, {
        maxweight = Nmsh.Rooms[lockerNum].locker.maxweight,
        slots = Nmsh.Rooms[lockerNum].locker.slots,
    })
    TriggerEvent("inventory:client:SetCurrentStash", "Hotel locker"..lockerNum)
end)

RegisterNetEvent('nmsh-gang_rooms:client:MenuOpen')
AddEventHandler('nmsh-gang_rooms:client:MenuOpen', function(data)
    local locker, isOwner = data.locker, data.isOwner
    if isOwner then
        local menu = {
            {
                header = locker.." Room locker",
                disabled = true
            },
            {
                header = "Open Locker",
                txt = "Open your locker",
                params = {
                    event = "nmsh-gang_rooms:client:OpenLockerInv",
                    args = {
                        locker = locker
                    }
                }
            },
            {
                header = "Manage",
                txt = "Manage your locker",
                params = {
                    event = "nmsh-gang_rooms:client:ManageMenu",
                    args = {
                        locker = locker
                    }
                }
            },
        }
        exports[Nmsh.MenuName]:openMenu(menu)
    else
        local menu = {
            {
                header = locker.." Room locker",
                disabled = true
            },
            {
                header = "Open Locker",
                params = {
                    event = "nmsh-gang_rooms:client:OpenLockerInv",
                    args = {
                        locker = locker
                    }
                }
            }
        }
        exports[Nmsh.MenuName]:openMenu(menu)
    end
end)

RegisterNetEvent('nmsh-gang_rooms:client:ManageMenu', function(data)
    local locker = data.locker
    local Menu = {
        {
            header = "Give keys",
            txt = "Give room keys to the closest citizen",
            params = {
                event = "nmsh-gang_rooms:client:RoomLookerManage",
                args = {
                    locker = locker,
                    action = "give"
                }
            }
        },
        {
            header = "Remove key",
            txt = "Remove room keys from a citizen",
            params = {
                event = "nmsh-gang_rooms:client:RoomLookerManage",
                args = {
                    locker = locker,
                    action = "remove"
                }
            }
        },
        {
            header = "Manage (weight | Slots)",
            params = {
                event = "nmsh-gang_rooms:client:RoomLookerManage",
                args = {
                    locker = locker,
                    action = "locker"
                }
            }
        },
    }
    exports[Nmsh.MenuName]:openMenu(Menu)
end)

RegisterNetEvent('nmsh-gang_rooms:client:RoomLookerManage', function(data)
    local locker = data.locker
    local action = data.action
    local menu = {}
    if action == 'give' then
        local keyboard = exports[Nmsh.InputName]:ShowInput({
            header = "Citizen ID",
            submitText = "Confirm",
            inputs = {
                {
                    type = 'number',
                    isRequired = true,
                    text = "Enter Player (ID) To give him room key",
                    name = 'player',
                }
            }
        })
        if keyboard ~= nil then
            if keyboard.player == nil then return nmsh.Functions.Notify('You have to enter player id', 'error', 3000) end
            local player, distance = nmsh.Functions.GetClosestPlayer()
            if player ~= -1 and distance < 3.0 then
                local Target = GetPlayerServerId(player)
                if tonumber(keyboard.player) == tonumber(Target) then
                    TriggerServerEvent("nmsh-gang_rooms:server:GiveNewKey", Target, data)
                else
                    nmsh.Functions.Notify("Person not Found", "error", 3000)
                end
            else
                nmsh.Functions.Notify("No player around you", "error", 3000)
            end
        end
    elseif action == 'remove' then
        nmsh.Functions.TriggerCallback('nmsh-gang_rooms:server:GetKeysHolders', function(KeysHolders)
            for k, v in pairs(KeysHolders[locker]) do 
                menu[#menu + 1] = {
                    header = "Name: "..v.name,
                    txt = "Citizen ID: "..v.cid,
                    params = {
                        Server = true,
                        event = "nmsh-gang_rooms:server:RemoveKey",
                        args = {
                            locker = locker,
                            citizenid = v.cid,
                            name = v.name
                        }
                    }
                }
            end
            if #KeysHolders > 0 then
                exports[Nmsh.MenuName]:openMenu(menu)
            else
                nmsh.Functions.Notify("You Didnt give your room keys to any one", "error", 3000)
            end
        end, locker)
    elseif action == 'locker' then
        local Menu = {
            {
                header = "Locker Slots",
                txt = "Manage your locker slots",
                params = {
                    event = "nmsh-gang_rooms:client:LookerManage",
                    args = {
                        locker = locker,
                        mtype = 'slots'
                    }
                }
            },
            {
                header = "Locker Weight",
                txt = "Manage your locker weight",
                params = {
                    event = "nmsh-gang_rooms:client:LookerManage",
                    args = {
                        locker = locker,
                        mtype = 'weight'
                    }
                }
            },
        }
        exports[Nmsh.MenuName]:openMenu(Menu)
    end
end)

RegisterNetEvent('nmsh-gang_rooms:client:LookerManage', function(data)
    local locker = data.locker
    local mtype = data.mtype
    local Menu = {}
    if mtype == 'slots' then
        for i = 1, #Nmsh.SlotsTiers do
            Menu[#Menu + 1] = {
                header = "Slots Tier #"..i,
                txt = "Upgrade slots to "..Nmsh.SlotsTiers[i].amount.." for $"..Nmsh.SlotsTiers[i].price.."",
                params = {
                    event = "nmsh-gang_rooms:client:newlockerfeatures",
                    args = {
                        locker = locker,
                        action = "slots",
                        choosed = Nmsh.SlotsTiers[i].amount,
                        price = Nmsh.SlotsTiers[i].price,
                    }
                }
            }
        end
        exports[Nmsh.MenuName]:openMenu(Menu)
    elseif mtype == 'weight' then
        for i = 1, #Nmsh.WeightTiers do 
            Menu[#Menu + 1] = {
                header = "Weight Tier #"..i,
                txt = "Upgrade weight to "..Nmsh.WeightTiers[i].capacity.." for $"..Nmsh.WeightTiers[i].price.."",
                params = {
                    event = "nmsh-gang_rooms:client:newlockerfeatures",
                    args = {
                        locker = locker,
                        action = "weight",
                        choosed = Nmsh.WeightTiers[i].amount,
                        price = Nmsh.WeightTiers[i].price,
                    }
                }
            }
        end
        exports[Nmsh.MenuName]:openMenu(Menu)
    end
end)

RegisterNetEvent('nmsh-gang_rooms:client:newlockerfeatures', function(data)
    TriggerServerEvent('nmsh-gang_rooms:server:newlockerfeatures', data)
end)

RegisterNetEvent('nmsh-gang_rooms:client:RoomKey', function(room)
    if room == nil then return end
    local roomInfo = Nmsh.Rooms[room]
    local doornumber = roomInfo.Door.Id
    local doorcords = roomInfo.Door.Coords
    local plyCoords = GetEntityCoords(PlayerPedId())
    local distance = #(plyCoords - roomInfo.Door.Coords)
    if distance < 2.0 then
        nmsh.Functions.TriggerCallback('nmsh-gang_rooms:server:canOpenLocker', function(hasAccess, isOwner)
            if hasAccess then
                if roomInfo.Door.isClosed then
                    TriggerServerEvent('nmsh-doorlock:server:updateState', doornumber, false, false, false, true)
                    roomInfo.Door.isClosed = false
                elseif roomInfo.Door.isClosed == false then
                    TriggerServerEvent('nmsh-doorlock:server:updateState', doornumber, true, false, false, true)
                    roomInfo.Door.isClosed = true
                end
            end
        end, room)
    else
        nmsh.Functions.Notify("Did you try to open invisible door ?", "error", 3000)
    end
end)

RegisterNetEvent('nmsh-gang_rooms:client:GiveNewKey')
AddEventHandler('nmsh-gang_rooms:client:GiveNewKey', function()
    local Room = nil
    local keyboard = exports[Nmsh.InputName]:ShowInput({
        header = "Room Number",
        submitText = "Confirm",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                text = "Enter room number",
                name = 'room',
            }
        }
    })
	if keyboard ~= nil then
        local k = tonumber(keyboard.room)
        if Nmsh.Rooms[k] ~= nil then
            Room = k
            if Nmsh.Rooms[Room].isOwned then

                nmsh.Functions.TriggerCallback('nmsh-gang_rooms:server:canOpenLocker', function(hasAccess, isOwner)
                    if isOwner then
                        nmsh.Functions.TriggerCallback('nmsh-gang_rooms:server:GiveNewRoomKey', function(iscreated)
                            if iscreated then
                                nmsh.Functions.Notify("You have been given a new key for your room", "success", 4000)
                            end
                        end, k)
                    end
                end, Room)

            end
        end

    end

end)