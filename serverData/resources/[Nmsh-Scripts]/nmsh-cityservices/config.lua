Config = Config or {}
Config.Debug = false

-- Stash Database Table
-- stashitems   =   nmsh-inventory / lj-inventory / aj-inventory
-- qs_stash     =   qs-inventory
Config.StashTable = 'stashitems'

-- https://shmann.gumroad.com/l/DxDKJ
Config.UseShmannWorks = false

-- Target Locations (Default: Gabz Townhall https://fivem.gabzv.com/package/5127312)
Config.Locations = {
    ['blip'] = {
        label = 'City Services',
        showBlip = true,
        sprite = 487,
        scale = 0.8,
        colour = 0,
        coords = vector3(-1290.76, -571.25, 30.57)
    },
    ['citizens'] = {
        length = 0.5,
        width = 1,
        heading = 75,
        minZ = 38.13,
        maxZ = 39.23,
        coords = vector3(-1291.07, -571.67, 30.57)
    },
    ['counter'] = {
        length = 1,
        width = 0.5,
        heading = 350,
        minZ = 38.13,
        maxZ = 39.23,
        coords = vector3(-1290.79, -576.05, 30.53)
    },
    ['companies'] = {
        length = 0.5,
        width = 1.0,
        heading = 345,
        minZ = 38.13,
        maxZ = 39.23,
        coords = vector3(-1289.16, -573.92, 30.57)
    }
}

-- Use Society Account For Payments Made Thru City Services
Config.UseSocietyAccount = false
Config.SocietyAccount = 'government'

-- Job & Rank Required To Assign business/lawyer license
Config.LicensesAssignJob = 'judge'
Config.LicensesAssignRank = 0

-- Licenses Available In City Services
Config.Licenses = {
    { label = "Request ID",               icon = "fas fa-id-card",       item = "id_card",         price = 50,
                                                                                                                   type =
        "id",                                                                                                                    verify = false,
                                                                                                                                                     limited = true },
    { label = "Request Driver's License", icon = "fas fa-car",           item = "driver_license",  price = 50,
                                                                                                                   type =
        "driver",                                                                                                                verify = false,
                                                                                                                                                     limited = true },
    { label = "Request Lawyer License",   icon = "fas fa-balance-scale", item = "lawyerpass",      price = 50,
                                                                                                                   type =
        "lawyer",                                                                                                                verify = true,
                                                                                                                                                     limited = true },
    { label = "Request Hunting License",  icon = "fas fa-balance-scale", item = "huntinglicense",  price = 50,
                                                                                                                   type =
        "hunting",                                                                                                               verify = true,
                                                                                                                                                     limited = true },
    { label = "Request Weapon License",   icon = "fas fa-shield-alt",    item = "weaponlicense",   price = 50,
                                                                                                                   type =
        "weapon",                                                                                                                verify = true,
                                                                                                                                                     limited = true },
    { label = "Request Fishing License",  icon = "fas fa-shield-alt",    item = "fishing_license", price = 50,
                                                                                                                   type =
        "fishing",                                                                                                               verify = true,
                                                                                                                                                     limited = true },
}

-- License Templates (Add Custom License Templates Here)
Config.LicenseTemplates = function(license, player)
    local info = {}

    -- ID License Template
    if license.type == "id" then
        info.citizenid = player.citizenid
        info.firstname = player.charinfo.firstname
        info.lastname = player.charinfo.lastname
        info.birthdate = player.charinfo.birthdate
        info.gender = player.charinfo.gender
        info.nationality = player.charinfo.nationality

        -- Driver License Template
    elseif license.type == "driver" then
        info.firstname = player.charinfo.firstname
        info.lastname = player.charinfo.lastname
        info.birthdate = player.charinfo.birthdate
        info.type = "Class C Driver License"

        -- Weapon License Template
    elseif license.type == "weapon" then
        info.firstname = player.charinfo.firstname
        info.lastname = player.charinfo.lastname
        info.birthdate = player.charinfo.birthdate

        -- Hunting License Template
    elseif license.type == "hunting" then
        info.firstname = player.charinfo.firstname
        info.lastname = player.charinfo.lastname
        info.birthdate = player.charinfo.birthdate

        -- Fishing License Template
    elseif license.type == "hunting" then
        info.firstname = player.charinfo.firstname
        info.lastname = player.charinfo.lastname
        info.birthdate = player.charinfo.birthdate

        -- Lawyer License Template
    elseif license.type == "lawyer" then
        info.id = '#' .. tostring(nmsh.Shared.RandomInt(2) .. nmsh.Shared.RandomInt(3) .. nmsh.Shared.RandomInt(1))
        info.firstname = player.charinfo.firstname
        info.lastname = player.charinfo.lastname
        info.citizenid = player.citizenid

        -- Default Licenses Template
    else
        info.firstname = player.charinfo.firstname
        info.lastname = player.charinfo.lastname
    end

    return info
end

-- Registered Companies
Config.RegisterCompanyEnabled = true
Config.RegisterCompanyPrice = 25000
Config.RegisterCompanyNameChange = 1500
Config.RegisterCompanyNameMin = 5
Config.RegisterCompanyNameMax = 25
Config.RegisterCompanyTypes = {
    { value = "none",       text = "None",                price = 0 },
    { value = "restaurant", text = "Restaurant Business", price = 10000 },
}

-- Enable Player Owned Companies
Config.CompanyEnabled = true

-- Limit 1 Player Owned Company Per Player
Config.CompanyLimited = true

-- Require Business License To Purchase Player Owned Company
Config.CompanyRequiresBusinessLicense = true

-- Player Owned Companies
Config.Companies = {
    -- { name = 'Benny\'s Original Motorworks', image = 'bennys.png', description = Lang:t('company.bennys'), purchase_price = 15000, sell_price = 3000, job = 'mechanic', grade = 4 },
    -- { name = 'Premium Deluxe Motorsport', image = 'pdm.png', description = Lang:t('company.pdm'), purchase_price = 20000, sell_price = 5000, job = 'cardealer', grade = 4 }
    -- {name = 'Aoki Restaurant', image = 'aoki.png', description = Lang:t('aoki'), purchase_price = 2000000, sell_price = 30000, job = 'aoki', grade = 4}
}

-- Available Jobs
Config.Jobs = {
    { name = 'taxi',     icon = 'fa-solid fa-taxi',        image = 'taxi.png',     description = Lang:t('job.taxi') },
    { name = 'bus',      icon = 'fa-solid fa-bus',         image = 'bus.png',      description = Lang:t('job.bus') },
    { name = 'reporter', icon = 'fa-solid fa-newspaper',   image = 'reporter.png', description = Lang:t('job.reporter') },
    { name = 'trucker',  icon = 'fa-solid fa-truck',       image = 'trucker.png',  description = Lang:t('job.trucker') },
    { name = 'tow',      icon = 'fa-solid fa-truck-fast',  image = 'tow.png',      description = Lang:t('job.tow') },
    { name = 'garbage',  icon = 'fa-solid fa-trash',       image = 'garbage.png',  description = Lang:t('job.garbage') },
    { name = 'vineyard', icon = 'fa-solid fa-wine-bottle', image = 'vineyard.png', description = Lang:t('job.vineyard') },
    { name = 'hotdog',   icon = 'fa-solid fa-hotdog',      image = 'hotdog.png',   description = Lang:t('job.hotdog') },
}
