function zf.hasItem(itemName, amount)
    local hasItem = lib.callback.await('zf:hasItem', false, itemName, amount)
    return hasItem
end

function zf.getItemLabel(itemName)
    local itemLabel
    if zf.core == 'qb-core' then
        itemLabel = Core.Shared.Items[itemName].label
    elseif zf.core == 'esx' then
        itemLabel = lib.callback.await('zf:getItemLabel', false, itemName)
    end
    return itemLabel
end

function zf.getItemCount(itemName)
    local itemCount = lib.callback.await('zf:getItemCount', false, itemName)
    return itemCount
end

function zf.toggleItem(toggle, name, amount, metadata)
    TriggerServerEvent('zf-lib:toggleItem', toggle, name, amount, metadata)
end