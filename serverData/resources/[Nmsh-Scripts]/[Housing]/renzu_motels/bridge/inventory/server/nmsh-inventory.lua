if GetResourceState('nmsh-inventory') ~= 'started' then return end

AddItem = function(src, item, count, metadata)
	return exports['nmsh-inventory']:AddItem(src, item, count, slot, metadata)
end

RemoveItem = function(src, item, count, metadata)
	return exports['nmsh-inventory']:RemoveItem(src, item, count, slot, metadata)
end