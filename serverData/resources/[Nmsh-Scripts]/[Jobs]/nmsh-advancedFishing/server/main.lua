if Config.Framework == "qb" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == "oldqb" then 
    QBCore = nil
    TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
end

local tasks = {}

Citizen.CreateThread(function()
    for k, v in pairs(Config.Tasks) do 
        tasks[k] = {}
        tasks[k].fishName = v.itemName
        tasks[k].taken = false
        tasks[k].hasCount = 0
        tasks[k].requiredCount = v.requiredCount
    end

    for k, v in pairs(Config.fishingRods) do 
        QBCore.Functions.CreateUseableItem(v.itemName, function(source, item)
            TriggerClientEvent('ak4y-advancedFishing:start', source, v.level)
        end)
    end
    
    for x, z in pairs(Config.fishBaits) do 
        QBCore.Functions.CreateUseableItem(z.itemName, function(source, item)
            TriggerClientEvent('ak4y-advancedFishing:setBait', source, z.baitType, z.itemName, z.label)
        end)
    end

    Citizen.Wait(3000)
    if Config.sql == "oxmysql" then  
        MySQL.update('UPDATE ak4y_fishing SET tasks = ?, time = NULL WHERE time <= CURDATE()', { json.encode(tasks) })
    elseif Config.sql == "ghmattimysql" then  
        exports.ghmattimysql:execute("UPDATE ak4y_fishing SET tasks = @tasks, time = NULL WHERE time <= CURDATE()", {
            ['@tasks'] = json.encode(tasks)
        })   
    elseif Config.sql == "mysql-async" then 
        MySQL.Async.execute('UPDATE ak4y_fishing SET tasks = @tasks, time = NULL WHERE time <= CURDATE()', {
            ['@tasks'] = json.encode(tasks)
        })
    end
end)

QBCore.Functions.CreateCallback('ak4y-advancedFishing:getPlayerDetails', function(source, cb)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local citizenId = xPlayer.PlayerData.citizenid
    local charInfo = xPlayer.PlayerData.charinfo
    local callbackData = {}
    if Config.sql == "oxmysql" then  
        local result = MySQL.query.await('SELECT * FROM ak4y_fishing WHERE citizenid = ?', { citizenId })
        if result[1] == nil then 
            MySQL.insert('INSERT INTO ak4y_fishing (citizenid, currentXP, tasks) VALUES (?, ?, ?)', {
                citizenId,
                0,
                json.encode(tasks)
            })
            callbackData = {
                resultData = {
                    ["currentXP"] = 0,
                    ["tasks"] = json.encode(tasks),
                },
                charInfo = charInfo
            }
        else
            callbackData = {resultData = result[1], charInfo = charInfo}
        end
        cb(callbackData)
    elseif Config.sql == "ghmattimysql" then  
        exports.ghmattimysql:execute("SELECT * FROM ak4y_fishing WHERE citizenid = @citizenid", {
            ["@citizenid"] = citizenId
        }, function (result)
            if result[1] == nil then 
                exports.ghmattimysql:execute("INSERT INTO ak4y_fishing SET citizenid = @citizenid, currentXP = @currentXP, tasks = @tasks", {
                    ["@citizenid"] = citizenId,
                    ["@currentXP"] = 0,
                    ["@tasks"] = json.encode(tasks),
                })
                callbackData = {
                    resultData = {
                        ["currentXP"] = 0,
                        ["tasks"] = json.encode(tasks),
                    },
                    charInfo = charInfo
                }
            else
                callbackData = {resultData = result[1], charInfo = charInfo}
            end
            cb(callbackData)
        end) 
    elseif Config.sql == "mysql-async" then 
        MySQL.Async.fetchAll("SELECT * FROM ak4y_fishing WHERE citizenid = @citizenid", {
            ["@citizenid"] = citizenId
        }, function (result)
            if result[1] == nil then 
                MySQL.Async.execute('INSERT INTO ak4y_fishing (citizenid, currentXP, tasks) VALUES (@citizenid, @currentXP, @tasks)', {
                    ["@citizenid"] = citizenId,
                    ["@currentXP"] = 0,
                    ["@tasks"] = json.encode(tasks)
                })
                callbackData = {
                    resultData = {
                        ["currentXP"] = 0,
                        ["tasks"] = json.encode(tasks),
                    },
                    charInfo = charInfo
                }
            else
                callbackData = {resultData = result[1], charInfo = charInfo}
            end
            cb(callbackData)
        end) 
    end
end)



