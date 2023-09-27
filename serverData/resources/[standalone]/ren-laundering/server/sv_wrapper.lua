core = nil

CreateThread(function()
    SetupCoreObject()
    RegisterCallBacks()
end)

SetupCoreObject = function()
    if Core.Core == 'qb-core' then 
        core = exports['qb-core']:GetCoreObject()
    elseif Core.Core == 'esx' then 
        core = exports['es_extended']:getSharedObject()
    end
end

RegisterCallBacks = function()
    if Core.Core == 'qb-core' then 
        core.Functions.CreateCallback('ren-laundering:get:back:money', function(source, cb, dealer)
            cb(BlackMoneyAmount(source, dealer))
        end)
    elseif Core.Core == 'esx' then 
        core.RegisterServerCallback('ren-laundering:get:back:money', function(source, cb, dealer)
            cb(BlackMoneyAmount(source, dealer))
        end)
    end
end

GetPlayer = function(src)
    if Core.Core == 'qb-core' then 
        return core.Functions.GetPlayer(src)
    elseif Core.Core == 'esx' then 
        return core.GetPlayerFromId(src)
    end
end

RemoveMoney = function(src, account, amount)
    local pData = GetPlayer(source)
    if Core.Core == 'qb-core' then 
        pData.Functions.RemoveMoney(account, amount)
    elseif Core.Core == 'esx' then 
        pData.removeAccountMoney(account, amount)
    end
end

AddMoney = function(src, account, amount)
    local pData = GetPlayer(src)
    if Core.Core == 'qb-core' then 
        pData.Functions.AddMoney(account, amount)
    elseif Core.Core == 'esx' then 
        pData.addAccountMoney(account, amount)
    end
end

GetMoney = function(src, account)
    local pData = GetPlayer(src)
    if Core.Core == 'qb-core' then      
        return pData.PlayerData.money[account]
    elseif Core.Core == 'esx' then 
        return pData.getAccount(account).money
    end
end