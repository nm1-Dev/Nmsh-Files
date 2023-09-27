QBCore = exports['qb-core']:GetCoreObject()
local UseBossMenu = false

-- Using Old QB Boss Menu
if GetResourceState('nmsh-management') ~= 'missing' then
    UseBossMenu = true
end

-- Main
local license_types = ""
for k, v in pairs(Config.Licenses) do
    license_types = license_types .. v.type .. '/'
    if k == #Config.Licenses then license_types = license_types:sub(1, #license_types - 1) end
end

-- Functions
local function GetOwnedCompanyByJob(job)
    local company = MySQL.query.await('SELECT * FROM player_companies WHERE job = ? LIMIT 1', { job })
    return company[1] ~= nil and company[1] or nil
end

local function GetOwnedCompaniesByPlayer(citizenid)
    return MySQL.query.await('SELECT * FROM player_companies WHERE citizenid = ?', { citizenid })
end

local function GetOwnedCompanies()
    return MySQL.query.await('SELECT * FROM player_companies')
end

local function GetOwnedCompanyEmployees(job)
    local employees = 0
    local players = MySQL.query.await('SELECT job FROM players')
    for _, v in pairs(players) do
        local playerJob = json.decode(v.job)
        if playerJob.name == job then
            employees += 1
        end
    end
    return employees
end

local function GetOwnerFirstNameLastName(citizenid)
    local info = MySQL.scalar.await('SELECT charinfo FROM players WHERE citizenid = ?', { citizenid })
    local owner = json.decode(info)
    return owner.firstname, owner.lastname
end

local function IsCompanyOwned(name)
    local company = MySQL.query.await('SELECT * FROM player_companies WHERE name = ? LIMIT 1', { name })
    return company[1] ~= nil and true or false
end

local function GetRegisteredCompany(citizenid)
    local company = MySQL.query.await('SELECT * FROM player_registered_companies WHERE citizenid = ? LIMIT 1', { citizenid })
    return company[1] ~= nil and company[1] or nil
end

local function GetRegisteredCompanyType(type)
    for _, v in pairs(Config.RegisterCompanyTypes) do
        if v.value == type then
            return v
        end
    end
end

local function GetLicenseType(type)
    for _, v in pairs(Config.Licenses) do
        if v.type == type then
            return v
        end
    end
end

local function CheckLicenseType(type)
    local result = false
    for _, v in pairs(Config.Licenses) do
        if v.type == type then
            result = true
        end
    end
    return result
end

local function IsJobAvailable(job)
    for _, v in pairs(Config.Jobs) do
        if v.name == job then
            local IsOwned = GetOwnedCompanyByJob(job)
            return IsOwned == nil and true or false
        end
    end
end

local function IsLicenseAllowed(license, licenses)
    if not license.verify then
        return true
    else
        return licenses[license.type]
    end
end

local function GetStashItems()
    local stashId = 'CityServices_PickupCounter'
    local result = MySQL.scalar.await('SELECT items FROM ' .. Config.StashTable ..' WHERE stash = ?', {stashId})
    if result then
		return json.decode(result)
    else
        return {}
    end
end

local function SaveStashItems(items)
    local stashId = 'CityServices_PickupCounter'
	local id = MySQL.scalar.await('SELECT id FROM ' .. Config.StashTable ..' WHERE stash = ?', {stashId})
	if id then
		MySQL.update('UPDATE ' .. Config.StashTable ..' SET items = ? WHERE id = ? AND stash = ?', {json.encode(items), id, stashId})
	else
		MySQL.insert('INSERT INTO ' .. Config.StashTable ..' (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE items = :items', { ['stash'] = stashId, ['items'] = json.encode(items) })
	end
end

local function AddSocietyMoney(amount)
    if UseBossMenu then
        TriggerEvent('nmsh-management:server:addAccountMoney', Config.SocietyAccount, amount)
    else
        exports['nmsh-banking']:addAccountMoney(Config.SocietyAccount, amount, "City Service")
    end
end

local function RemoveSocietyMoney(amount)
    if UseBossMenu then
        TriggerEvent('nmsh-management:server:removeAccountMoney', Config.SocietyAccount, amount)
    else
        exports['nmsh-banking']:removeAccountMoney(Config.SocietyAccount, amount, "City Service")
    end
end

