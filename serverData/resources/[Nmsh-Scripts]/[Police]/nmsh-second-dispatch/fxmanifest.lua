fx_version 'cerulean'
game 'gta5'

version '1.4'

client_scripts {
    'config.lua',
    'client/*.lua',
}

server_scripts {
    'server_config.lua',
    '@mysql-async/lib/MySQL.lua',
    'server/*.lua',
}

ui_page 'html/index.html'

files {
    'html/*',
    'html/titles/*',
    'html/titles/3/*',
    'html/titles/4/*',
    'html/titles/5/*',
    'html/titles/6/*',
    'html/titles/7/*'
}

exports {
    'dispatchadd',
    'policedead',
    'callsign_command'
}