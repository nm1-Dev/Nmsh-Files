Scully = {
    Framework = 'qb-core',        -- Server Core = scully_core, ESX = es_extended, QBCore = qb-core, Standalone = none
    RadioColour = 'blue',      -- Options are blue, green, orange, pink, purple, red and yellow
    AllowColours = false,         -- Disable if you don't want people to be able to change their radio colour in-game
    ColourCommand = 'rcolor',     -- Set to '' if you don't want to allow changing with a command, command is /rcolor 1-11
    EnableList = true,            -- Set to false to disable the player list
    HideListCommand = 'rlist',    -- Set to '' if you don't want to allow hiding the list with a command, command is /rlist
    ShowSelf = true,              -- Enable if you want your own name to be shown on the radio list
    EnableEditing = false,        -- Disable if you don't want to allow players to change their names and callsigns on the radio
    MicClicks = true,             -- Disable if you don't want mic clicks
    RadioAnims = true,            -- Disable if you don't want to use radio animations for holding the radio
    UseItem = true,               -- Enable if you want to use the radio as an item, will only work for QBCore and ESX
    UseItemColours = false,       -- Enable if you want to use different items for each colour, this will disable the command also
    UseKeybind = '',              -- Set to '' if you don't want to use the radio as a keybind, can be changed here for first use only or in your fivem keybind settings
    UseCustomChannelNames = true, -- Enable if you want custom channel names to be displayed on the radio
    ChannelNames = {              -- Channel names have a limit of 7 characters or they won't display
        [4] = 'LS',
        [5] = 'EMS',
        [6] = 'FD-EMS',
        [3] = 'TAC-3',
        [2] = 'TAC-2',
        [1] = 'LSPD',
        [7] = 'FBI',
        [21] = 'NG-HOT',
        [22] = 'NG',
        [7.1] = 'FBI-HOT',
    },
    WhitelistedAccess = { -- What channels should be whitelisted and what jobs should have access to them?
        [1] = {
            ['police'] = true,
            ['ambulance'] = true
        },
        [2] = {
            ['police'] = true,
            ['ambulance'] = true
        },
        [3] = {
            ['police'] = true,
            ['ambulance'] = true
        },
        [4] = {
            ['police'] = true,
            ['ambulance'] = true
        },
        [5] = {
            ['police'] = true,
            ['ambulance'] = true
        },
        [6] = {
            ['police'] = true,
            ['ambulance'] = true
        },
        [7] = {
            ['police'] = true,
            ['ambulance'] = true
        },
        [8] = {
            ['police'] = true,
            ['ambulance'] = true
        },
        [9] = {
            ['police'] = true,
            ['ambulance'] = true
        },
        [10] = {
            ['police'] = true,
            ['ambulance'] = true
        },
    },
    AcePerms = { -- Not needed unless Framework is set to 'none'
        ['radioPolice'] = 'police',
        ['radioEms'] = 'ems'
    }
}
