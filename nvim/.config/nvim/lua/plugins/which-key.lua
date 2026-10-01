vim.pack.add({
	"https://github.com/folke/which-key.nvim",
})

local wk = require("which-key")
wk.setup({
  preset = "helix",
})
wk.add({
  { "<leader>c", group = "code" },
  { "<leader>D", group = "Diffview", icon = { icon = "", color = "orange" } },
  { "<leader>f", group = "file" },
  { "<leader>p", group = "Yanky", icon = { icon = "󰃮 ", color = "yellow" } },
  { "<leader>q", group = "quit/session" },
  { "<leader>g", group = "git" },
  { "<leader>s", group = "search" },
  { "[", group = "prev" },
  { "]", group = "next" },
  { "g", group = "goto" },
  { "gs", group = "surround" },
  { "z", group = "fold" },
  {
    "<leader>b",
    group = "buffer",
    expand = function()
      return require("which-key.extras").expand.buf()
    end,
  },
  {
    "<leader>w",
    group = "windows",
    proxy = "<c-w>",
    expand = function()
      return require("which-key.extras").expand.win()
    end,
  },
  {
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  },
})
