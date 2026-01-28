return {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  root_markers = {'.luarc.json', '.luarc.jsonc'},
  Lua = {
    completion = {
      callSnippet = "Replace"
    }
  }
}
