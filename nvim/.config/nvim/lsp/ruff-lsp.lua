return {
  cmd = { 'ruff-lsp' },
  filetypes = { 'python' },
  root_markers = { 
    'pyproject.toml', 
    'ruff.toml', 
    '.git' 
  },
  settings = {},
  on_init = function()
    vim.deprecate('ruff_lsp', 'ruff', '3.0.0', 'nvim-lspconfig', false)
  end,
}
