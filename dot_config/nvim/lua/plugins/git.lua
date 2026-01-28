return {
  {
    'tpope/vim-fugitive',
    cmd = { 'G', 'Git', 'Gdiffsplit' }
  },
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = {
      'DiffviewFileHistory', 'DiffviewOpen', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewRefresh'
    },
    opts = {
      view = {
        merge_tool = {
          layout = "diff3_mixed"
        }
      }
    }
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
    },
    keys = {
      { 'gs', function() package.loaded.gitsigns.stage_hunk() end },
      { 'gr', function() package.loaded.gitsigns.reset_hunk() end },
      { 'gs', function() package.loaded.gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, mode = 'v'},
      { 'gr', function() package.loaded.gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, mode = 'v'},
      { 'gd', function() package.loaded.gitsigns.diffthis() end },
      { ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() package.loaded.gitsigns.next_hunk() end)
        return '<Ignore>'
      end, expr = true },
      { '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() package.loaded.gitsigns.prev_hunk() end)
        return '<Ignore>'
      end, expr = true },
    },
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',         -- required
      'nvim-telescope/telescope.nvim', -- optional
      'sindrets/diffview.nvim',        -- optional
    },
    config = true,
    cmd = {
      'Neogit'
    }
  },
  {
    'tanvirtin/vgit.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    cmd = {
      'VGit'
    }
  },
  -- Fugit2
  {
    -- 'SuperBo/fugit2.nvim',
    dir = '~/Workspace/fugit2.nvim',
    build = false,
    opts = {
      -- width = 100,
      -- colorscheme = "cyberdream",
      show_patch = false,
      -- command_timeout = 3000,
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
      {
        'chrisgrieser/nvim-tinygit',
        dependencies = { 'stevearc/dressing.nvim' }
      },
    },
    cmd = { 'Fugit2', 'Fugit2Graph', 'Fugit2Diff', 'Fugit2Blame' },
    keys = {
      { '<leader>F', mode = 'n', '<cmd>Fugit2<cr>' }
    }
  },
}
