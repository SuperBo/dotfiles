return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      highlight = { enable = true },
      ensure_installed = {
        'go', 'java', 'python', 'rust',
        'yaml', 'hcl',
        'javascript', 'svelte', 'typescript', 'json',
        'markdown', 'markdown_inline', 'bash', 'regex',
      },
      indent = { enable = true, disable = { 'python' } },
      matchup = {
        enable = true,
      },
    }
  },
  'nvim-treesitter/nvim-treesitter-context',
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      { 'kevinhwang91/promise-async' },
      -- { 'chrisgrieser/nvim-origami', opts = true }
    },
    event = 'BufReadPost',
    init = function()
      vim.o.foldcolumn = '1' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    opts = {
      filetype_exclude = {
        'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason',
        'diff'
      },
    },
    keys = {
      { 'zR', mode = 'n', function () require 'ufo'.openAllFolds() end },
      { 'zM', mode = 'n', function () require 'ufo'.closeAllFolds() end },
    },
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
      vim.g.lsp_zero_ui_float_border = 0
    end,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'onsails/lspkind.nvim'
    },
    config = function()
      local lsp_zero = require 'lsp-zero'
      lsp_zero.extend_cmp()

      local cmp = require 'cmp'
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup {
        -- formatting = lsp_zero.cmp_format(),
        formatting = {
          fields = {'abbr', 'kind', 'menu'},
          format = require 'lspkind'.cmp_format({
            mode = 'symbol_text',
            preset = 'default',
            maxwidth = 50,
            ellipsis_char = '...',
          })
        },
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({select = false}),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        }
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      local lsp_zero = require 'lsp-zero'
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      lsp_zero.set_server_config({
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true
            }
          }
        }
      })

      require 'mason-lspconfig'.setup({
        ensure_installed = {
          'lua_ls', 'rust_analyzer',
          'terraformls', 'tflint',
          'ruff', 'pyright'
        },
        handlers = {
          lsp_zero.default_setup,
          -- lua_ls = function()
          --   -- (Optional) Configure lua language server for neovim
          --   local lua_opts = lsp_zero.nvim_lua_ls()
          --   require('lspconfig').lua_ls.setup(lua_opts)
          -- end,
          lua_ls = function()
            require 'neodev'.setup({
              library = {
                enabled = true,
                plugins = { "nvim-treesitter", "plenary.nvim", "nui.nvim" },
              },
            })

            require 'lspconfig'.lua_ls.setup({
              settings = {
                Lua = {
                  completion = {
                    callSnippet = "Replace"
                  }
                }
              }
            })
          end,
        }
      })
    end,
  },
  {
    'folke/neodev.nvim', opts = {},
  },
  -- {
  --   dir = '/Users/ynguyen/Workspace/lsp-ai.nvim',
  --   opts = {
  --     autostart = false,
  --     server = {
  --       memory = {
  --         file_store = {},
  --       },
  --       models = {
  --         model1 =  {
  --           type="llama_cpp",
  --           -- repository= "Qwen/CodeQwen1.5-7B-Chat-GGUF",
  --           -- name= "codeqwen-1_5-7b-chat-q4_k_m.gguf",
  --           file_path="/Users/ynguyen/Workspace/model/codeqwen-1_5-7b-chat-q4_k_m.gguf",
  --           n_ctx=512,
  --           -- ctx_size= 512,
  --           n_gpu_layers= 500,
  --         }
  --       }
  --     },
  --     generation = {
  --       model = "model1",
  --       parameters = {
  --         max_tokens=256,
  --         max_context=1024,
  --         messages = {
  --           {
  --             role="system",
  --             content="You are a programming completion tool. Replace <CURSOR> with the correct code."
  --           },
  --           {
  --             role = "user",
  --             content = "{CODE}"
  --           }
  --         }
  --       }
  --     }
  --   },
  --   dependencies = { 'neovim/nvim-lspconfig' },
  -- }
}
