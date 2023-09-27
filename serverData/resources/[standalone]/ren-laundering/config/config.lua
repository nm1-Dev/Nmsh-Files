Core = { Target = 'nmsh-target', Core = 'qb-core' }--// targets: ('ox_target', 'nmsh-target', 'qtarget') core: ('esx', 'qb-core')

Laundering = {--//Don't touch
    [1] = {
        Blip = {--// blip refrences @ https://docs.fivem.net/docs/game-references/blips/
            show = true, --// if show = true then it will display dealers blip location on the map
            sprite = 429,--// blip logo id 
            colour = 39,--// blip color id
            scale = 0.80--// blip scale
        },

        -------accounts---------
            --qbcore: bank, cash, crypto
            --esx: money, bank, black_money
        -----------------------    
        
        cleans = 'cash',--// account type that the dealer washes
        returns = 'cash',--// when washed the dealer returns the money into the set account
        LaunderFee = 10, --// Launder fee is what the dealer takes, for example this dealer takes 0% of the money being laundered

        Dealer = {--//dealer data
            model = 's_m_y_dealer_01',--// dealer model that will be standint in this location
            pos = vec3(559.4, -1777.36, 32.50),--// dealer standing location
            heading = 339.78,--// dealer heading
        }
    },
}

--// notification event/functions
SentNotify = function(msg, type)--//Don't touch
    if type == 'error' then--//notification type don't touch
        -- print(msg)
        -------qbcore notify function------
        core.Functions.Notify(msg, "error")
        ----------------------------------
        -------esx notify function------
        --core.ShowNotification(msg)
        ----------------------------------
    elseif type == 'info' then--//notification type don't touch
        -- print(msg)
        -------qbcore notify function------
        core.Functions.Notify(msg, "info")
        ----------------------------------
        -------esx notify function------
        --core.ShowNotification(msg)
    elseif type == 'success' then--//notification type don't touch
        -- print(msg)
        -------qbcore notify function------
        core.Functions.Notify(msg, "success")
        ----------------------------------
        -------esx notify function------
        --core.ShowNotification(msg)
    end--// Don't touch
end