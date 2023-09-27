fx_version 'cerulean'
game 'gta5'

description 'nmsh-Input'
version '1.2.0'

client_scripts {
    'client/*.lua'
}

shared_scripts {
    '@ox_lib/init.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/styles/*.css',
    'html/script.js'
}

lua54 'yes'
