vim.loader.enable()

vim.g.mapleader = ';'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.cindent = true

-- vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- vim.opt.foldtext = 'v:lua.vim.treesitter.foldtext()'

vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>p', '"0p')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    '--depth=1',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')

require 'ui'

