local nmsh = exports[Nmsh.CoreName]:GetCoreObject()
local KeysHolders = {}

CreateThread(function()
    Wait(500)
    exports['oxmysql']:execute("SELECT * FROM `nmsh_gang_rooms`", function(result)
        if not result then return end
        for k, v in pairs(result) do
            if result[k].isowned == 1 then
                local current = result[k].id
                Nmsh.Rooms[current].isOwned = true 
                Nmsh.Rooms[current].Owner = result[k].owner
                Nmsh.Rooms[current].locker.maxweight = result[k].maxweight
                Nmsh.Rooms[current].locker.slots = result[k].slots

                if result[k].keyholders ~= nil then
                    local keyholders = json.decode(result[k].keyholders)
                    local NamesTable = {}
                    for key, holder in pairs(keyholders) do 
                        table.insert(NamesTable, {
                            cid = holder.cid,
                            name = holder.name
                        })
                    end
                    KeysHolders[current] = NamesTable
                end
            end
        end
	end)
end)

nmsh.Functions.CreateCallback('nmsh-gang_rooms:server:GetKeysHolders', function(source, cb, locker)
	cb(KeysHolders)
end)

nmsh.Functions.CreateCallback('nmsh-gang_rooms:server:GetConfig', function(source, cb)
	cb(Nmsh.Rooms)
end)

nmsh.Functions.CreateUseableItem('key1' , function(source, item)
	local src = source
	local Info = item.info.roomnumber
	TriggerClientEvent('nmsh-gang_rooms:client:RoomKey', src, tonumber(item.info.roomnumber))
end)

