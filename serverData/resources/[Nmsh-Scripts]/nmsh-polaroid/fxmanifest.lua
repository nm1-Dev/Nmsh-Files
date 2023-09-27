

fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'Apex'
description 'Polaroid'
version '1.0.0'
lua54 'yes'

shared_scripts {
  'config/config.lua',
  '@pmc-callbacks/import.lua'
}
  
client_scripts {
  'config/config.js',
  'client/cl_*.lua',
}
  
server_scripts {
  '@oxmysql/lib/MySQL.lua',
  --'@mysql-async/lib/MySQL.lua',    UNCOMMENT ONLY IF YOU USE MYSQL-ASYNC
  'config/server_config.lua', 
  'server/sv_*.lua'
}


ui_page 'build/index.html'

files {
  'build/index.html',
  'build/static/js/*.js',
  'build/static/css/*.css',
  'build/static/media/*.svg',
  'build/static/media/*.mp3',
}

dependencies {
  'screenshot-basic',
  'pmc-callbacks',
}

escrow_ignore { 
  'config/*.lua'
}


