vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  use 'justinmk/vim-dirvish'
  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-fugitive'
  --[[
  use {
    'junegunn/fzf.vim',
    requires = {'junegunn/fzf'}
  }
  --]]
  use 'tpope/vim-eunuch'
  use 'machakann/vim-sandwich'
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
  use 'nvim-lua/completion-nvim'

  -- UI
  use 'itchyny/lightline.vim'
  use 'mhinz/vim-startify'
  use 'camspiers/lens.vim'
  -- Theme
  use 'drewtempelmeyer/palenight.vim'
end)
