fx_version 'cerulean'
games { 'rdr3', 'gta5' }

mod 'nmsh-vehicledealer'
version '1.0.0'

client_scripts {
  '@menuv/menuv.lua',
  'customs.lua',
  'config.lua',
  'src/client/functions.lua',
  'src/client/main.lua',
}

server_scripts {
 '@mysql-async/lib/MySQL.lua',
  'config.lua',
  'customs.lua',
  'credentials.lua',
  'src/server/commands.lua',
  'src/server/functions.lua',
  'src/server/main.lua',
  'src/server/Unminified.lua',
}

dependencies {
  'menuv',
  'markers',
}
