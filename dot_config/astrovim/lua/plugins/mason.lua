-- Customize Mason

---@type LazySpec
return {
  --- mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "lua-ls",
        "ansible-ls",
        "pylsp",
        "black",
        "prettier",
        "gopls",
        "deleve",
        "basedpyright",
      },
    },
  },
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",

        -- install formatters
        "stylua",

        -- install debuggers
        "debugpy",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
