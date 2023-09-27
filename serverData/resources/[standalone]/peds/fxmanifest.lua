fx_version 'cerulean'
game 'gta5'

author 'sjpfeiffer'
description 'A ped spawner for fivem'
version '1.2.0'

lua54 'yes'

dependencies {
	"nmsh-target"
}

shared_scripts {
	'config.lua',
}

client_scripts {
	'client/main.lua'
}
