return {
  {
    'nanozuki/tabby.nvim',
    config = function() require 'config.tabby' end,
    event = 'UiEnter',
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v2.x",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function() require 'config.neo_tree' end,
    keys = { '-' },
    cmd = { 'NeoTree', 'NeoTreeShow', 'NeoTreeShowToggle' },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'UiEnter',
    config = function() require 'config.lualine' end,
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    }
  },
  {
    'catppuccin/nvim', name = 'catppuccin',
    priority = 1000,
    lazy = false,
    config = function() require 'config.catppuccin' end,
  },
  {
    'AlexvZyl/nordic.nvim',
    priority = 999,
    lazy = false,
    config = function() require 'nordic' .load() end
  },
  {
    'EdenEast/nightfox.nvim',
    priority = 999,
    lazy = false,
    opts = {
      options = {
        styles = {
          comments = 'italic',
        }
      }
    }
  },
  {
    'maxmx03/solarized.nvim',
    priority = 999,
    lazy = false,
    main = 'solarized',
    opts = { theme = 'neo' }
  },
}
