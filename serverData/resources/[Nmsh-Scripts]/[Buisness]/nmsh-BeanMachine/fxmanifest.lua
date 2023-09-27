fx_version 'adamant'

game 'gta5'
lua54 'yes'
author "megaJkobe"
description "An updated verison of the Bean Machine Job Made By NevoSwissa#0111"

ui_page { 'html/index.html' }

client_scripts {
    '@PolyZone/CircleZone.lua',
    '@PolyZone/client.lua',
    'client/client.lua',
    'config.lua',
}

files {
    'html/index.html',
    'html/css/menu.css',
    'html/js/js.js',
}

server_scripts {
    'server/server.lua',
    'config.lua',
}

dependencies {
    'PolyZone',
    'nmsh-target'
}
