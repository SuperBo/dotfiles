require('catppuccin').setup {
  flavour = "macchiato", -- latte, frappe, macchiato, mocha
  background = {
    light = "latte",
    dark = "mocha",
  },
  term_colors = false,
  integrations = {
    cmp = true,
    leap = true,
    mason = true,
    mini = true,
    telescope = true,
    treesitter = true,
    treesitter_context = true,
    native_lsp = {
      enabled = true,
    },
    nvimtree = {
      enabled = false,
      show_root = true,
    },
    neotree = {
			enabled = true,
			show_root = true,
			transparent_panel = true,
		},
  }
}