nmsh.Functions.CreateCallback('nmsh-gang_rooms:server:GiveNewRoomKey', function(source, cb, roomNumber)
    local src = source
    local Player = nmsh.Functions.GetPlayer(src)
	local info = { roomnumber = tonumber(roomNumber)}
	if Player.Functions.AddItem("key1", 1, false, info) then
		TriggerClientEvent("inventory:client:ItemBox", src, nmsh.Shared.Items["key1"], "add")
		TriggerEvent(Nmsh.LogsTrigger..":server:CreateLog", "gangsrooms", "Give New Room Keys Logs - Gangs Rooms", "yellow", "** Player Name: "..Player.PlayerData.name.."\n\n CitizenId: "..Player.PlayerData.citizenid.."\n\n Room Num: "..tonumber(roomNumber).."**")
		cb(true)
	else
		cb(false)
	end

end)

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(Nmsh.DailyRentTimer)
		if nmsh ~= nil then
			exports['oxmysql']:execute("SELECT * FROM `nmsh_gang_rooms`", function(lockers)
				for k, v in pairs(lockers) do
					local FinalCost = (Nmsh.DailyRental / 24)
					if lockers[k].owner ~= nil then
						local citizenid = lockers[k].owner
						local Player = nmsh.Functions.GetPlayerByCitizenId(citizenid)
						if Player ~= nil then  ---online players
							local OwnerMoney = Player.Functions.GetMoney("bank")
							if tonumber(OwnerMoney) >= tonumber(FinalCost) then
								Player.Functions.RemoveMoney("bank", tonumber(FinalCost))
								TriggerEvent('nmsh-phone:server:sendNewMail', {
									sender = "Mafia Hotels Comapny",
									subject = "Payment completed successfully",
									message = "You just paid your hotel room fees $"..tonumber(FinalCost).."",
									button = nil
								}, citizenid)
							else
								if tonumber(lockers[k].flags) < 3 then
									lockers[k].flags = lockers[k].flags + 1
									exports['oxmysql']:execute("UPDATE `nmsh_gang_rooms` SET `flags` = '"..lockers[k].flags.."' WHERE `id` = '"..lockers[k].id.."'")

									TriggerEvent('nmsh-phone:server:sendNewMail', {
										sender = "Mafia Hotels Comapny",
										subject = "Payment issue",
										message = "You did not pay your installments, and this is the "..lockers[k].flags.." warning!! <br><br>please pay the fees or you will lose your hotel room on the third warning",
										button = nil
									}, citizenid)
								elseif tonumber(lockers[k].flags) == 3 and tonumber(lockers[k].isowned) == 1 then
									exports['oxmysql']:execute("UPDATE `nmsh_gang_rooms` SET `owner` = 'NULL',`flags` = '0', `ispaid` = '0', `keyholders` = '[]', `maxweight` = '"..Nmsh.Maxweight.."', `slots` = '"..Nmsh.MaxSlots.."', `isowned` = '0' WHERE `id` = '"..lockers[k].id.."'")

									TriggerEvent('nmsh-phone:server:sendNewMail', {
										sender = "Mafia Hotels Comapny",
										subject = "Payment issue",
										message = "You did not paid your installments, so you just lost your hotel room",
										button = nil
									}, citizenid)
		
									Nmsh.Rooms[lockers[k].id].isOwned = false
									Nmsh.Rooms[lockers[k].id].Owner = nil
									Nmsh.Rooms[lockers[k].id].locker.maxweight = lockers[k].maxweight
									Nmsh.Rooms[lockers[k].id].locker.slots = lockers[k].slots
		
									TriggerClientEvent('nmsh-gang_rooms:client:Refresh', -1, Nmsh.Rooms)
								end
							end
						else
							---Offline players
							exports['oxmysql']:execute("SELECT * FROM `players` WHERE `citizenid` = '"..citizenid.."'", function(OwnerData)
								if OwnerData[1] ~= nil then
									local OwnerMoney = json.decode(OwnerData[1].money)
									if tonumber(OwnerMoney.bank) >= tonumber(FinalCost) then
										OwnerMoney.bank = OwnerMoney.bank - tonumber(FinalCost)
										exports['oxmysql']:execute("UPDATE `players` SET `money` = '"..json.encode(OwnerMoney).."' WHERE `citizenid` = '"..citizenid.."'")
										if Player ~= nil then
											TriggerClientEvent('nmsh-gangrooms:client:CinfirmPayment', Player.PlayerData.source, true)
										end
									else
										if tonumber(lockers[k].flags) < 3 then
											lockers[k].flags = lockers[k].flags + 1
											exports['oxmysql']:execute("UPDATE `nmsh_gang_rooms` SET `flags` = '"..lockers[k].flags.."' WHERE `id` = '"..lockers[k].id.."'")

											TriggerEvent('nmsh-phone:server:sendNewMail', {
												sender = "Mafia Hotels Comapny",
												subject = "Payment issue",
												message = "You did not pay your installments in mafia palace room, and this is the "..lockers[k].flags.." warning!! <br><br>please pay the fees or you will lose your storage on the third warning",
												button = nil
											}, citizenid)
		
										elseif tonumber(lockers[k].flags) == 3 and tonumber(lockers[k].isowned) == 1 then
											exports['oxmysql']:execute("UPDATE `nmsh_gang_rooms` SET `owner` = 'NULL',`flags` = '0', `ispaid` = '0', `keyholders` = '[]', `maxweight` = '"..Nmsh.Maxweight.."', `slots` = '"..Nmsh.MaxSlots.."', `isowned` = '0' WHERE `id` = '"..lockers[k].id.."'")

											TriggerEvent('nmsh-phone:server:sendNewMail', {
												sender = "Mafia Hotels Comapny",
												subject = "Payment issue",
												message = "Due to non-payment for the room at the Mafia Palace, the room contract was cancelled..",
												button = nil
											}, citizenid)
		
											Nmsh.Rooms[lockers[k].id].isOwned = false
											Nmsh.Rooms[lockers[k].id].Owner = nil
											Nmsh.Rooms[lockers[k].id].locker.maxweight = lockers[k].maxweight
											Nmsh.Rooms[lockers[k].id].locker.slots = lockers[k].slots
			
											TriggerClientEvent('nmsh-gang_rooms:client:Refresh', -1, Nmsh.Rooms)
										end
									end
								end
							end)
						end
					end
					Citizen.Wait(100)
				end
			end)
		end
    end
end)


