require('mini.comment').setup()
require('mini.pairs').setup()
require('mini.sessions').setup()
require('mini.trailspace').setup({
  only_in_normal_buffers = true,
})

require('mini.surround').setup({
  mappings = {
    add = '', -- Add surrounding in Normal and Visual modes
    delete = 'ds', -- Delete surrounding
    find = 'fs', -- Find surrounding (to the right)
    find_left = 'fS', -- Find surrounding (to the left)
    highlight = '', -- Highlight surrounding
    replace = 'cs', -- Replace surrounding
    update_n_lines = '', -- Update `n_lines`
  },
})

local starter = require 'mini.starter'

starter.setup {
  header = [[
░░░░░░░░░░░░░░░░░░    ░░░░░░░░░░░░░░░░░    ░░░░░░░░░░░░░░░░░
░░░░░▄▄████▄▄░░░░░    ░░░▄░▀▄░░░▄▀░▄░░░    ░░░░▄▄████▄▄░░░░░
░░░▄██████████▄░░░    ░░░█▄███████▄█░░░    ░░░██████████░░░░
░▄██▄██▄██▄██▄██▄░    ░░░███▄███▄███░░░    ░░░██▄▄██▄▄██░░░░
░░░▀█▀░░▀▀░░▀█▀░░░    ░░░▀█████████▀░░░    ░░░░▄▀▄▀▀▄▀▄░░░░░
░░░░░░░░░░░░░░░░░░    ░░░░▄▀░░░░░▀▄░░░░    ░░░▀░░░░░░░░▀░░░░
░░░░░░░░░░░░░░░░░░    ░░░░░░░░░░░░░░░░░    ░░░░░░░░░░░░░░░░░


           ░░░░░░░░░░░░░░░░░    ░░░░░░░░░░░░░░░░░
           ░░░░░░▄██▄░░░░░░░    ░░░░░▀▄░░░▄▀░░░░░
           ░░░░▄██████▄░░░░░    ░░░░▄█▀███▀█▄░░░░
           ░░░███▄██▄███░░░░    ░░░█▀███████▀█░░░
           ░░░░░▄▀▄▄▀▄░░░░░░    ░░░█░█▀▀▀▀▀█░█░░░
           ░░░░▀░▀░░▀░▀░░░░░    ░░░░░░▀▀░▀▀░░░░░░
           ░░░░░░░░░░░░░░░░░    ░░░░░░░░░░░░░░░░░
  ]],
  content_hooks = {
    starter.gen_hook.adding_bullet('󰽭 '),
    starter.gen_hook.aligning('center', 'center'),
  },
  footer = [[
The computing scientist\'s main challenge is not
to get confused by the complexities of his own making.
                                 - Edsger W. Dijkstra
  ]],
}
