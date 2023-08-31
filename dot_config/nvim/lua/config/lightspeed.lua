vim.g.lightspeed_no_default_keymaps = true

vim.keymap.set('', 's', '<Plug>Lightspeed_s', {remap=true})
vim.keymap.set('', 'S', '<Plug>Lightspeed_S', {remap=true})

require'lightspeed'.setup {
  automap = false
}
