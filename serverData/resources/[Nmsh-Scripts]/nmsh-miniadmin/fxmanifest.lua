fx_version 'cerulean'
game 'gta5'

version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
    'client/main.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    '@connectqueue/connectqueue.lua',
    'server/main.lua'
}

dependency "connectqueue"

lua54 'yes'
