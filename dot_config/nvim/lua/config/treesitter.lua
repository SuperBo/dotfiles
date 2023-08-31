require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'go', 'java', 'javascript', 'json', 'python', 'rust', 'svelte', 'typescript', 'yaml'
  },
  indent = {
    enable = true,
    disable = { 'python' }
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}
