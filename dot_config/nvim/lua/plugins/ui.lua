return {
  {
    'nanozuki/tabby.nvim',
    config = function() require 'config.tabby' end,
    event = 'UiEnter',
  },
  -- {
  --   'nvim-neo-tree/neo-tree.nvim',
  --   branch = "v3.x",
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-tree/nvim-web-devicons',
  --     'MunifTanjim/nui.nvim',
  --   },
  --   config = function() require 'config.neo_tree' end,
  --   keys = { '-', '<leader>gt'},
  --   cmd = { 'Neotree' },
  -- },
  -- {
  --   'luukvbaal/nnn.nvim',
  --   opts = {},
  --   keys = {
  --     { '-',  mode = 'n', '<cmd>NnnPicker %:p:h<cr>' },
  --   }
  -- },
  {
    'stevearc/oil.nvim',
    opts = {
      float = {
        max_width = 180,
        max_height = 60,
      },
      keymaps = {
        ['<C-c>'] = 'actions.close',
        ['q'] = 'actions.close',
        ['gi'] = {
          desc = 'Open in Fugit2',
          callback = function()
            local oil = require("oil")
            local dir = oil.get_current_dir()
            if dir then
              oil.close()
              vim.cmd("Fugit2 " .. dir)
            end
          end
        }
      }
    },
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '-', mode = 'n', '<cmd>Oil --float<cr>' }
    }
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
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        lsp_doc_border = true,
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    }
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    main = 'ibl',
    opts = {
      indent = {
        char = '¦',
      },
      scope = {
        show_start = false,
        show_end = false,
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "neotree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    }
  },
  {
    'catppuccin/nvim', name = 'catppuccin',
    priority = 1000,
    lazy = false,
    config = function() require 'config.catppuccin' end,
  },
  -- {
  --   'AlexvZyl/nordic.nvim',
  --   priority = 999,
  --   lazy = false,
  --   config = function() require 'nordic' .load() end
  -- },
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
  -- {
  --   'maxmx03/solarized.nvim',
  --   priority = 999,
  --   lazy = false,
  --   main = 'solarized',
  --   opts = { theme = 'neo' }
  -- },
  {
    'rebelot/kanagawa.nvim',
    priority = 998,
    lazy = false,
    opts = {
      compile = true,
      colors = {
        theme = {
          all = {
            ui = {
              float = { bg = "none", },
            },
          },
        }
      }
    }
  },
  {
    'ribru17/bamboo.nvim',
    priority = 998,
    lazy = false,
  },
  {
    'scottmckendry/cyberdream.nvim',
    priority = 998,
    lazy = false,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 998,
    opts = {},
  },
}
