ConsumableItems = {}
local ox_inventory = exports.ox_inventory

function zf.hasItem(source, item, amount)
    if zf.inventory == 'ox' then
        local itemData = ox_inventory:GetItem(source, item, nil, true)
        if itemData >= amount then return true end
	elseif zf.core == "qb-core" then
		local Player = Core.Functions.GetPlayer(source)
		if not Player then return false end
        local itemData = Player.Functions.GetItemByName(item)
        if not itemData then return false end
		if itemData.amount >= amount then return true end
	elseif zf.core == "esx" then
		local Player = Core.GetPlayerFromId(source)
		local itemName, itemCount = Player.hasItem(item)
		if itemCount >= amount then return true end
	end
    return false
end

function zf.giveItem(source, item, amount, metadata)
    if zf.inventory == 'ox' then
        ox_inventory:AddItem(source, item, amount, metadata)
	elseif zf.core == "qb-core" then
		local Player = Core.Functions.GetPlayer(source)
		if not Player then return end
		Player.Functions.AddItem(item, amount, false, metadata or {})
		TriggerClientEvent("inventory:client:ItemBox", source, Core.Shared.Items[item], "add", amount)
	elseif zf.core == "esx" then
		local Player = Core.GetPlayerFromId(source)
		Player.addInventoryItem(item, amount, metadata or {})
	end
end

function zf.removeItem(source, item, amount, metadata)
    if zf.inventory == 'ox' then
        local removedItem = ox_inventory:GetItem(source, item, nil, true)
        if removedItem >= amount then
            ox_inventory:RemoveItem(source, item, amount, metadata or {})
            return true
        end
	elseif zf.core == "qb-core" then
        local Player = Core.Functions.GetPlayer(source)
		if not Player then return end
		if Player.Functions.RemoveItem(item, amount) then
            TriggerClientEvent("inventory:client:ItemBox", source, Core.Shared.Items[item], "remove", amount)
            return true
        end
	elseif zf.core == "esx" and zf.inventory == 'esx' then
        local Player = Core.GetPlayerFromId(source)
        local removedItem = Player.getInventoryItem(item)
        if removedItem.count >= amount then
            Player.removeInventoryItem(item, amount)
            return true
        end
	end
    return false
end

function zf.createUsableItem(item, cb)
    if ConsumableItems[item] then print('[ZF-LIB] The item ' .. item .. ' is already registered as a consumable item. Skipping the registration of this item.') end
	if zf.core == "qb-core" then
		Core.Functions.CreateUseableItem(item, cb)
        ConsumableItems[item] = cb
	elseif zf.core == "esx" and zf.inventory == 'esx' then
		Core.RegisterUsableItem(item, cb)
        ConsumableItems[item] = cb
	end
end

function zf.toggleItem(source, toggle, name, amount, metadata)
    if toggle == 1 or toggle == true then
        zf.giveItem(source, name, amount, metadata or nil)
    elseif toggle == 0 or toggle == false then
        zf.removeItem(source, name, amount, metadata or nil)
    end
end

function zf.getItemCount(source, item)
    if zf.inventory == 'ox' then
        local itemData = ox_inventory:GetItem(source, item, nil, true)
        if itemData then return itemData else return 0 end
	elseif zf.core == "qb-core" then
		local Player = Core.Functions.GetPlayer(source)
		if not Player then return 0 end
        local itemData = Player.Functions.GetItemByName(item)
        if itemData then return itemData.amount else return 0 end
	elseif zf.core == "esx" then
		local Player = Core.GetPlayerFromId(source)
		local itemData = Player.getInventoryItem(item)
		if itemData then return itemData.count else return 0 end
	end
    return 0
end

lib.callback.register('zf:hasItem', function(source, item, amount)
    local hasItem = zf.hasItem(source, item, amount)
    return hasItem
end)

lib.callback.register('zf:getItemCount', function(source, item)
    local itemCount = zf.getItemCount(source, item)
    return itemCount
end)

lib.callback.register('zf:getItemLabel', function(source, itemName)
    local itemLabel = Core.GetItemLabel(itemName)
    return itemLabel
end)

RegisterNetEvent('zf-lib:toggleItem', function(toggle, name, amount, metadata)
    local source = source
    zf.toggleItem(source, toggle, name, amount, metadata)
end)