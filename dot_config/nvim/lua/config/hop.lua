local hop = require('hop')
local directions = require('hop.hint').HintDirection

hop.setup()

vim.keymap.set('', 's',
  function()
    hop.hint_char2({ direction = directions.AFTER_CURSOR, current_line_only = false })
  end, {remap=true}
)

vim.keymap.set('', 'S',
  function()
    hop.hint_char2({ direction = directions.BEFORE_CURSOR, current_line_only = false })
  end, {remap=true}
)
