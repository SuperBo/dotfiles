vim.api.nvim_set_keymap('n', '<C-P>', [[<cmd>Telescope find_files<cr>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>b', [[<cmd>Telescope buffers<cr>]], { noremap = true })

require 'telescope'.setup{
  pickers = {
    buffers = {
      theme = "dropdown",
      sort_lastused = true
    }
  }
}