nmsh.Functions.CreateCallback('nmsh-gang_rooms:server:CheckOwned', function(source, cb)
	local src = source
	local Player = nmsh.Functions.GetPlayer(src)
	exports['oxmysql']:execute("SELECT * FROM `nmsh_gang_rooms` WHERE `owner` = '"..Player.PlayerData.citizenid.."'", function(result)
        if result[1] ~= nil then
			cb(false)
		else
			cb(true)
		end
	end)
end)

RegisterNetEvent('nmsh-gang_rooms:server:rentRoom', function(room)
	local src = source
	local Player = nmsh.Functions.GetPlayer(src)
	local Money = Player.Functions.GetMoney("bank")
    if Money >= Nmsh.RoomRentCost then
        if Player.Functions.RemoveMoney("bank", Nmsh.RoomRentCost) then
            exports['oxmysql']:execute("SELECT * FROM `nmsh_gang_rooms` WHERE `id` = '"..room.."'", function(result)
				if result[1] ~= nil then
                    Nmsh.Rooms[room].isOwned = true
                    Nmsh.Rooms[room].Owner = result[1].owner
                    Nmsh.Rooms[room].locker.maxweight = result[1].maxweight
                    Nmsh.Rooms[room].locker.slots = result[1].slots
					exports['oxmysql']:execute("UPDATE `nmsh_gang_rooms` SET `isowned` = '1', `owner` = '"..Player.PlayerData.citizenid.."', `keyholders` = '[]', `ispaid` = '1' WHERE `id` = '"..room.."'")
					TriggerClientEvent('nmsh-gang_rooms:client:Refresh', -1, Nmsh.Rooms)
					TriggerClientEvent(Nmsh.CoreTriggerName..':Notify', src, 'You have successfully Rented A new hotel room #'..room, "success")
					TriggerEvent(Nmsh.LogsTrigger..":server:CreateLog", "gangsrooms", "New Room Rent - Gangs Rooms", "red", "** Player Name: "..Player.PlayerData.name.."\n\n CitizenId: "..Player.PlayerData.citizenid.."\n\n Room Num: "..room.."**")

					local info = { roomnumber = tonumber(room)}
					if Player.Functions.AddItem("key1", 1, false, info) then
						TriggerClientEvent("inventory:client:ItemBox", src, nmsh.Shared.Items["key1"], "add")
					end
				else
					exports['oxmysql']:execute("INSERT INTO `nmsh_gang_rooms` (`id`, `isowned`, `owner`, `maxweight`, `slots`, `keyholders`, `ispaid`) VALUES ('"..room.."', '1', '"..Player.PlayerData.citizenid.."', '"..Nmsh.Maxweight.."', '"..Nmsh.MaxSlots.."', '[]', '1')")
					Nmsh.Rooms[room].isOwned = true
					Nmsh.Rooms[room].locker.maxweight = 500000
					Nmsh.Rooms[room].locker.slots = 20
					TriggerClientEvent('nmsh-gang_rooms:client:Refresh', -1, Nmsh.Rooms)
					TriggerClientEvent(Nmsh.CoreTriggerName..':Notify', src, 'You have successfully Rented A new hotel room #'..room, "success")
					TriggerEvent(Nmsh.LogsTrigger..":server:CreateLog", "gangsrooms", "New Room Rent - Gangs Rooms", "red", "** Player Name: "..Player.PlayerData.name.."\n\n CitizenId: "..Player.PlayerData.citizenid.."\n\n Room Num: "..room.."**")
					local info = { roomnumber = tonumber(room)}
					if Player.Functions.AddItem("key1", 1, false, info) then
						TriggerClientEvent("inventory:client:ItemBox", src, nmsh.Shared.Items["key1"], "add")
					end
				end
			end)
        end
	else
		TriggerClientEvent(Nmsh.CoreTriggerName..':Notify', src, 'You dont have enoght money to Rent new Room', "error")
	end
end)

