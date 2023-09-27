fx_version 'cerulean'
game 'gta5'

client_scripts { 'client/*.lua' }
shared_scripts { 'config/*.lua' }
server_scripts { 'server/*.lua' }

ui_page 'web/dist/index.html'
files { 'web/dist/**' }

lua54 'yes'