fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Jube'
description 'ESX Grocery Store with ox_inventory support'
version '1.0.0'

shared_script '@es_extended/imports.lua'

client_scripts {
    'config.lua',
    'client/main.lua'
}

server_scripts {
    'config.lua',
    'server/main.lua'
}

dependency 'es_extended'
