local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('adminv1:client:openMenu', function(data)
    if data.action == 'banlist' then 
        QBCore.Functions.TriggerCallback('adminv1:server:GetBanList', function(result)
            if result then
                local BanMenu = {
                    {
                        header = "Ban List",
                        icon = "fa-duotone fa-list",
                        isMenuHeader = true, -- Set to true to make a nonclickable title
                    },
                }
                for k, v in pairs(result) do 
                    BanMenu[#BanMenu + 1] = {
                        header = 'Name : '..v.Name,
                        txt = 'Reason: '..v.Reason..'<br> Band Expire On : '..v.Time..'<br> Banned By : '..v.BannedBy..'',
                        icon = "fa-regular fa-user",
                        params = {
                            event = 'adminv1:client:UnBanConfirmation',
                            args = {
                                BanID = v.BanID,
                                Name = v.Name,
                            }
                        }
                    }
                end

                BanMenu[#BanMenu + 1] = {
                    header = "Exit",
                    icon = "fa-regular fa-circle-xmark",
                    params = {
                        event = "nmsh-menu:closeMenu",
                    }
                }
                if #BanMenu > 0 then 
                    exports['nmsh-menu']:openMenu(BanMenu)
                end
            else
                QBCore.Functions.Notify('No Band Found', "error")
            end
        end)
    elseif data.action == 'jaillist' then 
        QBCore.Functions.TriggerCallback('adminv1:server:GetJailList', function(result)
            if result then
                local JailMenuMenu = {
                    {
                        header = "Ban List",
                        icon = "fa-duotone fa-list",
                        isMenuHeader = true, -- Set to true to make a nonclickable title
                    },
                }
                for k, v in pairs(result) do 
                    JailMenuMenu[#JailMenuMenu + 1] = {
                        header = 'Name : '..v.Name,
                        txt = 'ID: '..v.ID..'<br> Jail Time : '..v.JailTime..'',
                        icon = "fa-regular fa-user",
                        params = {
                            event = 'adminv1:client:UnJailConfirmation',
                            args = {
                                ID = v.ID,
                                Name = v.Name,
                            }
                        }
                    }
                end

                JailMenuMenu[#JailMenuMenu + 1] = {
                    header = "Exit",
                    icon = "fa-regular fa-circle-xmark",
                    params = {
                        event = "nmsh-menu:closeMenu",
                    }
                }
                if #JailMenuMenu > 0 then 
                    exports['nmsh-menu']:openMenu(JailMenuMenu)
                end
            else
                QBCore.Functions.Notify('No Jail Found', "error")
            end
        end)
    elseif data.action == 'queue' then 
        exports['nmsh-menu']:openMenu({
            {
                header = "Queue Menu",
                icon = "fa-solid fa-people-roof",
                isMenuHeader = true,
            },
            {
                header = "Give Queue",
                txt = "Queue To Player",
                icon = "fa-regular fa-arrow-right-to-arc",
                params = {
                    event = "adminv1:client:queueMenu",
                    args = {
                        action = 'give'
                    }
                }
            },
            {
                header = "Remove Queue",
                txt = "Remove From Player",
                icon = "fa-light fa-ban",
                params = {
                    event = "adminv1:client:queueMenu",
                    args = {
                        action = 'remove'
                    }
                }
            },
            {
                header = "Edit Queue",
                txt = "Edit Current Player",
                icon = "fa-regular fa-pen-to-square",
                params = {
                    event = "adminv1:client:queueMenu",
                    args = {
                        action = 'edit'
                    }
                }
            },
            {
                header = "Push Queue",
                txt = "Push To New Pos",
                icon = "fa-duotone fa-forward",
                params = {
                    event = "adminv1:client:queueMenu",
                    args = {
                        action = 'push'
                    }
                }
            },
            {
                header = "Exit",
                icon = "fa-regular fa-circle-xmark",
                params = {
                    event = "nmsh-menu:closeMenu",
                }
            }
        })
    elseif data.action == 'charname' then 
        local input = lib.inputDialog('Change Character Name', {
            { type = "input", label = "Steam ID", placeholder = "steam:110000104edea99" },
        })
        if input then
            if input[1] then 
                QBCore.Functions.TriggerCallback('adminv1:server:GetPlayerChar', function(result)
                    if result and #result > 0 then
                        local CharacterMenu = {}
                        for i = 1, (#result), 1 do
                            CharacterMenu[#CharacterMenu + 1] = {
                                header = 'Name : '..result[i].charinfo.firstname..' '..result[i].charinfo.lastname..'',
                                txt = 'CitizenId '..result[i].citizenid..'',
                                icon = "fa-regular fa-user",
                                params = {
                                    event = 'adminv1:client:addnewname',
                                    args = {
                                        citizenid = result[i].citizenid,
                                        Name = result[i].charinfo.firstname..' '..result[i].charinfo.lastname,
                                    }
                                }
                            }
                        end

                        CharacterMenu[#CharacterMenu + 1] = {
                            header = "Exit",
                            icon = "fa-regular fa-circle-xmark",
                            params = {
                                event = "nmsh-menu:closeMenu",
                            }
                        }
                        if #CharacterMenu > 0 then 
                            exports['nmsh-menu']:openMenu(CharacterMenu)
                        end
                    else
                        QBCore.Functions.Notify('No Characters Found', "error")
                    end
                end, input[1])
            else
                QBCore.Functions.Notify('No Steam ID Found', "error")
            end
        end
    elseif data.action == 'verify' then 
        local input = lib.inputDialog('Verify', {
            {type = "input", label = "Account name", placeholder = "floky" },
            { type = 'select', label = 'Select platforme', options = {
                { value = 'twitter', label = 'Twitter' },
                { value = 'instagram', label = 'Instagram' },
            }},
        })
        if input then
            if input[1] ~= '' then 
                if input[2] then 
                    TriggerServerEvent('adminv1:server:verify', input[1], input[2])
                else
                    QBCore.Functions.Notify('No twitter or instagram', "error")
                end
            else
                QBCore.Functions.Notify('No ID', "error")
            end
        end
    end
end)

RegisterNetEvent('adminv1:client:addnewname', function(data)
    if not data then return end 
    local input = lib.inputDialog('Changing [ '..data.Name..' ] Name', {
        { type = "input", label = "First Name", placeholder = "she she" },
        { type = "input", label = "Last Name", placeholder = "87 87" },
    })
    if input then
        if input[1] then 
            if input[2] then 
                local firstname = tostring(input[1])
                local lastname = tostring(input[2])
                Wait(100)
                
                local alert = lib.alertDialog({
                    header = 'Confirmation',
                    content = 'Are you sure you want to change [ '..data.Name..' ] to [ '..firstname..' '..lastname..' ] ',
                    centered = true,
                    cancel = true
                })
                if alert then 
                    if alert == 'confirm' then 
                        local data = {
                            oldname = data.Name,
                            firstname = firstname,
                            lastname = lastname,
                            citizenid = data.citizenid,
                        }
                        TriggerServerEvent('adminv1:server:changecharnamenow', data)
                    end
                end
            else
                QBCore.Functions.Notify('No Last Name Found', "error")
            end
        else
            QBCore.Functions.Notify('No First Name Found', "error")
        end
    end
end)

local Queue = {
    ['level'] = {
        ['100'] = 100,
        ['90'] = 90,
        ['70'] = 70,
        ['50'] = 50,
        ['40'] = 40,
        ['20'] = 20,
        ['15'] = 15,
        ['10'] = 10,
    },
    ['time'] = {
        ['all'] = 2147483647,
        ['day'] = 86400,
        ['week'] = 604800,
        ['month'] = 2678400,
    },
}

RegisterNetEvent('adminv1:client:queueMenu', function(data)
    if not data then return end 
    if data.action == 'give' then 
        local input = lib.inputDialog('Give Queue', {
            { type = "input", label = "Steam ID", placeholder = "steam:110000104edea99" },
            { type = "input", label = "Player Name", placeholder = "she she" },
            { type = 'select', label = 'Queue level', options = {
                { value = '100', label = 'Owner And Dev (100)' },
                { value = '90', label = 'High Admin (90)' },
                { value = '70', label = 'High Jobs Commands (70)'},
                { value = '50', label = 'High Staff (50)'},
                { value = '40', label = 'Staff (40)'},
                { value = '20', label = 'Jobs (20)'},
                { value = '20', label = 'Streamers (20)'},
                { value = '15', label = 'Mods (15)'},
                { value = '10', label = 'Store (10)'},
            }},
            { type = 'select', label = 'Queue Time', options = {
                { value = 'all', label = 'All The Time' },
                { value = 'day', label = '1 Day' },
                { value = 'week', label = '1 Week' },
                { value = 'month', label = '1 Month' },
            }},
        })
        if input then
            if input[1] then 
                if input[2] then 
                    if input[3] then 
                        if input[4] then 
                            local steam = tostring(input[1])
                            local name = tostring(input[2])
                            local level = tostring(input[3])
                            local time = tostring(input[4])
                            TriggerServerEvent('adminv1:server:addpr', steam, name, Queue.level[level], Queue.time[time])
                        else
                            QBCore.Functions.Notify('No Time Found', "error")
                        end
                    else
                        QBCore.Functions.Notify('No Level Found', "error")
                    end
                else
                    QBCore.Functions.Notify('No Name Found', "error")
                end
            else
                QBCore.Functions.Notify('No Steam Found', "error")
            end
        end
    elseif data.action == 'remove' then 
        QBCore.Functions.TriggerCallback('adminv1:server:GetQueue', function(Queue)
            if Queue then
                local QueueMenu = {
                    {
                        header = "Queue List",
                        icon = "fa-duotone fa-list",
                        isMenuHeader = true, -- Set to true to make a nonclickable title
                    },
                }
                for k, v in pairs(Queue) do 
                    if v.time then 
                        QueueMenu[#QueueMenu + 1] = {
                            header = 'Name : '..v.name,
                            txt = ''..v.steam..'<br> Time to expire : '..v.time..'<br>Queue level : '..v.priority..'',
                            icon = "fa-regular fa-user",
                            params = {
                                event = 'adminv1:client:removepr',
                                args = {
                                    id = v.id,
                                    Name = v.name,
                                }
                            }
                        }
                    else
                        QueueMenu[#QueueMenu + 1] = {
                            header = 'Name : '..v.name,
                            txt = ''..v.steam..'<br> Time to expire : No Time<br>Queue level : '..v.priority..'',
                            icon = "fa-regular fa-user",
                            params = {
                                event = 'adminv1:client:removepr',
                                args = {
                                    id = v.id,
                                    Name = v.name,
                                }
                            }
                        }
                    end
                end

                QueueMenu[#QueueMenu + 1] = {
                    header = "Exit",
                    icon = "fa-regular fa-circle-xmark",
                    params = {
                        event = "nmsh-menu:closeMenu",
                    }
                }
                if #QueueMenu > 0 then 
                    exports['nmsh-menu']:openMenu(QueueMenu)
                end
            else
                QBCore.Functions.Notify('No Queue Found', "error")
            end
        end)
    elseif data.action == 'edit' then 
        QBCore.Functions.TriggerCallback('adminv1:server:GetQueue', function(Queue)
            if Queue then
                local QueueMenu = {
                    {
                        header = "Queue List",
                        icon = "fa-duotone fa-list",
                        isMenuHeader = true, -- Set to true to make a nonclickable title
                    },
                }
                for k, v in pairs(Queue) do 
                    if v.time then 
                        QueueMenu[#QueueMenu + 1] = {
                            header = 'Name : '..v.name,
                            txt = ''..v.steam..'<br> Time to expire : '..v.time..'<br>Queue level : '..v.priority..'',
                            icon = "fa-regular fa-user",
                            params = {
                                event = 'adminv1:client:editpr',
                                args = {
                                    id = v.id,
                                    Name = v.name,
                                    Time = v.time,
                                    Priority = v.priority,
                                }
                            }
                        }
                    else
                        QueueMenu[#QueueMenu + 1] = {
                            header = 'Name : '..v.name,
                            txt = ''..v.steam..'<br> Time to expire : No Time<br>Queue level : '..v.priority..'',
                            icon = "fa-regular fa-user",
                            params = {
                                event = 'adminv1:client:editpr',
                                args = {
                                    id = v.id,
                                    Name = v.name,
                                    Time = 'No Time',
                                    Priority = v.priority,
                                }
                            }
                        }
                    end
                end

                QueueMenu[#QueueMenu + 1] = {
                    header = "Exit",
                    icon = "fa-regular fa-circle-xmark",
                    params = {
                        event = "nmsh-menu:closeMenu",
                    }
                }
                if #QueueMenu > 0 then 
                    exports['nmsh-menu']:openMenu(QueueMenu)
                end
            else
                QBCore.Functions.Notify('No Queue Found', "error")
            end
        end)
    elseif data.action == 'push' then 
        local input = lib.inputDialog('Queue Push', {'Current Pos', 'New Pos'})

        if not input then return end
        local oldpos = tonumber(input[1])
        local newpos = tonumber(input[2])
        if oldpos and newpos then 
            if oldpos > 0 then 
                if newpos > 0 then 
                    TriggerServerEvent('Queue:pushPlayer', oldpos, newpos)
                end
            end
        else
            QBCore.Functions.Notify('are you noob ??', "error")
        end
    end
end)

RegisterNetEvent('adminv1:client:editpr', function(data)
    local input = lib.inputDialog('Edit [ '..data.Name..' ] \n Queue \n Time: '..data.Time..' \n Queue Level: '..data.Priority..'', {
        { type = 'select', label = 'New Queue Level', options = {
            { value = '100', label = 'Owner And Dev (100)' },
            { value = '90', label = 'High Admin (90)' },
            { value = '70', label = 'High Jobs Commands (70)'},
            { value = '50', label = 'High Staff (50)'},
            { value = '40', label = 'Staff (40)'},
            { value = '20', label = 'Jobs (20)'},
            { value = '20', label = 'Streamers (20)'},
            { value = '15', label = 'Mods (15)'},
            { value = '10', label = 'Store (10)'},
        }},
        { type = 'select', label = 'New Queue Time', options = {
            { value = 'all', label = 'All The Time' },
            { value = 'day', label = '1 Day' },
            { value = 'week', label = '1 Week' },
            { value = 'month', label = '1 Month' },
        }},
    })
    if input then
        if input[1] then 
            if input[2] then 
                local level = tostring(input[1])
                local time = tostring(input[2])
                TriggerServerEvent('adminv1:server:editpr', data.id, Queue.level[level], Queue.time[time])
            else
                QBCore.Functions.Notify('No Time Found', "error")
            end
        else
            QBCore.Functions.Notify('No Level Found', "error")
        end
    end
end)

RegisterNetEvent('adminv1:client:removepr', function(data)
    local alert = lib.alertDialog({
        header = 'Confirmation',
        content = 'Are you sure you want to remove queue from [ '..data.Name..' ]',
        centered = true,
        cancel = true
    })
    if alert then 
        if alert == 'confirm' then 
            TriggerServerEvent('adminv1:server:removepr', data)
        end
    end
end)

RegisterNetEvent('adminv1:client:UnJailConfirmation', function(data)
    local alert = lib.alertDialog({
        header = 'Confirmation',
        content = 'Are you sure you want to ujail [ '..data.Name..' ]',
        centered = true,
        cancel = true
    })
    if alert then 
        if alert == 'confirm' then 
            TriggerServerEvent('adminv1:server:unjailPlayer', data)
        end
    end
end)

RegisterNetEvent('adminv1:client:UnBanConfirmation', function(data)
    local alert = lib.alertDialog({
        header = 'Confirmation',
        content = 'Are you sure you want to unban [ '..data.Name..' ]',
        centered = true,
        cancel = true
    })
    if alert then 
        if alert == 'confirm' then 
            TriggerServerEvent('adminv1:server:unbanPlayer', data)
        end
    end
end)