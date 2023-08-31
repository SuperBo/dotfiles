local sections = {
  lualine_a = {'mode'},
  lualine_b = {'branch', 'diff'},
  lualine_c = {'filename'},
  lualine_x = {},
  lualine_y = {'encoding', 'fileformat', 'filetype'},
  lualine_z = {'location', 'progress'}
}

require 'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      'NvimTree',
      'alpha',
      'dashboard',
      'packer',
      'startify',
      'starter',
    },
    always_divide_middle = false,
    globalstatus = true,
  },
  sections = sections,
}
