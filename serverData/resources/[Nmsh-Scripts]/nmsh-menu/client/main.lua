local QBCore = exports['qb-core']:GetCoreObject()


local headerShown = false
local sendData = nil

-- Functions

local function sortData(data, skipfirst)
    local header = data[1]
    local tempData = data
    if skipfirst then table.remove(tempData,1) end
    table.sort(tempData, function(a,b) return a.header < b.header end)
    if skipfirst then table.insert(tempData,1,header) end
    return tempData
end

local function openMenu(data, sort, skipFirst)
    if not data or not next(data) then return end
    if sort then data = sortData(data, skipFirst) end
	for _,v in pairs(data) do
		if v["icon"] then
			local img = "nmsh-inventory/html/"
			if QBCore.Shared.Items[tostring(v["icon"])] then
				if not string.find(QBCore.Shared.Items[tostring(v["icon"])].image, "images/") then
					img = img.."images/"
				end
				v["icon"] = img..QBCore.Shared.Items[tostring(v["icon"])].image
			end
		end
	end
    SetNuiFocus(true, true)
    headerShown = false
    sendData = data
    SendNUIMessage({
        action = 'OPEN_MENU',
        data = table.clone(data)
    })
end

local function closeMenu()
    sendData = nil
    headerShown = false
    SetNuiFocus(false)
    SendNUIMessage({
        action = 'CLOSE_MENU'
    })
end

local function showHeader(data)
    if not data or not next(data) then return end
    headerShown = true
    sendData = data
    SendNUIMessage({
        action = 'SHOW_HEADER',
        data = table.clone(data)
    })
end

-- Events

RegisterNetEvent('nmsh-menu:client:openMenu', function(data, sort, skipFirst)
    convertToOx(data, sort, skipFirst)
end)

RegisterNetEvent('nmsh-menu:client:closeMenu', function()
    closeMenu()
end)

-- NUI Callbacks

RegisterNUICallback('clickedButton', function(option, cb)
    if headerShown then headerShown = false end
    PlaySoundFrontend(-1, 'Highlight_Cancel', 'DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
    SetNuiFocus(false)
    if sendData then
        local data = sendData[tonumber(option)]
        sendData = nil
        if data then
            if data.params.event then
                if data.params.isServer then
                    TriggerServerEvent(data.params.event, data.params.args)
                elseif data.params.isCommand then
                    ExecuteCommand(data.params.event)
                elseif data.params.isQBCommand then
                    TriggerServerEvent('QBCore:CallCommand', data.params.event, data.params.args)
                elseif data.params.isAction then
                    data.params.event(data.params.args)
                else
                    TriggerEvent(data.params.event, data.params.args)
                end
            end
        end
    end
    cb('ok')
end)

RegisterNUICallback('closeMenu', function(_, cb)
    headerShown = false
    sendData = nil
    SetNuiFocus(false)
    cb('ok')
    TriggerEvent("nmsh-menu:client:menuClosed")
end)

-- Command and Keymapping

RegisterCommand('playerfocus', function()
    if headerShown then
        SetNuiFocus(true, true)
    end
end)

RegisterKeyMapping('playerFocus', 'Give Menu Focus', 'keyboard', 'LMENU')

function convertToOx(data)
    local qbmenuID = 'qbmenu_convert'
    local oxData = {
        id = qbmenuID,
        title = nil,
        onExit = function()
            if curCB then
                curCB(nil)
                curCB = nil
            end
        end,
        options = nil
    }
    local options = {}
    for _, v in ipairs(data) do
        -- Formmating conversion
        if v.hidden then goto continue end
        if v.isMenuHeader and not oxData.title and not v.txt then
            oxData.title = v.header
        elseif v.isMenuHeader then
            options[#options + 1] = {
                title = v.header,
                description = v.txt,
            }
        else
            options[#options + 1] = {
                title = v.header,
                icon = v.icon,
                description = v.txt,
                disabled = v.disabled,
                metadata =  v.image,
                image =  v.image,
                onSelect = function()
                    if v.params.isServer then
                        TriggerServerEvent(v.params.event, v.params.args)
                    else
                        TriggerEvent(v.params.event, v.params.args)
                    end
                end
            }
        end
        ::continue::
    end
    if not oxData.title then
        oxData.title = 'Menu'
    end
    oxData.options = options
    lib.registerContext(oxData)     
    lib.showContext(qbmenuID)
    return oxData
end

-- Events

RegisterNetEvent('nmsh-menu:client:openMenu', function(data)
    --openMenu(data)
    convertToOx(data)
end)

RegisterNetEvent('nmsh-menu:client:closeMenu', function()
    closeMenu()
end)

-- NUI Callbacks

RegisterNUICallback('clickedButton', function(option)
    if headerShown then headerShown = false end
    PlaySoundFrontend(-1, 'Highlight_Cancel', 'DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
    SetNuiFocus(false)
    if sendData then
        local data = sendData[tonumber(option)]
        sendData = nil
        if data then
            if data.params.event then
                if data.params.isServer then
                    TriggerServerEvent(data.params.event, data.params.args)
                elseif data.params.isCommand then
                    ExecuteCommand(data.params.event)
                elseif data.params.isQBCommand then
                    TriggerServerEvent('QBCore:CallCommand', data.params.event, data.params.args)
                elseif data.params.isAction then
                    data.params.event(data.params.args)
                else
                    TriggerEvent(data.params.event, data.params.args)
                end
            end
        end
    end
end)

RegisterNUICallback('closeMenu', function()
    headerShown = false
    sendData = nil
    SetNuiFocus(false)
end)

-- Command and Keymapping

RegisterCommand('playerfocus', function()
    if headerShown then
        SetNuiFocus(true, true)
    end
end)

RegisterKeyMapping('playerFocus', 'Give Menu Focus', 'keyboard', 'LMENU')

-- Exports

--exports('openMenu', openMenu)
exports('openMenu', convertToOx)
exports('closeMenu', closeMenu)
exports('showHeader', showHeader)