function zf.getPlayer(source)
    if zf.core == 'qb-core' then
        return Core.Functions.GetPlayer(source)
    elseif zf.core == 'esx' then
        return Core.GetPlayerFromId(source)
    end
end

function zf.getPlayers()
    if zf.core == 'qb-core' then
        return Core.Functions.GetQBPlayers()
    elseif zf.core == 'esx' then
        return Core.GetPlayers()
    end
end

-- Money
function zf.addMoney(source, moneyType, amount, reason)
    if not reason then reason = 'unknown' end
    local Player = zf.getPlayer(source)
    local addedMoney = false
    local types = {
        ['cash'] = {
            ['qb-core'] = 'cash',
            ['esx'] = 'money'
        },
        ['bank'] = {
            ['qb-core'] = 'bank',
            ['esx'] = 'bank'
        }
    }

    if zf.core == 'qb-core' then
        moneyType = types[moneyType]['qb-core']
        addedMoney = Player.Functions.AddMoney(moneyType, amount, reason)
    elseif zf.core == 'esx' then
        moneyType = types[moneyType]['esx']
        local currentMoney = Player.getAccount(moneyType)
        Player.addAccountMoney(moneyType, amount, reason)
        if currentMoney + amount == Player.getAccount(moneyType) then
            addedMoney = true
        else
            addedMoney = false
        end
    end
    return addedMoney
end

function zf.removeMoney(source, moneyType, amount, reason)
    if not reason then reason = 'unknown' end
    local Player = zf.getPlayer(source)
    local removedMoney = false
    local types = {
        ['cash'] = {
            ['qb-core'] = 'cash',
            ['esx'] = 'money'
        },
        ['bank'] = {
            ['qb-core'] = 'bank',
            ['esx'] = 'bank'
        }
    }

    if zf.core == 'qb-core' then
        moneyType = types[moneyType]['qb-core']
        removedMoney = Player.Functions.RemoveMoney(moneyType, amount, reason)
    elseif zf.core == 'esx' then
        moneyType = types[moneyType]['esx']
        local currentMoney = Player.getAccount(moneyType)
        Player.removeAccountMoney(moneyType, amount, reason)
        if currentMoney - amount == currentMoney then
            removedMoney = false
        else
            removedMoney = true
        end
    end
    return removedMoney
end

function zf.getMoney(source, moneyType)
    local Player = zf.getPlayer(source)
    local types = {
        ['cash'] = {
            ['qb-core'] = 'cash',
            ['esx'] = 'money'
        },
        ['bank'] = {
            ['qb-core'] = 'bank',
            ['esx'] = 'bank'
        }
    }

    if zf.core == 'qb-core' then
        moneyType = types[moneyType]['qb-core']
        return Player.Functions.GetMoney(moneyType)
    elseif zf.core == 'esx' then
        moneyType = types[moneyType]['esx']
        return Player.getAccount(moneyType)
    end
    return false
end

function zf.setMoney(source, moneyType, amount)
    if not reason then reason = 'unknown' end
    local Player = zf.getPlayer(source)
    local types = {
        ['cash'] = {
            ['qb-core'] = 'cash',
            ['esx'] = 'money'
        },
        ['bank'] = {
            ['qb-core'] = 'bank',
            ['esx'] = 'bank'
        }
    }

    if zf.core == 'qb-core' then
        moneyType = types[moneyType]['qb-core']
        Player.Functions.SetMoney(moneyType, amount, reason)
    elseif zf.core == 'esx' then
        moneyType = types[moneyType]['esx']
        Player.setAccountMoney(moneyType, amount, reason)
    end
end