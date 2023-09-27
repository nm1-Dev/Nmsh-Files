QBCore = exports['qb-core']:GetCoreObject()

-- Command for item creation
QBCore.Commands.Add('createItem', '', {}, false, function(source, args)
    local src = source
    TriggerClientEvent('nmsh-itemcreator:client:openItemMenu', src, src)
end,'admin')

-- Command for job creation
QBCore.Commands.Add('createJob', '', {}, false, function(source, args)
    local src = source
    TriggerClientEvent('nmsh-jobcreator:client:openJobMenu', src, src)
end,'admin')

-- Validate item input
local function validateItem(item)
    for i = 1, 6 do 
        if not item[i] or item[i] == "" then
            return false
        end
    end
    return true
end

-- Save item to file
local function saveItemToFile(item)
    local resourcePath = GetResourcePath(GetCurrentResourceName())
    local filePath = resourcePath .. "/items.txt"
    local file = io.open(filePath, "a") 

    if file then
        file:write(string.format(
            "['%s'] = {['name'] = '%s', ['label'] = '%s', ['weight'] = %d, ['type'] = '%s', ['image'] = '%s', ['unique'] = %s, ['useable'] = %s, ['shouldClose'] = %s, ['combinable'] = %s, ['description'] = '%s'},\n",
            item[1], item[2], item[3], item[4], item[5], item[6], tostring(item[7]), tostring(item[8]), tostring(item[9]), item[10] or 'nil', item[11]
        ))
        file:close()
    else
        print("Error: Failed to open items.txt for writing.")
    end
end

RegisterServerEvent('nmsh-itemcreator:server:saveItem', function(item)
    if validateItem(item) then
        saveItemToFile(item)
        print("Item registered and saved to items.txt!")
    else
        print("Item validation failed.")
    end
end)

local function validateJob(job)
    return job.code and job.label and job.type
end

-- Save job to file
local function saveJobToFile(job)
    local resourcePath = GetResourcePath(GetCurrentResourceName())
    local filePath = resourcePath .. "/jobs.txt"
    local file = io.open(filePath, "a")

    if file then
        -- Get grade keys and sort them
        local gradeKeys = {}
        for grade, _ in pairs(job.grades) do
            table.insert(gradeKeys, tonumber(grade)) 
        end
        table.sort(gradeKeys)

        local gradeStrings = {}
        for _, grade in ipairs(gradeKeys) do
            local details = job.grades[tostring(grade)] 
            local bossString = details.isboss and ", isboss = true" or ""
            table.insert(gradeStrings, string.format("\t\t['%s'] = {\n\t\t\tname = '%s'%s,\n\t\t\tpayment = %d\n\t\t},",
                tostring(grade), details.name, bossString, details.payment))
        end
        local grades = table.concat(gradeStrings, "\n")

        file:write(string.format(
            "\t['%s'] = {\n\t\tlabel = '%s',\n\t\ttype = '%s',\n\t\tdefaultDuty = %s,\n\t\toffDutyPay = %s,\n\t\tgrades = {\n%s\n\t\t},\n\t},\n",
            job.code, job.label, job.type, tostring(job.defaultDuty), tostring(job.offDutyPay), grades
        ))
        file:close()
    else
        print("Error: Failed to open jobs.txt for writing.")
    end
end

RegisterServerEvent('nmsh-jobcreator:server:saveJob', function(job)
    if validateJob(job) then
        saveJobToFile(job)
        print("Job registered and saved to jobs.txt!")
    else
        print("Job validation failed.")
    end
end)