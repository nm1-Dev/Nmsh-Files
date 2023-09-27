Bank = Bank or {}

--- This function gets triggered whenever one or more PowerStations have been hit
--- @param hits array
--- @return nil
function Bank.OnPoliceCameraHit(hits)
    TriggerClientEvent("police:client:SetCamera", -1, hits, false)
end

--- This is called whenever a bank robbery is started, after a hack is done or a card is used, in this function you can do extra stuff after it has started
--- @param bankId number | string
--- @return nil
function Bank.OnRobberyStart(bankId)
    local bankName = type(bankId) == "number" and "bankrobbery" or bankId
    TriggerEvent('nmsh-scoreboard:server:SetActivityBusy', bankName, true)
    if bankName ~= "bankrobbery" then return end
    TriggerEvent('nmsh-banking:server:SetBankClosed', bankId, true)
end

--- This is called whenever a bank robbery's timeout has ended
--- @param bankId string | number
--- @return nil
function Bank.OnRobberyTimeoutEnd(bankId)
    local bankName = type(bankId) == "number" and "bankrobbery" or bankId
    TriggerEvent('nmsh-scoreboard:server:SetActivityBusy', bankName, false)
    if bankName ~= "bankrobbery" then return end
    TriggerEvent('nmsh-banking:server:SetBankClosed', bankId, false)
end

--- This will be called once a blackout starts or ends
--- @param isBlackout boolean
--- @return nil
function Bank.OnBlackout(isBlackout)
    if isBlackout then
        TriggerClientEvent("police:client:DisableAllCameras", -1)
    else
        TriggerClientEvent("police:client:EnableAllCameras", -1)
    end
end

BankFleeca = {}

BankFleeca.NextRobbery = {
    item = 'laptop_red',
    chance = 70 -- amount be > this amount
}

Bank.HitsNeeded = 13 -- The amount of powerstation needed to be hit to cause a blackout
Bank.BlackoutTimer = 10 -- The amount of minutes a blackout will take until all power comes back

Bank.RewardTypes = {
    [1] = {
        type = "item"
    },
    [2] = {
        type = "money"
    }
}

Bank.LockerRewards = {
    ["tier1"] = {
        [1] = {item = "goldchain", minAmount = 5, maxAmount = 15},
    },
    ["tier2"] = {
        [1] = {item = "rolex", minAmount = 5, maxAmount = 15},
    },
    ["tier3"] = {
        [1] = {item = "goldbar", minAmount = 1, maxAmount = 2},
    },
}

Bank.LockerRewardsPaleto = {
    ["tier1"] = {
        [1] = {item = "goldchain", minAmount = 10, maxAmount = 20},
    },
    ["tier2"] = {
        [1] = {item = "rolex", minAmount = 10, maxAmount = 20},
    },
    ["tier3"] = {
        [1] = {item = "goldbar", minAmount = 2, maxAmount = 4},
    },
}

Bank.LockerRewardsPacific = {
    ["tier1"] = {
        [1] = {item = "goldbar", minAmount = 4, maxAmount = 8},
    },
    ["tier2"] = {
        [1] = {item = "goldbar", minAmount = 4, maxAmount = 8},
    },
    ["tier3"] = {
        [1] = {item = "goldbar", minAmount = 4, maxAmount = 8},
    },
}

Bank.CameraHits = {
    [1] = {
        type = {"police", "bank"},
        stationsToHitPolice = {1, 2, 3, 4, 5, 6},
        stationsToHitBank = {1, 2, 11}
    },
    [2] = {
        type = {"police", "bank"},
        stationsToHitPolice = {1, 2, 3, 4, 5, 6},
        stationsToHitBank = {1, 2, 11}
    },
    [3] = {
        type = {"police", "bank"},
        stationsToHitPolice = {1, 2, 3, 4, 5, 6},
        stationsToHitBank = {4, 5, 6, 8}
    },
    [4] = {
        type = {"police", "bank"},
        stationsToHitPolice = {4, 5, 6},
        stationsToHitBank = {12, 13}
    },
    [5] = {
        type = {"police", "bank"},
        stationsToHitPolice = {4, 5, 6},
        stationsToHitBank = {12, 13}
    },
    [6] = {
        type = "police",
        stationsToHitPolice = {4, 5, 6}
    },
    [7] = {
        type = "police",
        stationsToHitPolice = 3
    },
    [8] = {
        type = "police",
        stationsToHitPolice = {4, 5, 6}
    },
    [9] = {
        type = "police",
        stationsToHitPolice = {7, 8}
    },
    [10] = {
        type = "police",
        stationsToHitPolice = {7, 8}
    },
    [11] = {
        type = "police",
        stationsToHitPolice = 9
    },
    [12] = {
        type = "police",
        stationsToHitPolice = 9
    },
    [13] = {
        type = "police",
        stationsToHitPolice = 9
    },
    [14] = {
        type = "police",
        stationsToHitPolice = {9, 10}
    },
    [15] = {
        type = "police",
        stationsToHitPolice = {7, 9, 10}
    },
    [16] = {
        type = "police",
        stationsToHitPolice = {7, 9, 10}
    },
    [17] = {
        type = "police",
        stationsToHitPolice = {9, 10}
    },
    [18] = {
        type = "police",
        stationsToHitPolice = 3
    },
    [19] = {
        type = "police",
        stationsToHitPolice = {{1, 2, 3}, {9, 10}}
    },
    [20] = {
        type = "police",
        stationsToHitPolice = 10
    },
    [21] = {
        type = "police",
        stationsToHitPolice = {1, 2, 11}
    },
    [22] = {
        type = "police",
        stationsToHitPolice = {1, 2, 11}
    },
    [23] = {
        type = "police",
        stationsToHitPolice = {4, 5, 6, 8}
    },
    [24] = {
        type = "police",
        stationsToHitPolice = {12, 13}
    },
    [25] = {
        type = "police",
        stationsToHitPolice = {12, 13}
    }
}
