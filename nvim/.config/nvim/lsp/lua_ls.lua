return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
  },
  settings = {
    lua = {
      workspace = {
        checkThirdParty = false,
      },
      codeLens = {
        enable = true
      },
      hint = {
        enable = true,
        semicolon = 'Disable'
      },
      telemetry = { enable = false },
    },
  },
}