-- Events
RegisterNetEvent('QBCore:Server:OnPlayerLoaded', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local licenses = Player.PlayerData.metadata["licences"]
    for k, v in pairs(Config.Licenses) do
        if not v.verify then
            licenses[v.type] = licenses[v.type] or true
        end
    end
    Player.Functions.SetMetaData("licences", licenses)
end)

RegisterNetEvent('nmsh-cityservices:server:GetLicense', function(type)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cash = Player.PlayerData.money['cash']
    local bank = Player.PlayerData.money['bank']
    local license = GetLicenseType(type)
    local licenses = Player.PlayerData.metadata["licences"]
    local allowed = IsLicenseAllowed(license, licenses)
    local info = Config.LicenseTemplates(license, Player.PlayerData)
    local item = QBCore.Shared.Items[license.item]
    local hasItem = Player.Functions.GetItemByName(license.item)
    
    if allowed then
        local stashItems = GetStashItems()
        local licenseItem = {
            name = item["name"],
            amount = 1,
            info = info,
            label = item["label"],
            description = item["description"] ~= nil and item["description"] or "",
            weight = item["weight"],
            type = item["type"],
            unique = item["unique"],
            useable = item["useable"],
            image = item["image"],
            slot = #stashItems + 1,
        }
        if license.limited and hasItem then
            TriggerClientEvent('QBCore:Notify', src, Lang:t('error.already_has_license'), 'error')
        else
            if cash >= license.price then
                table.insert(stashItems, licenseItem)
                SaveStashItems(stashItems)
                Player.Functions.RemoveMoney('cash', license.price)
                if Config.UseSocietyAccount then AddSocietyMoney(license.price) end
                TriggerClientEvent('QBCore:Notify', src, Lang:t('success.pickup_counter'), 'success')
            elseif bank >= license.price then
                table.insert(stashItems, licenseItem)
                SaveStashItems(stashItems)
                Player.Functions.RemoveMoney('bank', license.price)
                if Config.UseSocietyAccount then AddSocietyMoney(license.price) end
                TriggerClientEvent('QBCore:Notify', src, Lang:t('success.pickup_counter'), 'success')
            else
                TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_enough_money'), 'error')
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.license_not_allowed'), 'error')
    end
end)

RegisterNetEvent('nmsh-cityservices:server:ApplyJob', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local IsAvailable = IsJobAvailable(data.job)
    if IsAvailable then
        local jobInfo = QBCore.Shared.Jobs[data.job]
        Player.Functions.SetJob(data.job, 0)
        exports['nmsh-phone']:hireUser(data.job, Player.PlayerData.citizenid, 0)
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.job_hired', { job = jobInfo.label }), 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.job_not_available'), 'error')
    end
end)

RegisterNetEvent('nmsh-cityservices:server:RegisterCompany', function(name, type)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cash = Player.PlayerData.money['cash']
    local bank = Player.PlayerData.money['bank']
    if cash >= Config.RegisterCompanyPrice then
        Player.Functions.RemoveMoney('cash', Config.RegisterCompanyPrice)
        if Config.UseSocietyAccount then AddSocietyMoney(Config.RegisterCompanyPrice) end
        MySQL.insert('INSERT INTO player_registered_companies (`citizenid`, `name`, `type`, `balance`) VALUES (?, ?, ?, ?)', {Player.PlayerData.citizenid, name, type, 0})
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.registered_company', { name = name }), 'success')
    elseif bank >= Config.RegisterCompanyPrice then
        Player.Functions.RemoveMoney('bank', Config.RegisterCompanyPrice)
        if Config.UseSocietyAccount then AddSocietyMoney(Config.RegisterCompanyPrice) end
        MySQL.insert('INSERT INTO player_registered_companies (`citizenid`, `name`, `type`, `balance`) VALUES (?, ?, ?, ?)', {Player.PlayerData.citizenid, name, type, 0})
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.registered_company', { name = name }), 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_enough_money'), 'error')
    end
end)