QBCore.Functions.CreateCallback('ak4y-advancedFishing:rewards', function(source, cb, data)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local citizenId = xPlayer.PlayerData.citizenid
    local taskId = tonumber(data.taskId)
    local money = data.money
    if Config.sql == "oxmysql" then  
        local result = MySQL.query.await('SELECT tasks FROM ak4y_fishing WHERE citizenid = ?', { citizenId })
        if result[1] then 
            local resultak4y = json.decode(result[1].tasks)
            if not resultak4y[taskId].taken then 
                if resultak4y[taskId].hasCount >= resultak4y[taskId].requiredCount then 
                    resultak4y[taskId].taken = true
                    xPlayer.Functions.AddMoney('cash', money)
                    MySQL.update('UPDATE ak4y_fishing SET tasks = ?, time = (CURDATE() + INTERVAL '..Config.Settings.tasksResetDay..' DAY) WHERE citizenid = ?', { json.encode(resultak4y), citizenId })
                    cb(true)
                else
                    cb(false)
                end
            else
                cb(false)
            end
        end
    elseif Config.sql == "ghmattimysql" then  
        exports.ghmattimysql:execute("SELECT tasks FROM ak4y_fishing WHERE citizenid = @citizenid", {
            ["@citizenid"] = citizenId
        }, function (result)
            if result[1] then 
                local resultak4y = json.decode(result[1].tasks)
                if not resultak4y[taskId].taken then 
                    if resultak4y[taskId].hasCount >= resultak4y[taskId].requiredCount then 
                        resultak4y[taskId].taken = true
                        xPlayer.Functions.AddMoney('cash', money)
                        exports.ghmattimysql:execute("UPDATE ak4y_fishing SET tasks = @tasks, time = (CURDATE() + INTERVAL "..Config.Settings.tasksResetDay.." DAY) WHERE citizenid = @citizenid", {
                            ['@citizenid'] = citizenId,
                            ['@tasks'] = json.encode(resultak4y)
                        })
                        cb(true)
                    else
                        cb(false)
                    end
                else
                    cb(false)
                end
            end
        end) 
    elseif Config.sql == "mysql-async" then 
        MySQL.Async.fetchAll("SELECT tasks FROM ak4y_fishing WHERE citizenid = @citizenid", {
            ["@citizenid"] = citizenId
        }, function (result)
            if result[1] then 
                local resultak4y = json.decode(result[1].tasks)
                if not resultak4y[taskId].taken then 
                    if resultak4y[taskId].hasCount >= resultak4y[taskId].requiredCount then 
                        resultak4y[taskId].taken = true
                        xPlayer.Functions.AddMoney('cash', money)
                        MySQL.Async.execute("UPDATE ak4y_fishing SET tasks = @tasks, time = (CURDATE() + INTERVAL "..Config.Settings.tasksResetDay.." DAY) WHERE citizenid = @citizenid", {
                            ['@citizenid'] = citizenId,
                            ['@tasks'] = json.encode(resultak4y)
                        })
                        cb(true)
                    else
                        cb(false)
                    end
                else
                    cb(false)
                end
            end
        end) 
    end
end)

