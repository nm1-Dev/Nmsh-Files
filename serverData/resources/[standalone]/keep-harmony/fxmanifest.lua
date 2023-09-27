--                _
--               | |
--   _____      _| | _____  ___ _ __
--  / __\ \ /\ / / |/ / _ \/ _ \ '_ \
--  \__ \\ V  V /|   <  __/  __/ |_) |
--  |___/ \_/\_/ |_|\_\___|\___| .__/
--                             | |
--                             |_|
-- https://github.com/swkeep

fx_version 'cerulean'
games { 'gta5' }

name 'keep-harmony'
description 'A library of shared functions'
version      '2.28.1'
author "Swkeep#7049"
repository 'https://swkeep.tebex.io'

shared_scripts {
    "@ox_lib/init.lua", --uncoment if your're using ox_lib
    'config.lua',
    'configDEV.lua',    -- remove this line
    'lua/devConfig.lua',
    'lua/shared/harmony.shared.core.lua',
    'lua/shared/timer.lua',
    'lua/shared/locale.lua',
}

client_scripts {
    'lua/client/harmony.client.core.lua',
    'lua/client/client.accessible.lua',
    'lua/client/event.lua',
    'lua/client/client.core.lua',
    'lua/client/extensions/callback.lua',
    'lua/client/extensions/keybind.lua',
    'lua/client/extensions/input.lua',
    'lua/client/extensions/menu.lua',
    'lua/client/extensions/progressbar.lua',
    'lua/client/extensions/target.lua',
    'lua/client/extensions/util.lua',
    'lua/client/extensions/kvp.lua',
    'lua/client/extensions/chance.lua',
    'lua/client/extensions/relationship.lua',
    'lua/client/extensions/blip.lua',
    'lua/client/extensions/animator.lua',
    'lua/client/extensions/ped.lua',
    'lua/client/extensions/brain.lua',
    'lua/client/extensions/player.lua',
    'lua/client/extensions/emote.lua',
    'lua/client/extensions/items.lua',
    'lua/client/extensions/invoice.lua',
}

server_script {
    'serverConfig.lua',
    'discord.lua', -- removing this line is safe
    '@oxmysql/lib/MySQL.lua',
    'lua/server/harmony.server.core.lua',
    'lua/server/event.lua',
    'lua/server/extensions/callback.lua',
    'lua/server/extensions/player.lua',
    'lua/server/extensions/items.lua',
    'lua/server/extensions/vehicle.lua',
    'lua/server/extensions/errorChecker.lua',
    'lua/server/extensions/showInformation.lua',
    'lua/server/extensions/databaseSanityCheck.lua',
    'lua/server/extensions/blip.lua',
    'lua/server/extensions/command.lua',
    'lua/server/extensions/stash.lua',
    'lua/server/extension_tester.lua',
    'lua/server/extensions/discord.lua',
    'lua/server/extensions/webhook.lua',
    'lua/server/extensions/chance.lua',
    'lua/server/extensions/cooldown.lua',
    'lua/server/extensions/invoice.lua',
}

escrow_ignore {
    'lua/client/client.accessible.lua',
    'lua/devConfig.lua',
    'config.lua',
}

dependencies {
    '/server:5848',
    '/onesync',
    'oxmysql'
}

lua54 'yes'

dependency '/assetpacks'