local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}

-- Functions
local function IsCompanyOwned(job, companies)
    local company = nil
    for k, v in pairs(companies) do
        if v.job == job then
            company = v
        end
    end
    return company
end

local function GetRegisteredCompanyType(type)
    for _, v in pairs(Config.RegisterCompanyTypes) do
        if v.value == type then
            return v
        end
    end
end

local function GetPlayerOwnedCompanies()
    local p = promise.new()
    QBCore.Functions.TriggerCallback('nmsh-cityservices:server:GetPlayerOwnedCompanies', function(result)
        p:resolve(result)
    end)
    return Citizen.Await(p)
end

local function CheckPlayerHasBusinessLicense()
    local p = promise.new()
    QBCore.Functions.TriggerCallback('nmsh-cityservices:server:HasBusinessLicense', function(result)
        p:resolve(result)
    end)
    return Citizen.Await(p)
end

-- MainThread
CreateThread(function()

    -- Blip
    local BlipCoords
    local Blip = Config.Locations['blip']
    if Blip.showBlip then
        if Config.UseShmannWorks then
            BlipCoords = vector3(-552.26, -192.3, 38.47)
        else
            BlipCoords = Config.Locations['blip'].coords
        end
        CityServiceBlip = AddBlipForCoord(BlipCoords)
        SetBlipSprite(CityServiceBlip, Blip.sprite)
        SetBlipDisplay(CityServiceBlip, 4)
        SetBlipScale(CityServiceBlip, Blip.scale)
        SetBlipAsShortRange(CityServiceBlip, true)
        SetBlipColour(CityServiceBlip, Blip.Colour)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(Blip.label)
        EndTextCommandSetBlipName(CityServiceBlip)
    end

    -- Citizen Target Options
    local cityservices = {}
    for k, v in pairs(Config.Licenses) do
        cityservices[#cityservices+1] = {
            action = function(entity)
                TriggerServerEvent('nmsh-cityservices:server:GetLicense', v.type)
            end,
            icon = v.icon,
            label = v.label,
        }
    end
    cityservices[#cityservices+1] = {
        type = 'client',
        event = 'nmsh-cityservices:client:Jobs',
        icon = 'fas fa-user-clock',
        label = Lang:t('target.job'),
    }

    -- Citizen Target
    if Config.UseShmannWorks then
        exports['nmsh-target']:AddBoxZone('cityservices_citizen', vector3(-554.08, -185.25, 38.22), 1, 1, {
            name = 'cityservices_citizen',
            heading = 320,
            debugPoly = Config.Debug,
            minZ = 38.0,
            maxZ = 39.0,
            }, {
                options = cityservices,
                distance = 2.5
            }
        )
        exports['nmsh-target']:AddBoxZone('cityservices_counter', vector3(-555.3, -186.25, 38.22), 1, 1, {
            name = 'cityservices_counter',
            heading = 30,
            debugPoly = false,
            minZ = 38.0,
            maxZ = 39.0,
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'nmsh-cityservices:client:Counter',
                        icon = 'fas fa-hand-holding',
                        label = Lang:t('target.counter'),
                    },
                },
            distance = 2.5
        })
    else
        local cityservices_citizen = Config.Locations['citizens']
        local cityservices_counter = Config.Locations['counter']
        exports['nmsh-target']:AddBoxZone('cityservices_citizen', cityservices_citizen.coords, cityservices_citizen.length, cityservices_citizen.width, {
            name = 'cityservices_citizen',
            heading = cityservices_citizen.heading,
            debugPoly = Config.Debug,
            minZ = cityservices_citizen.minZ,
            maxZ = cityservices_citizen.maxZ,
            }, {
                options = cityservices,
                distance = 2.5
            }
        )

        exports['nmsh-target']:AddBoxZone('cityservices_counter', cityservices_counter.coords, cityservices_counter.length, cityservices_counter.width, {
            name = 'cityservices_counter',
            heading = cityservices_counter.heading,
            debugPoly = Config.Debug,
            minZ = cityservices_counter.minZ,
            maxZ = cityservices_counter.maxZ
            }, {
                options = {
                    {
                        type = 'client',
                        event = 'nmsh-cityservices:client:Counter',
                        icon = 'fas fa-hand-holding',
                        label = Lang:t('target.counter'),
                    },
                },
            distance = 2.5
        })
    end

    -- Company Target Options
    local companies = {}
    if Config.RegisterCompanyEnabled then
        companies[#companies+1] = {
            type = 'client',
            event = 'nmsh-cityservices:client:RegisteredCompany',
            icon = 'fas fa-copyright',
            label = Lang:t('target.registered_company'),
        }
    end
    if Config.CompanyEnabled then
        companies[#companies+1] = {
            type = 'client',
            event = 'nmsh-cityservices:client:OwnedCompanies',
            icon = 'fas fa-building',
            label = Lang:t('target.owned_companies'),
        }
    end

    -- Company Target
    if Config.UseShmannWorks then
        exports['nmsh-target']:AddBoxZone('cityservices_company', vector3(-557.11, -186.97, 38.22), 1, 1, {
            name = 'cityservices_company',
            heading = 15,
            debugPoly = Config.Debug,
            minZ = 38.0,
            maxZ = 39.0,
            }, {
                options = companies,
                distance = 2.5
            }
        )
    else
        local cityservices_company = Config.Locations['companies']
        exports['nmsh-target']:AddBoxZone('cityservices_company', cityservices_company.coords, cityservices_company.length, cityservices_company.width, {
            name = 'cityservices_company',
            heading = cityservices_company.heading,
            debugPoly = Config.Debug,
            minZ = cityservices_company.minZ,
            maxZ = cityservices_company.maxZ,
            }, {
                options = companies,
                distance = 2.5
            }
        )
    end