RegisterNetEvent('ak4y-advancedFishing:addTaskCount')
AddEventHandler('ak4y-advancedFishing:addTaskCount', function(itemName)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local citizenId = xPlayer.PlayerData.citizenid
    if Config.sql == "oxmysql" then  
        local result = MySQL.query.await('SELECT tasks FROM ak4y_fishing WHERE citizenid = ?', { citizenId })
        if result[1] then 
            local kayit = true
            local resultak4y = json.decode(result[1].tasks)
            for k, v in pairs(resultak4y) do 
                if v.fishName == itemName then 
                    if v.taken or v.hasCount >= v.requiredCount then 
                        kayit = false
                    end
                    v.hasCount = v.hasCount + 1
                end
            end
            if kayit then 
                MySQL.update('UPDATE ak4y_fishing SET tasks = ? WHERE citizenid = ?', { json.encode(resultak4y), citizenId })
            end
        end
    elseif Config.sql == "ghmattimysql" then  
        exports.ghmattimysql:execute("SELECT tasks FROM ak4y_fishing WHERE citizenid = @citizenid", {
            ["@citizenid"] = citizenId
        }, function (result)
            if result[1] then 
                local kayit = true
                local resultak4y = json.decode(result[1].tasks)
                for k, v in pairs(resultak4y) do 
                    if v.fishName == itemName then 
                        if v.taken or v.hasCount >= v.requiredCount then 
                            kayit = false
                        end
                        v.hasCount = v.hasCount + 1
                    end
                end
                if kayit then 
                    exports.ghmattimysql:execute("UPDATE ak4y_fishing SET tasks = @tasks WHERE citizenid = @citizenid", {
                        ['@citizenid'] = citizenId,
                        ['@tasks'] = json.encode(resultak4y)
                    })
                end
            end
        end) 
    elseif Config.sql == "mysql-async" then 
        MySQL.Async.fetchAll("SELECT tasks FROM ak4y_fishing WHERE citizenid = @citizenid", {
            ["@citizenid"] = citizenId
        }, function (result)
            if result[1] then 
                local kayit = true
                local resultak4y = json.decode(result[1].tasks)
                for k, v in pairs(resultak4y) do 
                    if v.fishName == itemName then 
                        if v.taken or v.hasCount >= v.requiredCount then 
                            kayit = false
                        end
                        v.hasCount = v.hasCount + 1
                    end
                end
                if kayit then 
                    MySQL.Async.execute("UPDATE ak4y_fishing SET tasks = @tasks WHERE citizenid = @citizenid", {
                        ['@citizenid'] = citizenId,
                        ['@tasks'] = json.encode(resultak4y)
                    })
                end
            end
        end) 
    end
end)

QBCore.Functions.CreateCallback('ak4y-advancedFishing:addXP', function(source, cb, amount)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local citizenId = xPlayer.PlayerData.citizenid
    local deger = tonumber(amount)
    if Config.sql == "oxmysql" then  
        MySQL.update('UPDATE ak4y_fishing SET currentXP = currentXP + ? WHERE citizenid = ?', { deger, citizenId })
    elseif Config.sql == "ghmattimysql" then  
        exports.ghmattimysql:execute("UPDATE ak4y_fishing SET currentXP = currentXP + @currentXP WHERE citizenid = @citizenid", {
            ['@citizenid'] = citizenId,
            ['@currentXP'] = deger,
        })
    elseif Config.sql == "mysql-async" then 
        MySQL.Async.execute("UPDATE ak4y_fishing SET currentXP = currentXP + @currentXP WHERE citizenid = @citizenid", {
            ['@citizenid'] = citizenId,
            ['@currentXP'] = deger,
        })
    end
    cb(true)
end)


