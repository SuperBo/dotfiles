vim.g.neo_tree_remove_legacy_commands = 1

require 'neo-tree'.setup {
  close_if_last_window = true,
  use_libuv_file_watcher = true,
  follow_current_file = true
}

vim.keymap.set('n', '-', '<Cmd>NeoTreeFloatToggle<CR>', { noremap = true })