end)

-- Events
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('nmsh-cityservices:client:Jobs',function()
    QBCore.Functions.TriggerCallback('nmsh-cityservices:server:GetOwnedCompanies', function(companies)
        local jobsMenu = {
            {
                header = Lang:t('menu.job_header'),
                txt = Lang:t('menu.job_text'),
                icon = 'fa-solid fa-briefcase',
                isMenuHeader = true
            }
        }

        local OwnedCompanies = {}
        if next(companies) then
            for k, v in pairs(companies) do
                OwnedCompanies[v.job] = true
            end
        end

        for k, v in pairs(Config.Jobs) do
            if not OwnedCompanies[v.name] then
                jobsMenu[#jobsMenu+1] = {
                    header = QBCore.Shared.Jobs[v.name].label,
                    icon = v.icon,
                    params = {
                        event = 'nmsh-cityservices:client:ViewJob',
                        args = {
                            job = v
                        }
                    }
                }
            end
        end

        jobsMenu[#jobsMenu+1] = {
            header = Lang:t('menu.close'),
            icon = 'fa-solid fa-angle-left',
            params = {
                event = 'nmsh-menu:closeMenu',
            }
        }

        exports['nmsh-menu']:openMenu(jobsMenu)
    end)
end)

RegisterNetEvent('nmsh-cityservices:client:ViewJob',function(data)
    local jobMenu = {}
    if data.job.image ~= nil then
        jobMenu[#jobMenu+1] = {
            isMenuHeader = true,
            header = '<img src=nui://nmsh-cityservices/images/'..data.job.image..' width=100% onerror="this.onerror=null; this.remove();"> <img src='..data.job.image..' onerror="this.onerror=null; this.remove();" width=100%>',
        }
    else
        jobMenu[#jobMenu+1] = {
            isMenuHeader = true,
            header = QBCore.Shared.Jobs[data.job.name].label
        }
    end

    jobMenu[#jobMenu+1] = {
        isMenuHeader = true,
        header = '',
        txt = '<br>'..data.job.description ..'<br><br>',
    }

    jobMenu[#jobMenu+1] = {
        isMenuHeader = true,
        header = Lang:t('menu.job_pay_per_hour'),
        txt = Lang:t('menu.currency', { amount = QBCore.Shared.Round(((60 / QBCore.Config.Money.PayCheckTimeOut) * QBCore.Shared.Jobs[data.job.name].grades['0'].payment), 1) })
    }

    jobMenu[#jobMenu+1] = {
        header = Lang:t('menu.apply'),
        icon = 'fa-solid fa-clipboard-check',
        params = {
            event = 'nmsh-cityservices:client:ApplyJob',
            args = {
                job = data.job.name
            }
        }
    }

    jobMenu[#jobMenu+1] = {
        header = Lang:t('menu.back'),
        icon = 'fa-solid fa-angle-left',
        params = {
            event = 'nmsh-cityservices:client:Jobs'
        }
    }

    exports['nmsh-menu']:openMenu(jobMenu)
end)

