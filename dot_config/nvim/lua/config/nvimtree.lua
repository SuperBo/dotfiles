require 'nvim-tree'.setup {
  update_cwd = true,
}

vim.api.nvim_set_keymap('n', '-', [[<cmd>NvimTreeToggle<cr>]], { noremap = true })