RegisterNetEvent('nmsh-cityservices:server:PurchaseCompany', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cash = Player.PlayerData.money['cash']
    local bank = Player.PlayerData.money['bank']
    local company = Config.Companies[data.id]
    if company then
        if cash >= company.purchase_price then
            Player.Functions.RemoveMoney('cash', company.purchase_price)
            Player.Functions.SetJob(company.job, company.grade)
            if Config.UseSocietyAccount then AddSocietyMoney(company.purchase_price) end
            MySQL.insert('INSERT INTO player_companies (`citizenid`, `job`) VALUES (?, ?)', {Player.PlayerData.citizenid, company.job})
            TriggerClientEvent('QBCore:Notify', src, Lang:t('success.purchased_company', { name = company.name }), 'success')
        elseif bank >= company.purchase_price then
            Player.Functions.RemoveMoney('bank', company.purchase_price)
            Player.Functions.SetJob(company.job, company.grade)
            if Config.UseSocietyAccount then AddSocietyMoney(company.purchase_price) end
            MySQL.insert('INSERT INTO player_companies (`citizenid`, `job`) VALUES (?, ?)', {Player.PlayerData.citizenid, company.job})
            TriggerClientEvent('QBCore:Notify', src, Lang:t('success.purchased_company', { name = company.name }), 'success')
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_enough_money'), 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.purchased_company'), 'error')
    end
end)

RegisterNetEvent('nmsh-cityservices:server:SellCompany', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local company = Config.Companies[data.id]
    if company then
        MySQL.query('DELETE FROM player_companies WHERE citizenid = ? AND job = ?', { Player.PlayerData.citizenid, company.job })
        Player.Functions.SetJob('unemployed', 0)
        Player.Functions.AddMoney('cash', company.sell_price)
        if Config.UseSocietyAccount then RemoveSocietyMoney(company.sell_price) end
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.sell_company', { name = company.name }), 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.sell_company'), 'error')
    end
end)

RegisterNetEvent('nmsh-cityservices:server:DissolveCompany', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    MySQL.query('DELETE FROM player_registered_companies WHERE citizenid = ?', { Player.PlayerData.citizenid })
    TriggerClientEvent('QBCore:Notify', src, Lang:t('success.registered_company_dissolve', { name = data.name }), 'success')
end)

RegisterNetEvent('nmsh-cityservices:server:ChangeCompanyName', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cash = Player.PlayerData.money['cash']
    local bank = Player.PlayerData.money['bank']
    if cash >= Config.RegisterCompanyNameChange then
        Player.Functions.RemoveMoney('cash', Config.RegisterCompanyNameChange)
        if Config.UseSocietyAccount then AddSocietyMoney(Config.RegisterCompanyNameChange) end
        MySQL.update('UPDATE player_registered_companies SET name = ? WHERE citizenid = ?', { data.name, Player.PlayerData.citizenid })
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.registered_company_name_changed', { name = data.name }), 'success')
    elseif bank >= Config.RegisterCompanyNameChange then
        Player.Functions.RemoveMoney('bank', Config.RegisterCompanyNameChange)
        if Config.UseSocietyAccount then AddSocietyMoney(Config.RegisterCompanyNameChange) end
        MySQL.update('UPDATE player_registered_companies SET name = ? WHERE citizenid = ?', { data.name, Player.PlayerData.citizenid })
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.registered_company_name_changed', { name = data.name }), 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_enough_money'), 'error')
    end
end)

RegisterNetEvent('nmsh-cityservices:server:ChangeCompanyType', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cash = Player.PlayerData.money['cash']
    local bank = Player.PlayerData.money['bank']
    local companyType = GetRegisteredCompanyType(data.type)
    if cash >= companyType.price then
        Player.Functions.RemoveMoney('cash', companyType.price)
        if Config.UseSocietyAccount then AddSocietyMoney(companyType.price) end
        MySQL.update('UPDATE player_registered_companies SET type = ? WHERE citizenid = ?', { data.type, Player.PlayerData.citizenid })
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.registered_company_type_changed', { type = companyType.text }), 'success')
    elseif bank >= companyType.price then
        Player.Functions.RemoveMoney('bank', companyType.price)
        if Config.UseSocietyAccount then AddSocietyMoney(companyType.price) end
        MySQL.update('UPDATE player_registered_companies SET type = ? WHERE citizenid = ?', { data.type, Player.PlayerData.citizenid })
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.registered_company_type_changed', { type = companyType.text }), 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_enough_money'), 'error')
    end
end)

RegisterNetEvent('nmsh-cityservices:server:InvestCompany', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cash = Player.PlayerData.money['cash']
    local bank = Player.PlayerData.money['bank']

    if cash >= data.amount then
        Player.Functions.RemoveMoney('cash', data.amount)
        if Config.UseSocietyAccount then AddSocietyMoney(data.amount) end
        MySQL.update('UPDATE player_registered_companies SET balance = balance + ? WHERE citizenid = ?', {data.amount, Player.PlayerData.citizenid})
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.registered_company_invest', { amount = data.amount }), 'success')
    elseif bank >= amount then
        Player.Functions.RemoveMoney('bank', data.amount)
        if Config.UseSocietyAccount then AddSocietyMoney(data.amount) end
        MySQL.update('UPDATE player_registered_companies SET balance = balance + ? WHERE citizenid = ?', {data.amount, Player.PlayerData.citizenid})
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.registered_company_invest', { amount = data.amount }), 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.not_enough_money'), 'error')
    end
