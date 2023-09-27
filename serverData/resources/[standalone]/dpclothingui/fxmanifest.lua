fx_version 'bodacious'
game 'gta5'
description 'dpClothing+ With UI'
author 'dullpear'
lua54 'yes'

client_scripts {
	'Client/Functions.lua', 		-- Global Functions / Events / Debug and Locale start.
	'Locale/*.lua', 				-- Locales.
	'Client/Config.lua',			-- Configuration.
	'Client/Variations.lua',		-- Variants, this is where you wanan change stuff around most likely.
	'Client/Clothing.lua',
	'Client/NUI.lua',
}

-- By iF9 & Mazen
ui_page 'ui/ui.html'
files {
    'ui/ui.html',
    "ui/js/*.js",
    "ui/css/*.css",
    'ui/imgs/*.png',
}