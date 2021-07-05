vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  use 'justinmk/vim-dirvish' -- browse file
  use 'b3nj5m1n/kommentary' -- comment utils
  use 'tpope/vim-fugitive' -- Git utils
  use 'tpope/vim-eunuch' --  Unix utils
  use 'machakann/vim-sandwich' -- parentheis utils
  use 'Raimondi/delimitMate' -- auto close parentheis
  use 'jeetsukumaran/vim-buffergator' -- browse buffer
  use {
    'easymotion/vim-easymotion',
    config = function() require 'config.easymotion' end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function() require 'config.telescope' end
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use {
    'hrsh7th/nvim-compe',
    config = function() require 'config.compe' end
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require 'config.treesitter' end
  }

  -- UI
  use 'itchyny/lightline.vim'
  use 'mhinz/vim-startify'
  use 'camspiers/lens.vim'

  -- Theme
  use 'drewtempelmeyer/palenight.vim'
  use 'owozsh/amora'
  use 'larsbs/vimterial_dark'
  use 'sainnhe/everforest'
  use 'arcticicestudio/nord-vim'
end)
