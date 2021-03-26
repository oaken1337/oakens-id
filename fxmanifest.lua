fx_version 'adamnt'
game 'gta5'

description 'oaken''s ID overhead (optimized)'

author 'oaken#1337'

version '1.0.0'

client_scripts {
  'client/main.lua'
}	

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server/main.lua',
  'config.lua'
}