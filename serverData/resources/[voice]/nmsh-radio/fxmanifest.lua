fx_version 'cerulean'

game 'gta5'
ui_page 'ui/index.html'

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}

shared_scripts {
	'config.lua',
	'functions/*.lua'
}

files {
	'ui/index.html',
    'ui/*.css',
	'ui/*.js',
	'ui/images/**/*.png'
}

provide 'pma-ambulance'

dependencies {
	'/server:5102',
	'/onesync',
}

lua54 'yes'