RegisterNetEvent('nmsh-cityservices:client:ApplyJob',function(data)
    exports['nmsh-menu']:openMenu({
        {
            isMenuHeader = true,
            header = Lang:t('menu.job_apply_header'),
            txt = '<br>'..Lang:t('menu.job_apply_text')..'<br><br>'
        },
        {
            header = Lang:t('menu.apply'),
            icon = 'fa-solid fa-clipboard-check',
            params = {
                isServer = true,
                event = 'nmsh-cityservices:server:ApplyJob',
                args = {
                    job = data.job
                }
            }
        },
        {
            header = Lang:t('menu.back'),
            icon = 'fa-solid fa-angle-left',
            params = {
                event = 'nmsh-cityservices:client:Jobs'
            }
        }
    })
end)

RegisterNetEvent('nmsh-cityservices:client:Counter',function()
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'CityServices_PickupCounter')
    TriggerEvent('inventory:client:SetCurrentStash', 'CityServices_PickupCounter')
end)

RegisterNetEvent('nmsh-cityservices:client:RegisteredCompany',function()
    local registeredCompanyMenu = {}
    QBCore.Functions.TriggerCallback('nmsh-cityservices:server:GetRegisteredCompany', function(company)
        if company then
            local companyType = GetRegisteredCompanyType(company.type)
            registeredCompanyMenu[#registeredCompanyMenu+1] = {
                isMenuHeader = true,
                icon = 'fa-solid fa-signature',
                header = company.name,
            }

            registeredCompanyMenu[#registeredCompanyMenu+1] = {
                isMenuHeader = true,
                header = Lang:t('menu.company_type'),
                txt =  companyType.text
            }

            registeredCompanyMenu[#registeredCompanyMenu+1] = {
                isMenuHeader = true,
                header = Lang:t('menu.company_value'),
                txt =  Lang:t('menu.currency', { amount = company.balance })
            }

             
            registeredCompanyMenu[#registeredCompanyMenu+1] = {
                header = Lang:t('menu.invest'),
                icon = 'fa-solid fa-sack-dollar',
                params = {
                    event = 'nmsh-cityservices:client:InvestCompany',
                    args = {
                        company = company
                    }
                }
            }
            registeredCompanyMenu[#registeredCompanyMenu+1] = {
                header = Lang:t('menu.edit'),
                icon = 'fa-solid fa-pen-to-square',
                params = {
                    event = 'nmsh-cityservices:client:EditCompany',
                    args = {
                        company = company
                    }
                }
            }
            registeredCompanyMenu[#registeredCompanyMenu+1] = {
                header = Lang:t('menu.dissolve'),
                icon = 'fa-solid fa-ban',
                params = {
                    event = 'nmsh-cityservices:client:DissolveCompany',
                    args = {
                        company = company
                    }
                }
            }
        else
            registeredCompanyMenu[#registeredCompanyMenu+1] = {
                isMenuHeader = true,
                header = Lang:t('menu.register_company_header'),
                icon = 'fas fa-copyright'
            }
            registeredCompanyMenu[#registeredCompanyMenu+1] = {
                isMenuHeader = true,
                header = '',
                txt = Lang:t('menu.register_company_text') .. '<br><br>' .. Lang:t('menu.cost') .. Lang:t('menu.currency', { amount = Config.RegisterCompanyPrice }),
            }
            registeredCompanyMenu[#registeredCompanyMenu+1] = {
                header = Lang:t('menu.register'),
                icon = 'fa-solid fa-square-check',
                params = {
                    event = 'nmsh-cityservices:client:RegisterCompany'
                }
            }
        end
        registeredCompanyMenu[#registeredCompanyMenu+1] = {
            header = Lang:t('menu.close'),
            icon = 'fa-solid fa-angle-left',
            params = {
                event = 'nmsh-menu:closeMenu',
            }
        }
        exports['nmsh-menu']:openMenu(registeredCompanyMenu)
    end)
end)

