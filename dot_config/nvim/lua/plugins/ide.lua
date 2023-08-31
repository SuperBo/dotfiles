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
        'go', 'java', 'javascript', 'json', 'python', 'rust', 'svelte', 'typescript', 'yaml', 'hcl'
      },
      indent = { enable = true, disable = { 'python' } },
    }
  },
  -- 'nvim-treesitter/nvim-treesitter-context',
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
      filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
    },
    keys = {
      { 'zR', mode = 'n', function () require 'ufo'.openAllFolds() end },
      { 'zM', mode = 'n', function () require 'ufo'.closeAllFolds() end },
    },
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    lazy = true,
    config = function()
      require 'lsp-zero.settings'.preset {}
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = { 'L3MON4D3/LuaSnip' },
    config = function()
      require 'lsp-zero.cmp'.extend()
      local cmp = require 'cmp'
      local cmp_action = require 'lsp-zero.cmp'.action()

      cmp.setup {
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
    cmd = 'LspInfo',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
        config = function() require 'mason'.setup() end
      },
      {
        'williamboman/mason-lspconfig.nvim',
        config = function()
          require 'mason-lspconfig'.setup {
            ensure_installed = { 'lua_ls', 'pyright', 'rust_analyzer', 'terraformls', 'tflint' }
          }
        end
      },
    },
    config = function()
      local lsp = require 'lsp-zero'.preset {}

      lsp.on_attach(function(_, bufnr)
        lsp.default_keymaps({buffer = bufnr})
      end)

      lsp.set_server_config({
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true
            }
          }
        }
      })

      require 'lspconfig'.lua_ls.setup(lsp.nvim_lua_ls())

      lsp.setup()
    end,
  }
}