nmsh.Functions.CreateCallback('nmsh-gang_rooms:server:canOpenLocker', function(source, cb, locker)
	local src = source
	local Player = nmsh.Functions.GetPlayer(src)
	local isOwner = false

	exports['oxmysql']:execute("SELECT * FROM `nmsh_gang_rooms`  WHERE `id` = '"..locker.."'", function(result)
        if result[1] ~= nil then
			if result[1].owner == Player.PlayerData.citizenid then
				isOwner = true
			   cb(true, isOwner)
			else
				if result[1].keyholders ~= nil then
					local keyholders = json.decode(result[1].keyholders)
					local hasKey = false
					for k, v in pairs(keyholders) do 
						if v.cid == Player.PlayerData.citizenid and not hasKey then
							hasKey = true
							cb(true, isOwner)
						end
					end
					if not hasKey then
						cb(false)
					end
				else
					cb(false)
				end
			end
		else
			cb(false)
		end
	end)
end)

RegisterServerEvent('nmsh-gang_rooms:server:GiveNewKey')
AddEventHandler('nmsh-gang_rooms:server:GiveNewKey', function(Target, data)
	local src = source
	local Player = nmsh.Functions.GetPlayer(src)
	local Target = nmsh.Functions.GetPlayer(Target)
	local locker = data.locker
	if Target ~= nil then
		local TargetName = ""..Target.PlayerData.charinfo.firstname.." "..Target.PlayerData.charinfo.lastname..""
		exports['oxmysql']:execute("SELECT * FROM `nmsh_gang_rooms`  WHERE `id` = '"..locker.."'", function(result)
			if result[1] ~= nil then
				if result[1].keyholders ~= nil then
					local keyholders = json.decode(result[1].keyholders)
					for k, v in pairs(keyholders) do 
						if v.cid == Target.PlayerData.citizenid then
							TriggerClientEvent(Nmsh.CoreTriggerName..':Notify', src, 'This player already have a key'..TargetName, "error")
							return
						end
					end

					table.insert(keyholders, {
						cid = Target.PlayerData.citizenid,
						name = TargetName
					})

					exports['oxmysql']:execute("UPDATE `nmsh_gang_rooms` SET `keyholders` = '"..json.encode(keyholders).."' WHERE `id` = '"..locker.."'")
					TriggerClientEvent(Nmsh.CoreTriggerName..':Notify', src, 'You have successfully give a key to: '..TargetName, "success")
					TriggerClientEvent(Nmsh.CoreTriggerName..':Notify', Target.PlayerData.source, 'You have a new key for the motel room: #'..locker, "success")
					TriggerEvent(Nmsh.LogsTrigger..":server:CreateLog", "gangsrooms", "Give Room key for A Player - Gangs Rooms", "green", "** Player Name: "..Player.PlayerData.name.."\n\n CitizenId: "..Player.PlayerData.citizenid.."\n\n Key give to: "..Target.PlayerData.Name.."\n\n Room Num: "..locker.."$**")
					KeysHolders[locker] = keyholders
				else
					local keyholders = {}
					table.insert(keyholders, {
						cid = Target.PlayerData.citizenid,
						name = TargetName
					})

					exports['oxmysql']:execute("UPDATE `nmsh_gang_rooms` SET `keyholders` = '"..json.encode(keyholders).."' WHERE `id` = '"..locker.."'")
					TriggerClientEvent(Nmsh.CoreTriggerName..':Notify', src, 'You have successfully give a key to: '..TargetName, "success")
					TriggerClientEvent(Nmsh.CoreTriggerName..':Notify', Target.PlayerData.source, 'You have got a new key for the hotel room Num: #'..locker, "success")
					TriggerEvent(Nmsh.LogsTrigger..":server:CreateLog", "gangsrooms", "Give Room key for A Player - Gangs Rooms", "green", "** Player Name: "..Player.PlayerData.name.."\n\n CitizenId: "..Player.PlayerData.citizenid.."\n\n Key give to: "..Target.PlayerData.Name .."\n\n Room Num: "..locker.."$**")
					KeysHolders[locker] = keyholders
				end
			end
		end)
	else
		TriggerClientEvent(Nmsh.CoreTriggerName..':Notify', src, 'Player is offline', "error")
	end
end)

