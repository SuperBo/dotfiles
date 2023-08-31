require 'bufferline'.setup{
  options = {
    separator_style = "thick",
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

vim.keymap.set('n', '<C-[>', '<CMD>BufferLineCyclePrev<CR>', {noremap = true})
vim.keymap.set('n', '<C-]>', '<CMD>BufferLineCycleNext<CR>', {noremap = true})
