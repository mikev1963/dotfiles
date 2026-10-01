vim.pack.add({
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = "main" },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = "main" },
})


require('nvim-treesitter.config').setup({
  ensure_installed = {
    "bash",
    "css",
    "html",
    "lua",
    "markdown",
    "python",
    "tsx",
    "typescript",
    "javascript",
    "vim",
    "yaml",
  },
  highlight = { enable = true },
  indent = { enable = true },
})