end)

-- Callbacks
QBCore.Functions.CreateCallback("nmsh-cityservices:server:GetRegisteredCompany", function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    cb(GetRegisteredCompany(Player.PlayerData.citizenid))
end)

QBCore.Functions.CreateCallback("nmsh-cityservices:server:GetOwnedCompanies", function(source, cb)
    local companies = GetOwnedCompanies()
    for k, v in pairs(companies) do
        companies[k].firstname, companies[k].lastname = GetOwnerFirstNameLastName(v.citizenid)
        companies[k].employees = GetOwnedCompanyEmployees(v.job)
    end
    cb(companies)
end)

QBCore.Functions.CreateCallback("nmsh-cityservices:server:GetPlayerOwnedCompanies", function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    cb(GetOwnedCompaniesByPlayer(Player.PlayerData.citizenid))
end)

QBCore.Functions.CreateCallback("nmsh-cityservices:server:HasBusinessLicense", function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local licenseTable = Player.PlayerData.metadata["licences"]
    cb(licenseTable['business'])
end)

-- Commands
QBCore.Commands.Add("givelicense", Lang:t("commands.license_give"), {{name = "id", help = Lang:t('info.player_id')}, {name = "license", help = Lang:t('info.license_type', {types = license_types})}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.LicensesAssignJob and Player.PlayerData.job.grade.level >= Config.LicensesAssignRank then
        if CheckLicenseType(args[2]) then
            local TargetPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
            if not TargetPlayer then return end
            local licenseTable = TargetPlayer.PlayerData.metadata["licences"]
            if licenseTable[args[2]] then
                TriggerClientEvent('QBCore:Notify', src, Lang:t("error.license_already"), "error")
                return
            end
            licenseTable[args[2]] = true
            TargetPlayer.Functions.SetMetaData("licences", licenseTable)
            TriggerClientEvent('QBCore:Notify', TargetPlayer.PlayerData.source, Lang:t("success.given_license"), "success")
            TriggerClientEvent('QBCore:Notify', src, Lang:t("success.give_license"), "success")
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("error.license_type"), "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.rank_license"), "error")
    end
end)

QBCore.Commands.Add("removelicense", Lang:t("commands.license_remove"), {{name = "id", help = Lang:t('info.player_id')}, {name = "license", help = Lang:t('info.license_type', {types = license_types})}}, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.LicensesAssignJob and Player.PlayerData.job.grade.level >= Config.LicensesAssignRank then
        if CheckLicenseType(args[2]) then
            local TargetPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
            if not TargetPlayer then return end
            local licenseTable = TargetPlayer.PlayerData.metadata["licences"]
            if not licenseTable[args[2]] then
                TriggerClientEvent('QBCore:Notify', src, Lang:t("error.license_not"), "error")
                return
            end
            licenseTable[args[2]] = false
            TargetPlayer.Functions.SetMetaData("licences", licenseTable)
            TriggerClientEvent('QBCore:Notify', TargetPlayer.PlayerData.source, Lang:t("error.removed_license"), "error")
            TriggerClientEvent('QBCore:Notify', src, Lang:t("success.remove_license"), "success")
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("error.license_type"), "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.rank_remove"), "error")
    end
end)

-- Exports
exports('GetOwnedCompanyByJob', function(job)
    return GetOwnedCompanyByJob(job)
end)

exports('GetOwnedCompaniesByPlayer', function(citizenid)
    return GetOwnedCompaniesByPlayer(citizenid)
end)

exports('GetOwnedCompanies', function()
    return GetOwnedCompanies()
end)

exports('GetOwnedCompanyEmployees', function(job)
    return GetOwnedCompanyEmployees(job)
end)

exports('IsCompanyOwned', function(name)
    return IsCompanyOwned(name)
end)

exports('GetRegisteredCompany', function(citizenid)
    return GetRegisteredCompany(citizenid)
end)

exports('GetRegisteredCompanyType', function(type)
    return GetRegisteredCompanyType(type)
end)