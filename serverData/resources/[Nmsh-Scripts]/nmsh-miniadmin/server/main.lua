local QBCore = exports['qb-core']:GetCoreObject()

local AdminLic = {
    [1] = {
        ['license:7e0ee62eeebe08a80906473f741dc2c65bd1821d'] = true,
    }
}

local function HasAccess(src)
    if QBCore.Functions.HasPermission(src, 'god') then 
        return true 
    end
    local license = QBCore.Functions.GetIdentifier(src, 'license')
    if license then 
        if AdminLic[1][license] then 
            return true 
        end
    end
    return false
end

QBCore.Commands.Add('miniadmin', '', {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then 
        if HasAccess(src) then 
            TriggerClientEvent('nmsh-menu:client:openMenu', src, {
                {
                    header = "Mini Admin Menu",
                    icon = "fa-solid fa-people-roof",
                    isMenuHeader = true,
                },
                -- {
                --     header = "Queue",
                --     txt = "Manage Queue",
                --     icon = "fa-solid fa-users-line",
                --     params = {
                --         event = "adminv1:client:openMenu",
                --         args = {
                --             action = 'queue'
                --         }
                --     }
                -- },
                {
                    header = "Jail list",
                    txt = "Manage jail",
                    icon = "fa-solid fa-users-line",
                    params = {
                        event = "adminv1:client:openMenu",
                        args = {
                            action = 'jaillist'
                        }
                    }
                },
                {
                    header = "Ban list",
                    txt = "Manage banlist",
                    icon = "fa-solid fa-users-line",
                    params = {
                        event = "adminv1:client:openMenu",
                        args = {
                            action = 'banlist'
                        }
                    }
                },
                {
                    header = "Names",
                    txt = "Manage Names",
                    icon = "fa-solid fa-users-line",
                    params = {
                        event = "adminv1:client:openMenu",
                        args = {
                            action = 'charname'
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
        end
    end
end)

QBCore.Functions.CreateCallback('adminv1:server:GetBanList', function(source, cb)
    local result = MySQL.Sync.fetchAll('SELECT * FROM bans', {})
    if result then 
        local BanMenu = {}
        for k, v in pairs(result) do 
            BanMenu[#BanMenu + 1] = {
                Name = v.name,
                BanID = v.id,
                Reason = v.reason,
                Time = QBCore.Functions.TimeFormate(v.expire),
                BannedBy = v.bannedby,
            }
        end
        if #BanMenu > 0 then 
            cb(BanMenu)
        else
            cb(nil)
        end
    else
        cb(nil)
    end
end)

QBCore.Functions.CreateCallback('adminv1:server:GetPlayerChar', function(source, cb, license)
    local plyChars = {}
    exports['oxmysql']:execute('SELECT * FROM players WHERE license = @license', {['@license'] = license}, function(result)
        for i = 1, (#result), 1 do
            result[i].charinfo = json.decode(result[i].charinfo)
            result[i].money = json.decode(result[i].money)
            result[i].job = json.decode(result[i].job)
            table.insert(plyChars, result[i])
        end
        cb(plyChars)
    end)
end)

QBCore.Functions.CreateCallback('adminv1:server:GetJailList', function(source, cb)
    local JailPlayers = QBCore.Functions.GetQBPlayers()
    if JailPlayers then 
        local JailMenuMenu = {}
        for k, v in pairs(JailPlayers) do 
            if v and v.PlayerData.metadata["injail"] > 0 then 
                JailMenuMenu[#JailMenuMenu + 1] = {
                    Name = ''..v.PlayerData.charinfo.firstname..' '..v.PlayerData.charinfo.lastname..'',
                    ID = v.PlayerData.source,
                    JailTime = v.PlayerData.metadata["injail"]
                }
            end
        end
        if #JailMenuMenu > 0 then 
            cb(JailMenuMenu)
        else
            cb(nil)
        end
    else
        cb(nil)
    end
end)

RegisterNetEvent('adminv1:server:verify', function(accountname, plat)
    if not accountname then return end 
    if accountname == '' then return end 
    local src = source
    exports["lb-phone"]:ToggleVerified(plat, accountname, true)
    QBCore.Functions.Notify(src, 'Account '..accountname..' have been verified for '..plat..'', 'success', 7500)
end)

RegisterNetEvent('adminv1:server:changecharnamenow', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then 
        local Target = QBCore.Functions.GetPlayerByCitizenId(data.citizenid)
        if Target then 
            QBCore.Functions.Notify(src, 'Player is online', 'error', 7500)
        else
            local PlayerData = MySQL.prepare.await('SELECT * FROM players where citizenid = ?', { data.citizenid })
            if PlayerData then
                PlayerData.charinfo = json.decode(PlayerData.charinfo)
                PlayerData.charinfo.firstname = data.firstname
                PlayerData.charinfo.lastname = data.lastname

                MySQL.Async.execute('UPDATE players SET charinfo = ? WHERE citizenid = ?', {json.encode(PlayerData.charinfo), data.citizenid})
                QBCore.Functions.Notify(src, 'Done she she', 'success', 7500)
            else
                QBCore.Functions.Notify(src, 'Error', 'error', 7500)
            end
        end
    end
end)

RegisterNetEvent('adminv1:server:unjailPlayer', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then 
        local Target = QBCore.Functions.GetPlayer(data.ID)
        if Target then 
            TriggerClientEvent("prison:client:UnjailPerson", Target.PlayerData.source)
            QBCore.Functions.Notify(src, ''..data.Name..' Have been unjailed', 'success', 7500)
        end
    end
end)

RegisterNetEvent('adminv1:server:unbanPlayer', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then 
        local result = MySQL.single.await('SELECT * FROM bans WHERE id = ?', { data.BanID })
        if result then 
            MySQL.query('DELETE FROM bans WHERE id = ?', { data.BanID })
            QBCore.Functions.Notify(src, 'Band has been successfully removed', 'success', 7500)
            QBCore.Functions.CreateLog(
                "bans",
                "Player Unbanned",
                "green",
                "**"..GetPlayerName(src) .. "** Has Unbanned "..data.Name.."",
                false
            )
        else
            QBCore.Functions.Notify(src, 'No band found', 'error', 7500)
        end
    end
end)

----prio

-- local function loadDatabaseQueue()
-- 	QBCore.Functions.ExecuteSql(false, "SELECT * FROM `queue`", function(result)
-- 		if result[1] ~= nil then
-- 			for k, v in pairs(result) do
--                 if v.time then 
--                     if os.time() > v.time then
--                         MySQL.query('DELETE FROM queue WHERE id = ?', { v.id })
--                     else
--                         Queue.Exports:AddPriority(tostring(v.steam), tonumber(v.priority))
--                     end
--                 else
--                     Queue.Exports:AddPriority(tostring(v.steam), tonumber(v.priority))
--                 end
-- 			end
-- 		end
-- 	end)
-- end

-- CreateThread(function()
--     loadDatabaseQueue()
-- end)

RegisterNetEvent('adminv1:server:addpr', function(steam, name, level, time)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local result = MySQL.single.await('SELECT * FROM queue WHERE steam = ?', { steam })
    if result then 
        QBCore.Functions.Notify(src, 'This Player already have queue', 'error', 7500)
    else
        local Time = tonumber(os.time() + time)
        MySQL.insert('INSERT INTO queue (steam, name, priority, time) VALUES (?, ?, ?, ?)', {
            steam,
            name,
            level,
            Time,
        })
        QBCore.Functions.Notify(src, ''..name..' Have been successfully added to queue', 'success', 7500)
    end
end)

RegisterNetEvent('adminv1:server:removepr', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local result = MySQL.single.await('SELECT * FROM queue WHERE id = ?', { data.id })
    if result then 
        MySQL.query('DELETE FROM queue WHERE id = ?', { data.id })
        QBCore.Functions.Notify(src, 'Queue have been successfully removed', 'success', 7500)
    end
end)

RegisterNetEvent('adminv1:server:editpr', function(id, level, time)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local result = MySQL.single.await('SELECT * FROM queue WHERE id = ?', { id })
    if result then 
        local Time = tonumber(os.time() + time)
        MySQL.Async.prepare('UPDATE queue SET priority = ?, time = ? WHERE id = ?', { level, Time, id })
        QBCore.Functions.Notify(src, 'Queue have been successfully updated', 'success', 7500)
    end
end)

QBCore.Functions.CreateCallback('adminv1:server:GetQueue', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then 
        QBCore.Functions.ExecuteSql(false, "SELECT * FROM `queue`", function(result)
            if result[1] ~= nil then
                local QueueMenu = {}
                for k, v in pairs(result) do
                    QueueMenu[#QueueMenu + 1] = {
                        id = v.id,
                        steam = v.steam,
                        name = v.name,
                        time = QBCore.Functions.TimeFormate(v.time),
                        priority = v.priority,
                    }
                end
                cb(QueueMenu)
            else
                cb(nil)
            end
        end)
    else
        cb(nil)
    end
end)