RegisterNetEvent('nmsh-cityservices:client:InvestCompany',function(data)
    exports['nmsh-menu']:openMenu({
        {
            isMenuHeader = true,
            header = Lang:t('menu.register_company_invest_header'),
            icon = 'fa-solid fa-sack-dollar',
        },
        {
            isMenuHeader = true,
            header = '',
            txt = '<br>'..Lang:t('menu.register_company_invest_text')..'<br><br>'
        },
        {
            header = Lang:t('menu.invest_now'),
            icon = 'fa-solid fa-dollar-sign',
            params = {
                event = 'nmsh-cityservices:client:InvestAmountCompany',
                args = {
                    company = data.company
                }
            }
        },
        {
            header = Lang:t('menu.back'),
            icon = 'fa-solid fa-angle-left',
            params = {
                event = 'nmsh-cityservices:client:RegisteredCompany'
            }
        }
    })
end)

RegisterNetEvent('nmsh-cityservices:client:InvestAmountCompany',function(data)
    local companyAmountInput = exports['nmsh-input']:ShowInput({
        header = Lang:t('menu.register_company_invest_amount_header'),
        submitText = Lang:t('menu.invest'),
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = Lang:t('menu.amount')
            }
        }
    })

    if companyAmountInput then
        if not companyAmountInput.amount then return end
        if companyAmountInput.amount ~= nil and tonumber(companyAmountInput.amount) > 0 then
            TriggerEvent('nmsh-cityservices:client:Confirm', { 
                header = Lang:t('menu.register_company_invest_confirm_header'),
                icon = '',
                text =  Lang:t('menu.register_company_invest_confirm_text', { name = data.company.name }) .. '<br><br>' .. Lang:t('menu.register_company_invest_amount') .. Lang:t('menu.currency', { amount = companyAmountInput.amount }),
                button = Lang:t('menu.confirm_and_invest'),
                event = {
                    confirm = 'nmsh-cityservices:server:InvestCompany',
                    back = 'nmsh-cityservices:client:RegisteredCompany',
                },
                args = {
                    amount = tonumber(companyAmountInput.amount),
                }
            })
        end
    end
end)

RegisterNetEvent('nmsh-cityservices:client:DissolveCompany',function(data)
    TriggerEvent('nmsh-cityservices:client:Confirm', { 
        header = Lang:t('menu.register_company_dissolve_header'),
        icon = 'fa-solid fa-ban',
        text =  Lang:t('menu.register_company_dissolve_text', { name = data.company.name}) .. '<br>',
        button = Lang:t('menu.confirm'),
        event = {
            confirm = 'nmsh-cityservices:server:DissolveCompany',
            back = 'nmsh-cityservices:client:RegisteredCompany',
        },
        args = {
            name = data.company.name,
        }
    })
end)

RegisterNetEvent('nmsh-cityservices:client:EditCompany',function(data)
    exports['nmsh-menu']:openMenu({
        {
            isMenuHeader = true,
            header = Lang:t('menu.register_company_edit_header'),
            icon = 'fa-solid fa-pen-to-square',
        },
        {
            isMenuHeader = true,
            header = '',
            txt = '<br>'..Lang:t('menu.register_company_edit_text')..'<br><br>'
        },
        {
            header = Lang:t('menu.register_company_edit_name'),
            icon = 'fa-solid fa-pencil',
            params = {
                event = 'nmsh-cityservices:client:EditCompanyName',
                args = {
                    company = data.company
                }
            }
        },
        {
            header = Lang:t('menu.register_company_edit_type'),
            icon = 'fa-solid fa-briefcase',
            params = {
                event = 'nmsh-cityservices:client:EditCompanyType',
                args = {
                    company = data.company
                }
            }
        },
        {
            header = Lang:t('menu.back'),
            icon = 'fa-solid fa-angle-left',
            params = {
                event = 'nmsh-cityservices:client:RegisteredCompany'
            }
        }
    })
end)

