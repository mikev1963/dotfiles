vim.pack.add({ 
  "https://github.com/declancm/cinnamon.nvim",
})

require("cinnamon").setup({
        keymaps = {
                basic = true,
                extra = true,
        },
        options = { mode = "window" },
})
