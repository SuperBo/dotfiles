_G.find_files = require('telescope.builtin').find_files

vim.api.nvim_set_keymap('n', '<C-P>', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>b', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { noremap = true })