RegisterServerEvent('nmsh-gang_rooms:server:RemoveKey', function(data)
	local src = source
	local Player = nmsh.Functions.GetPlayer(src)
	local locker = data.locker
	local citizenid = data.citizenid
	local name = data.name
	exports['oxmysql']:execute("SELECT * FROM `nmsh_gang_rooms`  WHERE `id` = '"..locker.."'", function(result)
		if result[1] ~= nil then
			if result[1].keyholders ~= nil then
				local found = false
				local keyholders = json.decode(result[1].keyholders)
				for k, v in pairs(keyholders) do 
					if v.cid == citizenid then
						found = true
						table.remove(keyholders, k)
					end
				end
				if found then
					exports['oxmysql']:execute("UPDATE `nmsh_gang_rooms` SET `keyholders` = '"..json.encode(keyholders).."' WHERE `id` = '"..locker.."'")
				   TriggerClientEvent(Nmsh.CoreTriggerName..':Notify', src, 'You have removed hotel keys from: '..name, "success")
				   TriggerEvent(Nmsh.LogsTrigger..":server:CreateLog", "gangsrooms", "Remove Keys From a player - Gangs Rooms", "red", "** Player Name: "..Player.PlayerData.name.."\n\n CitizenId: "..Player.PlayerData.citizenid.."\n\n Key removed from : "..data.name.."\n\n Room Num: "..locker.."$**")
				   KeysHolders[locker] = keyholders
				end
			end
		end
	end)
end)

RegisterNetEvent('nmsh-gang_rooms:server:newlockerfeatures', function(data)
	local src = source
	local Player = nmsh.Functions.GetPlayer(src)
	local Money = Player.Functions.GetMoney("bank")
	local price = data.price
	local locker = data.locker
	if tonumber(Money) >= tonumber(price) then
		if data.action == "weight" then
			if Nmsh.Rooms[locker].locker.maxweight < data.choosed then
				Player.Functions.RemoveMoney("bank", tonumber(price))
				Nmsh.Rooms[locker].locker.maxweight = data.choosed
				exports['oxmysql']:execute("UPDATE `nmsh_gang_rooms` SET `maxweight` = '"..tonumber(data.choosed).."' WHERE `id` = '"..locker.."'")
				TriggerClientEvent('nmsh-gang_rooms:client:Refresh', -1, Nmsh.Rooms)
				TriggerClientEvent(Nmsh.CoreTriggerName..':Notify', src, 'Your locker Weight has been sucessfully upgraded to '..tonumber(data.choosed), "success")
				TriggerEvent(Nmsh.LogsTrigger..":server:CreateLog", "gangsrooms", "Weight Upgrade - Gangs Rooms", "yellow", "** Player Name: "..Player.PlayerData.name.."\n\n CitizenId: "..Player.PlayerData.citizenid.."\n\n Room Num: "..locker.."\n\n Capacity : "..data.choosed.."\n\n Price : "..data.price.."$**")
			else
				TriggerClientEvent(Nmsh.CoreTriggerName..':Notify', src, 'Max wight has been reached', "error")
			end
		else
			if Nmsh.Rooms[locker].locker.slots < data.choosed then
				Player.Functions.RemoveMoney("bank", tonumber(price))
				Nmsh.Rooms[locker].locker.slots = data.choosed
				exports['oxmysql']:execute("UPDATE `nmsh_gang_rooms` SET `slots` = '"..tonumber(data.choosed).."' WHERE `id` = '"..locker.."'")
				TriggerClientEvent('nmsh-gang_rooms:client:Refresh', -1, Nmsh.Rooms)
				TriggerClientEvent(Nmsh.CoreTriggerName..':Notify', src, 'Your locker Slots has been sucessfully upgraded to '..tonumber(data.choosed), "success")
				TriggerEvent(Nmsh.LogsTrigger..":server:CreateLog", "gangsrooms", "Slots Upgrade - Gangs Rooms", "yellow", "** Player Name: "..Player.PlayerData.name.."\n\n CitizenId: "..Player.PlayerData.citizenid.."\n\n Room Num: "..locker.."\n\n Slots: "..data.choosed.."\n\n Price : "..data.price.."$**")
			else
				TriggerClientEvent(Nmsh.CoreTriggerName..':Notify', src, 'Max slots has been reached', "error")
			end
		end
	else
		TriggerClientEvent(Nmsh.CoreTriggerName..':Notify', src, 'You dont have enoght money to upgrade '..data.choosed, "error")
	end
end)