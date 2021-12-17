vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  -- use 'justinmk/vim-dirvish' -- browse file
  use 'b3nj5m1n/kommentary' -- comment utils
  use 'tpope/vim-fugitive' -- Git utils
  use 'tpope/vim-eunuch' --  Unix utils
  use 'machakann/vim-sandwich' -- parentheis utils
  use 'Raimondi/delimitMate' -- auto close parentheis
  -- use 'jeetsukumaran/vim-buffergator' -- browse buffer
  use {
    'easymotion/vim-easymotion',
    config = function() require 'config.easymotion' end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function() require 'config.telescope' end
  }

  -- LSP & Completer
  use 'neovim/nvim-lspconfig'
  use {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    requires = {'ms-jpq/coq.artifacts', branch = 'artifacts'}
  }

  -- Tree-sitter 
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require 'config.treesitter' end
  }

  -- UI
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'akinsho/bufferline.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function() require 'config.bufferline' end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function() require 'config.nvimtree' end
  }
  use 'mhinz/vim-startify'
  use 'camspiers/lens.vim'

  -- Theme
  use 'drewtempelmeyer/palenight.vim'
  use 'owozsh/amora'
  use 'larsbs/vimterial_dark'
  use 'sainnhe/everforest'
  use 'arcticicestudio/nord-vim'
  use 'sainnhe/sonokai'
end)
