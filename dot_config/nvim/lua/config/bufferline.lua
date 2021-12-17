require 'bufferline'.setup{
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    },
  }
}

vim.api.nvim_set_keymap('n', '<C-[>', '<CMD>BufferLineCyclePrev<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-]>', '<CMD>BufferLineCycleNext<CR>', {noremap = true})
