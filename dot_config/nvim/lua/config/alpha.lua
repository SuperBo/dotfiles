local alpha = require 'alpha'
local dashboard = require 'alpha.themes.dashboard'

dashboard.section.header.val = {
  '░░░░░░░░░░░░░░░░░░    ░░░░░░░░░░░░░░░░░    ░░░░░░░░░░░░░░░░░',
  '░░░░░▄▄████▄▄░░░░░    ░░░▄░▀▄░░░▄▀░▄░░░    ░░░░▄▄████▄▄░░░░░',
  '░░░▄██████████▄░░░    ░░░█▄███████▄█░░░    ░░░██████████░░░░',
  '░▄██▄██▄██▄██▄██▄░    ░░░███▄███▄███░░░    ░░░██▄▄██▄▄██░░░░',
  '░░░▀█▀░░▀▀░░▀█▀░░░    ░░░▀█████████▀░░░    ░░░░▄▀▄▀▀▄▀▄░░░░░',
  '░░░░░░░░░░░░░░░░░░    ░░░░▄▀░░░░░▀▄░░░░    ░░░▀░░░░░░░░▀░░░░',
  '░░░░░░░░░░░░░░░░░░    ░░░░░░░░░░░░░░░░░    ░░░░░░░░░░░░░░░░░',
  '',
  '',
  '           ░░░░░░░░░░░░░░░░░    ░░░░░░░░░░░░░░░░░',
  '           ░░░░░░▄██▄░░░░░░░    ░░░░░▀▄░░░▄▀░░░░░',
  '           ░░░░▄██████▄░░░░░    ░░░░▄█▀███▀█▄░░░░',
  '           ░░░███▄██▄███░░░░    ░░░█▀███████▀█░░░',
  '           ░░░░░▄▀▄▄▀▄░░░░░░    ░░░█░█▀▀▀▀▀█░█░░░',
  '           ░░░░▀░▀░░▀░▀░░░░░    ░░░░░░▀▀░▀▀░░░░░░',
  '           ░░░░░░░░░░░░░░░░░    ░░░░░░░░░░░░░░░░░',
}

dashboard.section.buttons.val = {
  dashboard.button('e', '  New file' , ':ene <BAR> startinsert <CR>'),
  dashboard.button('f', '  Find file', ':cd $HOME/Workspace | Telescope find_files<CR>'),
  dashboard.button('r', '  Recent'   , ':Telescope oldfiles<CR>'),
  dashboard.button('s', '  Session', ':SessionManager load_session<CR>'),
  dashboard.button('p', '  Packer Sync', ':PackerSync<CR>'),
  dashboard.button('c', '  NVIM Config ', ':Telescope dotfiles<CR>'),
  dashboard.button('q', '  Quit NVIM' , ':qa<CR>'),
}
dashboard.opts.opts.noautocmd = true

dashboard.section.footer.val = {
  'The computing scientist\'s main challenge is not',
  'to get confused by the complexities of his own making.',
  '                                 - Edsger W. Dijkstra'
}

alpha.setup(dashboard.opts)
