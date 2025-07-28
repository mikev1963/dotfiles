return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        ensure_installed = {
          "bash",
          "c",
          "css",
          "csv",
          "dockerfile",
          "go",
          "html",
          "ini",
          "javascript",
          "jinja",
          "json",
          "lua",
          "python",
          "ruby",
          "scss",
          "sql",
          "typescript",
          "yaml",
        },
        highlight = { enable = true },
        indent = { enable = false },
      })
    end
  }
}
