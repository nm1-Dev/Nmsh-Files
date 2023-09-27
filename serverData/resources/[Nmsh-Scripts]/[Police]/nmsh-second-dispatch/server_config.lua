local QBCore = exports['qb-core']:GetCoreObject()


function getIdentity(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    return {
        firstname = xPlayer.PlayerData.charinfo.firstname,
        lastname = xPlayer.PlayerData.charinfo.lastname
    }
end