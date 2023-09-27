fx_version 'cerulean'
game 'gta5'

server_scripts {
  'config.lua',
  'lists/seat.lua',
  'lists/sitpoints.lua',
  'server.lua'
}

client_scripts {
  'config.lua',
  'lists/seat.lua',
  'lists/sitpoints.lua',
  'client.lua'
}

ui_page 'html/sit.html'

files {
  'html/*.html',
  'html/*.js',
  'html/*.css',
}

dependencies {
  'PolyZone',
  'nmsh-target'
}
