fx_version 'adamant'
game 'gta5'
lua54 'yes'

shared_scripts {
	'@ox_lib/init.lua',
}

client_script {
	'client.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server.lua'
}
