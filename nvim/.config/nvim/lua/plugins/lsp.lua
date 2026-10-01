vim.pack.add {
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/mason-org/mason.nvim' },
	--{ src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
	-- { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
  { src = 'https://github.com/nvim-mini/mini.nvim' },
	{ src = 'https://github.com/nvim-mini/mini.icons' },
	{ src = 'https://github.com/nvim-mini/mini.indentscope' },
  { src = ('https://github.com/saghen/blink.cmp'), version = vim.version.range("1.*") },
}

require('mason').setup()

-- All language servers are expected to be installed with 'mason.nvim'
vim.lsp.enable({
  --"gopls",
  "lua_ls",
  "basedpyright",
  "pyright",
  "marksman",
  "ruff",
  "pyrefly",
  --"harper_ls",
  --"helm_ls",
  --"rust_analyzer",
  "ts_ls",
  "jsonls",
  "yamlls",
  --"zls",
})

require("blink.cmp").setup({
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    providers = {
    },
  },
  signature = { enabled = true },
  cmdline = {
    completion = { menu = { auto_show = true } },
  },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 150 },
  },
})

-- enhanced, a and i keybinds
require("mini.ai").setup()

-- auto pairs
require("mini.pairs").setup()

-- access to surround keymaps sa,sd,sc etc
require("mini.surround").setup()

-- icons, replace nvim_web_devicons
require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()

-- better jump capabilities
require("mini.jump").setup()