RegisterNetEvent('nmsh-cityservices:client:EditCompanyName',function(data)
    local companyNameInput = exports['nmsh-input']:ShowInput({
        header = Lang:t('menu.register_company_edit_name'),
        submitText = Lang:t('menu.change'),
        inputs = {
            {
                type = 'text',
                isRequired = true,
                default = data.company.name,
                name = 'name',
                text = Lang:t('menu.register_company_name_input')
            } 
        }
    })

    if companyNameInput then
        if not companyNameInput.name then
            TriggerEvent('nmsh-cityservices:client:RegisteredCompany')
            QBCore.Functions.Notify(Lang:t('error.name_length', { min = Config.RegisterCompanyNameMin, max = Config.RegisterCompanyNameMax }), 'error')
            return
        end

        if #companyNameInput.name < Config.RegisterCompanyNameMin or #companyNameInput.name > Config.RegisterCompanyNameMax then
            TriggerEvent('nmsh-cityservices:client:RegisteredCompany')
            QBCore.Functions.Notify(Lang:t('error.name_length', { min = Config.RegisterCompanyNameMin, max = Config.RegisterCompanyNameMax }), 'error')
        else

            if data.company.name == companyNameInput.name then
                TriggerEvent('nmsh-cityservices:client:RegisteredCompany')
            end

            TriggerEvent('nmsh-cityservices:client:Confirm', { 
                header = Lang:t('menu.register_company_edit_name_header'),
                icon = 'fa-solid fa-pen-to-square',
                text =  Lang:t('menu.register_company_edit_name_confirm_text', { name = companyNameInput.name }) .. '<br><br>' .. Lang:t('menu.cost') .. Lang:t('menu.currency', { amount = Config.RegisterCompanyNameChange }) .. '<br>',
                button = Lang:t('menu.confirm'),
                event = {
                    confirm = 'nmsh-cityservices:server:ChangeCompanyName',
                    back = 'nmsh-cityservices:client:RegisteredCompany',
                },
                args = {
                    name = companyNameInput.name
                }
            })
        end
    end
end)

RegisterNetEvent('nmsh-cityservices:client:EditCompanyType',function(data)
    local companyTypeInput = exports['nmsh-input']:ShowInput({
        header = Lang:t('menu.register_company_edit_type_header'),
        submitText = Lang:t('menu.change'),
        inputs = {
            {
                type = 'select',
                name = 'type',
                text = Lang:t('menu.register_company_type_input'),
                default = data.company.type,
                options = Config.RegisterCompanyTypes
            } 
        }
    })

    if companyTypeInput then
        
        if data.company.type == companyTypeInput.type then
            TriggerEvent('nmsh-cityservices:client:RegisteredCompany')
        end

        local companyType = GetRegisteredCompanyType(companyTypeInput.type)
        TriggerEvent('nmsh-cityservices:client:Confirm', { 
            header = Lang:t('menu.register_company_edit_type_header'),
            icon = 'fa-solid fa-pen-to-square',
            text =  Lang:t('menu.register_company_edit_type_confirm_text', { type = companyType.text }) .. '<br><br>' .. Lang:t('menu.cost') .. Lang:t('menu.currency', { amount = companyType.price }) .. '<br>',
            button = Lang:t('menu.confirm'),
            event = {
                confirm = 'nmsh-cityservices:server:ChangeCompanyType',
                back = 'nmsh-cityservices:client:RegisteredCompany',
            },
            args = {
                type = companyTypeInput.type
            }
        })
    end
end)

RegisterNetEvent('nmsh-cityservices:client:RegisterCompany',function()
    local companyNameInput = exports['nmsh-input']:ShowInput({
        header = Lang:t('menu.register_company_name_header'),
        submitText = Lang:t('menu.register'),
        inputs = {
            {
                type = 'text',
                isRequired = true,
                name = 'name',
                text = Lang:t('menu.register_company_name_input')
            },
            {
                text = Lang:t('menu.register_company_type_input'),
                name = 'type',
                type = 'select',
                options = Config.RegisterCompanyTypes
            }
        }
    })

    if companyNameInput then
        if not companyNameInput.name then
            TriggerEvent('nmsh-cityservices:client:RegisterCompany')
            QBCore.Functions.Notify(Lang:t('error.name_length', { min = Config.RegisterCompanyNameMin, max = Config.RegisterCompanyNameMax }), 'error')
            return
        end

        if #companyNameInput.name < Config.RegisterCompanyNameMin or #companyNameInput.name > Config.RegisterCompanyNameMax then
            TriggerEvent('nmsh-cityservices:client:RegisterCompany')
            QBCore.Functions.Notify(Lang:t('error.name_length', { min = Config.RegisterCompanyNameMin, max = Config.RegisterCompanyNameMax }), 'error')
        else
            TriggerServerEvent('nmsh-cityservices:server:RegisterCompany', companyNameInput.name, companyNameInput.type) 
        end
    end
end)

