return {
  -- {
  --   'tpope/vim-fugitive', cmd = { 'G', 'Git' }
  -- },
  {
    'tpope/vim-eunuch',
    cmd = {
      'Remove', 'Delete', 'Move', 'Rename', 'Copy', 'Chmod', 'Mkdir', 'Duplicate',
    }
  },
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function() require 'config.mini' end
  },
  -- {
  --   'ggandor/leap.nvim',
  --   keys = {
  --     { 's',  mode = 'n', '<Plug>(leap-forward-to)'  },
  --     { 'S',  mode = 'n', '<Plug>(leap-backward-to)' },
  --     { 'gs', mode = 'n', '<Plug>(leap-from-window)' }
  --   },
  -- },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      {
        's',
        mode = { 'n', 'o', 'x' },
        function() require 'flash'.jump() end,
        desc = 'Flash'
      },
      {
        'S',
        mode = { 'n', 'o', 'x' },
        function() require 'flash'.treesitter() end,
        desc = 'Flash Treesitter'
      },
      {
        'r',
        mode = 'o',
        function() require 'flash'.remote() end,
        desc = 'Remote Flash'
      },
      {
        'R',
        mode = { 'o', 'x' },
        function() require 'flash'.treesitter_search() end,
        desc = 'Treesitter Search'
      },
      {
        '<c-s>',
        mode = 'c',
        function() require 'flash'.toggle() end,
        desc = 'Toggle Flash Search'
      },
    },
  },
  {
    'sQVe/sort.nvim', cmd = 'Sort'
  },
  -- {
  --   'nvim-telescope/telescope.nvim',
  --   branch = '0.1.x',
  --   dependencies = {
  --     { 'nvim-lua/plenary.nvim' },
  --     {
  --       'nvim-telescope/telescope-fzf-native.nvim',
  --       build = [[
  --         cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release &&\\
  --         cmake --build build --config Release &&\\
  --         cmake --install build --prefix build
  --       ]]
  --     }
  --   },
  --   keys = { '<C-p>', '<C-b>' },
  --   config = function() require 'config.telescope' end,
  -- },
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = { 'default' },
    keys = {
      { '<c-p>',      mode = 'n', function() require 'fzf-lua'.files() end },
      { '<leader>ff', mode = 'n', function() require 'fzf-lua'.files() end },
      { '<c-b>',      mode = 'n', function() require 'fzf-lua'.buffers() end },
      { '<leader>fb', mode = 'n', function() require 'fzf-lua'.buffers() end },
      { '<leader>fg', mode = 'n', function() require 'fzf-lua'.grep() end },
      { '<leader>fm', mode = 'n', function() require 'fzf-lua'.marks() end },
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    keys = { [[<c-\>]], '<c-g>' },
    opts = {
      shade_terminals = false,
      open_mapping = [[<c-\>]],
      autochdir = true,
      direction = 'float',
      -- size = 20,
      float_opts = {
        border = 'curved',
        height = 30,
      },
    },
    config = function(_, opts)
      require 'toggleterm'.setup(opts)

      local Terminal  = require 'toggleterm.terminal'.Terminal
      local lazygitTerm = Terminal:new({
        cmd = 'lazygit', hidden = true,
        float_opts = {
          height = 50,
        },
      })

      vim.keymap.set({'n', 't'}, '<c-g>', function () lazygitTerm:toggle() end, { silent = true })
      -- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { silent = true })
    end,
  },
  -- {
  --   'kdheepak/lazygit.nvim',
  --   dependencies = { 'nvim-lua/plenary.nvim' },
  --   cmd = { 'LazyGit', 'LazyGitConfig', 'LazyGitFilter', 'LazyGitFilterCurrentFile' }
  -- },
}
