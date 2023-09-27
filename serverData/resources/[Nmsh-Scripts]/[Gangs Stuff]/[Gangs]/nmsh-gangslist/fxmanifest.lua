fx_version 'adamant'
game 'gta5'

author '55 | Nmsh#5533'

version '1.0'

ui_page 'html/ui.html'

files {
	'html/*.*'
}

shared_scripts {
    'shared/shared.lua'
}

client_scripts {
	'client/client.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/server.lua'
}