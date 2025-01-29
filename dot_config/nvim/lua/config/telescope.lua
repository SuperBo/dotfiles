local telescope = require 'telescope'
local builtin = require 'telescope.builtin'

vim.keymap.set('n', '<C-p>', builtin.find_files, { noremap = true })
vim.keymap.set('n', '<C-b>', builtin.buffers, { noremap = true })
vim.keymap.set('n', '<leader>gr', builtin.live_grep, { noremap = true })

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
    file_browser = {
      theme = 'ivy',
    },
    frecency = {
      ignore_patterns  = { "*.git/*", "*/tmp/*" },
      disable_devicons = false,
    }
  }
}

telescope.load_extension 'fzf'
telescope.load_extension 'file_browser'
-- telescope.load_extension 'frecency'
-- telescope.load_extension 'ui-select'
