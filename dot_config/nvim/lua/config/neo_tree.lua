vim.g.neo_tree_remove_legacy_commands = 1

require 'neo-tree'.setup {
  close_if_last_window = true,
  filesystem = {
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true,
    },
    use_libuv_file_watcher = true,
  },
  buffers = {
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true,
    }
  },
  git_status = {
    window = {
      position = 'float',
    }
  }
}

vim.keymap.set('n', '-', '<Cmd>Neotree position=float reveal toggle<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gt', '<Cmd>Neotree git_status toggle<CR>', { noremap = true })
