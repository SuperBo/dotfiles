local wezterm = require 'wezterm'
local action = wezterm.action

function Scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Catppuccin Frappe'
  else
    return 'Catppuccin Frappe'
  end
end

return {
  front_end = 'WebGpu',
  default_cursor_style = 'BlinkingBar',
  cursor_blink_rate = 500,

  font = wezterm.font {
    -- family = 'Fira Code',
    -- harfbuzz_features = {'zero'}
    -- family  = 'Iosevka',
    -- stretch = 'Expanded',
    -- weight  = 'Regular',
    family = 'JetBrains Mono',
    harfbuzz_features = { 'zero' },
  },
  -- font_rules = {
  --   {
  --     intensity = 'Bold',
  --     italic = false,
  --     font = wezterm.font {
  --       family = 'Cascadia Code',
  --       weight = 'DemiBold',
  --       harfbuzz_features = {'ss19'}
  --     },
  --   },
  --   {
  --     intensity = 'Half',
  --     italic = false,
  --     font = wezterm.font {
  --       family = 'Cascadia Code',
  --       weight = 'Medium',
  --       harfbuzz_features = {'ss19'}
  --     },
  --   },
  -- },

  font_size = 12,
  freetype_load_target = 'Light',
  -- line_height = 1.2, -- for Caskaydian
  -- cell_width = 1.05,
  -- enable_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = true,
  -- tab_bar_at_bottom = true,
  window_decorations = 'RESIZE',
  window_padding = {
    left   = '1.2cell',
    right  = '1.2cell',
    top    = '5px',
    bottom = '5px',
  },

  max_fps = 120,

  -- color_scheme = 'Catppuccin Macchiato',
  color_scheme = Scheme_for_appearance(wezterm.gui.get_appearance()),

  -- Keys
  use_ime = false,
  leader = { key = ';', mods = 'CTRL', timeout_milliseconds = 500 },
  keys = {
    {
      key = '\\', mods = 'LEADER',
      action = action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = '-', mods = 'LEADER',
      action = action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    { key = 'h', mods = 'LEADER',    action = action.ActivatePaneDirection 'Left'  },
    { key = 'l', mods = 'LEADER',    action = action.ActivatePaneDirection 'Right' },
    { key = 'j', mods = 'LEADER',    action = action.ActivatePaneDirection 'Down'  },
    { key = 'k', mods = 'LEADER',    action = action.ActivatePaneDirection 'Up'    },
    { key = 'h', mods = 'CMD|SHIFT', action = action.ActivatePaneDirection 'Left'  },
    { key = 'l', mods = 'CMD|SHIFT', action = action.ActivatePaneDirection 'Right' },
    { key = 'j', mods = 'CMD|SHIFT', action = action.ActivatePaneDirection 'Down'  },
    { key = 'k', mods = 'CMD|SHIFT', action = action.ActivatePaneDirection 'Up'    },
  },
}
