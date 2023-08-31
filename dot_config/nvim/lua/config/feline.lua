require 'nvim-web-devicons'.setup()

require 'gitsigns'.setup()

-- local palette = require('nightfox.palette').load('nightfox')
local latte = require('catppuccin.palettes.latte')
local palette  = require('catppuccin.palettes').get_palette 'mocha'
local ucolors = require('catppuccin.utils.colors')


local vi_mode_colors = {
  NORMAL = 'lavender',
  INSERT = 'green',
  VISUAL = 'flamingo',
  OP = 'green',
  BLOCK = 'flamingo',
  REPLACE = 'maroon',
  ['V-REPLACE'] = 'maroon',
  ENTER = 'cyan',
  MORE = 'teal',
  SELECT = 'maroon',
  ['S-LINE'] = 'maroon',
  ['S-BLOCK'] = 'maroon',
  COMMAND = 'peach',
  PROMPT = 'teal',
  CONFIRM = 'mauve',
  SHELL = 'green',
  TERMINAL = 'green',
  NONE = 'yellow',
  ['V-LINE'] = 'flamingo',
  ['V-BLOCK'] = 'flamingo',
  ['N-PENDING'] = 'lavender',
}

--[[ local theme = {
  black = palette.black.base,
  red = palette.red.base,
  green = palette.green.base,
  yellow = palette.yellow.base,
  blue = palette.blue.base,
  magenta = palette.magenta.base,
  cyan = palette.cyan.base,
  white = palette.white.base,
  orange = palette.orange.base,
  pink = palette.pink.base,
  fg = palette.fg2,
  bg = palette.bg0,
  bg3 = palette.bg3,
  blue_light = palette.blue.bright
}  -- nightfox ]]

local theme = {
  fg = ucolors.vary_color({ latte = latte.base }, palette.surface0),
  bg = ucolors.vary_color({ latte = latte.crust }, palette.surface0),
  lavender = palette.lavender,
  flamingo = palette.flamingo,
  maroon = palette.maroon,
  peach = palette.peach,
  teal = palette.teal,
  mauve = palette.mauve,
  black = palette.overlay1,
  skyblue = palette.skyblue,
  cyan = palette.sky,
  green = palette.green,
  red = palette.red,
  yellow = palette.yellow,
  blue = palette.blue,
  overlay0 = palette.overlay0,
  overlay1 = palette.overlay1,
  overlay2 = palette.overlay2,
  white = palette.base,
}

local vi_mode_hl = function()
  return {
    name = require('feline.providers.vi_mode').get_mode_highlight_name(),
    fg = 'bg',
    bg = require('feline.providers.vi_mode').get_mode_color(),
  }
end

local active_left = {
  {
    provider = 'vi_mode',
    hl = vi_mode_hl,
    left_sep = 'block',
    right_sep = 'slant_right',
    icon = '',
    truncate_hide = true
  },
  {
    provider = 'git_branch',
    left_sep = 'block',
    hl = {fg='yellow'},
    truncate_hide = true
  },
  {
    provider = {
      name = 'file_info',
      opts = {
        type = 'unique-short',
        colored_icon = false
      }
    },
    short_provider = {
      name = 'file_info',
      opts = {
        type = 'base-only',
        colored_icon = false
      }
    },
    left_sep = 'slant_left_2',
    right_sep = {'block', 'right_filled'},
    hl = {fg = 'fg', bg = 'overlay2'}
  }
}

local active_right = {
  { -- lsp status
    provider = function()
      return require("lsp-status").status()
    end,
    hl = {fg = 'bg', bg = 'fg'},
    left_sep = {
      always_visible = true,
      str = 'left_filled',
      hl = {fg = 'fg'}
    }
  },
  { -- lsp error 
    provider = 'diagnostic_errors',
    hl = {fg = 'white', bg = 'red'},
    left_sep = {
      always_visible = true,
      str = 'left_filled',
      hl = {fg = 'red', bg = 'fg'}
    }
  },
  { -- lsp warn
    provider = 'diagnostic_warnings',
    hl = {fg = 'black', bg = 'yellow'},
    left_sep = {
      always_visible = true,
      str = 'left_filled',
      hl = {fg = 'yellow', bg = 'red'}
    }
  },
  { -- lsp_info
    provider = 'diagnostic_info',
    hl = {fg = 'black', bg = 'teal'},
    left_sep = {
      always_visible = true,
      str = 'left_filled',
      hl = {fg = 'teal', bg = 'yellow'}
    }
  },
  { -- lsp_hint
    provider = 'diagnostic_hints',
    hl = {fg = 'black', bg = 'blue'},
    left_sep = {
      always_visible = true,
      str = 'left_filled',
      hl = {fg = 'blue', bg = 'teal'}
    }
  },
  -- file_type
  {
    provider = {
      name = 'file_type',
      opts = {
        filetype_icon = false,
        case = 'lowercase'
      }
    },
    hl = { fg = 'white', bg = 'overlay2' },
    right_sep = 'block',
    left_sep = {
      {str = 'left_filled', hl = {fg = 'overlay2', bg = 'blue'} ,always_visible = true},
      'block'
    }
  },
  {
    provider = 'file_encoding',
    hl = { fg = 'teal' },
    right_sep = 'block',
    left_sep = {
      {str = 'left_filled',  hl = { fg = 'bg', bg = 'overlay2' }},
      'block'
    },
    truncate_hide = true
  },
  {
    provider = function()
      return require('feline.providers.cursor').position(_, {padding = true}) .. '  ' .. require('feline.providers.cursor').line_percentage()
    end,
    short_provider = 'scroll_bar',
    hl = vi_mode_hl,
    left_sep = 'slant_left_2',
    right_sep = 'block'
  }
}

local inactive_left = {
  { 
    provider = {
      name = 'file_info',
      opts = {
        type = 'base-only',
        colored_icon = false
      }
    },
    hl = {fg = 'lavender', bg = 'bg'},
    left_sep = 'block',
    right_sep = 'right_filled'
  }
}

local inactive_right = {
  {
    provider = {
      name = 'position',
      opts = {padding = true},
    },
    hl = { fg = 'mauve' },
  },
  {
    provider = 'scroll_bar',
    left_sep = ' ',
    hl = { fg = 'flamingo' },
  }
}

local components = {
  active = {active_left, active_right},
  inactive = {inactive_left, inactive_right}
}

require 'feline'.setup {
  components = components,
  vi_mode_colors = vi_mode_colors,
  default_fg = 'fg',
  default_bg = 'bg',
  theme = theme,
  force_inactive = {
    filetypes = {
      '^packer$',
      '^neo-tree$',
      'dap-repl',
      'dapui_scopes',
      'dapui_stacks',
      'dapui_watches',
      'dapui_repl',
      'LspTrouble',
      "qf",
      'help',
    },
    buftypes = {
      '^terminal$'
    },
    bufnames = {}
  },
  disable = {
    filetypes = {
      '^NvimTree$',
      '^alpha$',
      '^dashboard$',
      '^startify$',
      '^neo-tree$',
      '^neo-tree-popup$',
      '^notify$'
    },
    buftypes = {},
    bufnames = {}
  },
}

