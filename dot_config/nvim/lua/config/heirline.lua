local conditions = require 'heirline.conditions'
local utils = require 'heirline.utils'
local heirline = require 'heirline'


-- Setup colors
local C = require('catppuccin.palettes').get_palette()
local colors = {
  bright_bg = C.surface0,
  bright_fg = C.text,
  red = C.red,
  dark_red = C.maroon,
  green = C.green,
  blue = C.blue,
  gray = C.overlay2,
  orange = C.peach,
  purple = C.mauve,
  cyan = C.sky,
  diag_warn = C.yellow,
  diag_error = C.red,
  diag_hint = C.lavender,
  diag_info = C.teal,
  git_del = utils.get_highlight("diffDeleted").fg,
  git_add = utils.get_highlight("diffAdded").fg,
  git_change = utils.get_highlight("diffChanged").fg,
}

-- Setup left status line
local vi_mode = {
  init = function(self)
    self.mode = vim.fn.mode(1) -- :h mode()
  end,
  static = {
    mode_names = {
      n = 'Normal',
      no = 'Normal?',
      nov = 'Normal?',
      noV = 'Normal?',
      ["no\22"] = 'Normal?',
      niI = "Ni",
      niR = "Nr",
      niV = "Nv",
      nt = "Nt",
      v = "Visual",
      vs = "Vs",
      V = "Visual_",
      Vs = "Vsuals",
      ["\22"] = "^V",
      ["\22s"] = "^V",
      s = "S",
      S = "S_",
      ["\19"] = "^S",
      i = "Insert",
      ic = "Insertc",
      ix = "Insertx",
      R = "R",
      Rc = "Rc",
      Rx = "Rx",
      Rv = "Rv",
      Rvc = "Rv",
      Rvx = "Rv",
      c = "Command",
      cv = "Ex",
      r = "...",
      rm = "M",
      ["r?"] = "?",
      ["!"] = "!",
      t = "T",
    },
    mode_colors = {
      n = 'purple',
      i = 'green',
      v = 'blue',
      V =  'blue',
      ["\22"] = 'blue',
      c = 'orange',
      s = 'purple',
      S = 'purple',
      ['\19'] = 'purple',
      R = 'orange',
      r = 'orange',
      ["!"] = 'red',
      t = 'red',
    }
  },
  provider = function(self)
    return '󰈙 %5(' .. self.mode_names[self.mode] .. '%) '
  end,
  -- Same goes for the highlight. Now the foreground will change according to the current mode.
  hl = function(self)
    local mode = self.mode:sub(1, 1) -- get only the first mode character
    return { fg = self.mode_colors[mode], bold = true, }
  end,
  update = {
    "ModeChanged",
    pattern = "*:*",
    callback = vim.schedule_wrap(function()
      vim.cmd("redrawstatus")
    end),
  },
}

heirline.setup {
  statusline = { vi_mode },
  opts = {
    colors = colors,
  }
}
