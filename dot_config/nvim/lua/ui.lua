-- Startify
local ascii_header = {
  '',
  '  ███    ██ ███████  ██████  ██    ██ ██ ███    ███',
  '  ████   ██ ██      ██    ██ ██    ██ ██ ████  ████',
  '  ██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██',
  '  ██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██',
  '  ██   ████ ███████  ██████    ████   ██ ██      ██',
  ''
}

vim.g.startify_custom_header = ascii_header
vim.g.startify_files_number = 5
vim.g.startify_session_persistence = 1
vim.g.startify_lists = {
  { type = 'sessions', header = {'   Sessions'} },
  { type = 'files', header = {'   Recents'} }
}

-- UI
vim.o.termguicolors = true
vim.o.number = true
vim.o.laststatus = 2
vim.api.nvim_set_var('lens#animate', 0)
vim.cmd 'autocmd VimResized * wincmd ='

-- Theme config
vim.g.palenight_color_overrides = {
  black = { gui = '#292D3E', cterm = '0', cterm16 = '0' }
}
vim.cmd 'colorscheme palenight'
vim.g.lightline = { colorscheme = 'palenight' }

-- GUI
vim.api.nvim_set_option('guifont', 'FiraMono Nerd Font:h13')
vim.g.neovide_cursor_vfx_mode = "sonicboom"
