fx_version 'cerulean'
version '1.0'
game 'gta5'
lua54 'yes'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
	'client/*.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    'shared/*.lua'
}

escrow_ignore {
	'shared/*.lua',  -- Only ignore one file
	'server/*.lua',  -- Only ignore one file
	'client/cl_bobcat.lua',  -- Only ignore one file
	'client/cl_cayo.lua',  -- Only ignore one file
	'client/cl_houses.lua',  -- Only ignore one file
	'client/cl_pacific.lua',  -- Only ignore one file
	'client/cl_paleto.lua',  -- Only ignore one file
	'client/cl_source.lua',  -- Only ignore one file
	'client/cl_union.lua',  -- Only ignore one file
	'client/drilling.lua',  -- Only ignore one file
	'client/functions.lua',  -- Only ignore one file
	'client/policealerts.lua',  -- Only ignore one file
	'client/safecrack.lua',  -- Only ignore one file
	'client/safecrack2.lua',  -- Only ignore one file
	'client/targets.lua',  -- Only ignore one file
}