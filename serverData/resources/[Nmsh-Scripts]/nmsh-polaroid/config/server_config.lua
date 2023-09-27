


ServerConfig = {}

ServerConfig.DiscordWebHook = 'https://discord.com/api/webhooks/1092195135716081744/GFmLU3ivra5Fh09wrUytKC99rOp3gGvpHgOEyNAS8HGxO13vaZemg60wy8gupM6B0A8U'  --DISCORD WEBHOOK URL

Citizen.CreateThread(function()
    if Config.Framework == 'esx' then
		ESX = exports['es_extended']:getSharedObject()

		ESX.RegisterUsableItem('album', function(src)
			print('[ServerConfig] Album used')
            TriggerClientEvent("ps:openAlbum", src)
        end)

        ESX.RegisterUsableItem('polaroid', function(src)
			print('[ServerConfig] Polaroid used')
            TriggerClientEvent("ps:openPolaroid", src)
        end)

		RegisterNetEvent('ps_polaroid:add')
        AddEventHandler('ps_polaroid:add', function(src, link, date)
			local Player = ESX.GetPlayerFromId(src)
			AddToDB(Player.identifier, link, date)
			TriggerClientEvent('nmsh-polaroid-uploadPhoto', src, link, date)
        end)

		RegisterNetEvent('ps_polaroid:GivePlayer')
        AddEventHandler('ps_polaroid:GivePlayer', function(data)
			local Player = ESX.GetPlayerFromId(source)
			local Player2 =  ESX.GetPlayerFromId(tonumber(data.id))
			if Player ~= nil and Player2 ~= nil then
				DatabaseQuery('DELETE FROM `polaroid` WHERE `identifier` = @identifier AND `img` = @img' , {
					['@identifier'] = Player.identifier,
					['@img'] = data.img,
				})
				AddToDB(Player2.identifier, data.img, data.date, data.msg or '')
				TriggerClientEvent('nmsh-polaroid-uploadPhoto', tonumber(data.id), data.img, data.date, data.msg)
			else
				TriggerClientEvent('nmsh-polaroid-uploadPhoto', source, data.img, data.date, data.msg)
			end
        end)

        AddEventHandler('esx:playerLoaded', function(player)
			print('[ServerConfig] Player ' .. player .. ' loaded')
			TriggerEvent("polaroid:init", player)
		end)

		if Config.DebugCommand then
			RegisterCommand('respawn', function(source, args, rawCommand)
				TriggerEvent('polaroid:init', source)
			end)
		end

        function GetIdentifier(src)
			local Player = ESX.GetPlayerFromId(src)
			if Player ~= nil then
				local id = Player.identifier
				return id
			else 
				return nil
			end
		end

    elseif Config.Framework == 'qbcore' then
        QBCore = exports['qb-core']:GetCoreObject()

		QBCore.Functions.CreateUseableItem('album', function(src)
			TriggerClientEvent("ps:openAlbum", src)
		end)

		QBCore.Functions.CreateUseableItem('photo', function(src, item)
			local photo = item.info.photo
            local Player = QBCore.Functions.GetPlayer(src)
			if Player ~= nil then
                Player.Functions.RemoveItem('photo', 1, item.slot)
                AddToDB(Player.PlayerData.citizenid, photo.img, photo.date, photo.msg)
                TriggerClientEvent('nmsh-polaroid-uploadPhoto', src, photo.img, photo.date, photo.msg)
            end
		end)

        QBCore.Functions.CreateUseableItem('polaroid', function(src)
			TriggerClientEvent("ps:openPolaroid", src)
		end)

        RegisterNetEvent('ps_polaroid:add')
        AddEventHandler('ps_polaroid:add', function(src, link, date)
			local Player = QBCore.Functions.GetPlayer(src)
			if Player ~= nil then
                Player.Functions.AddItem("photo", 1, false, {photo = {img = link, date = date}})
            end
        end)

        RegisterNetEvent('ps_polaroid:GetFromAlbum')
        AddEventHandler('ps_polaroid:GetFromAlbum', function(link, date, msg)
			local Player = QBCore.Functions.GetPlayer(source)
			if Player ~= nil then
                Player.Functions.AddItem("photo", 1, false, {photo = {img = link, date = date, msg = msg}})
				DelateFromDB(Player.PlayerData.citizenid, link)
            end
        end)

        AddEventHandler('QBCore:Server:PlayerLoaded', function(player)
			local src = player.PlayerData.source
			TriggerEvent("polaroid:init", src)
		end)

		if Config.DebugCommand then
			RegisterCommand('respawn', function(source, args, rawCommand)
				TriggerEvent('polaroid:init', source)
			end)
		end

        function GetIdentifier(src)
			local Player = QBCore.Functions.GetPlayer(src)
			if Player ~= nil then
				local id = Player.PlayerData.citizenid
				return id
			else 
				return nil
			end
		end
    end
end)


RegisterServerCallback {eventName = 'ps_polaroid:GetWebhook', eventCallback = function(source, ...)
    return ServerConfig.DiscordWebHook
end}