QBCore.Functions.CreateCallback('ak4y-advancedFishing:upgradeRod', function(source, cb, data)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local hedef = tonumber(data.hedef)
    local current = tonumber(data.hedef) - 1
    local currentItemName = nil
    local hedefItemName = nil
    local requiredCash = tonumber(data.price)
    local cashPara = xPlayer.PlayerData.money.cash

    for k, v in pairs(Config.fishingRods) do
        if v.level == current then 
            currentItemName = v.itemName
        elseif v.level == hedef then 
            hedefItemName = v.itemName
        end
    end

    if cashPara >= requiredCash then 
        if xPlayer and currentItemName ~= nil and hedefItemName ~= nil then  
            local items = xPlayer.Functions.GetItemByName(currentItemName)
            if items == nil then
                TriggerClientEvent("QBCore:Notify", src, Config.Language.youDontHaveItemUPGRADE, "error")
                cb(false)
            else
                if items.amount > 0 then 
                    xPlayer.Functions.RemoveMoney('cash', requiredCash)
                    xPlayer.Functions.RemoveItem(currentItemName, 1)
                    if math.random(1, 100) > Config.Settings.rodBrokeChanceWhenUpgrade then 
                        xPlayer.Functions.AddItem(hedefItemName, 1)
                        TriggerClientEvent("QBCore:Notify", src, Config.Language.upgradedRod, "success")
                    else
                        TriggerClientEvent("QBCore:Notify", src, Config.Language.brokenRod, "error")
                    end
                    cb(true)
                else
                    TriggerClientEvent("QBCore:Notify", src, Config.Language.youDontHave, "error")
                    cb(false)
                end
            end
        else
            cb(false)
        end
    else
        TriggerClientEvent("QBCore:Notify", src, Config.Language.youDontHaveMoney, "error")
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('ak4y-advancedFishing:buyItem', function(source, cb, data)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local buyItemId = tonumber(data.itemId)
    local buyItemCount = tonumber(data.itemCount)
    local currentItem = {}
    local cashPara = xPlayer.PlayerData.money.cash

    for k, v in pairs(Config.buyMarketItems) do
        if v.itemId == buyItemId then 
            currentItem.itemName = v.itemName
            currentItem.price = v.itemPrice
        end
    end
    
    local requiredCash = currentItem.price * buyItemCount

    if cashPara >= requiredCash then
        if xPlayer.Functions.AddItem(currentItem.itemName, buyItemCount) then 
            if xPlayer.Functions.RemoveMoney('cash', requiredCash) then 
                TriggerClientEvent("QBCore:Notify", src, Config.Language.succesBuy..": "..buyItemCount..'x - '.. currentItem.itemName..'!', "success")
                cb(true)
            else
                TriggerClientEvent("QBCore:Notify", src, Config.Language.youDontHaveMoney, "error")
                cb(false)
            end
        else
            TriggerClientEvent("QBCore:Notify", src, Config.Language.youDontHaveEnoughSpace, "error")
            cb(false)
        end
    else
        TriggerClientEvent("QBCore:Notify", src, Config.Language.youDontHaveMoney, "error")
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('ak4y-advancedFishing:sellItem', function(source, cb, data)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local sellItemId = tonumber(data.itemId)
    local sellItemCount = tonumber(data.itemCount)
    local currentItem = {}

    for k, v in pairs(Config.sellMenuItems) do
        if v.id == sellItemId then 
            currentItem.itemName = v.itemName
            currentItem.price = v.fishPrice
        end
    end
    
    local rewardsCash = currentItem.price * sellItemCount

    local currentAmount = xPlayer.Functions.GetItemByName(currentItem.itemName)
    if currentAmount ~= nil and currentAmount.amount >= sellItemCount then 
        xPlayer.Functions.RemoveItem(currentItem.itemName, sellItemCount)
        TriggerClientEvent("QBCore:Notify", src, Config.Language.succesSold.. ": "..sellItemCount..'x, '.. currentItem.itemName..' - $'..rewardsCash..'!', "success")
        xPlayer.Functions.AddMoney('cash', rewardsCash)
        cb(true)
    else
        TriggerClientEvent("QBCore:Notify", src, Config.Language.youDontHaveWantSell, "error")
        cb(false)
    end
end)


RegisterNetEvent('ak4y-advancedFishing:addItem')
AddEventHandler('ak4y-advancedFishing:addItem', function(item)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    xPlayer.Functions.AddItem(item, 1) 
end)


RegisterNetEvent('ak4y-advancedFishing:removeBait')
AddEventHandler('ak4y-advancedFishing:removeBait', function(item)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.RemoveItem(item, 1)
end)
