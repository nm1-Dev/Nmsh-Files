function zf.getPlayerData()
    if zf.core == 'qb-core' then
        return Core.Functions.GetPlayerData()
    elseif zf.core == 'esx' then
        return Core.GetPlayerData()
    end
end

function zf.getPlayerJob()
    local job = {}
    local playerData = zf.getPlayerData()
    
    if zf.core == 'qb-core' then
        job = {
            name = playerData.job.name,
            label = playerData.job.label,
            grade_name = playerData.job.grade,
            grade_label = playerData.job.grade.name,
            grade_salary = playerData.job.payment,
            isboss = playerData.job.isboss,
            onduty = playerData.job.onduty
        }
    elseif zf.core == 'esx' then
        job = {
            name = playerData.job.name,
            label = playerData.job.label,
            grade_name = playerData.job.grade_name,
            grade_label = playerData.job.grade_label,
            grade_salary = playerData.job.grade_salary,
            isboss = playerData.job.grade_name == 'boss' or false,
            onduty = true
        }
    end
    return job
end

function zf.getPlayerGang()
    local gang = {}
    local playerData = zf.getPlayerData()
    
    if zf.core == 'qb-core' then
        gang = {
            name = playerData.gang.name,
            label = playerData.gang.label,
            grade_name = playerData.gang.grade.level,
            grade_label = playerData.gang.grade.name,
            isboss = playerData.gang.isboss,
        }
    elseif zf.core == 'esx' then
        gang = {
            name = playerData.job.name,
            label = playerData.job.label,
            grade_name = playerData.job.grade_name,
            grade_label = playerData.job.grade_label,
            isboss = playerData.job.grade_name == 'boss' or false,
        }
    end
    return gang
end

function zf.getPlayerMoney(type)
    local playerData = zf.getPlayerData()
    if zf.core == 'qb-core' then
        local types = { ['cash'] = 'cash', ['bank'] = 'bank', ['black'] = false }

        if types[type] then
            return playerData.money[types[type]]
        end
        return false
    elseif zf.core == 'esx' then
        local types = { ['cash'] = 'money', ['bank'] = 'bank', ['black'] = 'black_money' }

        if types[type] then
            return playerData.accounts[types[type]]
        end
        return false
    end
end

function zf.getPlayerName()
    local playerData = zf.getPlayerData()
    if zf.core == 'qb-core' then
        return playerData.charinfo.firstname .. ' ' .. playerData.charinfo.lastname
    elseif zf.core == 'esx' then
        return playerData.name
    end
end