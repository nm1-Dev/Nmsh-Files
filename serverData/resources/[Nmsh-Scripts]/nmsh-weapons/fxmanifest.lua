fx_version 'cerulean'
game 'gta5'

description 'nmsh-Weapons'
version '1.2.1'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua',
}

server_script 'server/main.lua'
client_scripts {'client/main.lua', 'client/scope.lua'}

files {
    'weaponsnspistol.meta'
}

data_file 'WEAPONINFO_FILE_PATCH' 'weaponsnspistol.meta'

lua54 'yes'
