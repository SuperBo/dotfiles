-- Startify
-- local ascii_header = {
--   '',
--   '  ███    ██ ███████  ██████  ██    ██ ██ ███    ███',
--   '  ████   ██ ██      ██    ██ ██    ██ ██ ████  ████',
--   '  ██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██',
--   '  ██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██',
--   '  ██   ████ ███████  ██████    ████   ██ ██      ██',
--   ''
-- }

-- vim.g.startify_custom_header = ascii_header
-- vim.g.startify_files_number = 5
-- vim.g.startify_session_persistence = 1
-- vim.g.startify_lists = {
--   { type = 'sessions', header = {'   Sessions'} },
--   { type = 'files', header = {'   Recents'} }
-- }

-- UI
-- vim.o.termguicolors = true
vim.o.number = true

-- Theme config
vim.g.palenight_color_overrides = {
  black = { gui = '#292D3E', cterm = '0', cterm16 = '0' }
}

-- vim.o.background = 'light'
vim.cmd.colorscheme 'nordfox'

-- Neovide
if vim.g.neovide then
  vim.o.guifont = "CaskaydiaCove Nerd Font:h13"
  vim.g.neovide_cursor_vfx_mode = "sonicboom"
end
