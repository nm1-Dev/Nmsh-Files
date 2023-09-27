fx_version 'cerulean'

game 'gta5'

lua54 'yes'

author 'Lusty94'

description 'Limeys Juice Bar Job Script For QB-Core'

version '1.0.0'


client_scripts {
    'client/limeys_client.lua',
    'shared/menus.lua',
    'shared/targets.lua'
}

server_scripts {
    'server/limeys_server.lua',
    'shared/billing.lua',
} 

shared_scripts { 
	'shared/config.lua',
    '@ox_lib/init.lua'
}

escrow_ignore {
    'shared/config.lua',
    'shared/menus.lua',
    'shared/targets.lua',
    'shared/billing.lua',
    'client/limeys_client.lua',
    'server/limeys_server.lua',
}
