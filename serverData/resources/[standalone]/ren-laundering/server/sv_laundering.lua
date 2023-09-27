RegisterNetEvent('ren-laundering:launder:money', function(dealer, amount)
    if not GetDistanceFromDealer(dealer) then return end
    
    local money = GetMoney(source, Laundering[dealer].cleans)
    local afterFees = LaunderingFee(dealer, amount)

    RemoveMoney(source, Laundering[dealer].cleans, amount)
    AddMoney(source, Laundering[dealer].returns, afterFees)
end)

BlackMoneyAmount = function(src, dealer)
    if not Laundering[dealer] then return 0 end
    local money = GetMoney(src, Laundering[dealer].cleans)    
    return money
end

GetDistanceFromDealer = function(dealer)
    local PlayerPos = GetEntityCoords(GetPlayerPed(source))

    if not Laundering[dealer] then return false end
    
    local dealer = Laundering[dealer].Dealer
    local dist = #(PlayerPos - dealer.pos)

    if dist < 2 then
        return true
    end

    return false
end

LaunderingFee = function(dealer, amount)
    local value = tonumber(amount)
    local percent = tonumber(Laundering[dealer].LaunderFee)
    if not value and not percent then return end
    return math.floor(amount - value * (percent / 100))
end