RegisterNetEvent('nmsh-cityservices:client:OwnedCompanies',function()
    local ownedCompanyMenu = {
        {
            header = Lang:t('menu.owned_company_header'),
            txt = Lang:t('menu.owned_company_text'),
            icon = 'fas fa-building',
            isMenuHeader = true
        }
    }
    QBCore.Functions.TriggerCallback('nmsh-cityservices:server:GetOwnedCompanies', function(companies)
        for k, v in pairs(Config.Companies) do
            local company = IsCompanyOwned(v.job, companies)
            if company ~= nil then
                ownedCompanyMenu[#ownedCompanyMenu+1] = {
                    header = v.name,
                    txt = Lang:t('menu.owned_company_owner', { firstname = company.firstname, lastname = company.lastname }),
                    params = {
                        event = 'nmsh-cityservices:client:ViewOwnedCompany',
                        args = {
                            id = k,
                            company = company
                        }
                    }   
                }
            else
                ownedCompanyMenu[#ownedCompanyMenu+1] = {
                    header = v.name,
                    params = {
                        event = 'nmsh-cityservices:client:ViewPurchaseCompany',
                        args = {
                            id = k
                        }
                    }  
                }
            end
        end
        exports['nmsh-menu']:openMenu(ownedCompanyMenu)
    end)
end)

RegisterNetEvent('nmsh-cityservices:client:ViewOwnedCompany',function(data)
    local companyMenu = {}
    local company = Config.Companies[data.id]
    if company.image ~= nil then
        companyMenu[#companyMenu+1] = {
            isMenuHeader = true,
            header = '<img src=nui://nmsh-cityservices/images/'..company.image..' width=100% onerror="this.onerror=null; this.remove();"> <img src='..company.image..' onerror="this.onerror=null; this.remove();" width=100%>',
        }
    else
        companyMenu[#companyMenu+1] = {
            isMenuHeader = true,
            header = company.name
        }
    end
    companyMenu[#companyMenu+1] = {
        isMenuHeader = true,
        header = '',
        txt = '<br>'..company.description ..'<br><br>'..Lang:t('menu.owned_company_owner', { firstname = data.company.firstname, lastname = data.company.lastname })..'<br><br>'..Lang:t('menu.owned_company_employees', { amount = data.company.employees })..'<br><br>',
    }

    if data.company.citizenid == PlayerData.citizenid then
        companyMenu[#companyMenu+1] = {
            header = Lang:t('menu.sell'),
            icon = 'fa-solid fa-dollar-sign',
            params = {
                event = 'nmsh-cityservices:client:SellCompany',
                args = {
                    id = data.id
                }
            }
        }
    end

    companyMenu[#companyMenu+1] = {
        header = Lang:t('menu.back'),
        icon = 'fa-solid fa-angle-left',
        params = {
            event = 'nmsh-cityservices:client:OwnedCompanies'
        }
    }

    exports['nmsh-menu']:openMenu(companyMenu)
end)

RegisterNetEvent('nmsh-cityservices:client:ViewPurchaseCompany',function(data)
    local companyMenu = {}
    local company = Config.Companies[data.id]
    if company.image ~= nil then
        companyMenu[#companyMenu+1] = {
            isMenuHeader = true,
            header = '<img src=nui://nmsh-cityservices/images/'..company.image..' width=100% onerror="this.onerror=null; this.remove();"> <img src='..company.image..' onerror="this.onerror=null; this.remove();" width=100%>',
        }
    else
        companyMenu[#companyMenu+1] = {
            isMenuHeader = true,
            header = company.name
        }
    end

    companyMenu[#companyMenu+1] = {
        isMenuHeader = true,
        header = '',
        txt = '<br>'..company.description ..'<br><br>'..Lang:t('menu.owned_company_purchase')..' '..Lang:t('menu.currency', { amount = company.purchase_price })..'<br><br>'..Lang:t('menu.owned_company_sell')..' '..Lang:t('menu.currency', { amount = company.sell_price })..'<br><br>',
    }

    companyMenu[#companyMenu+1] = {
        header = Lang:t('menu.purchase'),
        icon = 'fa-solid fa-dollar-sign',
        params = {
            event = 'nmsh-cityservices:client:PurchaseCompany',
            args = {
                id = data.id
            }
        }
    }

    companyMenu[#companyMenu+1] = {
        header = Lang:t('menu.back'),
        icon = 'fa-solid fa-angle-left',
        params = {
            event = 'nmsh-cityservices:client:OwnedCompanies'
        }
    }

    exports['nmsh-menu']:openMenu(companyMenu)
end)

