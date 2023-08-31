local telescope = require 'telescope'
local builtin = require 'telescope.builtin'

vim.keymap.set('n', '<C-p>', builtin.find_files, { noremap = true })
vim.keymap.set('n', '<C-b>', builtin.buffers, { noremap = true })

telescope.setup {
  pickers = {
    buffers = {
      theme = 'dropdown',
      sort_lastused = true
    }
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {
      }
    },
  }
}

telescope.load_extension('fzf')
-- telescope.load_extension('ui-select')
