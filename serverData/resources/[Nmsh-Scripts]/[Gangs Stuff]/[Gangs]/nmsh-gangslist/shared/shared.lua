Nmsh = {}

Nmsh.FilesSetup = {
    CoreName = 'qb-core', -- Core File Name [Default: qb-core]
    CoreTriggerName = 'QBCore' -- Core Trigger [Default: QBCore]
}

Nmsh.Settings = {
    OpenKeyBind = 'PAGEDOWN' -- open menu keybind
}

Nmsh.Gangs = {
    -- [''] = { -- Gang Role name qbcore/shared/gang.lua
    --     role = '', -- Gang Role name qbcore/shared/gang.lua
    --     Image = '', -- Gang Logo Url
    --     Color = '', -- Gang Main Color | You can use color hash #1e1e1e or rbg(0, 0, 0)
    --     ShowRadio = true, -- Show Player Radio Channel on the list
    --     ShowCarStatus = true -- Show Player Car Status on the list
    -- },
    ['lostmc'] = {
        role = 'lostmc',
        Image = 'https://cdn.discordapp.com/attachments/940738528139169863/1070665623115399188/Nmsh-lostmc-logo.png',
        Color = 'white',
        ShowRadio = true,
        ShowCarStatus = true
    },
    ['ballas'] = {
        role = 'ballas',
        Image = 'https://cdn.discordapp.com/attachments/940738528139169863/1070665621739667526/Nmsh-ballas-Gang.png',
        Color = '#c401ff',
        ShowRadio = true,
        ShowCarStatus = true
    },
    ['vagos'] = {
        role = 'vagos',
        Image = 'https://cdn.discordapp.com/attachments/940738528139169863/1070665623539028039/Nmsh-Vagos-logo.png',
        Color = 'yellow',
        ShowRadio = true,
        ShowCarStatus = true
    },
    ['bloods'] = {
        role = 'bloods',
        Image = 'https://cdn.discordapp.com/attachments/940738528139169863/1070665622406565928/Nmsh-Bloods-logo.png',
        Color = '#red',
        ShowRadio = true,
        ShowCarStatus = true
    },
    ['families'] = {
        role = 'families',
        Image = 'https://cdn.discordapp.com/attachments/940738528139169863/1070665622737928282/Nmsh-families-Gang.png',
        Color = 'green',
        ShowRadio = true,
        ShowCarStatus = true
    },
}