RegisterNetEvent('nmsh-cityservices:client:PurchaseCompany',function(data)
    local company = Config.Companies[data.id]

    local companyAmount = 0
    if Config.CompanyLimited then
        companyAmount = GetPlayerOwnedCompanies()
    end

    local hasBusinessLicense = false
    if Config.CompanyRequiresBusinessLicense then
        hasBusinessLicense = CheckPlayerHasBusinessLicense()
    end

    if Config.CompanyLimited and #companyAmount > 0 then
        QBCore.Functions.Notify(Lang:t('error.already_own_company'), 'error')
        TriggerEvent('nmsh-cityservices:client:OwnedCompanies')
        return
    end

    if Config.CompanyRequiresBusinessLicense and not hasBusinessLicense then
        QBCore.Functions.Notify(Lang:t('error.business_license_required'), 'error')
        TriggerEvent('nmsh-cityservices:client:OwnedCompanies')
        return
    end

    exports['nmsh-menu']:openMenu({
        {
            isMenuHeader = true,
            header = Lang:t('menu.owned_company_purchase_header'),
            txt = '<br>'..Lang:t('menu.owned_company_purchase_text', { company = company.name, purchase = company.purchase_price, sell = company.sell_price })..'<br><br>'
        },
        {
            header = Lang:t('menu.purchase'),
            icon = 'fa-solid fa-dollar-sign',
            params = {
                isServer = true,
                event = 'nmsh-cityservices:server:PurchaseCompany',
                args = {
                    id = data.id
                }
            }
        },
        {
            header = Lang:t('menu.back'),
            icon = 'fa-solid fa-angle-left',
            params = {
                event = 'nmsh-cityservices:client:OwnedCompanies'
            }
        }
    })
end)

RegisterNetEvent('nmsh-cityservices:client:SellCompany',function(data)
    local company = Config.Companies[data.id]
    exports['nmsh-menu']:openMenu({
        {
            isMenuHeader = true,
            header = Lang:t('menu.owned_company_sell_confirm_header'),
            txt = '<br>'..Lang:t('menu.owned_company_sell_confirm_text', { name = company.name })..'<br><br>' .. Lang:t('menu.owned_company_selling_price') .. Lang:t('menu.currency', { amount = company.sell_price }) .. '<br><br>',
        },
        {
            header = Lang:t('menu.sell'),
            icon = 'fa-solid fa-money-check-dollar',
            params = {
                isServer = true,
                event = 'nmsh-cityservices:server:SellCompany',
                args = {
                    id = data.id
                }
            }
        },
        {
            header = Lang:t('menu.back'),
            icon = 'fa-solid fa-angle-left',
            params = {
                event = 'nmsh-cityservices:client:OwnedCompanies'
            }
        }
    })
end)

RegisterNetEvent('nmsh-cityservices:client:Confirm',function(data)
    exports['nmsh-menu']:openMenu({
        {
            isMenuHeader = true,
            header = data.header,
            icon = data.icon,
        },
        {
            isMenuHeader = true,
            header = '',
            txt = '<br>'..data.text..'<br><br>'
        },
        {
            header = data.button,
            icon = 'fa-solid fa-check',
            params = {
                isServer = true,
                event = data.event.confirm,
                args = data.args
            }
        },
        {
            header = Lang:t('menu.back'),
            icon = 'fa-solid fa-angle-left',
            params = {
                event = data.event.back
            }
        }
    })
end)