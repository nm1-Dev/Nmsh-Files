local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('row-beekeeping:installHive')
AddEventHandler('row-beekeeping:installHive', function(coords)
    local timestamp = os.time()
    exports.oxmysql:execute('INSERT INTO bees (coords, timestamp, beequeen) VALUES (@coords, @state, @bq)', {
        ['@coords'] = json.encode(coords),
        ['@state'] = timestamp,
        ['@bq'] = 0,
    }, function(rowschanged)
        if rowschanged then
            print(rowschanged.insertId)
            exports.oxmysql:execute('SELECT * FROM bees WHERE id = @id', {["@id"] = rowschanged.insertId}, function(hive)
                TriggerClientEvent('row-beekeeping:trigger_zone', -1, 2, hive[1])
            end)
        end
    end)
end)

QBCore.Functions.CreateCallback('row-beekeeping:removeHive', function(source, cb, pId)
    exports.oxmysql:execute('DELETE FROM bees WHERE id = @id', {["@id"] = pId})
    TriggerClientEvent('row-beekeeping:trigger_zone', -1, 4, pId)
    cb(true)
end)

QBCore.Functions.CreateCallback('row-beekeeping:addQueen', function(source, cb, key)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local queenbee = xPlayer.Functions.GetItemByName("beequeen").amount
    if queenbee > 0 then
        exports.oxmysql:execute('UPDATE bees SET beequeen = (1 + @beequeen) WHERE id = @id', {["@id"] = key, ['@beequeen'] = math.random(1,1)}, function(rowschanged)
            exports.oxmysql:execute('SELECT * FROM bees WHERE id = @id', {["@id"] = key}, function(hive)
                cb(true)
                TriggerClientEvent('row-beekeeping:trigger_zone', -1, 3, hive[1])
            end)
        end)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('row-beekeeping:getBeehives', function(source, cb)
    exports.oxmysql:execute('SELECT * FROM bees', {}, function(hives)
        cb(hives)
    end)
end)

QBCore.Functions.CreateUseableItem(HiveConfig.BeeHiveItem, function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("nmsh-beehives:setBeehives", source)
end)

RegisterServerEvent('beehive:removeItem')
AddEventHandler('beehive:removeItem', function(item , amount)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.RemoveItem(item , amount)
end)

RegisterServerEvent('beehive:addItem')
AddEventHandler('beehive:addItem', function(item , amount)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.AddItem(item, amount)
end)

RegisterServerEvent('row-beekeeping:harvestHive')
AddEventHandler('row-beekeeping:harvestHive', function(pId, sekslazim)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    exports.oxmysql:execute('DELETE FROM bees WHERE id = @id', {["@id"] = pId}, function(plants)
        TriggerClientEvent('row-beekeeping:trigger_zone', -1, 4, pId)
        if sekslazim > 0 then
            TriggerClientEvent('row-bee:itemekle', src)
        else
            TriggerClientEvent('row-bee:itemekle2', src)
        end
    end)
end)