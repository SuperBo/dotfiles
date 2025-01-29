-- require('mini.animate').setup()
require('mini.comment').setup()
-- require('mini.pairs').setup()
require('mini.sessions').setup()
require('mini.trailspace').setup({
  only_in_normal_buffers = true,
})
-- require('mini.files').setup()

require('mini.surround').setup({
  mappings = {
    add = 'sa', -- Add surrounding in Normal and Visual modes
    delete = 'sd', -- Delete surrounding
    find = 'sf', -- Find surrounding (to the right)
    find_left = 'sF', -- Find surrounding (to the left)
    highlight = 'sh', -- Highlight surrounding
    replace = 'sr', -- Replace surrounding
    update_n_lines = 'sn', -- Update `n_lines`
  },
})

-- require('mini.indentscope').setup({})
-- require('mini.indentscope').gen_animation.none()

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
