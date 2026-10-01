vim.pack.add({
  "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
  "https://github.com/rachartier/tiny-cmdline.nvim",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/artemave/workspace-diagnostics.nvim",
})

vim.o.cmdheight = 0
vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	update_in_insert = false,
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})

require("tiny-inline-diagnostic").setup({
	preset = "simple",
	transparent_cursorline = false,
	options = {
		multilines = {
			enabled = true,
		},
	},
})
