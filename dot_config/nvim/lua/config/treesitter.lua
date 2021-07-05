require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "java", "javascript", "json", "python", "yaml"
  },
  indent = {
    enable = true
  },
  highlight = {
    enable = true
  }
}
