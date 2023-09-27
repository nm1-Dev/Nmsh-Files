fx_version 'cerulean'
game 'gta5'

author 'Sloppy Designs'
description 'City Services'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locale/en.lua', -- replace with desired language
    'config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

client_script 'client/main.lua'

files {
    'images/*'
}



escrow_ignore {
    'client/*.lua',
    'server/*.lua',
    'locale/*.lua',
    'config.lua',
}

lua54 'yes'
dependency '/assetpacks'